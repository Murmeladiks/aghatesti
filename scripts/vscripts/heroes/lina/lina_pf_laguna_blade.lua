LinkLuaModifier("modifier_lina_pf_super_charged", 			"heroes/lina/lina_pf_laguna_blade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lina_pf_laguna_blade_barrier", 	"heroes/lina/lina_pf_laguna_blade", LUA_MODIFIER_MOTION_NONE)

-----------------------------------------------------------------------------------------------------------------------------

lina_pf_laguna_blade = class({})

-----------------------------------------------------------------------------------------------------------------------------

function lina_pf_laguna_blade:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_laguna_blade.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_laguna_blade_shard_units_hit.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_supercharge_buff.vpcf", context)
end

-----------------------------------------------------------------------------------------------------------------------------

function lina_pf_laguna_blade:OnSpellStart()
	local hCaster = self:GetCaster()
	local nBounces = 0

	if hCaster:HasShard("aghsfort_special_lina_laguna_blade_bounce") then
		nBounces = hCaster:FindTalentValue("aghsfort_special_lina_laguna_blade_bounce", "value")
	end

	self:LagunaBlade(hCaster, self:GetCursorTarget(), nBounces, {})

	hCaster:EmitSound("Ability.LagunaBlade")

	if hCaster:GetHeroFacetID() == 1 then
		local hSupercharge = hCaster:AddNewModifier(hCaster, self, "modifier_lina_pf_super_charged", {duration = self:GetSpecialValueFor("supercharge_duration")})
		hSupercharge:SetStackCount(self:GetSpecialValueFor("supercharge_stacks"))
	end
end

-----------------------------------------------------------------------------------------------------------------------------

function lina_pf_laguna_blade:LagunaBlade(hCastOrigin, hTarget, nBounces, hHits)	
	local hCaster = self:GetCaster()
	local nSearchType = FIND_CLOSEST
	local hInnate = hCaster:FindAbilityByName("lina_pf_fiery_soul")

	local tDamageTable = {
		victim = hTarget,
		attacker = hCaster,
		damage = self:GetSpecialValueFor("damage"),
		damage_type = self:GetAbilityDamageType(),
		ability = self
	}

	if hCaster:GetHeroFacetID() == 2 then
		local hFacetInnate = hCaster:FindAbilityByName("lina_slow_burn")

		if hFacetInnate then
			tDamageTable.damage = tDamageTable.damage * hFacetInnate:GetSpecialValueFor("impact_damage_pct")

			hTarget:AddNewModifier(hCaster, hFacetInnate, "modifier_lina_pf_slow_burn", {duration = hFacetInnate:GetSpecialValueFor("burn_duration") * (1 - hTarget:GetStatusResistance()), damage = tDamageTable.damage})
		end
	end

	ApplyDamage(tDamageTable)

	if hCaster:HasTalent("special_bonus_unique_lina_7") then
		hCaster:AddNewModifier(hCaster, self, "modifier_lina_pf_laguna_blade_barrier", {duration = self:GetSpecialValueFor("barrier_duration"), damage = tDamageTable.damage})
	end

	if hInnate then
		hInnate:CriticalMark(hTarget)
	end

	local sAttachment = hCastOrigin == hCaster and "attach_attack1" or "attach_hitloc"

	local nLagunaFx = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_laguna_blade.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControlEnt(nLagunaFx, 0, hCastOrigin, PATTACH_POINT_FOLLOW, sAttachment, Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nLagunaFx, 1, hTarget, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:ReleaseParticleIndex(nLagunaFx)

	if hCaster:HasShard("aghsfort_special_lina_laguna_blade_line") then
		self:LineLaguna(hCastOrigin:GetOrigin(), hTarget)
		nSearchType = FIND_FARTHEST
	end

	hTarget:EmitSound("Ability.LagunaBladeImpact")

	hHits[hTarget:entindex()] = true

	if nBounces > 0 then
		local vOrigin = hTarget:GetOrigin()
		local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vOrigin, nil, self:GetEffectiveCastRange(vOrigin, hTarget), self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), self:GetAbilityTargetFlags(), nSearchType, false)

		for _, hEnemy in pairs(hEnemies) do
			if not hHits[hEnemy:entindex()] then
				Timers:CreateTimer(0.1, function()
					self:LagunaBlade(hTarget, hEnemy, nBounces - 1, hHits)
				end)
				break
			end
		end
	else
		hHits = nil
	end
end

-----------------------------------------------------------------------------------------------------------------------------

function lina_pf_laguna_blade:LineLaguna(vOrigin, hTarget)
	local hCaster = self:GetCaster()
	local nWidth = hCaster:FindTalentValue("aghsfort_special_lina_laguna_blade_line", "value")
	local hInnate = hCaster:FindAbilityByName("lina_pf_fiery_soul")

	local hEnemies =  FindUnitsInLine(hCaster:GetTeamNumber(), vOrigin, hTarget:GetOrigin(), nil, nWidth, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE)

	local tDamageTable = {
		victim = hTarget,
		attacker = hCaster,
		damage = self:GetSpecialValueFor("damage"),
		damage_type = self:GetAbilityDamageType(),
		ability = self
	}
	
	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			tDamageTable.victim = hEnemy
			ApplyDamage(tDamageTable)

			local nHitFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_laguna_blade_shard_units_hit.vpcf", PATTACH_ABSORIGIN, hTarget)
			ParticleManager:SetParticleControlEnt(nHitFX, 0, hEnemy, PATTACH_POINT_FOLLOW, "attach_hitloc", hEnemy:GetAbsOrigin(), true)
			ParticleManager:SetParticleControl(nHitFX, 1, hCaster:GetAbsOrigin())
			ParticleManager:ReleaseParticleIndex(nHitFX)

			if hInnate then
				hInnate:CriticalMark(hEnemy)
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------

function lina_pf_laguna_blade:CastTalentLagunaBlade(vPosition)
	local hCaster = self:GetCaster()
	local vCasterOrigin = hCaster:GetAbsOrigin()
	local vDirection = (vPosition - vCasterOrigin):Normalized()

	local flLineLength = self:GetCastRange(vPosition, nil) + hCaster:GetCastRangeBonus()
	local flLineWidth = self:GetSpecialValueFor("extension_width")

	local vEndPosition = vCasterOrigin + vDirection * flLineLength
	local vGroundEndPosition = GetGroundPosition(vEndPosition, nil)

	self:DisplayShardCasterEffects(vGroundEndPosition)

	local hEnemies =  FindUnitsInLine(hCaster:GetTeamNumber(), vCasterOrigin, vEndPosition, nil, flLineWidth, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, self:GetAbilityTargetFlags())
	for _, hEnemy in pairs(hEnemies) do
		self:CastTargetLagunaBlade(hEnemy, true)
	end
end

--------------------------------------------------------------------------------

modifier_lina_pf_super_charged = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:OnCreated()
	local hAbility = self:GetCaster():FindAbilityByName("lina_pf_fiery_soul")

	if not hAbility then
		self:Destroy()
		return
	end

	self.nAttackSpeedPerStack = hAbility:GetSpecialValueFor("fiery_soul_attack_speed_bonus")
	self.nMoveSpeedPerStack = hAbility:GetSpecialValueFor("fiery_soul_move_speed_bonus")
	self.nMagicResistPerStack = hAbility:GetSpecialValueFor("fiery_soul_magic_resist")

	if IsClient() then return end

	self.nFierySoulFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_fiery_soul.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControl(self.nFierySoulFX, 1, Vector(self:GetStackCount(), 0, 0))
	self:AddParticle(self.nFierySoulFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:OnStackCountChanged(iStackCount)
	if IsClient() then return end
	ParticleManager:SetParticleControl(self.nFierySoulFX, 1, Vector(self:GetStackCount(), 0, 0))
end

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
	}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeedPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSpeedPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:GetModifierMagicalResistanceBonus()
	return self.nMagicResistPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_super_charged:GetEffectName()
	return "particles/units/heroes/hero_lina/lina_supercharge_buff.vpcf"
end

--------------------------------------------------------------------------------

modifier_lina_pf_laguna_blade_barrier = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_laguna_blade_barrier:OnCreated(kv)
	if IsClient() then return end

	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nShieldValue = kv.damage * hAbility:GetSpecialValueFor("barrier_pct") / 100
	self.nMaxShield = self.nShieldValue

	
	self:SetHasCustomTransmitterData(true)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_laguna_blade_barrier:OnRefresh(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()

	self.nShieldValue = math.max(self.nShieldValue, kv.damage * hAbility:GetSpecialValueFor("barrier_pct") / 100)
	self.nMaxShield = math.max(self.nShieldValue, self.nMaxShield)

	self:SendBuffRefreshToClients()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_laguna_blade_barrier:AddCustomTransmitterData()
	return {
		nShieldValue = self.nShieldValue,
		nMaxShield = self.nMaxShield
	}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_laguna_blade_barrier:HandleCustomTransmitterData(data)
	self.nShieldValue = data.nShieldValue
	self.nMaxShield = data.nMaxShield
end

--------------------------------------------------------------------------------

function modifier_lina_pf_laguna_blade_barrier:DeclareFunctions()
	return {MODIFIER_PROPERTY_INCOMING_DAMAGE_CONSTANT}
end

--------------------------------------------------------------------------------


function modifier_lina_pf_laguna_blade_barrier:GetModifierIncomingDamageConstant(event)
	if IsServer() then		
		local nDamage = event.damage
		local nReduction = -self.nShieldValue

		self.nShieldValue = math.max(0, self.nShieldValue - nDamage)

		if self.nShieldValue <= 0 then
			self:Destroy()
		end

		self:SendBuffRefreshToClients()

		return nReduction
	else
		return event.report_max and self.nMaxShield or self.nShieldValue
	end
end
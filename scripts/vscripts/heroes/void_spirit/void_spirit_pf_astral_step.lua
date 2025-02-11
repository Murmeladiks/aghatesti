LinkLuaModifier("modifier_void_spirit_pf_astral_step", 				"heroes/void_spirit/void_spirit_pf_astral_step", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_astral_step_debuff", 		"heroes/void_spirit/void_spirit_pf_astral_step", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_astral_step_trail",		"heroes/void_spirit/void_spirit_pf_astral_step", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_astral_step_breach", 		"heroes/void_spirit/void_spirit_pf_astral_step", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

void_spirit_pf_astral_step = class({})

--------------------------------------------------------------------------------

function void_spirit_pf_astral_step:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_impact.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_debuff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/astral_step_trail.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_void_spirit_astral_step_debuff.vpcf", context)
end

--------------------------------------------------------------------------------

function void_spirit_pf_astral_step:GetIntrinsicModifierName()
	return "modifier_void_spirit_pf_astral_step"
end

--------------------------------------------------------------------------------

function void_spirit_pf_astral_step:GetCastRange(vLocation, hTarget)
	return IsClient() and self:GetSpecialValueFor("max_travel_distance") or 10000
end

--------------------------------------------------------------------------------

function void_spirit_pf_astral_step:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPos = self:GetCursorPosition()
	local vOrigin = hCaster:GetOrigin()
	local nDistance = (vOrigin - vPos):Length2D()
	local nMinDistance = self:GetSpecialValueFor("min_travel_distance")
	local nMaxDistance = self:GetSpecialValueFor("max_travel_distance") + hCaster:GetCastRangeBonus()
	local nDuration = self:GetSpecialValueFor("pop_damage_delay")

	if nDistance < nMinDistance then
		vPos = vOrigin + (vPos - vOrigin):Normalized() * nMinDistance
	elseif nDistance > nMaxDistance + hCaster:GetCastRangeBonus() then	
		vPos = vOrigin + (vPos - vOrigin):Normalized() * nMaxDistance 
	end

	vPos = GetGroundPosition(vPos, hCaster)

	FindClearSpaceForUnit(hCaster, vPos, true)

	local hEnemies = FindUnitsInLine(hCaster:GetTeam(), vOrigin, vPos, nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE)

	local hCleaveSuppressor = hCaster:AddNewModifier(hCaster, nil, "modifier_void_spirit_astral_step_caster", {duration = 0.1})
	local hCrit = hCaster:AddNewModifier(hCaster, self, "modifier_void_spirit_astral_step_intrinsic", {duration = 0.1})

	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, self, "modifier_void_spirit_pf_astral_step_debuff", {duration = nDuration, strength = 100})
		hCaster:PerformAttack(hEnemy, false, true, true, true, false, false, true)

		local nImpactFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_impact.vpcf", PATTACH_CUSTOMORIGIN, hCaster)
		ParticleManager:SetParticleControlEnt(nImpactFX, 0, hEnemy, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
		ParticleManager:ReleaseParticleIndex(nImpactFX)
	end

	if hCaster:HasShard("aghsfort_special_void_spirit_astral_step_breach") and #hEnemies > 0 then
		local tDistances = {}
		for _, hEnemy in ipairs(hEnemies) do
			tDistances[hEnemy:entindex()] = (hEnemy:GetOrigin() - vOrigin):Length2D()
		end
	
		table.sort(hEnemies, function(a, b) return tDistances[a:entindex()] < tDistances[b:entindex()] end)

		hEnemies[1]:AddNewModifier(hCaster, self, "modifier_void_spirit_pf_astral_step_breach", {duration = hCaster:FindTalentValue("aghsfort_special_void_spirit_astral_step_breach", "value")})
	end

	if hCleaveSuppressor and not hCleaveSuppressor:IsNull() then
		hCleaveSuppressor:Destroy()
	end

	if hCrit and not hCrit:IsNull() then
		hCrit:Destroy()
	end

	local nStepFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step.vpcf", PATTACH_WORLDORIGIN, hCaster)
	ParticleManager:SetParticleControl(nStepFX, 0, vOrigin)
	ParticleManager:SetParticleControl(nStepFX, 1, vPos)
	ParticleManager:ReleaseParticleIndex(nStepFX)

	EmitSoundOnLocationWithCaster(vOrigin, "Hero_VoidSpirit.AstralStep.Start", hCaster)
	EmitSoundOnLocationWithCaster(vPos, "Hero_VoidSpirit.AstralStep.End", hCaster)

	if hCaster:HasShard("aghsfort_special_void_spirit_astral_step_trail") then
		CreateModifierThinker(hCaster, self, "modifier_void_spirit_pf_astral_step_trail", {duration = hCaster:FindTalentValue("aghsfort_special_void_spirit_astral_step_trail", "value"), x = vPos.x, y = vPos.y}, vOrigin, hCaster:GetTeam(), false)
	end
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_astral_step_debuff = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:OnCreated( kv )
	local hAbility = self:GetAbility()

	self.nMoveSlow = -hAbility:GetSpecialValueFor("movement_slow_pct")

	if IsClient() then return end

	local nStrength = kv.strength or 100
	
	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = hAbility:GetSpecialValueFor("pop_damage") * nStrength / 100,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	ApplyDamage(self.tDamageTable)

	local nDamageFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_dmg.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(nDamageFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
	ParticleManager:ReleaseParticleIndex(nDamageFX)

	EmitSoundOn("Hero_VoidSpirit.AstralStep.MarkExplosion", hParent)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:GetEffectName()
	return "particles/units/heroes/hero_void_spirit/astral_step/void_spirit_astral_step_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:GetStatusEffectName()
	return "particles/status_fx/status_effect_void_spirit_astral_step_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_debuff:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_astral_step = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step:IsPurgable() 	return false end
function modifier_void_spirit_pf_astral_step:IsHidden()		return true end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step:OnAttackLanded(event)
	if event.attacker ~= self:GetParent() or IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hCaster = self:GetCaster()
	local hAstralStep = hCaster:FindAbilityByName("void_spirit_pf_astral_step")

	if not hTarget or event.no_attack_cooldown or not hCaster:HasShard("aghsfort_special_void_spirit_astral_step_attacks") or hTarget:IsBuilding() or hTarget:IsOther() then
		return
	end

	if not hAstralStep or not hAstralStep:IsTrained() then
		return
	end

	hTarget:AddNewModifier(hAttacker, hAstralStep, "modifier_void_spirit_pf_astral_step_debuff", {duration = hAstralStep:GetSpecialValueFor("pop_damage_delay"), strength = hAttacker:FindTalentValue("aghsfort_special_void_spirit_astral_step_attacks", "void_mark_pct")})
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_astral_step_trail = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_trail:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_trail:OnCreated(kv)
	if IsClient() then return end
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()

	self.vEndPos = Vector(kv.x, kv.y, GetGroundPosition(hParent:GetOrigin(), self:GetCaster()).z)
	self.nRadius = hAbility:GetSpecialValueFor("radius")

	self.tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = hAbility:GetSpecialValueFor("pop_damage") * hCaster:FindTalentValue("aghsfort_special_void_spirit_astral_step_trail", "value3") / 100,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	local nTrailFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/astral_step_trail.vpcf", PATTACH_ABSORIGIN, hParent)
	ParticleManager:SetParticleControl(nTrailFX, 1, self.vEndPos)
	ParticleManager:SetParticleControl(nTrailFX, 2, Vector(self:GetDuration(), 0, 0))
	self:AddParticle(nTrailFX, false, false, -1, false, false)

	self:StartIntervalThink(hCaster:FindTalentValue("aghsfort_special_void_spirit_astral_step_trail", "value2"))

	hParent:EmitSound("Hero_VoidSpirit.AstralTrail.Loop")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_trail:OnDestroy()
	if IsClient() then return end
	self:GetParent():StopSound("Hero_VoidSpirit.AstralTrail.Loop")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_trail:OnIntervalThink()
	local hParent = self:GetParent()
	local hEnemies = FindUnitsInLine(hParent:GetTeam(), hParent:GetOrigin(), self.vEndPos, nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE)

	for _, hEnemy in pairs(hEnemies) do
		self.tDamageTable.victim = hEnemy
		ApplyDamage(self.tDamageTable)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, hEnemy, self.tDamageTable.damage, self:GetCaster():GetPlayerOwner())
	end
end
	

--------------------------------------------------------------------------------

modifier_void_spirit_pf_astral_step_breach = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_breach:OnCreated( kv )
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nDamage = hAbility:GetSpecialValueFor("pop_damage") * hCaster:FindTalentValue("aghsfort_special_void_spirit_astral_step_breach", "value3") / 100
	self.nInterval = hCaster:FindTalentValue("aghsfort_special_void_spirit_astral_step_breach", "value2")

	if IsClient() then return end
	
	self.tDamageTable = {
		attacker = hCaster,
		victim = self:GetParent(),
		damage = self.nDamage,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(self.nInterval)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_breach:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, self:GetParent(), self.tDamageTable.damage, self:GetCaster():GetPlayerOwner())
end

function modifier_void_spirit_pf_astral_step_breach:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_TOOLTIP,
		MODIFIER_PROPERTY_TOOLTIP2
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_breach:OnTooltip()
	return self.nDamage
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_breach:OnTooltip2()
	return self.nInterval
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_breach:GetStatusEffectName()
	return "particles/status_fx/status_effect_void_spirit_astral_step_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_astral_step_breach:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end
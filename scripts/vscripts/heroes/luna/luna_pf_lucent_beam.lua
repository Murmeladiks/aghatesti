LinkLuaModifier("modifier_luna_pf_lucent_beam_damage_buff", "heroes/luna/luna_pf_lucent_beam", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_lucent_beam_moonglow", 	"heroes/luna/luna_pf_lucent_beam", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

luna_pf_lucent_beam = class({})

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_luna/luna_lucent_beam_precast.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_luna/luna_lucent_beam.vpcf", context)
end

function luna_pf_lucent_beam:Spawn()
	if IsClient() then return end

	self.tMarkedTargets = {}
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:CastFilterResultTarget(hTarget)
	local hCaster = self:GetCaster()

	if hCaster:HasShard("aghsfort_special_luna_lucent_beam_moonglow") then
		return UnitFilter(hTarget, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, hCaster:GetTeamNumber())
	end

	return self.BaseClass.CastFilterResultTarget(self, hTarget)
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:OnAbilityPhaseStart()
	if IsServer() then
		local hCaster = self:GetCaster()
		
		self.nCastFX = ParticleManager:CreateParticle("particles/units/heroes/hero_luna/luna_lucent_beam_precast.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
		ParticleManager:SetParticleControlEnt(self.nCastFX, 0, hCaster, PATTACH_POINT_FOLLOW, "attach_weapon", Vector(0, 0, 0), true)
	end

	return true
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:OnAbilityPhaseInterrupted()
	if IsClient() then return end
	ParticleManager:DestroyParticle(self.nCastFX, true)
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:OnSpellStart()
	ParticleManager:ReleaseParticleIndex(self.nCastFX)

	local hTarget = self:GetCursorTarget()
	local hCaster = self:GetCaster()

	hCaster:EmitSound("Hero_Luna.LucentBeam.Cast")

	for _, hEnemy in pairs(self.tMarkedTargets) do
		if not hEnemy:TriggerSpellAbsorb(self) and hTarget ~= hEnemy then self:LucentBeam(hEnemy) end
	end

	if hTarget:GetTeam() == hCaster:GetTeam() then
		self:Moonglow(hTarget)
		return
	end

	if hTarget:TriggerSpellAbsorb(self) then return end

	self:LucentBeam(hTarget)
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:LucentBeam(hTarget, bEclipse, nFixedDamage)
	local hCaster = self:GetCaster()
	local hGlaives = hCaster:FindAbilityByName("luna_pf_moon_glaive")

	local tDamageTable = {
		attacker = hCaster,
		victim = hTarget,
		damage = nFixedDamage or self:GetSpecialValueFor("beam_damage"),
		damage_type = self:GetAbilityDamageType(),
		ability = self
	}
	
	ApplyDamage(tDamageTable)

	if hCaster:HasShard("aghsfort_special_luna_lucent_beam_diffusion") then
		local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, hCaster:FindTalentValue("aghsfort_special_luna_lucent_beam_diffusion", "radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS, 0, false)
		tDamageTable.damage = tDamageTable.damage * hCaster:FindTalentValue("aghsfort_special_luna_lucent_beam_diffusion", "damage_pct") / 100

		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				tDamageTable.victim = hEnemy
				ApplyDamage(tDamageTable)
			end
		end
	end

	if not bEclipse then
		hTarget:AddNewModifier(hCaster, self, "modifier_stunned", {duration = self:GetSpecialValueFor("stun_duration") * (1 - hTarget:GetStatusResistance())})
		hTarget:EmitSound("Hero_Luna.LucentBeam.Target")

		if self:GetSpecialValueFor("damage_buff_duration") > 0 then
			hCaster:AddNewModifier(hCaster, self, "modifier_luna_pf_lucent_beam_damage_buff", {duration = self:GetSpecialValueFor("damage_buff_duration"), nStacks = 1})
		end

		if hCaster:HasShard("aghsfort_special_luna_lucent_beam_glaives") and hGlaives and hGlaives:IsTrained() then
			local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, hGlaives:GetSpecialValueFor("range"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS, 0, false)

			local tProjectile = {
				Target = nil,
				Source = hTarget,
				Ability = self,
				EffectName = "particles/units/heroes/hero_luna/luna_moon_glaive_bounce.vpcf",
				bDodgable = true,
				bIsAttack = true,
				bProvidesVision = false,
				iMoveSpeed = hCaster:GetProjectileSpeed(),
				iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
			}

			for _, hEnemy in pairs(hEnemies) do
				if hEnemy ~= hTarget then
					tProjectile.Target = hEnemy
					ProjectileManager:CreateTrackingProjectile(tProjectile)
				end
			end
		end
	end

	local nBeamFX = ParticleManager:CreateParticle("particles/units/heroes/hero_luna/luna_lucent_beam.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	ParticleManager:SetParticleControlEnt(nBeamFX, 1, hTarget, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nBeamFX, 5, hTarget, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nBeamFX, 6, hCaster, PATTACH_POINT_FOLLOW, "attach_weapon", Vector(0, 0, 0), true)
	ParticleManager:ReleaseParticleIndex(nBeamFX)
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:Moonglow(hTarget)
	local hCaster = self:GetCaster()

	hTarget:AddNewModifier(hCaster, self, "modifier_luna_pf_lucent_beam_moonglow", {duration = self:GetSpecialValueFor("stun_duration") * hCaster:FindTalentValue("aghsfort_special_luna_lucent_beam_moonglow", "duration_multiplier")})
end

--------------------------------------------------------------------------------

function luna_pf_lucent_beam:OnProjectileHit(hTarget, vLocation)
	if not hTarget then return end
	local hIntrinsic = self:GetCaster():FindModifierByName("modifier_luna_pf_moon_glaive")

	if hIntrinsic then hIntrinsic.bBounceActive = true end
	self:GetCaster():PerformAttack(hTarget, false, true, true, false, false, false, false)
	if hIntrinsic then hIntrinsic.bBounceActive = false end
end

--------------------------------------------------------------------------------

modifier_luna_pf_lucent_beam_damage_buff = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_damage_buff:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_damage_buff:OnCreated(kv)
	local hAbility = self:GetAbility()

	self.nDamagePerHit = hAbility:GetSpecialValueFor("damage_buff_per_beam")
	self.nEclipsePct = hAbility:GetSpecialValueFor("damage_buff_from_eclipse_pct") / 100

	if IsClient() then return end

	self.nStacks = kv.nStacks or 0
	self.nEclipseStacks = kv.nEclipseStacks or 0

	self:UpdateDamage()

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self.nStacks = self.nStacks - (kv.nStacks or 0)
			self.nEclipseStacks = self.nEclipseStacks - (kv.nEclipseStacks or 0)
			self:UpdateDamage()
		end
	end)
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_damage_buff:OnRefresh(kv)
	local hAbility = self:GetAbility()

	self.nDamagePerHit = hAbility:GetSpecialValueFor("damage_buff_per_beam")

	if IsClient() then return end

	self.nStacks = self.nStacks + (kv.nStacks or 0)
	self.nEclipseStacks = self.nEclipseStacks + (kv.nEclipseStacks or 0)
	self:UpdateDamage()

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self.nStacks = self.nStacks - (kv.nStacks or 0)
			self.nEclipseStacks = self.nEclipseStacks - (kv.nEclipseStacks or 0)
			self:UpdateDamage()
		end
	end)
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_damage_buff:UpdateDamage()
	self:SetStackCount((self.nStacks * self.nDamagePerHit) + (self.nEclipseStacks * self.nEclipsePct * self.nDamagePerHit))
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_damage_buff:DeclareFunctions()
	return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_damage_buff:GetModifierPreAttack_BonusDamage()
	return self:GetStackCount()
end

--------------------------------------------------------------------------------

modifier_luna_pf_lucent_beam_moonglow = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_moonglow:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nAttackSpeed = hAbility:GetSpecialValueFor("beam_damage") * hCaster:FindTalentValue("aghsfort_special_luna_lucent_beam_moonglow", "dmg_to_aspd_pct") / 100
	self.nLifesteal = hCaster:FindTalentValue("aghsfort_special_luna_lucent_beam_moonglow", "lifesteal") / 100
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_moonglow:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_TOOLTIP
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_moonglow:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeed
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_moonglow:OnTooltip()
	return self.nLifesteal * 100
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lucent_beam_moonglow:OnAttackLanded(event)
	if event.attacker ~= self:GetParent() or IsClient() then return end

	local hAttacker = event.attacker
	local hTarget = event.target
	local nDamage = event.damage
	local nCategory = event.damage_category
	local hAbility = self:GetAbility()

	if not hTarget or hAttacker == hTarget or not hAbility then
		return 0
	end

	if hTarget:IsBuilding() or hTarget:IsOther() or nCategory ~= DOTA_DAMAGE_CATEGORY_ATTACK then
		return 0
	end

	hAttacker:HealWithParams(nDamage * self.nLifesteal, hAbility, true, true, self:GetCaster(), false)
	ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker))
end
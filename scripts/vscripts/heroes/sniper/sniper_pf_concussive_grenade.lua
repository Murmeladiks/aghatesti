LinkLuaModifier("modifier_sniper_pf_concussive_grenade_slow", "heroes/sniper/sniper_pf_concussive_grenade", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

sniper_pf_concussive_grenade = class({})

--------------------------------------------------------------------------------

function sniper_pf_concussive_grenade:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shard_concussive_grenade_model.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shard_concussive_grenade_slow.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/concussive_grenade_disarm.vpcf", context)	
end

--------------------------------------------------------------------------------

function sniper_pf_concussive_grenade:Spawn()
	if IsClient() then return end
	self:SetLevel(1)
end

--------------------------------------------------------------------------------

function sniper_pf_concussive_grenade:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function sniper_pf_concussive_grenade:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPosition = self:GetCursorPosition()
	local vOrigin = hCaster:GetAttachmentOrigin(hCaster:ScriptLookupAttachment("attach_attack1"))

	local vDirection = vPosition - vOrigin
	vDirection.z = 0
	vDirection = vDirection:Normalized()

	local nGrenadeFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_shard_concussive_grenade_model.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	ParticleManager:SetParticleControl(nGrenadeFX, 0, vOrigin)
	ParticleManager:SetParticleControl(nGrenadeFX, 1, Vector(self:GetSpecialValueFor("speed"), 0, 0))
	ParticleManager:SetParticleControl(nGrenadeFX, 5, vPosition)

	ProjectileManager:CreateLinearProjectile({
		EffectName = "",
		Ability = self,
		vSpawnOrigin = vOrigin, 
		vVelocity = vDirection * self:GetSpecialValueFor("speed"),
		fDistance = (vPosition - vOrigin):Length2D(),
		Source = hCaster,
		fExpireTime = GameRules:GetGameTime() + 10.0,
		bProvidesVision = true,
		iVisionRadius = 200,
		iVisionTeamNumber = hCaster:GetTeam(),
		bDrawsOnMinimap = false,
		ExtraData = {
			nFX = nGrenadeFX
		}
	})

	hCaster:AddNewModifier(
		hCaster, 
		self, 
		"modifier_knockback", 
		{
			center_x = vPosition.x,
			center_y = vPosition.y,
			center_z = vPosition.z,
			should_stun = false, 
			duration = self:GetSpecialValueFor("knockback_duration"),
			knockback_duration = self:GetSpecialValueFor("knockback_duration"),
			knockback_distance = self:GetSpecialValueFor("knockback_distance"),
			knockback_height = self:GetSpecialValueFor("knockback_height"),
		}
	)

	hCaster:EmitSound("Hero_Sniper.ConcussiveGrenade.Cast")
end

--------------------------------------------------------------------------------

function sniper_pf_concussive_grenade:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	local hCaster = self:GetCaster()
	local nDuration = self:GetSpecialValueFor("debuff_duration")
	local hAssassinate = hCaster:FindAbilityByName("sniper_pf_assassinate")

	local tKV = {
		center_x = vLocation.x,
		center_y = vLocation.y,
		center_z = vLocation.z,
		should_stun = true, 
		duration = self:GetSpecialValueFor("knockback_duration"),
		knockback_duration = self:GetSpecialValueFor("knockback_duration"),
		knockback_distance = self:GetSpecialValueFor("knockback_distance"),
		knockback_height = self:GetSpecialValueFor("knockback_height"),
	}

	local nDamage = self:GetSpecialValueFor("base_damage")

	if hAssassinate and hAssassinate:IsTrained() then
		nDamage = nDamage + hAssassinate:GetSpecialValueFor("damage") * self:GetSpecialValueFor("assassinate_multiplier") / 100
	end

	local tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = nDamage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self
	}
	
	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLocation, nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, self, "modifier_knockback", tKV)
		hEnemy:AddNewModifier(hCaster, self, "modifier_sniper_pf_concussive_grenade_slow", {duration = nDuration * (1 - hEnemy:GetStatusResistance())})
		hEnemy:EmitSound("Hero_Sniper.ConcussiveGrenade.Target")

		tDamageTable.victim = hEnemy
		ApplyDamage(tDamageTable)
	end

	local nGrenadeFX = ExtraData.nFX

	if nGrenadeFX then
		ParticleManager:DestroyParticle(nGrenadeFX, false)
		ParticleManager:ReleaseParticleIndex(nGrenadeFX)
	end

	EmitSoundOnLocationWithCaster(vLocation, "Hero_Sniper.ConcussiveGrenade", hCaster)

	return true
end

--------------------------------------------------------------------------------

modifier_sniper_pf_concussive_grenade_slow = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_concussive_grenade_slow:OnCreated()
	local hAbility = self:GetAbility()

	self.nMoveSlow = -hAbility:GetSpecialValueFor("slow")

	if IsClient() then return end

	local nSlowFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_shard_concussive_grenade_slow.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	self:AddParticle(nSlowFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_concussive_grenade_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

function modifier_sniper_pf_concussive_grenade_slow:CheckState()
	return {[MODIFIER_STATE_DISARMED] = true}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_concussive_grenade_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_concussive_grenade_slow:GetEffectName()
	return "particles/units/heroes/hero_sniper/concussive_grenade_disarm.vpcf"
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_concussive_grenade_slow:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_concussive_grenade_slow:ShouldUseOverheadOffset()
	return true
end
modifier_medusa_magic_shield = class({})

--------------------------------------------------------------------------------

function modifier_medusa_magic_shield:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_medusa_magic_shield:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_MAGICAL,
	}
end

--------------------------------------------------------------------------------

function modifier_medusa_magic_shield:OnCreated()
	self.parent = self:GetParent()

	local p_id = ParticleManager:CreateParticle("particles/heroes/medusa/medusa_magic_shield.vpcf", PATTACH_CUSTOMORIGIN_FOLLOW, self.parent)
	ParticleManager:SetParticleControlEnt(p_id, 1, self.parent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), false)
	ParticleManager:SetParticleControl(p_id, 5, Vector(1, 1, 1))

	self:AddParticle(p_id, false, false, 10, false, false)

	if not IsServer() then return end
	local ability = self:GetAbility()
	self.mana_threshold = ability:GetSpecialValueFor("mana_threshold")
	self.cooldown_shift = ability:GetSpecialValueFor("cooldown_speed_increase") / 100

	self.stone_gaze = self.parent:FindAbilityByName("medusa_stone_gaze_lua")
	self:_ForwardStoneGazeCd()
end

--------------------------------------------------------------------------------

function modifier_medusa_magic_shield:OnDestroy()
	if not IsServer() then return end

	local ability = self:GetAbility()

	local duration = ability:GetSpecialValueFor("expire_effect_duration")
	local radius = ability:GetSpecialValueFor("expire_effect_radius")
	local damage = ability:GetSpecialValueFor("expire_effect_damage")

	local enemies = FindUnitsInRadius(
		self.parent:GetTeamNumber(),
		self.parent:GetOrigin(),
		nil,
		radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_COURIER,
		0,
		0,
		false
	)

	local damage_info = {
		victim = nil,
		attacker = self.parent,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = ability,
	}

	for _, enemy in pairs(enemies) do
		damage_info.victim = enemy
		ApplyDamage(damage_info)
		enemy:AddNewModifier(self.parent, ability, "modifier_disarmed", {duration = duration})
	end

	
	--local p_id = ParticleManager:CreateParticle("particles/units/heroes/hero_stormspirit/stormspirit_overload_discharge.vpcf", PATTACH_ABSORIGIN, self.parent)
	local p_id = ParticleManager:CreateParticle("particles/items_fx/ethereal_blade_glow_target.vpcf", PATTACH_ABSORIGIN, self.parent)
	ParticleManager:SetParticleControl(p_id, 0, self.parent:GetAbsOrigin())
	ParticleManager:SetParticleControl(p_id, 1, self.parent:GetAbsOrigin())
	ParticleManager:ReleaseParticleIndex(p_id)

	self:_ForwardStoneGazeCd()
end

--------------------------------------------------------------------------------

function modifier_medusa_magic_shield:GetAbsoluteNoDamageMagical()
	return 1
end

--------------------------------------------------------------------------------

function modifier_medusa_magic_shield:_ForwardStoneGazeCd()
	if not IsServer() then return end
	if self.stone_gaze:IsCooldownReady() then return end

	local current_cd = self.stone_gaze:GetCooldownTimeRemaining()
	self.stone_gaze:EndCooldown()
	self.stone_gaze:StartCooldown(current_cd - self.cooldown_shift)
end
modifier_medusa_stone_gaze_active = class({})

function modifier_medusa_stone_gaze_active:IsPurgable() return false end

function modifier_medusa_stone_gaze_active:OnCreated()
	self.ability = self:GetAbility()
	self.parent = self:GetParent()

	self.radius = self.ability:GetSpecialValueFor("radius")
	self.move_speed_bonus_pct = self.ability:GetSpecialValueFor("speed_boost")

	self.stone_gaze_splitting_shard = self.parent:FindAbilityByName("pathfinder_medusa_stone_gaze_split")

	if self.stone_gaze_splitting_shard then
		self.move_speed_bonus = self.stone_gaze_splitting_shard:GetSpecialValueFor("move_speed_bonus")
		self.attack_speed_bonus = self.stone_gaze_splitting_shard:GetSpecialValueFor("attack_speed_bonus")
		if IsServer() then self:StartIntervalThink(1 / (self.parent:GetAttacksPerSecond(false) * 2)) end
	end

	if not IsServer() then return end

	self:_AddEffects()
	self.parent:FindModifierByName(self.ability:GetIntrinsicModifierName()):Activate()
end

function modifier_medusa_stone_gaze_active:OnDestroy()
	if not IsServer() then return end
	self.parent:FindModifierByName(self.ability:GetIntrinsicModifierName()):Deactivate()
	self.parent:StopSound("Hero_Medusa.StoneGaze.Cast")
end


function modifier_medusa_stone_gaze_active:_AddEffects()
	local p_id = ParticleManager:CreateParticle(
		"particles/units/heroes/hero_medusa/medusa_stone_gaze_active.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.parent
	)
	ParticleManager:SetParticleControlEnt(
		p_id, 1, self.parent, PATTACH_POINT_FOLLOW, "attach_head", Vector(0,0,0), true
	)
	self:AddParticle(
		p_id, false, false, -1, false, false
	)

	self.parent:EmitSound("Hero_Medusa.StoneGaze.Cast")
end


function modifier_medusa_stone_gaze_active:OnIntervalThink()
	if not IsServer() then return end

	if not self.parent or self.parent:IsNull() or not self.parent:IsAlive() then return end
	if self.parent:IsHexed() or self.parent:IsStunned() or self.parent:IsOutOfGame() or self.parent:IsDisarmed() then return end

	local parent_origin = self.parent:GetAbsOrigin()
	local parent_attack_range = self.parent:Script_GetAttackRange()

	local target = self.target or self.parent:GetAttackTarget()
	if not target or target:IsNull() or not target:IsAlive() then 
		self.target = self:_ReacquireTarget(parent_origin, parent_attack_range)
		target = self.target
	end
	-- search may still yield no appropriate targets
	if not target or target:IsNull() then return end

	if (target:GetAbsOrigin() - parent_origin):Length2D() > parent_attack_range then return end

	self.parent:PerformAttack(
		target, true, true, false, false, true, false, false
	)
end


function modifier_medusa_stone_gaze_active:_ReacquireTarget(location, radius)
	local enemies = FindUnitsInRadius(
		self.parent:GetTeamNumber(),
		location,
		nil,
		radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_NOT_ATTACK_IMMUNE,
		FIND_CLOSEST,
		false
	)
	if not enemies or #enemies == 0 then return end
	return enemies[1]
end


function modifier_medusa_stone_gaze_active:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,

		MODIFIER_EVENT_ON_ORDER,
	}
end

function modifier_medusa_stone_gaze_active:GetModifierMoveSpeedBonus_Constant()
	return self.move_speed_bonus
end

function modifier_medusa_stone_gaze_active:GetModifierAttackSpeedBonus_Constant()
	return self.attack_speed_bonus
end

function modifier_medusa_stone_gaze_active:GetModifierMoveSpeedBonus_Percentage()
	return self.move_speed_bonus_pct
end


function modifier_medusa_stone_gaze_active:OnOrder(params)
	if not IsServer() then return end
	if params.unit ~= self.parent then return end

	if params.order_type == DOTA_UNIT_ORDER_ATTACK_TARGET then
		self.target = params.target
	end
end

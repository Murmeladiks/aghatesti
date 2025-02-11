medusa_split_shot_curse_of_endless_torment = class({})
LinkLuaModifier("modifier_curse_of_endless_torment_pole", "heroes/medusa/medusa_split_shot_curse_of_endless_torment/modifier_curse_of_endless_torment_pole", LUA_MODIFIER_MOTION_NONE)


function medusa_split_shot_curse_of_endless_torment:GetIntrinsicModifierName()
	return "modifier_curse_of_endless_torment_pole"
end


if not IsServer() then return end


function medusa_split_shot_curse_of_endless_torment:_Destroy()
	self.owner.poles[self.caster:GetEntityIndex()] = nil
	self.caster:RemoveSelf()
end


function medusa_split_shot_curse_of_endless_torment:Spawn()
	self.caster = self:GetCaster()
	self.owner = self.caster:GetOwner()

	Timers:CreateTimer(0, function()
		self.location = self.caster:GetAbsOrigin()
	end)

	self.split_shot = self.owner:FindModifierByName("modifier_medusa_split_shot_lua")

	self.attack_limit = self:GetLevelSpecialValueFor("pole_attacks_count", 1)
	self.performed_attacks = 0

	self.owner.poles[self.caster:GetEntityIndex()] = self
end


function medusa_split_shot_curse_of_endless_torment:OnProjectileHit(target, location)
	self.performed_attacks = self.performed_attacks + 1

	if target and not target:IsNull() then
		self.split_shot:FireSplitShot(target, 0, false)
	end

	if self.performed_attacks > self.attack_limit then
		self:_Destroy()
	end
end


function medusa_split_shot_curse_of_endless_torment:FireAttack(target, snake_shard_value)
	if not self.caster or self.caster:IsNull() then return end
	if not self.location then return end

	local attack_range = self.owner:Script_GetAttackRange()
	local distance = (self.location - target:GetAbsOrigin()):Length()
	-- extreme distance = in another room and can be safely removed
	if distance >= 4000 then
		self:_Destroy()
		return
	end
	
	-- exceeding attack range - find new target
	if distance > attack_range then
		local enemies = FindUnitsInRadius(
			self.caster:GetTeamNumber(),
			self.location,
			nil,
			attack_range,
			DOTA_UNIT_TARGET_TEAM_ENEMY,
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING,
			DOTA_UNIT_TARGET_FLAG_NOT_ATTACK_IMMUNE,
			FIND_CLOSEST,
			false
		)
		-- no enemies = skip
		if #enemies <= 0 then return end
		target = enemies[1]
	end
	self.caster:FaceTowards(target:GetAbsOrigin())

	if snake_shard_value and snake_shard_value > 0 and RollPseudoRandomPercentage(snake_shard_value, self:GetEntityIndex(), self.caster) then
		self.split_shot.snake_ability:FireSnake(target, nil, self.caster)
		return
	end

	ProjectileManager:CreateTrackingProjectile({
		Target = target,
		Source = self.caster,
		Ability = self,	
		
		EffectName = self.owner:GetRangedProjectileName(),
		iMoveSpeed = self.owner:GetProjectileSpeed(),
		bDodgeable = false,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		bProvidesVision = false,
	})
end

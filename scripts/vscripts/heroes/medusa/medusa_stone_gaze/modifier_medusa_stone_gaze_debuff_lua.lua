modifier_medusa_stone_gaze_debuff_lua = class({})

function modifier_medusa_stone_gaze_debuff_lua:IsHidden() return true end
function modifier_medusa_stone_gaze_debuff_lua:IsPurgable() return false end
function modifier_medusa_stone_gaze_debuff_lua:IsDebuff() return true end

function modifier_medusa_stone_gaze_debuff_lua:OnCreated()
	self.ability = self:GetAbility()

	self.slow = -self.ability:GetSpecialValueFor("slow")
	self.radius = self.ability:GetSpecialValueFor("radius")
	
	self.stone_angle = 85

	self.parent = self:GetParent()
	self.caster = self:GetCaster()
	self.facing = false
	self.counter = 0
	self.interval = 0.1

	if self.ability.passive_stone_gaze_shard then
		self.face_duration = self.ability.passive_stone_gaze_shard:GetSpecialValueFor("passive_face_duration")
		self.stun_duration = self.ability.passive_stone_gaze_shard:GetSpecialValueFor("passive_stone_duration")
		self.stone_gaze_cd = 
			self.ability.passive_stone_gaze_shard:GetSpecialValueFor("passive_stone_cooldown")
			* self:GetCaster():GetCooldownReduction()
	else
		self.face_duration = self.ability:GetSpecialValueFor("face_duration")
		self.stun_duration = self.ability:GetSpecialValueFor("stone_duration")
	end

	if not IsServer() then return end

	self:PlayEffects1()
	self:PlayEffects2()

	self:StartIntervalThink(self.interval)
	self:OnIntervalThink()
end

function modifier_medusa_stone_gaze_debuff_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
end

function modifier_medusa_stone_gaze_debuff_lua:GetModifierMoveSpeedBonus_Percentage()
	if self.facing then return self.slow end
end

function modifier_medusa_stone_gaze_debuff_lua:GetModifierAttackSpeedBonus_Constant()
	if self.facing then return self.slow end
end

function modifier_medusa_stone_gaze_debuff_lua:OnIntervalThink()
	local direction = self.caster:GetOrigin() - self.parent:GetOrigin()

	local center_angle = VectorToAngles(direction).y
	local facing_angle = VectorToAngles(self.parent:GetForwardVector()).y
	local distance = direction:Length2D()

	local prev_facing = self.facing

	-- determine facing
	self.facing = ( math.abs( AngleDiff(center_angle,facing_angle) ) < self.stone_angle ) and (distance < self.radius )

	-- change effects only when the state changed
	if self.facing ~= prev_facing then
		self:ChangeEffects( self.facing )
	end

	-- if facing and distance is less than radius, add to counter
	if self.facing then
		self.counter = self.counter + self.interval
	end

	-- if counter is more than face duration, stun and destroy
	if self.counter >= self.face_duration then

		local stun_duration = self.stun_duration
		local active_stone_gaze = self.caster:FindModifierByName("modifier_medusa_stone_gaze_active")

		if self.ability.passive_stone_gaze_shard and active_stone_gaze then
			stun_duration = math.max(active_stone_gaze:GetRemainingTime(), self.stun_duration)
		end
		
		self.ability:Petrify(self.parent, stun_duration, self.ability)

		if self.ability.passive_stone_gaze_shard then
			self.parent:AddNewModifier(self.parent, self.ability, "modifier_medusa_stone_gaze_cd", {
				duration = self.stone_gaze_cd
			})
		end

		self:Destroy()
	end
end

function modifier_medusa_stone_gaze_debuff_lua:PlayEffects1()
	local effect_cast = ParticleManager:CreateParticle(
		"particles/units/heroes/hero_medusa/medusa_stone_gaze_debuff.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.parent
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast, 1, self.caster, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0,0,0), true
	)
	self:AddParticle(
		effect_cast, false, false, -1, false, false
	)
end

function modifier_medusa_stone_gaze_debuff_lua:PlayEffects2()
	self.effect_cast = ParticleManager:CreateParticle(
		"particles/units/heroes/hero_medusa/medusa_stone_gaze_facing.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.parent
	)
	ParticleManager:SetParticleControlEnt(
		self.effect_cast, 1, self.parent, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0,0,0), true
	)
	self:AddParticle(
		self.effect_cast, false, false, -1, false, false
	)
end

function modifier_medusa_stone_gaze_debuff_lua:ChangeEffects(is_now_facing)
	local target = is_now_facing and self.caster or self.parent

	ParticleManager:SetParticleControlEnt(
		self.effect_cast, 1, target, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0,0,0), true
	)
end


function modifier_medusa_stone_gaze_debuff_lua:OnDestroy()
	if not IsServer() then return end
	if not self.parent or self.parent:IsNull() then return end
	self.parent:SetForceAttackTarget(nil)
end

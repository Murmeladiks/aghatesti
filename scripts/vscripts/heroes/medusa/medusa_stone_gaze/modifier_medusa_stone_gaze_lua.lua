modifier_medusa_stone_gaze_lua = class({})

function modifier_medusa_stone_gaze_lua:IsHidden() return true end
function modifier_medusa_stone_gaze_lua:IsPurgable() return false end
function modifier_medusa_stone_gaze_lua:DestroyOnExpire() return false end

if not IsServer() then return end

function modifier_medusa_stone_gaze_lua:OnCreated()
	self.ability = self:GetAbility()

	self.team = self.ability:GetTeamNumber()
	self.parent = self:GetParent()

	self.is_illusion = self.parent:IsIllusion()

	if IsServer() then self:StartIntervalThink(1) end
end

function modifier_medusa_stone_gaze_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
	}
end

function modifier_medusa_stone_gaze_lua:GetModifierProcAttack_Feedback(params)
	if not self.ability.explosion_shard then return end
	local target = params.target

	if target:IsConsideredHero() or target:IsBoss() then return end

	local petrification_modifier = target:FindModifierByName("modifier_medusa_petrified_lua")
	if not petrification_modifier or petrification_modifier:GetRemainingTime() <= 0 then return end

	local petrified_damage_radius = self.ability.explosion_shard:GetSpecialValueFor("petrified_damage_radius")
	local petrified_damage_bonus = self.ability.explosion_shard:GetSpecialValueFor("petrified_damage_bonus") / 100

	local enemies = FindUnitsInRadius(
		self.team,
		target:GetAbsOrigin(),
		nil,
		petrified_damage_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_COURIER,
		DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		0,
		false
	)

	for _, enemy in pairs(enemies) do
		if enemy and not enemy:IsNull() and enemy:IsAlive() then
			ApplyDamage({
				victim = enemy,
				attacker = self.parent,
				damage = enemy:GetMaxHealth() * petrified_damage_bonus,
				damage_type = DAMAGE_TYPE_PURE,
				damage_flags = DOTA_DAMAGE_FLAG_NO_DAMAGE_MULTIPLIERS + DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION,
				ability = self.ability.explosion_shard,
			})
		end
	end

	local p_id = ParticleManager:CreateParticle("particles/units/heroes/hero_earth_spirit/earthspirit_stone_clap_shock.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
	ParticleManager:SetParticleControl(p_id, 0, target:GetAbsOrigin())
	ParticleManager:ReleaseParticleIndex(p_id)
end


function modifier_medusa_stone_gaze_lua:OnIntervalThink()
	if self.is_illusion then self:StartIntervalThink(-1) end

	local passive_stone_gaze_shard = 
		self.ability.passive_stone_gaze_shard 
		or self.parent:FindAbilityByName("pathfinder_medusa_stone_gaze_gorgon_eyes")
	
	if passive_stone_gaze_shard and not self.ability.passive_stone_gaze_shard then
		self.ability.passive_stone_gaze_shard  = passive_stone_gaze_shard
		self:Activate()
	end

	if not self.active or not self.parent:IsAlive() then return end

	local duration = self.ability:GetSpecialValueFor("duration") * 2
	local radius = self.ability:GetSpecialValueFor("radius")

	local enemies = FindUnitsInRadius(
		self.parent:GetTeamNumber(),
		self.parent:GetOrigin(),
		nil,
		radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		0,
		false
	)

	for _, enemy in pairs(enemies) do
		local petrification = enemy:HasModifier("modifier_medusa_petrified_status_lua")
		local stone_gaze_debuff = enemy:HasModifier("modifier_medusa_stone_gaze_debuff_lua")
		local stone_gaze_cd = passive_stone_gaze_shard and enemy:HasModifier("modifier_medusa_stone_gaze_cd") or false

		if passive_stone_gaze_shard and self.parent:HasModifier("modifier_medusa_stone_gaze_active") then
			self.parent:MakeVisibleDueToAttack(DOTA_TEAM_BADGUYS, 150)
			
			ExecuteOrderFromTable({
				UnitIndex = enemy:entindex(),
				OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
				TargetIndex = self.parent:entindex(),
				Queue = false
			})

			enemy:SetForceAttackTarget(self.parent)

			Timers:CreateTimer(self.parent:FindModifierByName("modifier_medusa_stone_gaze_active"):GetRemainingTime(), function()
				if enemy and not enemy:IsNull() and enemy:IsAlive() then
					enemy:SetForceAttackTarget(nil)
				end
			end)
		end

		if not petrification and not stone_gaze_debuff and not stone_gaze_cd then
			enemy:AddNewModifier(
				self.parent, self.ability, "modifier_medusa_stone_gaze_debuff_lua", {
					duration = duration
				}
			)
		end
	end
end


function modifier_medusa_stone_gaze_lua:Activate()
	self:StartIntervalThink(0.1)
	self.active = true
	self:SetStackCount(1)
end


function modifier_medusa_stone_gaze_lua:Deactivate()
	if self.ability.passive_stone_gaze_shard and not self.ability.passive_stone_gaze_shard:IsNull() then return end
	self:StartIntervalThink(1)
	self.active = false
	self:SetStackCount(0)
end


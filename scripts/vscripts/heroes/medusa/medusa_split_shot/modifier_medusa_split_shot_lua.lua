modifier_medusa_split_shot_lua = class({})

function modifier_medusa_split_shot_lua:IsHidden() return true end
function modifier_medusa_split_shot_lua:IsPurgable() return false end
function modifier_medusa_split_shot_lua:RemoveOnDeath() return false end

function modifier_medusa_split_shot_lua:OnCreated()
	self:OnRefresh()

	if not IsServer() then return end
	self.projectile_name = self.parent:GetRangedProjectileName()

	self.attack_records = {}

	self.depetrify_attacks = {}

	self.parent.poles = self.parent.poles or {}

	self.modifier_talent = false
end

function modifier_medusa_split_shot_lua:OnRefresh()
	self.parent = self:GetParent()
	self.team = self.parent:GetTeamNumber()
	self.ability = self:GetAbility()

	self.damage_reduction_t = self.ability:GetSpecialValueFor("damage_modifier_tooltip")
	self.damage_reduction = self.damage_reduction_t - 100
	self.target_count = self.ability:GetSpecialValueFor("arrow_count")
	self.bonus_range = self.ability:GetSpecialValueFor("split_shot_bonus_range")

	self.stone_gaze = self.parent:FindAbilityByName("medusa_stone_gaze_lua")
	self.snake_ability = self.parent:FindAbilityByName("medusa_mystic_snake_lua")

	self.is_illusion = self.parent:IsIllusion()
end

function modifier_medusa_split_shot_lua:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,

		MODIFIER_EVENT_ON_TAKEDAMAGE,
		MODIFIER_EVENT_ON_ATTACK_RECORD,
		MODIFIER_EVENT_ON_ATTACK_RECORD_DESTROY,
	}
end

function modifier_medusa_split_shot_lua:GetModifierDamageOutgoing_Percentage(params)
	if IsServer() then
		if self.attack_records[params.record] and self.barrage_shard then 
			-- getting half of remaining value from default reduction (used here as expected remaining damage, 50 60 70 80)
			return -(100 - self.damage_reduction_t * self.barrage_shard:GetSpecialValueFor("active_damage_reduction") / 100)
		end
	end
	if self.ability:GetToggleState() then
		return self.damage_reduction
	end
end

if not IsServer() then return end

function modifier_medusa_split_shot_lua:OnAttack(params)
	if params.attacker ~= self.parent then return end
	if params.no_attack_cooldown then return end
	if params.target:GetTeamNumber() == self.team then return end
	if self.parent:PassivesDisabled() then return end
	if not params.process_procs then return end
	
	if self.split_shot_flag then return end

	local stone_gaze_active = self.parent:FindModifierByName("modifier_medusa_stone_gaze_active")

	self.modifier_talent = self.parent:FindTalentValue("special_bonus_unique_medusa_4") == 1
	local snake_shard_value = self.parent:FindTalentValue("pathfinder_medusa_split_shot_snake_oiled_enhancement", "chance")
	
	if not self.is_illusion then
		for entindex, pole in pairs(self.parent.poles) do
			pole:FireAttack(params.target, snake_shard_value)
		end
	end
	
	if not self.ability:GetToggleState() then return end
	
	local affected_targets = 0

	local radius = self.parent:Script_GetAttackRange() + self.bonus_range
	local enemies = FindUnitsInRadius(
		self.team,
		self.parent:GetOrigin(),
		nil,
		radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_COURIER,
		DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		FIND_CLOSEST,
		false
	)

	self.barrage_shard = self.barrage_shard or self.parent:FindAbilityByName("pathfinder_medusa_split_shot_bewitched_barrage")
	if self.barrage_shard and self.barrage_shard:GetLevel() > 0 and self.ability:GetAutoCastState() then
		local extended_shot_count = 0
		if stone_gaze_active and stone_gaze_active.stone_gaze_splitting_shard then
			for _, enemy in pairs(enemies) do
				if enemy:HasModifier("modifier_medusa_stone_gaze_debuff_lua") 
				or enemy:HasModifier("modifier_medusa_petrified_status_lua") 
				then
					extended_shot_count = extended_shot_count + 1
				end
			end
		end

		local complete_shot_count = self.target_count + extended_shot_count
		local delay = math.min(1 / complete_shot_count, 0.1)
		Timers:CreateTimer(delay, function()
			if not params.target or params.target:IsNull() or not params.target:IsAlive() then return end
			self.parent:SetRangedProjectileName("particles/econ/events/diretide_2020/attack_modifier/attack_modifier_fall20.vpcf")
			self:FireSplitShot(params.target, snake_shard_value)
			self.parent:SetRangedProjectileName(self.projectile_name)
			affected_targets = affected_targets + 1
			if affected_targets >= complete_shot_count then return end
			return delay
		end)
		return
	end

	for _, enemy in pairs(enemies) do
		if enemy ~= params.target and not enemy:HasModifier("modifier_breakable_container") and not enemy:HasModifier("modifier_aghsfort_explosive_barrel_pf") then
			self:FireSplitShot(enemy, snake_shard_value)
			-- do not count targets that are affected by active stone gaze
			if not stone_gaze_active 
			or not stone_gaze_active.stone_gaze_splitting_shard
			or (not enemy:HasModifier("modifier_medusa_stone_gaze_debuff_lua") and not enemy:HasModifier("modifier_medusa_petrified_status_lua"))
			then
				affected_targets = affected_targets + 1
			end
			
			if affected_targets >= self.target_count then break end
		end
	end

	if affected_targets > 0 then
		self.parent:EmitSound("Hero_Medusa.AttackSplit")
	end
end


function modifier_medusa_split_shot_lua:FireSplitShot(enemy, snake_shard_value, use_projectile, never_miss)
	if use_projectile == nil then use_projectile = true end
	if never_miss == nil then never_miss = false end
	if self.is_illusion then snake_shard_value = 0 end
	if snake_shard_value > 0 and RollPseudoRandomPercentage(snake_shard_value, self.ability:GetEntityIndex(), self.parent) then
		self.snake_ability:FireSnake(enemy)
		return
	end

	self.split_shot_flag = true
	self.parent:PerformAttack(
		enemy, -- hTarget
		false, -- bUseCastAttackOrb
		self.modifier_talent, -- bProcessProcs
		true, -- bSkipCooldown
		false, -- bIgnoreInvis
		use_projectile, -- bUseProjectile
		false, -- bFakeAttack
		never_miss -- bNeverMiss
	)
	self.split_shot_flag = false
end


function modifier_medusa_split_shot_lua:IncrementPetrify(params)
	local target = params.target
	if not target or target:IsNull() or not target:IsAlive() then return end
	
	if not self.barrage_shard then return end
	target.split_shot_petrify_counter = (target.split_shot_petrify_counter or 0) + 1

	if target.split_shot_petrify_counter >= self.barrage_shard:GetSpecialValueFor("attacks_to_petrify") then
		target.split_shot_petrify_counter = 0
		self.stone_gaze:Petrify(target, self.barrage_shard:GetSpecialValueFor("petrify_duration"), self.barrage_shard)
	end
end


function modifier_medusa_split_shot_lua:OnTakeDamage(params)
	if params.attacker ~= self.parent then return end
	if params.attacker:GetTeamNumber() == params.unit:GetTeamNumber() then return end

	self.stone_gaze.explosion_shard = 
		self.stone_gaze.explosion_shard 
		or self.parent:FindAbilityByName("pathfinder_medusa_stone_gaze_stone_shatter")

	self.curse_shard = 
		self.curse_shard 
		or self.parent:FindAbilityByName("pathfinder_medusa_split_shot_curse_of_endless_torment")

	-- if target died to our damage instance, process immediately
	if not params.unit:IsAlive() then
		if self.curse_shard then
			self:RollPoleAt(params.unit:GetAbsOrigin(), self.curse_shard:GetSpecialValueFor("spawn_chance"))
		end
		if self.stone_gaze.explosion_shard then
			local petrification_modifier = params.unit:FindModifierByName("modifier_medusa_petrified_lua")
			if petrification_modifier and petrification_modifier:GetRemainingTime() > 0 then
				self.stone_gaze:ShatterPetrified(params.unit, petrification_modifier.latest_applied_duration)
			end
		end
		return
	end

	if self.curse_shard then
		params.unit:AddNewModifier(self.parent, self.curse_shard, "modifier_curse_of_endless_torment_victim", {
			duration = self.curse_shard:GetSpecialValueFor("linger_duration")
		})
	end
	if self.stone_gaze.explosion_shard then
		params.unit:AddNewModifier(self.parent, self.stone_gaze.explosion_shard, "modifier_stone_gaze_shatter_victim", {
			duration = self.stone_gaze.explosion_shard:GetSpecialValueFor("linger_duration")
		})
	end
end


function modifier_medusa_split_shot_lua:RollPoleAt(location, chance)
	if not RollPercentage(chance) then return end

	local min_radius = self.curse_shard:GetSpecialValueFor("min_radius")
	for _, pole in pairs(self.parent.poles) do
		if (pole:GetAbsOrigin() - location):Length() <= min_radius then return end
	end

	local pole = CreateUnitByName(
		"pathfinder_medusa_split_shot_pole", location, true, self.parent, self.parent, self.parent:GetTeamNumber()
	)
	if not pole or pole:IsNull() then return end
	pole:SetOwner(self.parent)

	local p_id = ParticleManager:CreateParticle("particles/units/heroes/hero_shadowshaman/shadowshaman_ward_spawn_rubick.vpcf", PATTACH_ABSORIGIN_FOLLOW, pole)
	ParticleManager:SetParticleControl(p_id, 0, location)
	ParticleManager:ReleaseParticleIndex(p_id)

	pole:EmitSound("Hero_Venomancer.Plague_Ward")
end


function modifier_medusa_split_shot_lua:OnAttackRecord(params)
	if params.attacker ~= self.parent then return end

	if self.depetrify_attack then 
		self.depetrify_attacks[params.record] = true
		return 
	end

	if not self.split_shot_flag or not self.barrage_shard or not self.ability:GetAutoCastState() then return end
	self.attack_records[params.record] = true
end


function modifier_medusa_split_shot_lua:OnAttackRecordDestroy(params)
	if self.depetrify_attacks[params.record] then
		self.stone_gaze:RemoveSource(params.target, self.snake_ability.petrifying_snake_shard)
		return
	end

	if self.attack_records[params.record] then self.attack_records[params.record] = nil end

	if params.attacker ~= self.parent or self.is_illusion then return end
	self:IncrementPetrify(params)
end

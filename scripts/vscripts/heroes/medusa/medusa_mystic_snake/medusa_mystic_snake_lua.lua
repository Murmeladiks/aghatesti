LinkLuaModifier("modifier_medusa_pf_mystic_snake_buff", 	"heroes/medusa/medusa_mystic_snake/medusa_mystic_snake_lua", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

medusa_mystic_snake_lua = class({})

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:CastFilterResultTarget(target)
	local caster = self:GetCaster()
	if not caster or caster:IsNull() then return end

	if caster == target then return UF_FAIL_CUSTOM end
	local target_team = 
		caster:HasTalent("pathfinder_medusa_mystic_snake_venomotherapy")
		and DOTA_UNIT_TARGET_TEAM_BOTH
		or DOTA_UNIT_TARGET_TEAM_ENEMY

	return UnitFilter(
		target, 
		target_team, 
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 
		DOTA_UNIT_TARGET_FLAG_NONE, 
		caster:GetTeamNumber()
	)
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:GetCustomCastErrorTarget(target)
	if self:GetCaster() == target then
		return "#dota_hud_error_cant_cast_on_self"
	end
	return ""
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:Spawn()
	if IsClient() then return end
	self:UpdateValues()
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:UpdateValues()
	local current_level = self:GetLevel()
	if current_level == 0 then current_level = 1 end
	
	local caster = self:GetCaster()

	self.bounce_radius = self:GetLevelSpecialValueFor("radius", current_level)
	self.bounce_damage_increase = self:GetLevelSpecialValueFor("snake_scale", current_level) / 100
	self.mana_steal_base = self:GetLevelSpecialValueFor("mana_steal_default", current_level)
	self.mana_steal_captain = self:GetLevelSpecialValueFor("mana_steal_captain", current_level)
	
	self.max_jumps = self:GetLevelSpecialValueFor("snake_jumps", current_level)
	self.jump_delay = self:GetLevelSpecialValueFor("jump_delay", current_level)
	self.snake_damage = self:GetLevelSpecialValueFor("snake_damage", current_level)

	self.damage_table = {
		victim = nil,
		attacker = caster,
		damage = self.snake_damage,
		damage_type = self:GetAbilityDamageType(),
		ability = self,
	}
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:OnSpellStart()
	self:UpdateValues()
	
	local cursor_target = self:GetCursorTarget()

	self:FireSnake(cursor_target)
	cursor_target:EmitSound("Hero_Medusa.MysticSnake.Cast")
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:FireSnake(target, extra_data, source)
	local caster = self:GetCaster()
	if not source then source = caster end

	if not extra_data then 
		extra_data = {
			jumps = 0,
			total_stolen_mana = 0,
			returning = 0,
			-- hit registry
			[target:GetEntityIndex()] = true
		}
	end

	local projectile_name = "particles/units/heroes/hero_medusa/medusa_mystic_snake_projectile.vpcf"
	if extra_data.returning == 1 then
		projectile_name = "particles/units/heroes/hero_medusa/medusa_mystic_snake_projectile_return.vpcf"
	end

	ProjectileManager:CreateTrackingProjectile({
		Target = target,
		Source = source,
		Ability = self,	
		
		EffectName = projectile_name,
		iMoveSpeed = self:GetSpecialValueFor("initial_speed"),
		bDodgeable = false,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		bProvidesVision = true,
		iVisionRadius = 100,
		iVisionTeamNumber = caster:GetTeamNumber(),

		ExtraData = extra_data
	})
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:OnProjectileHit_ExtraData(target, location, extra_data)
	if not target or target:IsNull() then return end

	if extra_data.returning == 1 then
		self:OnSnakeReturn(extra_data)
		return
	end

	local caster = self:GetCaster()

	extra_data[tostring(target:GetEntityIndex())] = true
	extra_data.jumps = extra_data.jumps + 1

	local mana_taken = 0
	if target:GetTeamNumber() ~= caster:GetTeamNumber() then
		mana_taken = self:_OnEnemyHit(target, extra_data)
	else
		mana_taken = self:_OnAllyHit(target)
	end
	extra_data.total_stolen_mana = extra_data.total_stolen_mana + mana_taken
	
	if target and not target:IsNull() then
		target:EmitSound("Hero_Medusa.MysticSnake.Target")
	end
	
	-- return snake
	if extra_data.jumps >= self.max_jumps then
		extra_data.returning = 1
		self:FireSnake(caster, extra_data, target)
		return
	end

	Timers:CreateTimer(self.jump_delay, function()
		local targets = self:SeekNewTargets(location, extra_data)
		local targets_count = #targets

		if targets_count == 0 then
			extra_data.returning = 1
			self:FireSnake(caster, extra_data, target)
			return
		end
		-- split snake legendary shard
		-- roll percentage if learned, and split only if there's valid secondary target
		-- different from main snake target
		local chain_talent_bounces = caster:FindTalentValue("pathfinder_medusa_mystic_snake_chained_serpents", "bonus_bounces")
		local chain_talent_chance = caster:FindTalentValue("pathfinder_medusa_mystic_snake_chained_serpents", "split_chance")
		if chain_talent_chance > 0 and targets_count > 1 and RollPercentage(chain_talent_chance) then
			extra_data.jumps = extra_data.jumps - chain_talent_bounces
			self:FireSnake(targets[2], extra_data, target)
		end

		self:FireSnake(targets[1], extra_data, target)
	end)
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:OnSnakeReturn(extra_data)
	local caster = self:GetCaster()

	local total_gained_mana = caster:GetMaxMana() * extra_data.total_stolen_mana / 100

	caster:GiveMana(total_gained_mana)
	caster:EmitSound("Hero_Medusa.MysticSnake.Return")

	SendOverheadEventMessage(
		nil, 
		OVERHEAD_ALERT_MANA_ADD,
		caster,
		total_gained_mana,
		caster:GetPlayerOwner()
	)

	self.spell_immunity_talent = 
		self.spell_immunity_talent 
		or caster:FindAbilityByName("special_bonus_unique_medusa_mystic_snake_spell_immunity")

	if self.spell_immunity_talent and self.spell_immunity_talent:GetLevel() > 0 then
		caster:Purge(false, true, false, false, false)
		caster:AddNewModifier(caster, self, "modifier_black_king_bar_immune", {
			duration = self.spell_immunity_talent:GetSpecialValueFor("value")
		})
	end

	if self:GetSpecialValueFor("attack_buff_duration") > 0 then
		caster:AddNewModifier(caster, self, "modifier_medusa_pf_mystic_snake_buff", {duration = self:GetSpecialValueFor("attack_buff_duration"), damage = total_gained_mana / self:GetSpecialValueFor("mana_per_damage")})
	end

	self:_OnAllyHit(caster)
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:SeekNewTargets(location, extra_data)
	local target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
	local radius = self.bounce_radius
	local caster = self:GetCaster()
	local venomotherapy_shard = caster:FindAbilityByName("pathfinder_medusa_mystic_snake_venomotherapy")

	if venomotherapy_shard then
		target_team = DOTA_UNIT_TARGET_TEAM_BOTH
		radius = radius * (1 + venomotherapy_shard:GetSpecialValueFor("search_range_bonus") / 100)
	end

	self.global_range_talent = 
		self.global_range_talent 
		or caster:FindAbilityByName("special_bonus_unique_medusa_mystic_snake_global")

	local global_range_learned = self.global_range_talent and self.global_range_talent:GetLevel() > 0

	if global_range_learned then
		radius = -1
	end
	
	local units = FindUnitsInRadius(
		caster:GetTeamNumber(),
		location,
		nil,
		radius,
		target_team,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE,
		FIND_CLOSEST,
		false
	)

	-- we need 2 new targets for split snake talent
	local valid_targets = {}
	local found_targets = 0

	-- perform simplified check if we have global range, as we don't need to filter for ally/enemy different search ranges
	if global_range_learned then
		for _, unit in pairs(units) do
			if not extra_data[tostring(unit:GetEntityIndex())] then
				if caster:HasShard("pathfinder_medusa_mystic_snake_venomotherapy") then
					if unit ~= caster then
						table.insert(valid_targets, unit)
						found_targets = found_targets + 1
					end
				else
					table.insert(valid_targets, unit)
					found_targets = found_targets + 1
				end
			end
			if found_targets >= 2 then break end
		end

		return valid_targets
	end

	for _, unit in pairs(units) do
		if not extra_data[tostring(unit:GetEntityIndex())] then
			if caster:HasShard("pathfinder_medusa_mystic_snake_venomotherapy") then
				-- increased range for allies, usual for enemies
				if unit:GetTeamNumber() == caster:GetTeamNumber() then
					if unit ~= caster then
						table.insert(valid_targets, unit)
						found_targets = found_targets + 1
					end
				else
					if (unit:GetAbsOrigin() - location):Length() < self.bounce_radius then
						table.insert(valid_targets, unit)
						found_targets = found_targets + 1
					end
				end
			else
				table.insert(valid_targets, unit)
				found_targets = found_targets + 1
			end
		end
		if found_targets >= 2 then break end
	end
	return valid_targets
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:_OnEnemyHit(target, extra_data)
	local mana_taken = 0
	if target:IsConsideredHero() then
		mana_taken = self.mana_steal_captain
	else
		mana_taken = self.mana_steal_base
	end

	self.damage_table.victim = target
	-- base damage + increase per jump from base damage
	self.damage_table.damage = self.snake_damage + extra_data.jumps * self.bounce_damage_increase * self.snake_damage

	-- dealing damage after the petrification effect, if we have that shard, otherwise immediately

	self.petrifying_snake_shard = 
		self.petrifying_snake_shard 
		or self:GetCaster():FindAbilityByName("pathfinder_medusa_mystic_snake_petrifying_snake")

	if not self.petrifying_snake_shard or self.petrifying_snake_shard:IsNull() or self.petrifying_snake_shard:GetLevel() == 0 then
		ApplyDamage(self.damage_table) 
		return mana_taken 
	end

	local stone_gaze = self:GetCaster():FindAbilityByName("medusa_stone_gaze_lua")
	local split_shot = self:GetCaster():FindModifierByName("modifier_medusa_split_shot_lua")

	if stone_gaze and stone_gaze:IsTrained() then
		stone_gaze:Petrify(
			target, self.petrifying_snake_shard:GetSpecialValueFor("petrify_duration"), self.petrifying_snake_shard
		)
	end

	if split_shot and split_shot:GetAbility():IsTrained() then
		split_shot:FireSplitShot(target, 0, true)
		
		Timers:CreateTimer(0.1, function()
			if not target or target:IsNull() or not target:IsAlive() then return end
			split_shot.depetrify_attack = true
			split_shot:FireSplitShot(target, 0, true)
			split_shot.depetrify_attack = false
		end)
	end

	ApplyDamage(self.damage_table)

	return mana_taken
end

--------------------------------------------------------------------------------

function medusa_mystic_snake_lua:_OnAllyHit(target)
	if not self:GetCaster():HasShard("pathfinder_medusa_mystic_snake_venomotherapy") then return 0 end

	local caster = self:GetCaster()
	local venomotherapy_shard = caster:FindAbilityByName("pathfinder_medusa_mystic_snake_venomotherapy")

	local petrify_radius = venomotherapy_shard:GetSpecialValueFor("petrify_radius")
	local petrify_duration = venomotherapy_shard:GetSpecialValueFor("petrify_duration")
	local missing_mana_healing = venomotherapy_shard:GetSpecialValueFor("missing_mana_healing") / 100
	-- medusa gets twice as much healing
	if target == caster then missing_mana_healing = missing_mana_healing * 2 end

	local missing_mana = caster:GetMaxMana() - caster:GetMana()
	
	if missing_mana > 0 then
		local healing = missing_mana * missing_mana_healing
		target:Heal(healing, venomotherapy_shard)
		SendOverheadEventMessage(
			nil, 
			OVERHEAD_ALERT_HEAL,
			target,
			healing,
			caster:GetPlayerOwner()
		)
	end

	local target_location = target:GetAbsOrigin()
	local units = FindUnitsInRadius(
		caster:GetTeamNumber(),
		target_location,
		nil,
		petrify_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		0,
		0,
		false
	)

	local stone_gaze = self:GetCaster():FindAbilityByName("medusa_stone_gaze_lua")

	for _, unit in pairs(units) do
		if stone_gaze and stone_gaze:IsTrained() then
			stone_gaze:Petrify(unit, petrify_duration, venomotherapy_shard)
		end

		unit:RemoveModifierByName("modifier_knockback")
		unit:AddNewModifier(self:GetCaster(), self, "modifier_knockback", {
			knockback_duration = 0.35,
			duration = 0.35,
			knockback_distance = petrify_radius / 2,
			knockback_height = 70,
			center_x = target_location.x,
			center_y = target_location.y,
			center_z = target_location.z,
		})
	end

	local proc_effect = ParticleManager:CreateParticle(
		"particles/units/heroes/hero_antimage/antimage_manavoid_explode_b.vpcf", PATTACH_ABSORIGIN_FOLLOW, target
	)
	ParticleManager:SetParticleControl(proc_effect, 1, target_location)
	ParticleManager:ReleaseParticleIndex(proc_effect)

	return 0
end


--------------------------------------------------------------------------------

modifier_medusa_pf_mystic_snake_buff = class({})

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:OnCreated(kv)
	local hAbility = self:GetAbility()

	self.nMaxStacks = hAbility:GetSpecialValueFor("max_attacks")

	if IsClient() then return end
	self.nDamage = kv.damage
	self:SetHasCustomTransmitterData(true)

	self:SetStackCount(self.nMaxStacks)
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:OnRefresh(kv)
	if IsClient() then return end

	if kv.damage > self.nDamage then
		self.nDamage = kv.damage
		self:SendBuffRefreshToClients()
	end

	self:SetStackCount(self.nMaxStacks)
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:AddCustomTransmitterData()
	return {nDamage = self.nDamage}
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:HandleCustomTransmitterData(data)
	self.nDamage = data.nDamage
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
		MODIFIER_PROPERTY_TOOLTIP
	}
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:OnTooltip()
	return self.nDamage
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_mystic_snake_buff:GetModifierProcAttack_BonusDamage_Physical(event)
	if not event.no_attack_cooldown then
		self:DecrementStackCount()

		if self:GetStackCount() < 1 then
			self:Destroy()
		end
	end

	SendOverheadEventMessage(nil, OVERHEAD_ALERT_CRITICAL, event.target, event.damage, event.attacker)

	return self.nDamage
end


--[[
A mystic snake made of energy jumps from target to target dealing damage. After it reaches its last target, it returns to Medusa to replenish her with mana. 
The snake deals more damage per jump and returns 11%/14%/17%/20% mana based on the targets' total mana.
Changes from base kit: The snake will restore 30/60/90/120 mana for targets that has no mana.

Minor Shards:
- +1 max bounces
- +10% damage increase per bounce
- -12% cooldown

Legendary Shards:
+ Chain Serpents: 
	Mystic Snake has a 25% chance per bounce to split in two, adding an extra bounce to each new snake 

+ Petrifying Snake: 
	Mystic snake petrify enemies on impact, causing Medusa to launch 2 attacks towards the target. 
	The second attacks will dispel this petrify debuff. 
    -> only the petrify debuff applied by mystic snake will be dispelled, all other source of petrification remains unaffected
    -> the automatic attacks always fire no matter what, and never miss

+ Venomotherapy: 
	Mystic Snake can now jump to other allies (but not Medusa herself), healing them for 20% of Medusa's missing mana. 
	Upon impact with an ally, the snake petrify nearby enemies within a 210 radius. 
	Medusa is healed twice as much. Counts bounces to allies normally.
    -> the bounce range for allies is 50% larger than the regular bounces.
    -> the allies impact should use the regular mana void effect, enemies within the effect radius should be knocked back a tiny bit. 
		Consider removing some component from the particle to make it less "busy"
    -> the knockback and petrify effect should also proc when the snake returns to medusa.

]]

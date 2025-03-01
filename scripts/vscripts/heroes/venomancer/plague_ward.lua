require("libraries.has_shard")
LinkLuaModifier( "modifier_pathfinder_plague_ward_passive", "heroes/venomancer/modifier_pathfinder_plague_ward_passive", LUA_MODIFIER_MOTION_NONE )
--[[ ============================================================================================================
	Author: Rook
	Date: June 6, 2015
	Called when Venomancer's Plague Ward is cast.  Spawns a Plague Ward of the appropriate level at the target location.
	Additional parameters: keys.Duration
================================================================================================================= ]]
function venomancer_plague_ward_datadriven_on_spell_start(keys)
	--The Plague Ward should initialize facing away from Venomancer, so find that direction.
	local caster_origin = keys.caster:GetAbsOrigin()
	local direction = (keys.target_points[1] - caster_origin):Normalized()
	direction.z = 0
	
	keys.caster:EmitSound("Hero_Venomancer.Plague_Ward")
	
	local plague_ward_level = keys.ability:GetLevel()
	if plague_ward_level >= 1 and plague_ward_level <= 4 then
		--local plague_ward_unit = CreateUnitByName("plague_ward_" .. plague_ward_level .. "_datadriven", keys.target_points[1], true, keys.caster, keys.caster, keys.caster:GetTeam())

		local plague_ward_unit = CreateUnitByName("npc_dota_venomancer_plague_ward_" .. plague_ward_level, keys.target_points[1], true, keys.caster, keys.caster, keys.caster:GetTeam()) 

		plague_ward_unit:SetForwardVector(direction)
		
		if IsServer() then
			plague_ward_unit:SetControllableByPlayer(keys.caster:GetPlayerID(), true)
		
			-- Get the base Plague Ward damage from ability values
			local base_damage = keys.ability:GetLevelSpecialValueFor("damage", plague_ward_level - 1)
		
			-- Initialize bonus damage to 0
			local bonus_damage = 0
		
			-- Check if Venomancer has the upgrade ability
			if keys.caster:HasAbility("special_bonus_unique_venomancer_ward_bonus_damage") then
				local upgrade_ability = keys.caster:FindAbilityByName("special_bonus_unique_venomancer_ward_bonus_damage")
				if upgrade_ability then
					local bonus_damage_pct = upgrade_ability:GetSpecialValueFor("bonus_damage_pct")
					local venomancer_attack_damage = keys.caster:GetAverageTrueAttackDamage(nil)
					bonus_damage = (bonus_damage_pct / 100) * venomancer_attack_damage
				end
			end
		
			-- Apply the final Plague Ward damage
			plague_ward_unit:SetBaseDamageMin(base_damage + bonus_damage)
			plague_ward_unit:SetBaseDamageMax(base_damage + bonus_damage + 2)
		end
		plague_ward_unit:SetOwner(keys.caster)
		
		plague_ward_unit:SetMaxHealth(keys.ability:GetLevelSpecialValueFor("health", plague_ward_level - 1))
		plague_ward_unit:SetHealth(keys.ability:GetLevelSpecialValueFor("health", plague_ward_level - 1))

		-- if HasShard(keys.caster, "pathfinder_special_venomancer_ward_corpse") then
		-- 	plague_ward_unit:AddAbility("pathfinder_special_venomancer_ward_corpse")
		-- end

		--///////////////
		--plague_ward_unit:StartGestureFadeWithSequenceSettings(ACT_DOTA_CUSTOM_TOWER_IDLE)
		--///////////
		
		--Display particle effects for Venomancer as well as the plague ward.
		local venomancer_plague_ward_cast_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_venomancer/venomancer_ward_cast.vpcf", PATTACH_ABSORIGIN, keys.caster)
		local plague_ward_spawn_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_venomancer/venomancer_ward_spawn.vpcf", PATTACH_ABSORIGIN, plague_ward_unit)

		local lifetime = keys.Duration
		if HasShard(keys.caster, "special_bonus_unique_venomancer_ward_duration") then
			lifetime = lifetime + keys.caster:FindAbilityByName("special_bonus_unique_venomancer_ward_duration"):GetSpecialValueFor("value")
		end
		
		--Add the green duration circle, and kill the plague ward after the duration ends.
		plague_ward_unit:AddNewModifier(plague_ward_unit, nil, "modifier_kill", {duration = lifetime})
		plague_ward_unit:AddNewModifier(plague_ward_unit, keys.ability, "modifier_pathfinder_plague_ward_passive", nil)
		
		--Store the unit that spawned this plague ward (i.e. Venomancer).
		plague_ward_unit.venomancer_plague_ward_parent = keys.caster
		
		--Plague wards get the effect of Venomancer's Poison Sting ability, at the current level.  Their autoattacks slow for the full amount but each tick of the DoT deals 50% of the
		--normal damage.  Additionally, the slow and DoT are completely ignored if the target is also affected by a Poison Sting debuff originating from one of Venomancer's autoattacks.
		keys.ability:ApplyDataDrivenModifier(keys.caster, plague_ward_unit, "modifier_plague_ward_datadriven", {})
				
		
		--Due to garbage collection issues when the DoT ticks after the plague ward has died, this code is commented out and we instead 
		--use the current level of Venomancer's Poison Sting whenever a plague ward's autoattack lands.
		--[[local poison_sting_ability = keys.caster:FindAbilityByName("venomancer_poison_sting_datadriven")
		if poison_sting_ability == nil then
			poison_sting_ability = keys.caster:FindAbilityByName("venomancer_poison_sting")
		end
		
		if poison_sting_ability ~= nil then
			local poison_sting_level = poison_sting_ability:GetLevel()
			
			if poison_sting_level > 0 then
				--Store the Poison Sting values associated with this plague ward.
				plague_ward_unit.poison_sting_duration = poison_sting_ability:GetLevelSpecialValueFor("duration", poison_sting_level - 1)
				plague_ward_unit.poison_sting_damage_per_interval = poison_sting_ability:GetLevelSpecialValueFor("damage", poison_sting_level - 1) / 2
				plague_ward_unit.poison_sting_movement_speed = poison_sting_ability:GetLevelSpecialValueFor("movement_speed", poison_sting_level - 1)
				
				--Store the unit that spawned this plague ward (i.e. Venomancer).
				plague_ward_unit.venomancer_plague_ward_parent = keys.caster
				
				keys.ability:ApplyDataDrivenModifier(keys.caster, plague_ward_unit, "modifier_plague_ward_datadriven", {})
			end
		end]]
	end
end



--[[ ============================================================================================================
	Author: Rook
	Date: June 6, 2015
	Called when one of Venomancer's Plague Wards lands an attack on a unit.  Applies the effects of the current level
	of Venomancer's Poison Sting ability.
================================================================================================================= ]]
function modifier_plague_ward_datadriven_on_attack_landed(keys)
	if IsValidEntity(keys.attacker.venomancer_plague_ward_parent) then
		local poison_sting_ability = keys.attacker.venomancer_plague_ward_parent:FindAbilityByName("venomancer_poison_sting_datadriven")
		if poison_sting_ability == nil then
			poison_sting_ability = keys.attacker.venomancer_plague_ward_parent:FindAbilityByName("venomancer_poison_sting")
		end
	
		if poison_sting_ability ~= nil then
			local poison_sting_level = poison_sting_ability:GetLevel()
			
			if poison_sting_level > 0 then
				local poison_sting_duration = poison_sting_ability:GetLevelSpecialValueFor("duration", poison_sting_level - 1)
			
				keys.ability:ApplyDataDrivenModifier(keys.attacker.venomancer_plague_ward_parent, keys.target, "modifier_plague_ward_datadriven_poison_sting_debuff_movement_speed", {duration = poison_sting_duration})
				if keys.target:HasModifier("modifier_poison_sting_debuff_datadriven") or keys.target:HasModifier("modifier_venomancer_poison_sting") then
					keys.target:SetModifierStackCount("modifier_plague_ward_datadriven_poison_sting_debuff_movement_speed", nil, 0)
				else
					keys.target:SetModifierStackCount("modifier_plague_ward_datadriven_poison_sting_debuff_movement_speed", nil, math.abs(poison_sting_ability:GetLevelSpecialValueFor("movement_speed", poison_sting_level - 1)))
				end
				
				keys.ability:ApplyDataDrivenModifier(keys.attacker.venomancer_plague_ward_parent, keys.target, "modifier_plague_ward_datadriven_poison_sting_debuff", {duration = poison_sting_duration})
			end
		end
		if HasShard(keys.attacker.venomancer_plague_ward_parent, "pathfinder_special_venomancer_ward_lifesteal") then
			local dmg_pct = keys.attacker.venomancer_plague_ward_parent:FindAbilityByName("pathfinder_special_venomancer_ward_lifesteal"):GetSpecialValueFor("lifesteal_percentage")
			keys.attacker.venomancer_plague_ward_parent:Heal(keys.attacker:GetAverageTrueAttackDamage(nil) / 100 * dmg_pct, keys.attacker)
			local nFXIndex = ParticleManager:CreateParticle( "particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, keys.attacker.venomancer_plague_ward_parent )
			ParticleManager:ReleaseParticleIndex( nFXIndex )
		end
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: June 6, 2015
	Called regularly after one of Venomancer's Plague Wards lands an autoattack on a unit.  Damages the target by
	half the amount of Venomancer's Poison Sting DoT ability, so long as the target is not also affected by a
	Poison Sting debuff originating from Venomancer.
================================================================================================================= ]]
function modifier_plague_ward_datadriven_debuff_on_interval_think(keys)
	if not keys.target:HasModifier("modifier_poison_sting_debuff_datadriven") and not keys.target:HasModifier("modifier_venomancer_poison_sting") and IsValidEntity(keys.caster) then
		local poison_sting_ability = keys.caster:FindAbilityByName("venomancer_poison_sting_datadriven")
		if poison_sting_ability == nil then
			poison_sting_ability = keys.caster:FindAbilityByName("venomancer_poison_sting")
		end
	
		if poison_sting_ability ~= nil then
			local poison_sting_level = poison_sting_ability:GetLevel()
			
			if poison_sting_level > 0 then
				local poison_sting_damage_per_interval = poison_sting_ability:GetLevelSpecialValueFor("damage", poison_sting_level - 1)
				ApplyDamage({victim = keys.target, attacker = keys.caster, damage = poison_sting_damage_per_interval / 2, damage_type = DAMAGE_TYPE_MAGICAL, ability = poison_sting_ability})
			end
		end
	end
end

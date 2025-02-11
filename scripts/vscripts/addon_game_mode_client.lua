require("extensions/init")
require("common/chat_wheel/c_chat_wheel")

ListenToGameEvent("ability_vector_target_start", function(event)
	local ability = EntIndexToHScript(event.ability)
	local location
	
	if event.location then
		location = Vector(event.location["0"], event.location["1"], event.location["2"])
	end

	if ability and ability.OnVectorTargetingStart then
		ability:OnVectorTargetingStart(location, event.cursor_ents)
	end
end, nil)

ListenToGameEvent("ability_vector_target_think", function(event)
	local ability = EntIndexToHScript(event.ability)
	local location
	
	if event.location then
		location = Vector(event.location["0"], event.location["1"], event.location["2"])
	end

	if ability and ability.OnVectorTargetingThink then
		ability:OnVectorTargetingThink(location, event.cursor_ents)
	end
end, nil)

ListenToGameEvent("ability_vector_target_end", function(event)
	local ability = EntIndexToHScript(event.ability)
	local location
	
	if event.location then
		location = Vector(event.location["0"], event.location["1"], event.location["2"])
	end

	if ability and ability.OnVectorTargetingEnd then
		ability:OnVectorTargetingEnd(location, event.cursor_ents)
	end
end, nil)

-- General Game Mode Config
_G.AGHANIM_PLAYERS = 4

-------- MOD LINKING FOR CLIENT SIDE
--LinkLuaModifier("modifier_pathfinders_choose", "pathfinders_way/abilities/ability_pathfinders_choose", LUA_MODIFIER_MOTION_NONE)
--LinkLuaModifier("modifier_pathfinders_choosing", "pathfinders_way/abilities/ability_pathfinders_choose", LUA_MODIFIER_MOTION_NONE)
--LinkLuaModifier("modifier_pathfinders_watch_tower", "pathfinders_way/modifiers/modifier_pathfinders_watch_tower", LUA_MODIFIER_MOTION_NONE)
--LinkLuaModifier("modifier_pathfinders_effigy", "pathfinders_way/modifiers/modifier_pathfinders_effigy", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_minor_ability_upgrades", "modifiers/modifier_minor_ability_upgrades", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_bottle_upgrade", "modifiers/modifier_blessing_bottle_upgrade", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_armor", "modifiers/modifier_blessing_armor", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_attack_speed", "modifiers/modifier_blessing_attack_speed", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_evasion", "modifiers/modifier_blessing_evasion", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_mana_boost", "modifiers/modifier_blessing_mana_boost", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_health_boost", "modifiers/modifier_blessing_health_boost", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_magic_resist", "modifiers/modifier_blessing_magic_resist", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_magic_damage_bonus", "modifiers/modifier_blessing_magic_damage_bonus", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_damage_bonus", "modifiers/modifier_blessing_damage_bonus", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_movement_speed", "modifiers/modifier_blessing_movement_speed", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_damage_reflect", "modifiers/modifier_blessing_damage_reflect", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_spell_life_steal", "modifiers/modifier_blessing_spell_life_steal", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_life_steal", "modifiers/modifier_blessing_life_steal", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_arcanist", "modifiers/modifier_blessing_potion_arcanist", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_dragon", "modifiers/modifier_blessing_potion_dragon", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_echo_slam", "modifiers/modifier_blessing_potion_echo_slam", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_torrent", "modifiers/modifier_blessing_potion_torrent", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_shadow_wave", "modifiers/modifier_blessing_potion_shadow_wave", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_ravage", "modifiers/modifier_blessing_potion_ravage", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_purification", "modifiers/modifier_blessing_potion_purification", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_respawn_time_reduction", "modifiers/modifier_blessing_respawn_time_reduction", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_respawn_invulnerability", "modifiers/modifier_blessing_respawn_invulnerability", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_death_detonation", "modifiers/modifier_blessing_death_detonation", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_strength", "modifiers/modifier_blessing_strength", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_agility", "modifiers/modifier_blessing_agility", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_intelligence", "modifiers/modifier_blessing_intelligence", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_health", "modifiers/modifier_blessing_potion_health", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_potion_mana", "modifiers/modifier_blessing_potion_mana", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_restore_mana", "modifiers/modifier_blessing_restore_mana", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_book_strength", "modifiers/modifier_blessing_book_strength", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_book_agility", "modifiers/modifier_blessing_book_agility", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_book_intelligence", "modifiers/modifier_blessing_book_intelligence", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_blessing_refresher_shard", "modifiers/modifier_blessing_refresher_shard", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_battle_royale", "modifiers/modifier_battle_royale", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_respawn_haste", "modifiers/modifier_respawn_haste", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_hero_select", "pathfinder/modifier_hero_select", LUA_MODIFIER_MOTION_NONE)

LinkLuaModifier("modifier_uncapped_movespeed", "modifiers/modifier_uncapped_movespeed", LUA_MODIFIER_MOTION_NONE)

LinkLuaModifier("modifier_dummy_caster_passive", "modifiers/creatures/modifier_dummy_caster_passive", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_monster_leash", 					"modifiers/modifier_monster_leash", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_passive_autocast", 				"modifiers/modifier_passive_autocast", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ability_cast_warning",			"modifiers/modifier_ability_cast_warning", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ascension_bubble_display", 		"modifiers/modifier_ascension_bubble_display", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ascension_glimmer_display", 		"modifiers/modifier_ascension_glimmer_display", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ascension_flicker_display", 		"modifiers/modifier_ascension_flicker_display", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ascension_plasma_field_display", 	"modifiers/modifier_ascension_plasma_field_display", LUA_MODIFIER_MOTION_NONE)

LinkLuaModifier("modifier_cosmetic_pet", "common/battlepass/inventory/modifiers/modifier_cosmetic_pet", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_dummy_caster", "common/battlepass/inventory/modifiers/modifier_dummy_caster", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_cosmetic_pet_flying_visual", "common/battlepass/inventory/modifiers/modifier_cosmetic_pet_flying_visual", LUA_MODIFIER_MOTION_NONE)
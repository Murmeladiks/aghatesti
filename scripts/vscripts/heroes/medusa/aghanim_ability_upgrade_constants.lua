MINOR_ABILITY_UPGRADES["npc_dota_hero_medusa"] = {
	-- split shot shards
	{
		description = "medusa_split_shot_lua_damage_reduction",
		ability_name = "medusa_split_shot_lua",
		special_value_name = "damage_modifier_tooltip",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 5,
	},
	{
		description = "medusa_split_shot_lua_split_count",
		ability_name = "medusa_split_shot_lua",
		special_value_name = "arrow_count",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	{
		description = "medusa_split_shot_lua_search_range",
		ability_name = "medusa_split_shot_lua",
		special_value_name = "split_shot_bonus_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
	},
	-- mystic snake shards	
	{
		description = "medusa_mystic_snake_lua_jumps",
		ability_name = "medusa_mystic_snake_lua",
		special_value_name = "snake_jumps",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	{
		description = "medusa_mystic_snake_lua_damage_increase",
		ability_name = "medusa_mystic_snake_lua",
		special_value_name = "snake_scale",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 10,
	},
	{
		description = "medusa_mystic_snake_lua_cooldown",
		ability_name = "medusa_mystic_snake_lua",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	-- mana shield shards
	{
		description = "medusa_mana_shield_lua_damage_per_mana",
		ability_name = "medusa_mana_shield_lua",
		special_value_name = "damage_per_mana",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.2,
	},
	-- stone gaze shards
	{
		description = "medusa_stone_gaze_lua_petrification_duration",
		ability_name = "medusa_stone_gaze_lua",
		special_value_name = "stone_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	{
		description = "medusa_stone_gaze_lua_petrification_bonus_damage",
		ability_name = "medusa_stone_gaze_lua",
		special_value_name = "bonus_physical_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 5,
	},
	{
		description = "medusa_stone_gaze_lua_cooldown",
		ability_name = "medusa_stone_gaze_lua",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_medusa"] = "medusa_stone_gaze_lua"

SPECIAL_ABILITY_UPGRADES["npc_dota_hero_medusa"] = {
	"pathfinder_medusa_split_shot_snake_oiled_enhancement",
	"pathfinder_medusa_split_shot_bewitched_barrage",
	"pathfinder_medusa_split_shot_curse_of_endless_torment",
	
	"pathfinder_medusa_mystic_snake_chained_serpents",
	"pathfinder_medusa_mystic_snake_petrifying_snake",
	"pathfinder_medusa_mystic_snake_venomotherapy",

	"pathfinder_medusa_mana_shield_stone_form",
	"pathfinder_medusa_mana_shield_mana_dome",
	"pathfinder_medusa_mana_shield_magic_negation",

	"pathfinder_medusa_stone_gaze_stone_shatter",
	"pathfinder_medusa_stone_gaze_split",
	"pathfinder_medusa_stone_gaze_gorgon_eyes",
}

item_medusa_split_shot_lua_damage_reduction = item_small_scepter_fragment
item_medusa_split_shot_lua_split_count = item_small_scepter_fragment
item_medusa_split_shot_lua_search_range = item_small_scepter_fragment
item_medusa_mystic_snake_lua_jumps = item_small_scepter_fragment
item_medusa_mystic_snake_lua_damage_increase = item_small_scepter_fragment
item_medusa_mystic_snake_lua_cooldown = item_small_scepter_fragment
item_medusa_mana_shield_lua_damage_per_mana = item_small_scepter_fragment
item_medusa_stone_gaze_lua_petrification_duration = item_small_scepter_fragment
item_medusa_stone_gaze_lua_petrification_bonus_damage = item_small_scepter_fragment
item_medusa_stone_gaze_lua_cooldown = item_small_scepter_fragment

PURCHASABLE_SHARDS["npc_dota_hero_medusa"] = {
	"item_medusa_split_shot_lua_damage_reduction",
	"item_medusa_split_shot_lua_split_count",
	"item_medusa_split_shot_lua_search_range",
	"item_medusa_mystic_snake_lua_jumps",
	"item_medusa_mystic_snake_lua_damage_increase",
	"item_medusa_mystic_snake_lua_cooldown",
	"item_medusa_mana_shield_lua_damage_per_mana",
	"item_medusa_stone_gaze_lua_petrification_duration",
	"item_medusa_stone_gaze_lua_petrification_bonus_damage",
	"item_medusa_stone_gaze_lua_cooldown",
}

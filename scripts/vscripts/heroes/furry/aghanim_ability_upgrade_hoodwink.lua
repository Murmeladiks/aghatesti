MINOR_ABILITY_UPGRADES["npc_dota_hero_hoodwink"] = {
	{
		description = "pathfinder_acorn_shot_percent_cooldown",
		ability_name = "pathfinder_acorn_shot",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	
	{
		description = "pathfinder_acorn_shot_bonus_damage",
		ability_name = "pathfinder_acorn_shot",
		special_value_name = "bonus_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 20,
	},
	
	{
		description = "pathfinder_acorn_shot_bounce_count",
		ability_name = "pathfinder_acorn_shot",
		special_value_name = "bounce_count",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	{
		description = "pathfinder_acorn_shot_bounce_range",
		ability_name = "pathfinder_acorn_shot",
		special_value_name = "bounce_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 100,
	},
	
	{
		description = "pathfinder_acorn_shot_debuff_duration",
		ability_name = "pathfinder_acorn_shot",
		special_value_name = "debuff_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	
	-------------
	
	
	{
		description = "pathfinder_bushwhack_percent_cooldown",
		ability_name = "pathfinder_bushwhack",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	
	{
		description = "pathfinder_bushwhack_trap_radius",
		ability_name = "pathfinder_bushwhack",
		special_value_name = "trap_radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
	},
	
	{
		description = "pathfinder_bushwhack_debuff_duration",
		ability_name = "pathfinder_bushwhack",
		special_value_name = "debuff_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.7,
	},
	
	{
		description = "pathfinder_bushwhack_total_damage",
		ability_name = "pathfinder_bushwhack",
		special_value_name = "total_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
	},
	
	
	
	-------------
	
	
	{
		description = "pathfinder_scurry_percent_cooldown",
		ability_name = "pathfinder_scurry",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "pathfinder_scurry_movement_speed_pct",
		ability_name = "pathfinder_scurry",
		special_value_name = "movement_speed_pct",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 5,
	},
	
	{
		description = "pathfinder_scurry_duration",
		ability_name = "pathfinder_scurry",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	{
		description = "pathfinder_scurry_movement_evasion",
		ability_name = "pathfinder_scurry",
		special_value_name = "evasion",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 8,
	},
	
	
	
	-------------
	
	
	{
		description = "pathfinder_sharpshooter_percent_cooldown",
		ability_name = "pathfinder_sharpshooter",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "pathfinder_sharpshooter_max_damage",
		ability_name = "pathfinder_sharpshooter",
		special_value_name = "max_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 350,
	},
	{
		description = "pathfinder_sharpshooter_arrow_range",
		ability_name = "pathfinder_sharpshooter",
		special_value_name = "arrow_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 850,
	},
	{
		description = "pathfinder_sharpshooter_max_slow_debuff_duration",
		ability_name = "pathfinder_sharpshooter",
		special_value_name = "max_slow_debuff_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
	},
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_hoodwink"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_hoodwink"] = "hoodwink_sharpshooter"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_hoodwink"] =
{
	"pathfinder_acorn_shot_attack",
	"pathfinder_acorn_shot_stun",
	"pathfinder_acorn_shot_tree",
	
	"pathfinder_bushwhack_ground",
	"pathfinder_bushwhack_multi_attack",
	"pathfinder_bushwhack_scurry",
	
	"pathfinder_scurry_canadian",
	"pathfinder_scurry_allies",
	"pathfinder_scurry_leap",
	
	"pathfinder_sharpshooter_reset",
	"pathfinder_sharpshooter_spread",
	"pathfinder_sharpshooter_moving",

	-- "pathfinder_sharpshooter_pierce",
}


item_pathfinder_acorn_shot_percent_cooldown = item_small_scepter_fragment
item_pathfinder_acorn_shot_bonus_damage = item_small_scepter_fragment
item_pathfinder_acorn_shot_bounce_count = item_small_scepter_fragment
item_pathfinder_acorn_shot_bounce_range = item_small_scepter_fragment
item_pathfinder_acorn_shot_debuff_duration = item_small_scepter_fragment

item_pathfinder_bushwhack_percent_cooldown = item_small_scepter_fragment
item_pathfinder_bushwhack_trap_radius = item_small_scepter_fragment
item_pathfinder_bushwhack_debuff_duration = item_small_scepter_fragment
item_pathfinder_bushwhack_total_damage = item_small_scepter_fragment

item_pathfinder_scurry_percent_cooldown = item_small_scepter_fragment
item_pathfinder_scurry_movement_speed_pct = item_small_scepter_fragment
item_pathfinder_scurry_duration = item_small_scepter_fragment
item_pathfinder_scurry_movement_evasion = item_small_scepter_fragment

item_pathfinder_sharpshooter_percent_cooldown = item_small_scepter_fragment
item_pathfinder_sharpshooter_max_damage = item_small_scepter_fragment
item_pathfinder_sharpshooter_arrow_range = item_small_scepter_fragment
item_pathfinder_sharpshooter_max_slow_debuff_duration = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_hoodwink" ] =
{
	"item_pathfinder_acorn_shot_percent_cooldown",
	"item_pathfinder_acorn_shot_bonus_damage",
	"item_pathfinder_acorn_shot_bounce_count",
	"item_pathfinder_acorn_shot_bounce_range",
	"item_pathfinder_acorn_shot_debuff_duration",
	
	"item_pathfinder_bushwhack_percent_cooldown",
	"item_pathfinder_bushwhack_trap_radius",
	"item_pathfinder_bushwhack_debuff_duration",
	"item_pathfinder_bushwhack_total_damage",
	
	"item_pathfinder_scurry_percent_cooldown",
	"item_pathfinder_scurry_movement_speed_pct",
	"item_pathfinder_scurry_duration",
	"item_pathfinder_scurry_movement_evasion",
	
	"item_pathfinder_sharpshooter_percent_cooldown",
	"item_pathfinder_sharpshooter_max_damage",
	"item_pathfinder_sharpshooter_arrow_range",
	"item_pathfinder_sharpshooter_max_slow_debuff_duration",
}
MINOR_ABILITY_UPGRADES["npc_dota_hero_ogre_magi"] = {
	{
		description = "ogre_magi_fireblast_lua_pct_cooldown",
		ability_name = "ogre_magi_fireblast_lua",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},

	{
		description = "ogre_magi_fireblast_lua_stun_duration",
		ability_name = "ogre_magi_fireblast_lua",
		special_value_name = "stun_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.5,
	},

	{
		description = "ogre_magi_fireblast_lua_fireblast_damage",
		ability_name = "ogre_magi_fireblast_lua",
		special_value_name = "fireblast_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 60,
	},

	{
		description = "ogre_magi_ignite_lua_pct_cooldown",
		ability_name = "ogre_magi_ignite_lua",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},

	{
		description = "ogre_magi_ignite_lua_burn_damage",
		ability_name = "ogre_magi_ignite_lua",
		special_value_name = "burn_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 12,
	},

	{
		description = "ogre_magi_ignite_lua_slow_movement_speed_pct",
		ability_name = "ogre_magi_ignite_lua",
		special_value_name = "slow_movement_speed_pct",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 10,
	},

	{
		description = "ogre_magi_ignite_lua_duration",
		ability_name = "ogre_magi_ignite_lua",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
	},

	{
		description = "ogre_magi_bloodlust_lua_pct_cooldown",
		ability_name = "ogre_magi_bloodlust_lua",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},

	{
		description = "ogre_magi_bloodlust_lua_bonus_movement_speed",
		ability_name = "ogre_magi_bloodlust_lua",
		special_value_name = "bonus_movement_speed",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 3,
	},

	{
		description = "ogre_magi_bloodlust_lua_bonus_attack_speed",
		ability_name = "ogre_magi_bloodlust_lua",
		special_value_name = "bonus_attack_speed",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 15,
	},

	{
		description = "ogre_magi_bloodlust_lua_duration",
		ability_name = "ogre_magi_bloodlust_lua",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 3,
	},

	{
		description = "ogre_magi_multicast_lua_multicast_3_times",
		ability_name = "ogre_magi_multicast_lua",
		special_value_name = "multicast_3_times",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 5,
	},

	{
		description = "ogre_magi_multicast_lua_multicast_4_times",
		ability_name = "ogre_magi_multicast_lua",
		special_value_name = "multicast_4_times",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2.5,
	},
	
	{
		description = "ogre_magi_multicast_lua_bonus_cast_range",
		ability_name = "ogre_magi_multicast_lua",
		special_value_name = "bonus_cast_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 35,
	},
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_ogre_magi"] = {
	"aghsfort_minor_stat_upgrade_bonus_evasion",      
	"aghsfort_minor_stat_upgrade_bonus_attack_speed",
}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_ogre_magi"] = "ogre_magi_multicast"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_ogre_magi"] =
{
	"pathfinder_special_ignite_fireblast",
	"pathfinder_special_friendly_ignite",
	"pathfinder_special_ignite_multismash",

	"pathfinder_special_om_shield_bloodlust",
	"pathfinder_special_bloodlust_fear",

	"pathfinder_special_om_aoe_fireblast",
	"pathfinder_special_om_summoming",   
	"pathfinder_special_om_gold_fireblast",

	"pathfinder_special_om_aoe_multicast",
	"pathfinder_special_om_multi_multicast",
	"pathfinder_special_om_alive_multicast",
}

item_ogre_magi_fireblast_lua_pct_cooldown = item_small_scepter_fragment
item_ogre_magi_fireblast_lua_stun_duration = item_small_scepter_fragment
item_ogre_magi_fireblast_lua_fireblast_damage = item_small_scepter_fragment

item_ogre_magi_ignite_lua_pct_cooldown = item_small_scepter_fragment
item_ogre_magi_ignite_lua_burn_damage = item_small_scepter_fragment
item_ogre_magi_ignite_lua_slow_movement_speed_pct = item_small_scepter_fragment
item_ogre_magi_ignite_lua_duration = item_small_scepter_fragment

item_ogre_magi_bloodlust_lua_pct_cooldown = item_small_scepter_fragment
item_ogre_magi_bloodlust_lua_bonus_movement_speed = item_small_scepter_fragment
item_ogre_magi_bloodlust_lua_bonus_attack_speed = item_small_scepter_fragment
item_ogre_magi_bloodlust_lua_duration = item_small_scepter_fragment

item_ogre_magi_multicast_lua_multicast_3_times = item_small_scepter_fragment
item_ogre_magi_multicast_lua_multicast_4_times = item_small_scepter_fragment
item_ogre_magi_multicast_lua_bonus_cast_range = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_ogre_magi" ] =
{
	"item_ogre_magi_fireblast_lua_pct_cooldown",
	"item_ogre_magi_fireblast_lua_stun_duration",
	"item_ogre_magi_fireblast_lua_fireblast_damage",

	"item_ogre_magi_ignite_lua_pct_cooldown",
	"item_ogre_magi_ignite_lua_burn_damage",
	"item_ogre_magi_ignite_lua_slow_movement_speed_pct",
	"item_ogre_magi_ignite_lua_duration",

	"item_ogre_magi_bloodlust_lua_pct_cooldown",
	"item_ogre_magi_bloodlust_lua_bonus_movement_speed",
	"item_ogre_magi_bloodlust_lua_bonus_attack_speed",
	"item_ogre_magi_bloodlust_lua_duration",

	"item_ogre_magi_multicast_lua_multicast_3_times",   
	"item_ogre_magi_multicast_lua_multicast_4_times",
	"item_ogre_magi_multicast_lua_bonus_cast_range",
}
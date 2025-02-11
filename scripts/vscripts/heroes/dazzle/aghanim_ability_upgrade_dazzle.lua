MINOR_ABILITY_UPGRADES["npc_dota_hero_dazzle"] = {
	{
		description = "pf_poison_touch_end_distance",
		ability_name = "pf_poison_touch",
		special_value_name = "end_distance",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 150,
	},
	
	{
		description = "pf_poison_touch_targets",
		ability_name = "pf_poison_touch",
		special_value_name = "targets",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	{
		description = "pf_poison_touch_damage",
		ability_name = "pf_poison_touch",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 10,
		required_facet = 1,
	},

	{
		description = "pf_poison_touch_damage_bloom",
		ability_name = "pf_poison_touch",
		special_values =
		{
			{
				special_value_name = "damage",
				operator = MINOR_ABILITY_UPGRADE_OP_ADD,
				value = 10,
			},
			{
				special_value_name = "split_damage",
				operator = MINOR_ABILITY_UPGRADE_OP_ADD,
				value = 25,
			},
		},
		required_facet = 2,
	},
	
	{
		description = "pf_poison_touch_slow",
		ability_name = "pf_poison_touch",
		special_value_name = "slow",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 10,
	},
	
	{
		description = "pf_poison_touch_duration",
		ability_name = "pf_poison_touch",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
	},
	
	
	{
		description = "pf_poison_touch_pct_cooldown",
		ability_name = "pf_poison_touch",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	
	
	--------
	
	
	{
		description = "pf_shadow_wave_damage_radius",
		ability_name = "pf_shadow_wave",
		special_value_name = "damage_radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
	},
	
	{
		description = "pf_shadow_wave_damage",
		ability_name = "pf_shadow_wave",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 40,
	},
	
	{
		description = "pf_shadow_wave_mana",
		ability_name = "pf_shadow_wave",
		special_value_name = "mana",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 20,
	},
	
	{
		description = "pf_shadow_wave_pct_cooldown",
		ability_name = "pf_shadow_wave",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	
	
	--------
	
	
	{
		description = "pf_shallow_grave_duration",
		ability_name = "pf_shallow_grave",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.6,
	},
	
	{
		description = "pf_shallow_grave_cast_range",
		ability_name = "pf_shallow_grave",
		special_value_name = "cast_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 150,
	},
	
	{
		description = "pf_shallow_grave_pct_cooldown",
		ability_name = "pf_shallow_grave",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 7,
	},
	
	--------

	{
		description = "dazzle_pf_innate_weave_armor",
		ability_name = "dazzle_pf_innate_weave",
		special_value_name = "armor_change",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.5,
	},

	--------

	{
		description = "dazzle_pf_bad_juju_cooldown_reduction",
		ability_name = "dazzle_pf_bad_juju",
		special_value_name = "cooldown_reduction",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.3,
	},
	
	{
		description = "dazzle_pf_bad_juju_cooldown_healthcost",
		ability_name = "dazzle_pf_bad_juju",
		special_values =
		{
			{
				special_value_name = "health_cost",
				operator = MINOR_ABILITY_UPGRADE_OP_MUL,
				value = MINOR_ABILITY_COOLDOWN_MANACOST_PCT,
			},
			{
				special_value_name = "cooldown",
				operator = MINOR_ABILITY_UPGRADE_OP_MUL,
				value = MINOR_ABILITY_COOLDOWN_MANACOST_PCT,
			},
		},
	},
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_dazzle"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_dazzle"] = "dazzle_bad_juju"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_dazzle"] =
{
	--"pf_poison_touch_spread",
	"pf_poison_touch_ward",
	"pf_poison_touch_chain",
	
	"pf_shallow_grave_invis",
	"pf_shallow_grave_aoe",
	"pf_shallow_grave_ground",
	
	"pf_shadow_wave_enemy",
	"pf_shadow_wave_proc",
	"pf_shadow_wave_dispel",
	
	"pf_bad_juju_attacks",
	"pf_bad_juju_heal",
	"pf_bad_juju_raze",
}


item_pf_poison_touch_end_distance = item_small_scepter_fragment
item_pf_poison_touch_targets = item_small_scepter_fragment
item_pf_poison_touch_damage = item_small_scepter_fragment
item_pf_poison_touch_damage_bloom = item_small_scepter_fragment
item_pf_poison_touch_slow = item_small_scepter_fragment
item_pf_poison_touch_duration = item_small_scepter_fragment
item_pf_poison_touch_pct_cooldown = item_small_scepter_fragment

item_pf_shadow_wave_damage_radius = item_small_scepter_fragment
item_pf_shadow_wave_damage = item_small_scepter_fragment
item_pf_shadow_wave_mana = item_small_scepter_fragment
item_pf_shadow_wave_pct_cooldown = item_small_scepter_fragment

item_pf_shallow_grave_duration = item_small_scepter_fragment
item_pf_shallow_grave_cast_range = item_small_scepter_fragment
item_pf_shallow_grave_pct_cooldown = item_small_scepter_fragment

item_dazzle_pf_innate_weave_armor = item_small_scepter_fragment
item_dazzle_pf_bad_juju_cooldown_reduction = item_small_scepter_fragment
item_dazzle_pf_bad_juju_cooldown_healthcost = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_dazzle" ] =
{
	"item_dazzle_pf_innate_weave_armor",
	"item_pf_poison_touch_end_distance",
	"item_pf_poison_touch_targets",
	"item_pf_poison_touch_slow",
	"item_pf_poison_touch_duration",
	"item_pf_poison_touch_pct_cooldown",
	
	"item_pf_shadow_wave_damage_radius",
	"item_pf_shadow_wave_damage",
	"item_pf_shadow_wave_mana",
	"item_pf_shadow_wave_pct_cooldown",
	
	"item_pf_shallow_grave_duration",
	"item_pf_shallow_grave_cast_range",
	"item_pf_shallow_grave_pct_cooldown",
	
	"item_dazzle_pf_bad_juju_cooldown_reduction",
	"item_dazzle_pf_bad_juju_cooldown_healthcost",
}

PURCHASABLE_SHARDS_FACET_ADDITIONS["npc_dota_hero_dazzle"] = {
	[1] = {
		"item_pf_poison_touch_damage"
	},
	[2] = {
		"item_pf_poison_touch_damage_bloom",
	},
}
MINOR_ABILITY_UPGRADES["npc_dota_hero_ursa"] = {
	{
		description = "aghsfort_ursa_earthshock_flat_damage",
		ability_name = "ursa_pf_earthshock",
		special_value_name = "impact_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 90,
	},
	
	{
		description = "aghsfort_ursa_earthshock_flat_radius_hop_distance",
		ability_name = "ursa_pf_earthshock",
		special_values =
		{
			{
				special_value_name = "shock_radius",
				operator = MINOR_ABILITY_UPGRADE_OP_ADD,
				value = 75,
			},
			{
				special_value_name = "hop_distance",
				operator = MINOR_ABILITY_UPGRADE_OP_ADD,
				value = 75,
			},
		},
	},
	
	-- {
	-- 	description = "aghsfort_ursa_earthshock_flat_movement_slow",
	-- 	ability_name = "ursa_pf_earthshock",
	-- 	special_value_name = "movement_slow",
	-- 	operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	-- 	value = 16,
	-- },
	
	{
		description = "aghsfort_ursa_earthshock_mana_cost_cooldown",
		ability_name = "ursa_pf_earthshock",
		special_values =
		{
			{
				special_value_name = "mana_cost",
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
	
	{
		description = "aghsfort_ursa_overpower_flat_max_attacks",
		ability_name = "ursa_pf_overpower",
		special_value_name = "max_attacks",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	{
		description = "aghsfort_ursa_overpower_flat_attack_speed_bonus_pct",
		ability_name = "ursa_pf_overpower",
		special_value_name = "attack_speed_bonus_pct",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
	},
	
	{
		description = "aghsfort_ursa_overpower_mana_cost_cooldown",
		ability_name = "ursa_pf_overpower",
		special_values =
		{
			{
				special_value_name = "mana_cost",
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
	
	{
		description = "aghsfort_ursa_fury_swipes_flat_damage_per_stack",
		ability_name = "ursa_pf_fury_swipes",
		special_value_name = "damage_per_stack",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 7,
	},
	
	{
		description = "aghsfort_ursa_fury_swipes_flat_max_swipe_stack",
		ability_name = "ursa_pf_fury_swipes",
		special_value_name = "max_swipe_stack",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	{
		description = "aghsfort_ursa_enrage_flat_damage_reduction",
		ability_name = "ursa_pf_enrage",
		special_value_name = "damage_reduction",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 7,
	},
	
	{
		description = "aghsfort_ursa_enrage_flat_duration",
		ability_name = "ursa_pf_enrage",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.75,
	},
	
	{
		description = "aghsfort_ursa_enrage_flat_status_resistance",
		ability_name = "ursa_pf_enrage",
		special_value_name = "status_resistance",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 7
	},
	
	{
		description = "aghsfort_ursa_enrage_mana_cost_cooldown",
		ability_name = "ursa_pf_enrage",
		special_values =
		{
			{
				special_value_name = "mana_cost",
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

STAT_UPGRADE_EXCLUDES["npc_dota_hero_ursa"] = {"aghsfort_minor_stat_upgrade_bonus_spell_amp"}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_ursa"] = "ursa_enrage"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_ursa"] =
{
	
	"aghsfort_special_ursa_earthshock_knockback",
	"special_bonus_unique_ursa_earthshock_overpower_stack",
	
	"aghsfort_special_ursa_overpower_crit",
	"aghsfort_special_ursa_overpower_evasion",
	"aghsfort_special_ursa_overpower_cleave",
	
	"aghsfort_special_ursa_fury_swipes_armor_reduction",
	"aghsfort_special_ursa_fury_swipes_lifesteal",
	"aghsfort_special_ursa_fury_swipes_ursa_minor",
	
	"aghsfort_special_ursa_enrage_earthshock",
	"aghsfort_special_ursa_enrage_attack_speed",
	"aghsfort_special_ursa_enrage_allies",
	
	--"aghsfort_special_ursa_earthshock_apply_fury_swipes",  -- became a talent
	-- "aghsfort_special_ursa_earthshock_invis",
	--"aghsfort_special_ursa_earthshock_miss_chance",
	-- "aghsfort_special_ursa_overpower_taunt",
	--"aghsfort_special_ursa_enrage_magic_immunity",
	--"aghsfort_special_ursa_enrage_fear",
	--"aghsfort_special_ursa_enrage_armor",
}

item_aghsfort_ursa_earthshock_flat_damage = item_small_scepter_fragment
item_aghsfort_ursa_earthshock_flat_radius_hop_distance = item_small_scepter_fragment
item_aghsfort_ursa_overpower_flat_max_attacks = item_small_scepter_fragment
item_aghsfort_ursa_overpower_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_ursa_fury_swipes_flat_damage_per_stack = item_small_scepter_fragment
item_aghsfort_ursa_fury_swipes_flat_max_swipe_stack = item_small_scepter_fragment
item_aghsfort_ursa_enrage_flat_duration = item_small_scepter_fragment
item_aghsfort_ursa_enrage_mana_cost_cooldown = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_ursa" ] =
{
	"item_aghsfort_ursa_earthshock_flat_damage",
	"item_aghsfort_ursa_earthshock_flat_radius_hop_distance",
	"item_aghsfort_ursa_overpower_flat_max_attacks",
	"item_aghsfort_ursa_overpower_mana_cost_cooldown",
	"item_aghsfort_ursa_fury_swipes_flat_damage_per_stack",
	"item_aghsfort_ursa_fury_swipes_flat_max_swipe_stack",
	"item_aghsfort_ursa_enrage_flat_duration",
	"item_aghsfort_ursa_enrage_mana_cost_cooldown",
}
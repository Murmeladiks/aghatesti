MINOR_ABILITY_UPGRADES["npc_dota_hero_lina"] = {
	{
		description = "aghsfort_lina_dragon_slave_mana_cost_cooldown",
		ability_name = "lina_pf_dragon_slave",
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
		description = "aghsfort_lina_dragon_slave_damage",
		ability_name = "lina_pf_dragon_slave",
		special_value_name = "dragon_slave_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
		facet_additional = {
			facet_id = 2,
			special_value_name = "dragon_slave_burn_damage_tooltip"
		}
	},
	{
		description = "aghsfort_lina_dragon_slave_distance",
		ability_name = "lina_pf_dragon_slave",
		special_value_name = "dragon_slave_distance",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 150,
	},	
	{
		description = "aghsfort_lina_light_strike_array_mana_cost_cooldown",
		ability_name = "lina_pf_light_strike_array",
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
		description = "aghsfort_lina_light_strike_array_aoe",
		ability_name = "lina_pf_light_strike_array",
		special_value_name = "light_strike_array_aoe",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
	},
	{
		description = "aghsfort_lina_light_strike_array_damage",
		ability_name = "lina_pf_light_strike_array",
		special_value_name = "light_strike_array_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 70,
		facet_additional = {
			facet_id = 2,
			special_value_name = "light_strike_array_burn_damage_tooltip"
		}
	},
	{
		description = "aghsfort_lina_light_strike_array_stun",
		ability_name = "lina_pf_light_strike_array",
		special_value_name = "light_strike_array_stun_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.4,
	},
	
	{
		description = "aghsfort_lina_fiery_soul_attack_move_speed",
		ability_name = "lina_pf_fiery_soul",
		special_values =
		{
			{
				special_value_name = "fiery_soul_attack_speed_bonus",
				operator = MINOR_ABILITY_UPGRADE_OP_ADD,
				value = 20,
			},
			{
				special_value_name = "fiery_soul_move_speed_bonus",
				operator = MINOR_ABILITY_UPGRADE_OP_ADD,
				value = 2,
			},
		},
		
	},
	{
		description = "aghsfort_lina_fiery_soul_max_stacks",
		ability_name = "lina_pf_fiery_soul",
		special_value_name = "fiery_soul_max_stacks",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	{
		description = "aghsfort_lina_fiery_soul_active_duration",
		ability_name = "lina_pf_fiery_soul",
		special_value_name = "active_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
	},
	{
		description = "aghsfort_lina_laguna_blade_mana_cost_cooldown",
		ability_name = "lina_pf_laguna_blade",
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
		description = "aghsfort_lina_laguna_blade_damage",
		ability_name = "lina_pf_laguna_blade",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 200,
		facet_additional = {
			facet_id = 2,
			special_value_name = "burn_damage_tooltip"
		}
	},
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_lina"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_lina"] = "lina_laguna_blade"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_lina"] =
{
	"aghsfort_special_lina_dragon_slave_lsa_trail",
	"aghsfort_special_lina_dragon_slave_triwave",
	"aghsfort_special_lina_dragon_slave_ignite",
	"aghsfort_special_lina_dragon_slave_booster",
	
	"aghsfort_special_lina_light_strike_array_pulsate",
	"aghsfort_special_lina_light_strike_array_attacks",
	"aghsfort_special_lina_light_strike_array_vacuum",
	
	"aghsfort_special_lina_fiery_soul_multishot",
	--   "aghsfort_special_lina_fiery_soul_dragon_slave_on_cast",
	--   "aghsfort_special_lina_fiery_soul_dragon_slave_mini_lagunas",
	"aghsfort_special_lina_fiery_soul_lsa_attacks", --enabled
	"aghsfort_special_lina_fiery_soul_ally_cast",
	
	"aghsfort_special_lina_laguna_blade_bounce",
	--   "aghsfort_special_lina_laguna_blade_lsa",
	--"aghsfort_special_lina_laguna_blade_channel", --disabled
	"aghsfort_special_lina_laguna_blade_line",
}


item_aghsfort_lina_dragon_slave_damage = item_small_scepter_fragment
item_aghsfort_lina_dragon_slave_distance = item_small_scepter_fragment
item_aghsfort_lina_light_strike_array_damage = item_small_scepter_fragment
item_aghsfort_lina_light_strike_array_stun = item_small_scepter_fragment
item_aghsfort_lina_fiery_soul_attack_move_speed = item_small_scepter_fragment
item_aghsfort_lina_fiery_soul_max_stacks = item_small_scepter_fragment
item_aghsfort_lina_fiery_soul_active_duration = item_small_scepter_fragment
item_aghsfort_lina_laguna_blade_damage = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_lina" ] =
{
	"item_aghsfort_lina_dragon_slave_damage",
	"item_aghsfort_lina_dragon_slave_distance",
	"item_aghsfort_lina_light_strike_array_damage",
	"item_aghsfort_lina_light_strike_array_stun",
	"item_aghsfort_lina_fiery_soul_attack_move_speed",
	"item_aghsfort_lina_fiery_soul_max_stacks",
	"item_aghsfort_lina_fiery_soul_active_duration",
	"item_aghsfort_lina_laguna_blade_damage",
}
MINOR_ABILITY_UPGRADES["npc_dota_hero_queenofpain"] = {
	{
		description = "aghsfort_queenofpain_shadow_strike_mana_cost_cooldown",
		ability_name = "queenofpain_pf_shadow_strike",
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
		 description = "aghsfort_queenofpain_shadow_strike_dot_damage",
		 ability_name = "queenofpain_pf_shadow_strike",
		 special_value_name = "duration_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 20,
	},

	{
		 description = "aghsfort_queenofpain_shadow_strike_strike_damage",
		 ability_name = "queenofpain_pf_shadow_strike",
		 special_value_name = "strike_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 100,
	},	


	--[[{
		description = "aghsfort_queenofpain_shadow_strike_duration_heal",
		ability_name = "queenofpain_pf_shadow_strike",
		special_value_name = "duration_heal",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 10,
	},]] -- no longer a thing

	{
		description = "aghsfort_queenofpain_blink_mana_cost_cooldown",
		ability_name = "queenofpain_pf_blink",
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
		 description = "aghsfort_queenofpain_blink_range",
		 ability_name = "queenofpain_pf_blink",
		 special_value_name = "blink_range",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 200,
	},

	{
		description = "aghsfort_queenofpain_scream_of_pain_mana_cost_cooldown",
		ability_name = "queenofpain_pf_scream_of_pain",
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
		 description = "aghsfort_queenofpain_scream_of_pain_damage",
		 ability_name = "queenofpain_pf_scream_of_pain",
		 special_value_name = "damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 75,
	},
	{
		 description = "aghsfort_queenofpain_scream_of_pain_radius",
		 ability_name = "queenofpain_pf_scream_of_pain",
		 special_value_name = "area_of_effect",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 75,
	},
	{
		description = "aghsfort_queenofpain_sonic_wave_mana_cost_cooldown",
		ability_name = "queenofpain_pf_sonic_wave",
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
		 description = "aghsfort_queenofpain_sonic_wave_damage",
		 ability_name = "queenofpain_pf_sonic_wave",
		 special_value_name = "damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 110,
	},
	{
		 description = "aghsfort_queenofpain_sonic_wave_distance",
		 ability_name = "queenofpain_pf_sonic_wave",
		 special_value_name = "distance",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 150,
	},
	{
		 description = "aghsfort_queenofpain_sonic_wave_knockback_duration",
		 ability_name = "queenofpain_pf_sonic_wave",
		 special_value_name = "knockback_duration",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 1.5,
	},
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_queenofpain"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_queenofpain"] = "queenofpain_sonic_wave"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_queenofpain"] =
{
	"aghsfort_special_queenofpain_shadow_strike_on_attack",
	"aghsfort_special_queenofpain_shadow_strike_chain",
	"aghsfort_special_queenofpain_shadow_strike_scream",

	"aghsfort_special_queenofpain_blink_generates_scream",
	"aghsfort_special_queenofpain_blink_attack_speed",
	"aghsfort_special_queenofpain_blink_shadow_strike",

	"aghsfort_special_queenofpain_scream_of_pain_resets_blink",
	"aghsfort_special_queenofpain_scream_of_pain_restores_caster",
	"aghsfort_special_queenofpain_scream_of_pain_knockback",

	"aghsfort_special_queenofpain_sonic_wave_trail",
	"aghsfort_special_queenofpain_sonic_wave_circle",
	"aghsfort_special_queenofpain_sonic_wave_attack_buff",
}


item_aghsfort_queenofpain_shadow_strike_strike_damage = item_small_scepter_fragment
item_aghsfort_queenofpain_shadow_strike_dot_damage = item_small_scepter_fragment
item_aghsfort_queenofpain_blink_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_queenofpain_blink_range = item_small_scepter_fragment
item_aghsfort_queenofpain_scream_of_pain_damage = item_small_scepter_fragment
item_aghsfort_queenofpain_scream_of_pain_radius = item_small_scepter_fragment
item_aghsfort_queenofpain_sonic_wave_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_queenofpain_sonic_wave_damage = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_queenofpain" ] =
{
	"item_aghsfort_queenofpain_shadow_strike_strike_damage",
	"item_aghsfort_queenofpain_shadow_strike_dot_damage",
	"item_aghsfort_queenofpain_blink_mana_cost_cooldown",
	"item_aghsfort_queenofpain_blink_range",
	"item_aghsfort_queenofpain_scream_of_pain_damage",
	"item_aghsfort_queenofpain_scream_of_pain_radius",
	"item_aghsfort_queenofpain_sonic_wave_mana_cost_cooldown",
	"item_aghsfort_queenofpain_sonic_wave_damage",
}
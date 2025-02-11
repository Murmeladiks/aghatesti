MINOR_ABILITY_UPGRADES["npc_dota_hero_void_spirit"] = {
	-- Aether Remnant
	{
		description = "aghsfort_void_spirit_aether_remnant_mana_cost_cooldown",
		ability_name = "void_spirit_pf_aether_remnant",
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
		description = "aghsfort_void_spirit_aether_remnant_damage",
		ability_name = "void_spirit_pf_aether_remnant",
		special_value_name = "impact_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 100,
	},
	
	-- Dissimilate
	{
		description = "aghsfort_void_spirit_dissimilate_mana_cost_cooldown",
		ability_name = "void_spirit_pf_dissimilate",
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
		description = "aghsfort_void_spirit_dissimilate_damage",
		ability_name = "void_spirit_pf_dissimilate",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 90,
	},
	
	--Resonant Pulse
	{
		description = "aghsfort_void_spirit_resonant_pulse_mana_cost_cooldown",
		ability_name = "void_spirit_pf_resonant_pulse",
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
			--{		
				--special_value_name = "AbilityChargeRestoreTime",
				--operator = MINOR_ABILITY_UPGRADE_OP_MUL,
				--value = MINOR_ABILITY_COOLDOWN_MANACOST_PCT,
			--}
		},
	},
	
	{
		description = "aghsfort_void_spirit_resonant_pulse_damage",
		ability_name = "void_spirit_pf_resonant_pulse",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
	},
	
	{
		description = "aghsfort_void_spirit_resonant_pulse_base_absorb",
		ability_name = "void_spirit_pf_resonant_pulse",
		special_value_name = "base_absorb_amount",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 100,
	},
	
	{
		description = "aghsfort_void_spirit_resonant_pulse_absorb_per_unit",
		ability_name = "void_spirit_pf_resonant_pulse",
		special_value_name = "absorb_per_unit_hit",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 20,
	},
	
	-- Astral Step
	
	{
		description = "aghsfort_void_spirit_astral_step_pop_damage",
		ability_name = "void_spirit_pf_astral_step",
		special_value_name = "pop_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 70,
	},
	
	{
		description = "aghsfort_void_spirit_astral_step_max_travel_distance",
		ability_name = "void_spirit_pf_astral_step",
		special_value_name = "max_travel_distance",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 125,
	},
	
	{
		description = "aghsfort_void_spirit_astral_step_charge_restore_time",
		ability_name = "void_spirit_pf_astral_step",
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
			}
		},
	},
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_void_spirit"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_void_spirit"] = "void_spirit_astral_step"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_void_spirit"] =
{
	
	"aghsfort_special_void_spirit_aether_remnant_phantom_attack",
	"aghsfort_special_void_spirit_aether_remnant_bowling",
	
	"aghsfort_special_void_spirit_dissimilate_translocate",
	"special_bonus_unique_void_spirit_dissimilate_expanse",
	"special_bonus_unique_void_spirit_dissimilate_remnants",
	"aghsfort_special_void_spirit_dissimilate_lure",
	
	"aghsfort_special_void_spirit_resonant_pulse_knockback",
	"aghsfort_special_void_spirit_resonant_pulse_cadence",
	"special_bonus_unique_void_spirit_resonant_pulse_suppression",
	
	"aghsfort_special_void_spirit_astral_step_attacks",
	"aghsfort_special_void_spirit_astral_step_trail",
	"aghsfort_special_void_spirit_astral_step_breach",
	--"aghsfort_special_void_spirit_astral_step_vacuum", -- REMOVED
}

item_aghsfort_void_spirit_aether_remnant_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_void_spirit_aether_remnant_damage = item_small_scepter_fragment
item_aghsfort_void_spirit_dissimilate_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_void_spirit_dissimilate_damage = item_small_scepter_fragment
item_aghsfort_void_spirit_resonant_pulse_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_void_spirit_resonant_pulse_damage = item_small_scepter_fragment
item_aghsfort_void_spirit_resonant_pulse_base_absorb = item_small_scepter_fragment
item_aghsfort_void_spirit_resonant_pulse_absorb_per_unit = item_small_scepter_fragment
item_aghsfort_void_spirit_astral_step_pop_damage = item_small_scepter_fragment
item_aghsfort_void_spirit_astral_step_max_travel_distance = item_small_scepter_fragment
item_aghsfort_void_spirit_astral_step_charge_restore_time = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_void_spirit" ] =
{
	"item_aghsfort_void_spirit_aether_remnant_mana_cost_cooldown",
	"item_aghsfort_void_spirit_aether_remnant_damage",
	"item_aghsfort_void_spirit_dissimilate_mana_cost_cooldown",
	"item_aghsfort_void_spirit_dissimilate_damage",
	"item_aghsfort_void_spirit_resonant_pulse_mana_cost_cooldown",
	"item_aghsfort_void_spirit_resonant_pulse_damage",
	"item_aghsfort_void_spirit_resonant_pulse_base_absorb",
	"item_aghsfort_void_spirit_resonant_pulse_absorb_per_unit",
	"item_aghsfort_void_spirit_astral_step_pop_damage",
	"item_aghsfort_void_spirit_astral_step_max_travel_distance",
	"item_aghsfort_void_spirit_astral_step_charge_restore_time",
}
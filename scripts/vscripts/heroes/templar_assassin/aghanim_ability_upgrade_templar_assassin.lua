MINOR_ABILITY_UPGRADES["npc_dota_hero_templar_assassin"] = {
	{
		description = "aghsfort_templar_assassin_refraction_mana_cost_cooldown",
		ability_name = "templar_assassin_pf_refraction",
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
		 description = "aghsfort_templar_assassin_refraction_instances",
		 ability_name = "templar_assassin_pf_refraction",
		 special_value_name = "instances",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 1,
	},
	
	{
		 description = "aghsfort_templar_assassin_refraction_bonus_damage",
		 ability_name = "templar_assassin_pf_refraction",
		 special_value_name = "bonus_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 25,
	},
	{
		 description = "aghsfort_templar_assassin_refraction_max_damage_absorb",
		 ability_name = "templar_assassin_pf_refraction",
		 special_value_name = "max_damage_absorb",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 50,
	},

	{
		 description = "aghsfort_templar_assassin_meld_bonus_damage",
		 ability_name = "templar_assassin_pf_meld",
		 special_value_name = "bonus_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 50,
	},
	{
		 description = "aghsfort_templar_assassin_meld_bonus_armor",
		 ability_name = "templar_assassin_pf_meld",
		 special_value_name = "bonus_armor",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = -1,
	},

	{
		 description = "aghsfort_templar_assassin_psi_blades_bonus_attack_range",
		 ability_name = "templar_assassin_pf_psi_blades",
		 special_value_name = "bonus_attack_range",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 30,
	},
	{
		 description = "aghsfort_templar_assassin_psi_blades_attack_spill_range",
		 ability_name = "templar_assassin_pf_psi_blades",
		 special_value_name = "attack_spill_range",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 0.25,
	},
	{
		 description = "aghsfort_templar_assassin_psi_blades_attack_spill_width",
		 ability_name = "templar_assassin_pf_psi_blades",
		 special_value_name = "attack_spill_width",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 30,
	},


	{
		 description = "aghsfort_templar_assassin_psionic_trap_max_traps",
		 ability_name = "templar_assassin_pf_psionic_trap",
		 special_value_name = "AbilityCharges",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 1,
	},
	{
		 description = "aghsfort_templar_assassin_psionic_trap_trap_radius",
		 ability_name = "templar_assassin_pf_psionic_trap",
		 special_value_name = "trap_radius",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 50,
	},	

	{
		 description = "aghsfort_templar_assassin_psionic_trap_trap_damage",
		 ability_name = "templar_assassin_pf_psionic_trap",
		 special_value_name = "trap_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 100,
	},	

	{
		description = "aghsfort_templar_assassin_psionic_trap_mana_cost_cooldown",
		ability_name = "templar_assassin_pf_psionic_trap",
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

STAT_UPGRADE_EXCLUDES["npc_dota_hero_templar_assassin"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_templar_assassin"] = "templar_assassin_psionic_trap"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_templar_assassin"] =
{
	
	"aghsfort_special_templar_assassin_refraction_kill_refresh",
	"aghsfort_special_templar_assassin_refraction_detonate_trap",

	"aghsfort_special_templar_assassin_meld_attack_on_activation",
	"aghsfort_special_templar_assassin_meld_teleport",
	"aghsfort_special_templar_assassin_meld_refraction_on_kill", 

	"aghsfort_special_templar_assassin_psi_blades_trap",
	"aghsfort_special_templar_assassin_psi_blades_splash", 

	"aghsfort_special_templar_assassin_psionic_trap_area_attack",
	"aghsfort_special_templar_assassin_psionic_trap_damage_heals",
	"aghsfort_special_templar_assassin_psionic_trap_multipulse",

	--"aghsfort_special_templar_assassin_refraction_allies",
	--"aghsfort_special_templar_assassin_refraction_counter_attack",
	--"aghsfort_special_templar_assassin_psi_blades_autoattack",
}

item_aghsfort_templar_assassin_refraction_instances = item_small_scepter_fragment
item_aghsfort_templar_assassin_refraction_bonus_damage = item_small_scepter_fragment
item_aghsfort_templar_assassin_meld_bonus_damage = item_small_scepter_fragment
item_aghsfort_templar_assassin_meld_bonus_armor = item_small_scepter_fragment
item_aghsfort_templar_assassin_psi_blades_bonus_attack_range = item_small_scepter_fragment
item_aghsfort_templar_assassin_psi_blades_attack_spill_width = item_small_scepter_fragment
item_aghsfort_templar_assassin_psionic_trap_max_traps = item_small_scepter_fragment
item_aghsfort_templar_assassin_psionic_trap_trap_damage = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_templar_assassin" ] =
{
	"item_aghsfort_templar_assassin_refraction_instances",
	"item_aghsfort_templar_assassin_refraction_bonus_damage",
	"item_aghsfort_templar_assassin_meld_bonus_damage",
	"item_aghsfort_templar_assassin_meld_bonus_armor",
	"item_aghsfort_templar_assassin_psi_blades_bonus_attack_range",
	"item_aghsfort_templar_assassin_psi_blades_attack_spill_width",
	"item_aghsfort_templar_assassin_psionic_trap_max_traps",
	"item_aghsfort_templar_assassin_psionic_trap_trap_damage",
}
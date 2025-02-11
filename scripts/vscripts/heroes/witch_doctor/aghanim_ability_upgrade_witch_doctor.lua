MINOR_ABILITY_UPGRADES["npc_dota_hero_witch_doctor"] = {
	{
		description = "aghsfort_witch_doctor_paralyzing_cask_cooldown",
		ability_name = "witch_doctor_pf_paralyzing_cask",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "aghsfort_witch_doctor_paralyzing_cask_flat_damage",
		ability_name = "witch_doctor_pf_paralyzing_cask",
		special_value_name = "base_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 40,
	},
	{
		description = "aghsfort_witch_doctor_paralyzing_cask_flat_bounce_range",
		ability_name = "witch_doctor_pf_paralyzing_cask",
		special_value_name = "bounce_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 200,
	},
	{
		description = "aghsfort_witch_doctor_paralyzing_cask_flat_bounces",
		ability_name = "witch_doctor_pf_paralyzing_cask",
		special_value_name = "bounces",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
	},
	{
		description = "aghsfort_witch_doctor_paralyzing_cask_flat_stun_duration",
		ability_name = "witch_doctor_pf_paralyzing_cask",
		special_value_name = "stun_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.75,
	},
	{
		description = "aghsfort_witch_doctor_voodoo_restoration_manacost",
		ability_name = "witch_doctor_pf_voodoo_restoration",
		special_values =
		{
			{
				special_value_name = "mana_per_second",
				operator = MINOR_ABILITY_UPGRADE_OP_MUL,
				value = -15,
			},
			{
				special_value_name = "AbilityManaCost",
				operator = MINOR_ABILITY_UPGRADE_OP_MUL,
				value = -15,
			},
		},
	},
	{
		description = "aghsfort_witch_doctor_voodoo_restoration_flat_radius",
		ability_name = "witch_doctor_pf_voodoo_restoration",
		special_value_name = "radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 100,
	},
	{
		description = "aghsfort_witch_doctor_voodoo_restoration_flat_heal",
		ability_name = "witch_doctor_pf_voodoo_restoration",
		special_value_name = "heal",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 8,
	},
	{
		description = "aghsfort_witch_doctor_maledict_cooldown",
		ability_name = "witch_doctor_pf_maledict",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "aghsfort_witch_doctor_maledict_flat_radius",
		ability_name = "witch_doctor_pf_maledict",
		special_value_name = "radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 40,
	},
	{
		description = "aghsfort_witch_doctor_maledict_flat_bonus_damage",
		ability_name = "witch_doctor_pf_maledict",
		special_value_name = "bonus_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 16,
	},
	{
		description = "aghsfort_witch_doctor_maledict_flat_max_bonus_damage",
		ability_name = "witch_doctor_pf_maledict",
		special_value_name = "max_bonus_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
	},	
	{
		description = "aghsfort_witch_doctor_maledict_flat_ticks",
		ability_name = "witch_doctor_pf_maledict",
		special_value_name = "ticks",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	{
		description = "aghsfort_witch_doctor_death_ward_cooldown",
		ability_name = "witch_doctor_pf_death_ward",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "aghsfort_witch_doctor_death_ward_flat_damage",
		ability_name = "witch_doctor_pf_death_ward",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 35,
		facet_changes = {
			facet_id = 3,
			value_mult = 0.7
		}
	},
	{
		description = "aghsfort_witch_doctor_death_ward_flat_bounces",
		ability_name = "witch_doctor_pf_death_ward",
		special_value_name = "bounces",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	{
		description = "aghsfort_witch_doctor_death_ward_flat_channel_duration",
		ability_name = "witch_doctor_pf_death_ward",
		special_value_name = "AbilityChannelTime",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	-- {
	-- 	 description = "aghsfort_witch_doctor_death_ward_flat_bounce_radius",
	-- 	 ability_name = "aghsfort_witch_doctor_death_ward",
	-- 	 special_value_name = "bounce_radius",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	-- 	 value = 150,
	-- },
	--{
	--	description = "aghsfort_witch_doctor_voodoo_restoration_mul_heal_interval",
	--	ability_name = "aghsfort_witch_doctor_voodoo_restoration",
	--	special_value_name = "heal_interval",
	--	operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	--	value = -15,
	--},
	
	-- {
	-- 	 description = "aghsfort_witch_doctor_paralyzing_cask_manacost",
	-- 	 ability_name = "aghsfort_witch_doctor_paralyzing_cask",
	-- 	 special_value_name = "mana_cost",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	-- 	 value = 15,
	-- },
	
	-- {
	-- 	 description = "aghsfort_witch_doctor_maledict_manacost",
	-- 	 ability_name = "aghsfort_witch_doctor_maledict",
	-- 	 special_value_name = "mana_cost",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	-- 	 value = 15,
	-- },
	-- {
	-- 	 description = "aghsfort_witch_doctor_death_ward_manacost",
	-- 	 ability_name = "aghsfort_witch_doctor_death_ward",
	-- 	 special_value_name = "mana_cost",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	-- 	 value = 15,
	-- },	
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_witch_doctor"] = {
	"aghsfort_minor_stat_upgrade_bonus_attack_damage",
	"aghsfort_minor_stat_upgrade_bonus_evasion",
	"aghsfort_minor_stat_upgrade_bonus_attack_speed",
}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_witch_doctor"] = "witch_doctor_death_ward"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_witch_doctor"] =
{
	"aghsfort_special_witch_doctor_paralyzing_cask_multicask",
	"aghsfort_special_witch_doctor_paralyzing_cask_applies_maledict",
	"aghsfort_special_witch_doctor_paralyzing_cask_aoe_damage",
	"aghsfort_special_witch_doctor_paralyzing_cask_attack_procs",

	"special_bonus_unique_witch_doctor_voodoo_restoration_enemy_damage",
	"aghsfort_special_witch_doctor_voodoo_restoration_lifesteal",
	"aghsfort_special_witch_doctor_voodoo_restoration_damage_amp",

	"aghsfort_special_witch_doctor_maledict_aoe_procs",
	"aghsfort_special_witch_doctor_maledict_death_restoration",
	"aghsfort_special_witch_doctor_maledict_affects_allies",
	"aghsfort_special_witch_doctor_maledict_infectious",

	"aghsfort_special_witch_doctor_death_ward_no_channel",
	"aghsfort_special_witch_doctor_death_ward_splitshot",
	"aghsfort_special_witch_doctor_death_ward_damage_resist",

	--"aghsfort_special_witch_doctor_maledict_ground_curse",
	--"aghsfort_special_witch_doctor_voodoo_restoration_mana_restore",
	--"aghsfort_special_witch_doctor_death_ward_bounce",
}

SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS["npc_dota_hero_witch_doctor"] = {
	["special_bonus_unique_witch_doctor_voodoo_restoration_enemy_damage"] = {
		RequiredFacetID = 2,
		ReplacedSpecial = "special_bonus_unique_witch_doctor_voodoo_restoration_ally_heal"
	}
}

item_aghsfort_witch_doctor_voodoo_restoration_manacost = item_small_scepter_fragment
item_aghsfort_witch_doctor_voodoo_restoration_flat_heal = item_small_scepter_fragment
item_aghsfort_witch_doctor_paralyzing_cask_flat_damage = item_small_scepter_fragment
item_aghsfort_witch_doctor_paralyzing_cask_flat_bounces = item_small_scepter_fragment
item_aghsfort_witch_doctor_maledict_flat_ticks = item_small_scepter_fragment
item_aghsfort_witch_doctor_maledict_flat_max_bonus_damage = item_small_scepter_fragment
item_aghsfort_witch_doctor_death_ward_flat_damage = item_small_scepter_fragment
item_aghsfort_witch_doctor_death_ward_flat_channel_duration = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_witch_doctor" ] =
{
	"item_aghsfort_witch_doctor_voodoo_restoration_manacost",
	"item_aghsfort_witch_doctor_voodoo_restoration_flat_heal",
	"item_aghsfort_witch_doctor_paralyzing_cask_flat_damage",
	"item_aghsfort_witch_doctor_paralyzing_cask_flat_bounces",
	"item_aghsfort_witch_doctor_maledict_flat_ticks",
	"item_aghsfort_witch_doctor_maledict_flat_max_bonus_damage",
	"item_aghsfort_witch_doctor_death_ward_flat_damage",
	"item_aghsfort_witch_doctor_death_ward_flat_channel_duration",
}
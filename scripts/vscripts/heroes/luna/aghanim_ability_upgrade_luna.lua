MINOR_ABILITY_UPGRADES["npc_dota_hero_luna"] = {
	{
		description = "aghsfort_luna_lucent_beam_flat_damage",
		ability_name = "luna_pf_lucent_beam",
		special_value_name = "beam_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
	},
	
	{
		description = "aghsfort_luna_lucent_beam_percent_mana_cost_cooldown",
		ability_name = "luna_pf_lucent_beam",
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
		description = "aghsfort_luna_lucent_beam_flat_stun",
		ability_name = "luna_pf_lucent_beam",
		special_value_name = "stun_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.25,
	},
	
	{
		description = "aghsfort_luna_moon_glaive_range",
		ability_name = "luna_pf_moon_glaive",
		special_value_name = "range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 100,
	},
	
	{
		description = "aghsfort_luna_moon_glaive_bounces",
		ability_name = "luna_pf_moon_glaive",
		special_value_name = "bounces",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
	},
	
	{
		description = "aghsfort_luna_moon_glaive_damage_reduction_percent",
		ability_name = "luna_pf_moon_glaive",
		special_value_name = "damage_reduction_percent",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = -5,
	},
	
	--[[{
	description = "aghsfort_luna_moon_glaive_percent_mana_cost",
	ability_name = "aghsfort_luna_moon_glaive",
	special_value_name = "mana_cost",
	operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	value = 12,
	},
	
	{
	description = "aghsfort_luna_moon_glaive_percent_cooldown",
	ability_name = "aghsfort_luna_moon_glaive",
	special_value_name = "cooldown",
	operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	value = 12,
	},--]]

	{
		description = "luna_pf_lunar_orbit_damage",
		ability_name = "luna_pf_lunar_orbit",
		special_value_name = "rotating_glaives_collision_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 5,
	},
	
	--[[{
		description = "aghsfort_luna_lunar_blessing_flat_damage",
		ability_name = "aghsfort_luna_lunar_blessing",
		special_value_name = "bonus_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 6,
	},
	
	{
		description = "aghsfort_luna_lunar_blessing_percent_cooldown_mana_cost",
		ability_name = "aghsfort_luna_lunar_blessing",
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
		description = "aghsfort_luna_lunar_blessing_night_duration",
		ability_name = "aghsfort_luna_lunar_blessing",
		special_value_name = "night_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1.0,
	},
	
	{
		description = "aghsfort_luna_lunar_blessing_night_bonus_pct",
		ability_name = "aghsfort_luna_lunar_blessing",
		special_value_name = "night_bonus_pct",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 25,
	},]]
	
	{
		description = "aghsfort_luna_eclipse_beams",
		ability_name = "luna_pf_eclipse",
		special_value_name = "beams",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
	},
	
	--[[{
	description = "aghsfort_luna_eclipse_hit_count",
	ability_name = "luna_pf_eclipse",
	special_value_name = "hit_count",
	operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	value = 2,
	},--]]
	
	{
		description = "aghsfort_luna_eclipse_percent_cooldown_mana_cost",
		ability_name = "luna_pf_eclipse",
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
	
	--[[{
	description = "aghsfort_luna_eclipse_radius",
	ability_name = "luna_pf_eclipse",
	special_value_name = "radius",
	operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	value = 125,
	},--]]
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_luna"] = {}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_luna"] = "luna_eclipse"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_luna"] =
{
	
	-- Lucent Beam
	"aghsfort_special_luna_lucent_beam_diffusion",
	"aghsfort_special_luna_lucent_beam_moonglow",
	"aghsfort_special_luna_lucent_beam_glaives",

	-- Lunar Orbit
	"special_bonus_unique_luna_lunar_orbit_lunar_cyclone",
	"aghsfort_special_luna_lunar_blessing_leap",
	
	-- Glaives
	"aghsfort_special_luna_moon_glaive_knockback",
	--"aghsfort_special_luna_moon_glaive_glaive_shield", -- predates Lunar Orbit
	"aghsfort_special_luna_glaives_moon_well",
	
	-- Lunar Blessing
	"aghsfort_special_luna_lunar_blessing_moon_mark",
	
	-- Eclipse
	"aghsfort_special_luna_eclipse_lunar_cycle",
	"special_bonus_unique_luna_eclipse_lunar_focus",
	"special_bonus_unique_luna_eclipse_hide",
	
	
	--"aghsfort_special_luna_lucent_beam_bloodmoon",
	--"aghsfort_special_luna_moon_glaive_ally_bounce",
	--"aghsfort_special_luna_moon_glaive_double_moon",
	--"aghsfort_special_luna_lunar_blessing_lunar_power",
	
	--"aghsfort_special_luna_lunar_blessing_lunar_remnant",
	--"aghsfort_special_luna_lunar_blessing_moon_shield",
	--"aghsfort_special_luna_lunar_blessing_moonfright",
	
	--"aghsfort_special_luna_eclipse_moonstruck",
	--"aghsfort_special_luna_eclipse_lunar_favor",
}

item_aghsfort_luna_lucent_beam_flat_damage = item_small_scepter_fragment
item_aghsfort_luna_lucent_beam_percent_mana_cost_cooldown = item_small_scepter_fragment
item_aghsfort_luna_lucent_beam_flat_stun = item_small_scepter_fragment

item_aghsfort_luna_moon_glaive_range = item_small_scepter_fragment
item_aghsfort_luna_moon_glaive_bounces = item_small_scepter_fragment
item_aghsfort_luna_moon_glaive_damage_reduction_percent = item_small_scepter_fragment

item_luna_pf_lunar_orbit_damage = item_small_scepter_fragment

item_aghsfort_luna_eclipse_beams = item_small_scepter_fragment
item_aghsfort_luna_eclipse_percent_cooldown_mana_cost = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_luna" ] =
{
	"item_aghsfort_luna_lucent_beam_flat_damage",
	"item_aghsfort_luna_lucent_beam_percent_mana_cost_cooldown",
	"item_aghsfort_luna_lucent_beam_flat_stun",
	"item_aghsfort_luna_moon_glaive_range",
	"item_aghsfort_luna_moon_glaive_bounces",
	"item_aghsfort_luna_moon_glaive_damage_reduction_percent",
	"item_luna_pf_lunar_orbit_damage",
	"item_aghsfort_luna_eclipse_beams",
	"item_aghsfort_luna_eclipse_percent_cooldown_mana_cost",
}
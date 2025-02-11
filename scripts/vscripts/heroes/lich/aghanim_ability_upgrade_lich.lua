MINOR_ABILITY_UPGRADES["npc_dota_hero_lich"] = {
	{
		description = "aghsfort_lich_frost_nova_mana_cost_cooldown",
		ability_name = "lich_pf_frost_nova",
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
		description = "aghsfort_lich_frost_nova_damage_upgrade",
		ability_name = "lich_pf_frost_nova",
		special_value_name = "aoe_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 80,
   },
   {
		description = "aghsfort_lich_frost_nova_radius_upgrade",
		ability_name = "lich_pf_frost_nova",
		special_value_name = "radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
   },
   {
		description = "aghsfort_lich_frost_shield_duration_upgrade",
		ability_name = "lich_pf_frost_shield",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1,
   },	
   {
	   description = "aghsfort_lich_frost_shield_mana_cost_cooldown",
	   ability_name = "lich_pf_frost_shield",
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
		description = "aghsfort_lich_frost_shield_damage_upgrade",
		ability_name = "lich_pf_frost_shield",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 20,
   },
   {
	   description = "aghsfort_lich_frost_shield_damage_reduction_upgrade",
	   ability_name = "lich_pf_frost_shield",
	   special_value_name = "damage_reduction",
	   operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	   value = 5,		
   },
   {
	   description = "aghsfort_lich_sinister_gaze_mana_cost_cooldown",
	   ability_name = "lich_pf_sinister_gaze",
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
		description = "aghsfort_lich_sinister_gaze_radius_upgrade",
		ability_name = "lich_pf_sinister_gaze",
		special_value_name = "aoe",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
   },	
   {
		description = "aghsfort_lich_sinister_gaze_mana_drained_upgrade",
		ability_name = "lich_pf_sinister_gaze",
		special_value_name = "mana_drain",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 7,
   },
   {
	   description = "aghsfort_lich_chain_frost_mana_cost_cooldown",
	   ability_name = "lich_pf_chain_frost",
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
		description = "aghsfort_lich_chain_frost_jump_range_upgrade",
		ability_name = "lich_pf_chain_frost",
		special_value_name = "jump_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 150,
   },	
   {
		description = "aghsfort_lich_chain_frost_damage_upgrade",
		ability_name = "lich_pf_chain_frost",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 150,
   },	

   {
		description = "aghsfort_lich_chain_frost_jumps_upgrade",
		ability_name = "lich_pf_chain_frost",
		special_value_name = "jumps",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
   },
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_lich"] = {"aghsfort_minor_stat_upgrade_bonus_evasion"}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_lich"] = "lich_chain_frost"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_lich"] =
{
	"aghsfort_special_lich_frost_nova_root_disarm",
	"aghsfort_special_lich_frost_nova_execute_refund",
	"aghsfort_special_lich_frost_nova_aoe_attacks",

	"aghsfort_special_lich_frost_shield_magic_resist_debuff_and_stun",
	"aghsfort_special_lich_frost_shield_frost_giant",
	"aghsfort_special_lich_frost_shield_dispels",

	"aghsfort_special_lich_sinister_gaze_spawns_ice_spire",
	"aghsfort_special_lich_sinister_gaze_drains_life",
	"aghsfort_special_lich_sinister_gaze_raises_skeletons",

	"aghsfort_special_lich_chain_frost_split",
	"special_bonus_unique_lich_chain_frost_applies_frost_shield",
	"aghsfort_special_lich_chain_frost_applies_frost_nova",

	-- "aghsfort_special_lich_frost_nova_applies_frost_shield",
	-- "aghsfort_special_lich_frost_shield_heal",
}


item_aghsfort_lich_frost_nova_damage_upgrade = item_small_scepter_fragment
item_aghsfort_lich_frost_nova_radius_upgrade = item_small_scepter_fragment
item_aghsfort_lich_frost_shield_duration_upgrade = item_small_scepter_fragment
item_aghsfort_lich_frost_shield_damage_upgrade = item_small_scepter_fragment
item_aghsfort_lich_sinister_gaze_radius_upgrade = item_small_scepter_fragment
item_aghsfort_lich_sinister_gaze_mana_drained_upgrade = item_small_scepter_fragment
item_aghsfort_lich_chain_frost_damage_upgrade = item_small_scepter_fragment
item_aghsfort_lich_chain_frost_jumps_upgrade = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_lich" ] =
{
   "item_aghsfort_lich_frost_nova_damage_upgrade",
   "item_aghsfort_lich_frost_nova_radius_upgrade",
   "item_aghsfort_lich_frost_shield_duration_upgrade",
   "item_aghsfort_lich_frost_shield_damage_upgrade",
   "item_aghsfort_lich_sinister_gaze_radius_upgrade",
   "item_aghsfort_lich_sinister_gaze_mana_drained_upgrade",
   "item_aghsfort_lich_chain_frost_damage_upgrade",
   "item_aghsfort_lich_chain_frost_jumps_upgrade",
}
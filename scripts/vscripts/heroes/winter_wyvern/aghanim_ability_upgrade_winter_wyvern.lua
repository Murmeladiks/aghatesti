MINOR_ABILITY_UPGRADES["npc_dota_hero_winter_wyvern"] = {
	{
		description = "aghsfort_winter_wyvern_arctic_burn_flat_damage",
		ability_name = "winter_wyvern_pf_arctic_burn",
		special_value_name = "damage_per_second",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 25,
   },

   {
		description = "aghsfort_winter_wyvern_arctic_burn_flat_duration",
		ability_name = "winter_wyvern_pf_arctic_burn",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1.0,
   },

   {
		description = "aghsfort_winter_wyvern_arctic_burn_flat_range",
		ability_name = "winter_wyvern_pf_arctic_burn",
		special_value_name = "attack_range_bonus",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
   },

   {
		description = "aghsfort_winter_wyvern_arctic_burn_flat_move_slow",
		ability_name = "winter_wyvern_pf_arctic_burn",
		special_value_name = "move_slow",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 25,
   },

   {
		description = "aghsfort_winter_wyvern_splinter_blast_flat_slow",
		ability_name = "winter_wyvern_pf_splinter_blast",
		special_value_name = "bonus_movespeed",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 25,
   },

   {
		description = "aghsfort_winter_wyvern_splinter_blast_flat_radius",
		ability_name = "winter_wyvern_pf_splinter_blast",
		special_value_name = "split_radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 125,
   },

   {
		description = "aghsfort_winter_wyvern_splinter_blast_flat_slow_duration",
		ability_name = "winter_wyvern_pf_splinter_blast",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2.0,
   },

   {
		description = "aghsfort_winter_wyvern_splinter_blast_flat_damage",
		ability_name = "winter_wyvern_pf_splinter_blast",
		special_value_name = "splinter_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 100,
   },

   -- {
   -- 	 description = "aghsfort_winter_wyvern_splinter_blast_pct_mana_cost",
   -- 	 ability_name = "winter_wyvern_pf_splinter_blast",
   -- 	 special_value_name = "mana_cost",
   -- 	 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
   -- 	 value = 15,
   -- },

   {
		description = "aghsfort_winter_wyvern_splinter_blast_pct_cooldown",
		ability_name = "winter_wyvern_pf_splinter_blast",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
   },

   {
		description = "aghsfort_winter_wyvern_cold_embrace_pct_cooldown",
		ability_name = "winter_wyvern_pf_cold_embrace",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
   },

   {
		description = "aghsfort_winter_wyvern_cold_embrace_flat_heal_additive",
		ability_name = "winter_wyvern_pf_cold_embrace",
		special_value_name = "heal_additive",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 12,
   },

   {
		description = "aghsfort_winter_wyvern_cold_embrace_flat_heal_percentage",
		ability_name = "winter_wyvern_pf_cold_embrace",
		special_value_name = "heal_percentage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1.0,
   },

   {
		description = "aghsfort_winter_wyvern_cold_embrace_flat_duration",
		ability_name = "winter_wyvern_pf_cold_embrace",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1.0,
   },


   {
		description = "aghsfort_winter_wyvern_winters_curse_pct_cooldown",
		ability_name = "winter_wyvern_pf_winters_curse",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
   },

   -- {
   -- 	 description = "aghsfort_winter_wyvern_winters_curse_pct_manacost",
   -- 	 ability_name = "winter_wyvern_pf_winters_curse",
   -- 	 special_value_name = "mana_cost",
   -- 	 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
   -- 	 value = 15,
   -- },

   {
		description = "aghsfort_winter_wyvern_winters_curse_flat_bonus_attack_speed",
		ability_name = "winter_wyvern_pf_winters_curse",
		special_value_name = "bonus_attack_speed",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 25,
   },

   {
		description = "aghsfort_winter_wyvern_winters_curse_flat_duration",
		ability_name = "winter_wyvern_pf_winters_curse",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 1.5,
   },

   {
		description = "aghsfort_winter_wyvern_winters_curse_flat_radius",
		ability_name = "winter_wyvern_pf_winters_curse",
		special_value_name = "radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 125,
   },
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_winter_wyvern"] = {"aghsfort_minor_stat_upgrade_bonus_evasion"}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_winter_wyvern"] = "winter_wyvern_winters_curse"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_winter_wyvern"] =
{
	"aghsfort_special_winter_wyvern_arctic_burn_splitshot",
	"aghsfort_special_winter_wyvern_arctic_burn_doubleattack",
	--"aghsfort_special_winter_wyvern_arctic_burn_nomana", // lol
	"aghsfort_special_winter_wyvern_arctic_burn_splash_damage",

	"aghsfort_special_winter_wyvern_splinter_blast_main_target_hit",
	"aghsfort_special_winter_wyvern_splinter_blast_vacuum",
	"aghsfort_special_winter_wyvern_splinter_blast_heal",

	"special_bonus_unique_winter_wyvern_cold_embrace_charges",
	"aghsfort_special_winter_wyvern_cold_embrace_blast_on_end",
	"aghsfort_special_winter_wyvern_cold_embrace_magic_damage_block",

	"aghsfort_special_winter_wyvern_winters_curse_transfer",
	"aghsfort_special_winter_wyvern_winters_curse_damage_amp",
	"aghsfort_special_winter_wyvern_winters_curse_heal_on_death",
}

item_aghsfort_winter_wyvern_arctic_burn_flat_damage = item_small_scepter_fragment
item_aghsfort_winter_wyvern_arctic_burn_flat_duration = item_small_scepter_fragment
item_aghsfort_winter_wyvern_splinter_blast_flat_radius = item_small_scepter_fragment
item_aghsfort_winter_wyvern_splinter_blast_flat_damage = item_small_scepter_fragment
item_aghsfort_winter_wyvern_cold_embrace_flat_heal_percentage = item_small_scepter_fragment
item_aghsfort_winter_wyvern_cold_embrace_pct_cooldown = item_small_scepter_fragment
item_aghsfort_winter_wyvern_winters_curse_flat_duration = item_small_scepter_fragment
item_aghsfort_winter_wyvern_winters_curse_pct_cooldown = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_winter_wyvern" ] =
{
	"item_aghsfort_winter_wyvern_arctic_burn_flat_damage",
	"item_aghsfort_winter_wyvern_arctic_burn_flat_duration",
	"item_aghsfort_winter_wyvern_splinter_blast_flat_radius",
	"item_aghsfort_winter_wyvern_splinter_blast_flat_damage",
	"item_aghsfort_winter_wyvern_cold_embrace_flat_heal_percentage",
	"item_aghsfort_winter_wyvern_cold_embrace_pct_cooldown",
	"item_aghsfort_winter_wyvern_winters_curse_flat_duration",
	"item_aghsfort_winter_wyvern_winters_curse_pct_cooldown",
}
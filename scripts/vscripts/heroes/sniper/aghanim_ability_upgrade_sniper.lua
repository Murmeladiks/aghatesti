MINOR_ABILITY_UPGRADES["npc_dota_hero_sniper"] = {
	{
		description = "aghsfort_sniper_shrapnel_percent_cooldown",
		ability_name = "sniper_pf_shrapnel",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "aghsfort_sniper_shrapnel_flat_damage",
		ability_name = "sniper_pf_shrapnel",
		special_value_name = "shrapnel_damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 25,
		facet_changes = {
			facet_id = 2,
			value_mult = 4
		}
	},
	{
		description = "aghsfort_sniper_shrapnel_flat_radius",
		ability_name = "sniper_pf_shrapnel",
		special_value_name = "radius",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 75,
	},
	{
		description = "aghsfort_sniper_shrapnel_flat_slow_movement_speed",
		ability_name = "sniper_pf_shrapnel",
		special_value_name = "slow_movement_speed",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = -12,
	},
	{
		description = "aghsfort_sniper_shrapnel_duration",
		ability_name = "sniper_pf_shrapnel",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 2,
		facet_changes = {
			facet_id = 2,
			value_mult = 0.25
		}
	},
	{
		description = "aghsfort_sniper_headshot_flat_damage",
		ability_name = "sniper_pf_headshot",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 40,
	},
	{
		description = "aghsfort_sniper_headshot_knockback_distance",
		ability_name = "sniper_pf_headshot",
		special_value_name = "knockback_distance",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 15,
	},

	{
		description = "aghsfort_sniper_headshot_proc_chance",
		ability_name = "sniper_pf_headshot",
		special_value_name = "proc_chance",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 8,
	},
	{
		description = "aghsfort_sniper_headshot_debuff_duration",
		ability_name = "sniper_pf_headshot",
		special_value_name = "slow_duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.5,
	},
	{
		description = "aghsfort_sniper_take_aim_flat_bonus_attack_range",
		ability_name = "sniper_keen_scope",
		special_value_name = "bonus_range",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 50,
	},
	{
		description = "aghsfort_sniper_take_aim_self_slow",
		ability_name = "sniper_pf_take_aim",
		special_value_name = "slow",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 10,
	},
	{
		description = "aghsfort_sniper_take_aim_duration",
		ability_name = "sniper_pf_take_aim",
		special_value_name = "duration",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 0.5,
	},
	{
		description = "aghsfort_sniper_assassinate_flat_damage",
		ability_name = "sniper_pf_assassinate",
		special_value_name = "damage",
		operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		value = 165,
	},
	{
		description = "aghsfort_sniper_assassinate_percent_cooldown",
		ability_name = "sniper_pf_assassinate",
		special_value_name = "cooldown",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 12,
	},
	{
		description = "aghsfort_sniper_assassinate_percent_cast_point",
		ability_name = "sniper_pf_assassinate",
		special_value_name = "cast_point",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = -20,
	},

	-- {
	-- 	description = "aghsfort_sniper_shrapnel_percent_mana_cost",
	-- 	ability_name = "sniper_pf_shrapnel",
	-- 	special_value_name = "mana_cost",
	-- 	operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	-- 	value = 12,
	-- },
	-- {
	-- 	description = "aghsfort_sniper_take_aim_percent_cooldown",
	-- 	ability_name = "sniper_pf_take_aim",
	-- 	special_value_name = "cooldown",
	-- 	operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	-- 	value = 12,
	-- },
	--[[{
		description = "aghsfort_sniper_assassinate_percent_mana_cost",
		ability_name = "sniper_pf_assassinate",
		special_value_name = "mana_cost",
		operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		value = 15,
	},]]
	-- {
	-- 	description = "aghsfort_sniper_assassinate_projectile_speed",
	-- 	ability_name = "sniper_pf_assassinate",
	-- 	special_value_name = "projectile_speed",
	-- 	operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	-- 	value = 1250,
	-- },
}

STAT_UPGRADE_EXCLUDES["npc_dota_hero_sniper"] = {
	"aghsfort_minor_stat_upgrade_bonus_evasion"
}

ULTIMATE_ABILITY_NAMES["npc_dota_hero_sniper"] = "sniper_assassinate"


SPECIAL_ABILITY_UPGRADES["npc_dota_hero_sniper"] =
{
   "aghsfort_special_sniper_shrapnel_bombs",
   "aghsfort_special_sniper_shrapnel_attack_speed",
   "aghsfort_special_sniper_shrapnel_move_speed",
   

   "aghsfort_special_sniper_headshot_armor_reduction",
   "aghsfort_special_sniper_headshot_shotgun",
   "aghsfort_special_sniper_headshot_assassinate",

   "special_bonus_unique_aghsfort_special_sniper_take_aim_self_purge",
   "aghsfort_special_sniper_take_aim_shrapnel",
   "aghsfort_special_sniper_take_aim_rapid_fire",

   "aghsfort_special_sniper_assassinate_buckshot",
   "special_bonus_unique_aghsfort_special_sniper_assassinate_original_scepter",
   "aghsfort_special_sniper_assassinate_concussive_dummy"

	--"aghsfort_special_sniper_shrapnel_miss_chance", -- redundant, move_speed grants that
	--"aghsfort_special_sniper_headshot_stuns",
	--"aghsfort_special_sniper_headshot_crits",
	--"aghsfort_special_sniper_take_aim_aoe", -- bugged
	--"aghsfort_special_sniper_take_aim_hop_backwards", -- redundant, less fancy grenade
	--"aghsfort_special_sniper_take_aim_armor_reduction", -- redundant, weaker headshot armor reduction
	--"aghsfort_special_sniper_assassinate_killshot", -- worth bringing back? maybe replace headshot assassinate
}


item_aghsfort_sniper_shrapnel_flat_damage = item_small_scepter_fragment
item_aghsfort_sniper_shrapnel_flat_radius = item_small_scepter_fragment
item_aghsfort_sniper_shrapnel_duration = item_small_scepter_fragment
item_aghsfort_sniper_headshot_flat_damage = item_small_scepter_fragment
item_aghsfort_sniper_headshot_proc_chance = item_small_scepter_fragment
item_aghsfort_sniper_take_aim_flat_bonus_attack_range = item_small_scepter_fragment
item_aghsfort_sniper_assassinate_flat_damage = item_small_scepter_fragment
item_aghsfort_sniper_assassinate_percent_cast_point = item_small_scepter_fragment

PURCHASABLE_SHARDS[ "npc_dota_hero_sniper" ] =
{
   "item_aghsfort_sniper_shrapnel_flat_damage",
   "item_aghsfort_sniper_shrapnel_flat_radius",
   "item_aghsfort_sniper_shrapnel_duration",
   "item_aghsfort_sniper_headshot_flat_damage",
   "item_aghsfort_sniper_headshot_proc_chance",
   "item_aghsfort_sniper_take_aim_flat_bonus_attack_range",
   "item_aghsfort_sniper_assassinate_flat_damage",
   "item_aghsfort_sniper_assassinate_percent_cast_point",
}
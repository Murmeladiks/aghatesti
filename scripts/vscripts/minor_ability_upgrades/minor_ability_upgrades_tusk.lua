local Tusk =
{
	{
		 description = "aghsfort_tusk_ice_shards_flat_damage",
		 ability_name = "aghsfort_tusk_ice_shards",
		 special_value_name = "shard_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 80,
	},

	-- {
	-- 	 description = "aghsfort_tusk_ice_shards_pct_mana_cost",
	-- 	 ability_name = "aghsfort_tusk_ice_shards",
	-- 	 special_value_name = "mana_cost",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
	-- 	 value = 15,
	-- },

	{
		 description = "aghsfort_tusk_ice_shards_pct_cooldown",
		 ability_name = "aghsfort_tusk_ice_shards",
		 special_value_name = "cooldown",
		 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		 value = 12,
	},

	{
		 description = "aghsfort_tusk_ice_shards_flat_shard_duration",
		 ability_name = "aghsfort_tusk_ice_shards",
		 special_value_name = "shard_duration",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 0.75,
	},

	{
		 description = "aghsfort_tusk_snowball_pct_cooldown",
		 ability_name = "aghsfort_tusk_snowball",
		 special_value_name = "cooldown",
		 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		 value = 12,
	},

	{
		 description = "aghsfort_tusk_snowball_flat_snowball_damage",
		 ability_name = "aghsfort_tusk_snowball",
		 special_value_name = "snowball_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 90,
	},

	-- {
	-- 	 description = "aghsfort_tusk_snowball_flat_snowball_speed",
	-- 	 ability_name = "aghsfort_tusk_snowball",
	-- 	 special_value_name = "snowball_speed",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	-- 	 value = 100,
	-- },

	{
		 description = "aghsfort_tusk_snowball_flat_stun_duration",
		 ability_name = "aghsfort_tusk_snowball",
		 special_value_name = "stun_duration",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 0.5,
	},

	{
		 description = "aghsfort_tusk_tag_team_pct_cooldown",
		 ability_name = "aghsfort_tusk_tag_team",
		 special_value_name = "cooldown",
		 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		 value = 12,
	},

	{
		 description = "aghsfort_tusk_tag_team_flat_damage",
		 ability_name = "aghsfort_tusk_tag_team",
		 special_value_name = "bonus_damage",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 20,
	},

	{
		 description = "aghsfort_tusk_tag_team_flat_radius",
		 ability_name = "aghsfort_tusk_tag_team",
		 special_value_name = "radius",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 150,
	},

	{
		 description = "aghsfort_tusk_tag_team_flat_debuff_duration",
		 ability_name = "aghsfort_tusk_tag_team",
		 special_value_name = "debuff_duration",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 1.0,
	},


	{
		 description = "aghsfort_tusk_walrus_punch_pct_cooldown",
		 ability_name = "aghsfort_tusk_walrus_punch",
		 special_value_name = "cooldown",
		 operator = MINOR_ABILITY_UPGRADE_OP_MUL,
		 value = 12,
	},

	{
		 description = "aghsfort_tusk_walrus_punch_flat_crit_multiplier",
		 ability_name = "aghsfort_tusk_walrus_punch",
		 special_value_name = "crit_multiplier",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 75,
	},

	{
		 description = "aghsfort_tusk_walrus_punch_flat_slow_duration",
		 ability_name = "aghsfort_tusk_walrus_punch",
		 special_value_name = "slow_duration",
		 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
		 value = 2.0,
	},

	-- {
	-- 	 description = "aghsfort_tusk_walrus_punch_flat_move_slow",
	-- 	 ability_name = "aghsfort_tusk_walrus_punch",
	-- 	 special_value_name = "move_slow",
	-- 	 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	-- 	 value = 30,
	-- },

	--{
	--	 description = "aghsfort_tusk_walrus_punch_flat_air_time",
	--	 ability_name = "aghsfort_tusk_walrus_punch",
	--	 special_value_name = "air_time",
	--	 operator = MINOR_ABILITY_UPGRADE_OP_ADD,
	--	 value = 1.5,
	--},
}

return Tusk


_G.EXTRA_ABILITIES_PER_ASCENSION_LEVEL =
{
	0, 1, 2, 3, 4, 5,
}

_G.ELITE_ABILITIES_PER_ASCENSION_LEVEL =
{
	1, 1, 1, 1, 1, 1,
}

-- Ascension ability type
_G.ASCENSION_ABILITY_CAPTAINS_ONLY = 0
_G.ASCENSION_ABILITY_NON_CAPTAINS_ONLY = 1
_G.ASCENSION_ABILITY_ALL_UNITS = 2
_G.ASCENSION_ABILITY_GLOBAL = 3

-- Ascension cast behavior
_G.ASCENSION_CAST_WHEN_COOLDOWN_READY = 0	-- Default
_G.ASCENSION_CAST_ON_DEATH = 1
_G.ASCENSION_CAST_ON_LOW_HEALTH = 2
_G.ASCENSION_CAST_ON_TAKE_MAGIC_DAMAGE = 3
_G.ASCENSION_CAST_ON_NEARBY_ENEMY = 4
_G.ASCENSION_CAST_ON_DEATH_NO_TARGET = 5

-- Ascension tareting behavior [for targetted abilities]
_G.ASCENSION_TARGET_NO_TARGET = 0
_G.ASCENSION_TARGET_RANDOM_PLAYER = 1
_G.ASCENSION_TARGET_ATTACKER = 2
_G.ASCENSION_TARGET_CLUMPED_PLAYER = 3

-- Uncomment + change ability names for debugging
_G.ASCENSION_ABILITIES_FORCE_LIST =
{
	-- "ascension_armor",
}

_G.TRIALS_ASCENSION_ABILITIES =
{
}

_G.TRIALS_BOSS_ASCENSION_ABILITIES = 
{
}

_G.APEX_BOSS_ASCENSION_ABILITIES =
{
	"ascension_armor",
	"ascension_bulwark",
	"ascension_magic_resist",
	"ascension_heal_suppression",
	-- "ascension_chilling_touch",
	"aghsfort_ascension_magnetic_field",
	"ascension_damage",		
	--"ascension_bomb",
	--"aghsfort_ascension_silence",
	"ascension_magic_immunity",
	--"ascension_pathfinder_dilation",
}

_G.ASCENSION_SOLO =
{
	"ascension_solo_player",
}

_G.ASCENSION_ABILITIES =
{
--	example_ability_name =
--	{
--		nType = <ascension ability type>,
--		nCastBehavior = <cast behavior type>, ASCENSION_CAST_WHEN_COOLDOWN_READY is used if unspecified		
--		nTargetType = <target type>, -- For targeted abilities, ASCENSION_TARGET_NO_TARGET is used if unspecified
--		nMinAscensionLevel = 3,
--		nMaxAscensionLevel = 5,
--		nRestrictToAct = 1, -- Should this only appear in one act? Leave blank if not
--		szRequiredBoss = "<boss unit name>", -- Only used if nRestrictToAct is set
--		flHealthPercent = 20, -- Only used for ASCENSION_CAST_ON_LOW_HEALTH, defaults to 25 if not set
--		bEliteOnly = true, -- Indicates if this is an elite only ability
--		vecBlacklistedEncounters = {}, -- List of encounter names to not use this ascension ability with
--	},
	ascension_solo_player =
	{
		isSolo = true,
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
	},

	-- aghsfort_ascension_firefly =
	-- {
	-- 	nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
	-- 	bEliteOnly = true,
	-- 	vecBlacklistedEncounters = 
	-- 	{
	-- 		"encounter_enraged_wildwings",
	-- 	}
	-- },

	ascension_pathfinder_blademail =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_NEARBY_ENEMY,	
		nRange = 700,	
		bEliteOnly = true,
		vecBlacklistedEncounters = 
		{
			"encounter_dire_siege",
			"encounter_legion_commander",
			"encounter_spectres",
		}
	},
	ascension_pathfinder_dilation =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_NEARBY_ENEMY,	
		nRange = 550,	
		bEliteOnly = true,
		vecBlacklistedEncounters = 
		{

		}
	},

	
	ascension_plasma_field =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_DEATH_NO_TARGET,
		bEliteOnly = true,
		vecBlacklistedEncounters = 
		{
			"encounter_drow_ranger_miniboss",
			"encounter_alchemist",
			"encounter_fire_roshan",
			"encounter_big_ogres",
		}
	},

	ascension_bomb =
	{
		nType = ASCENSION_ABILITY_GLOBAL,
		nTargetType = ASCENSION_TARGET_CLUMPED_PLAYER,
		bEliteOnly = true,
		nRange = 700,
		vecBlacklistedEncounters = 
		{
			"encounter_bombers",
			"encounter_bomb_squad",
		}		
	},

	ascension_flicker =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_NEARBY_ENEMY,
		nRange = 500,
		vecBlacklistedEncounters = 
		{
			"encounter_dire_siege",
			"encounter_big_ogres",
			"encounter_baby_ogres",
		},
	},


	ascension_drunken =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_NEARBY_ENEMY,
		nRange = 500,
	},

	ascension_bulwark =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
	},

	ascension_magic_resist =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
	},

	ascension_extra_fast =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		vecBlacklistedEncounters = 
		{
			"encounter_mushroom_mines",
			"encounter_brewmaster",
			"encounter_drow_ranger_miniboss",
			"encounter_gauntlet",
		}		
	},

	ascension_chilling_touch =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		vecBlacklistedEncounters = 
		{
			"encounter_mirana",
		}
	},

	ascension_vampiric =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_LOW_HEALTH,
		flHealthPercent = 25,
		vecBlacklistedEncounters = 
		{
			"encounter_brewmaster",
		}
	},

	ascension_armor =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
	},

	ascension_damage =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		vecBlacklistedEncounters = 
		{
			"encounter_mushroom_mines",
			"encounter_mirana",
		}
	},

	ascension_attack_speed =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		nCastBehavior = ASCENSION_CAST_ON_LOW_HEALTH,
		flHealthPercent = 50,
		vecBlacklistedEncounters = 
		{
			"encounter_big_ogres",
			"encounter_mushroom_mines",
		}
	},

	ascension_magic_immunity =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_TAKE_MAGIC_DAMAGE,
		bEliteOnly = true,
	},

	ascension_armor_sapping =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		nCastBehavior = ASCENSION_CAST_ON_DEATH,
		nTargetType = ASCENSION_TARGET_ATTACKER,
		vecBlacklistedEncounters = 
		{
			"encounter_alchemist",
			"encounter_fire_roshan",
		}
	},

	ascension_heal_suppression =
	{
		bEliteOnly = true,
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
	},

	aghsfort_ascension_silence =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_NEARBY_ENEMY,
		nRange = 400,
	},

	aghsfort_ascension_magnetic_field =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
	},

	ascension_embiggen =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		nCastBehavior = ASCENSION_CAST_ON_DEATH,
		nTargetType = ASCENSION_TARGET_ATTACKER,
		vecBlacklistedEncounters =
		{
			"encounter_bombers",
			"encounter_alchemist",
			"encounter_fire_roshan",
		}
	},

	ascension_vengeance =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_DEATH,
		nTargetType = ASCENSION_TARGET_ATTACKER,
		vecBlacklistedEncounters =
		{
			"encounter_alchemist",
			"encounter_fire_roshan",
		}
	},

	aghsfort_ascension_invis =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_NEARBY_ENEMY,
		nRange = 800,
		vecBlacklistedEncounters =
		{
			"Illegally_Smol_Bears",		
		}
	},

	--[[
	ascension_impatient =
	{
		nType = ASCENSION_ABILITY_ALL_UNITS,
		vecBlacklistedEncounters =
		{
			"encounter_hellbears_portal_v3",
			"encounter_morphlings_b",
			"encounter_warlocks",
			"encounter_mirana",
			"encounter_legion_commander",
			"encounter_bandits",
		}
	},
	]]

	ascension_meteoric =
	{
		nType = ASCENSION_ABILITY_CAPTAINS_ONLY,
		nCastBehavior = ASCENSION_CAST_ON_TAKE_MAGIC_DAMAGE,
		--nCastBehavior = ASCENSION_CAST_WHEN_COOLDOWN_READY,
		nTargetType = ASCENSION_TARGET_CLUMPED_PLAYER,
		bEliteOnly = true,
		vecBlacklistedEncounters =
		{
			"encounter_dire_siege",
			"encounter_drow_ranger_miniboss"
		}
	},

}

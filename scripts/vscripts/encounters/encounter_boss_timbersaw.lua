require( "encounters/encounter_boss_base" )
require( "aghanim_utility_functions" )
require( "spawner" )

--------------------------------------------------------------------------------

if CMapEncounter_BossTimbersaw == nil then
	CMapEncounter_BossTimbersaw = class( {}, {}, CMapEncounter_BossBase )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:constructor( hRoom, szEncounterName )
	CMapEncounter_BossBase.constructor( self, hRoom, szEncounterName )

	GameRules:SetTreeRegrowTime( 30.0 )

	

	self:AddSpawner( CDotaSpawner( "spawner_boss", "spawner_boss",
		{
			{
				EntityName = self:GetPreviewUnit(),
				Team = DOTA_TEAM_BADGUYS,
				Count = 1,
				PositionNoise = 0.0,
	
			},
		} ) )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:GetPreviewUnit()
	return "npc_dota_boss_timbersaw"
end


--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:Precache( context )
	CMapEncounter_BossBase.Precache( self, context )
	
	PrecacheUnitByNameSync( "npc_dota_creature_timbersaw_treant", context, -1 )
	PrecacheResource( "particle_folder", "particles/units/heroes/hero_shredder", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_shredder.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/voscripts/game_sounds_vo_shredder.vsndevts", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_shredder/shredder_chakram_aghs.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_shredder/shredder_chakram_stay.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_shredder/shredder_chakram_return.vpcf", context )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:GetBossIntroVoiceLine()
	local nLine = RandomInt( 0, 3 )
	if nLine == 0 then
		return "shredder_timb_rival_31"
	end

	if nLine == 1 then
		return "shredder_timb_rare_02"
	end

	if nLine == 2 then
		return "shredder_timb_respawn_05"
	end

	if nLine == 3 then
		return "shredder_timb_respawn_02"
	end

	return "shredder_timb_levelup_07"
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:OnEncounterLoaded()
	CMapEncounter_BossBase.OnEncounterLoaded( self )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:OnThink()
	CMapEncounter_BossBase.OnThink( self )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:MustKillForEncounterCompletion( hEnemyCreature )
    if hEnemyCreature:GetUnitName() == "npc_dota_creature_timbersaw_treant" then
    	return false
    end
    return true
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:OnBossSpawned( hBoss )
	CMapEncounter_BossBase.OnBossSpawned( self, hBoss )

	hBoss.AI:SetEncounter( self )
end

---------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:OnBossKilled( hBoss, hAttacker )
	DecrementLegendaryRerollsForAll()
	
	CMapEncounter_BossBase.OnBossKilled( self, hBoss, hAttacker )

	local vecTreants = self:GetRoom():FindAllEntitiesInRoomByName( "npc_dota_furion_treant_4", false )
	if #vecTreants > 0 then
		for _,hTreant in pairs ( vecTreants ) do
			hTreant:ForceKill( false )
		end
	end
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:GetLaughLine()

	local szLines = 
	{
		"shredder_timb_laugh_01",
		"shredder_timb_laugh_02",
		"shredder_timb_laugh_03",
		"shredder_timb_laugh_04",
		"shredder_timb_laugh_05",
		"shredder_timb_laugh_06",
		"shredder_timb_kill_15",
		"shredder_timb_kill_16",
		"shredder_timb_deny_14",
		"shredder_timb_levelup_09",
	}

	return szLines[ RandomInt( 1, #szLines ) ]
end

---------------------------------------------------------- ----------------------

function CMapEncounter_BossTimbersaw:GetKillTauntLine(victim)
	local szLines = 
	{
		"shredder_timb_kill_08",
		"shredder_timb_kill_13",
		"shredder_timb_kill_12",
		"shredder_timb_rival_15",
		"shredder_timb_rival_08",
		"shredder_timb_rival_24",
		"shredder_timb_rival_31",
		"shredder_timb_ally_16",
		"shredder_timb_ally_18",
		"shredder_timb_ally_22",
		"shredder_timb_respawn_03",		
	}

	return szLines[ RandomInt( 1, #szLines ) ]
end

--------------------------------------------------------------------------------

function CMapEncounter_BossTimbersaw:GetAbilityUseLine( szAbilityName )
	local szLineToUse = self:GetLaughLine()
	if szAbilityName == "boss_timbersaw_whirling_death" then
		local szLines = 
		{
			"shredder_timb_whirlingdeath_01",
			"shredder_timb_whirlingdeath_02",
			"shredder_timb_whirlingdeath_03",
			"shredder_timb_whirlingdeath_04",
			"shredder_timb_whirlingdeath_05",
			"shredder_timb_whirlingdeath_06",
		}
		szLineToUse = szLines[ RandomInt( 1, #szLines ) ]
	end

	if szAbilityName == "boss_timbersaw_timber_chain" then
		local szLines = 
		{
			"shredder_timb_timberchain_01",
			"shredder_timb_timberchain_02",
			"shredder_timb_timberchain_05",
			"shredder_timb_timberchain_04",
			"shredder_timb_timberchain_07",
			"shredder_timb_timberchain_08",
			"shredder_timb_timberchain_09",
		}
		szLineToUse = szLines[ RandomInt( 1, #szLines ) ]
	end

	if szAbilityName == "boss_timbersaw_chakram_dance" then
		local szLines = 
		{
			"shredder_timb_attack_08",
			"shredder_timb_attack_07",
			"shredder_timb_attack_05",
			"shredder_timb_attack_03",
			"shredder_timb_attack_02",
			"shredder_timb_cast_01",
			"shredder_timb_levelup_10",
			"shredder_timb_levelup_11",
			"shredder_timb_levelup_12",
		}
		szLineToUse = szLines[ RandomInt( 1, #szLines ) ]
	end

	if szAbilityName == "shredder_chakram" then
		local szLines = 
		{
			"shredder_timb_chakram_01",
			"shredder_timb_chakram_02",
			"shredder_timb_chakram_03",
			"shredder_timb_chakram_04",
			"shredder_timb_chakram_05",
			"shredder_timb_chakram_06",
			"shredder_timb_chakram_07",
			"shredder_timb_chakram_08",
		}
		szLineToUse = szLines[ RandomInt( 1, #szLines ) ]
	end
	return szLineToUse
end


--------------------------------------------------------------------------------

return CMapEncounter_BossTimbersaw

require( "map_encounter" )
require( "aghanim_utility_functions" )
require( "spawner" )

_G.BOSS_SPEECH_COOLDOWN = 7.0
_G.BOSS_LAUGH_COOLDOWN = 20.0

--------------------------------------------------------------------------------

if CMapEncounter_BossBase == nil then
	CMapEncounter_BossBase = class( {}, {}, CMapEncounter )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:constructor( hRoom, szEncounterName )
	CMapEncounter.constructor( self, hRoom, szEncounterName )
	self.bBossIntroduced = false
	self.bBossFightStarted = false
	self.bBossKilled = false

	self.flBossSpeechCooldown = -1
	self.flBossNextLaughTime = -1

	self.flBossIntroEndTime = 9999999999999999999999
	self.Bosses = {}	
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:OnThink()
	CMapEncounter.OnThink( self )

	if self.bBossIntroduced == false then
		for nPlayerID = 0,AGHANIM_PLAYERS-1 do
			local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
			if hPlayerHero then
				for _,hBoss in pairs( self.Bosses ) do
					if hPlayerHero:CanEntityBeSeenByMyTeam( hBoss ) then
						self:IntroduceBoss( hBoss )
						return
					end
				end
			end
		end

		return
	end

	local flNow = GameRules:GetGameTime()
	if self.bBossIntroduced and self.flBossIntroEndTime > flNow  then
		return
	end

	if not self.bBossFightStarted and flNow > self.flBossIntroEndTime then
		self:StartBossFight()
		return
	end

	if self.bBossFightStarted and flNow > self.flBossNextLaughTime then
		local szLaughLine = self:GetLaughLine()
		if szLaughLine ~= nil then
			self:BossSpeak( szLaughLine )
			self.flBossNextLaughTime = flNow + BOSS_LAUGH_COOLDOWN
		end
	end

	for nPlayerID = 0,AGHANIM_PLAYERS-1 do
		local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
		if hPlayerHero then
			local hVisionBuff = hPlayerHero:FindModifierByName( "modifier_provide_vision" )
			if hVisionBuff == nil then
				for _,hBoss in pairs( self.Bosses ) do
					if hBoss and hBoss:IsNull() == false and hBoss:IsAlive() then
						hPlayerHero:AddNewModifier( hBoss, nil, "modifier_provide_vision", { duration = -1 } )
						break
					end
				end
			end	
		end
	end
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:ShowBossHP()
	local bossIDs = {}
	local szUnitName = self:GetBossUnitName()

	for _,hBoss in pairs ( self.Bosses ) do
		if hBoss and not hBoss:IsNull() then
			if hBoss:IsAlive() then
				table.insert(bossIDs, hBoss:entindex())
			end
		end
	end

	local netTable =  { 
		ent_index = bossIDs, 
		unit_name = szUnitName 
	}

	CustomNetTables:SetTableValue( "boss_net_table", "current_boss", netTable)
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:InitializeObjectives()
	CMapEncounter.InitializeObjectives( self )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossUnitName()
	return self:GetPreviewUnit()
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossUnits()
	return self.Bosses
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:OnBossSpawned( hBoss )
	hBoss.bIsBoss = true
	hBoss:SetAbsAngles( 0, 270, 0 )
	hBoss:AddNewModifier( hBoss, nil, "modifier_boss_intro", {} )
	hBoss:RemoveAbility( "ability_ascension" )
	hBoss:RemoveModifierByName( "modifier_ascension" )

	table.insert( self.Bosses, hBoss )
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroGesture()
	return ACT_DOTA_VICTORY
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroCameraPitch()
	return 30
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroCameraDistance()
	return 800
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroCameraHeight()
	return 50
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroCameraYawRotateSpeed()
	return 0.1
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroCameraInitialYaw()
	return 120
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroDuration()
	return 4.0
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetBossIntroVoiceLine()
	return nil
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:IntroduceBoss( hEncounteredBoss )
	self.bBossIntroduced = true

	for _,hBoss in pairs ( self.Bosses ) do
		hBoss:SetAbsAngles( 0, 270, 0 )
		hBoss:AddNewModifier( hBoss, nil, "modifier_provide_vision", { duration = -1 } )
		hBoss:StartGesture( self:GetBossIntroGesture() )
	end

	for nPlayerID = 0,AGHANIM_PLAYERS-1 do
		local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
		if hPlayerHero then
			hPlayerHero:AddNewModifier( hPlayerHero, nil, "modifier_boss_intro", {  } )
		end
	end
	
	self:AddEncounterObjective( tostring( "defeat_boss_" .. self:GetBossUnitName() ), 0, 0 )

	local netTable = {}
	netTable[ "boss_ent_index" ] = hEncounteredBoss:entindex()
	netTable[ "camera_pitch" ] = self:GetBossIntroCameraPitch()
	netTable[ "camera_distance" ] = self:GetBossIntroCameraDistance()
	netTable[ "camera_height" ] = self:GetBossIntroCameraHeight()
	netTable[ "camera_yaw_rotate_speed" ] = self:GetBossIntroCameraYawRotateSpeed()
	netTable[ "camera_inital_yaw" ] = self:GetBossIntroCameraInitialYaw()
	self.flBossIntroEndTime = GameRules:GetGameTime() + self:GetBossIntroDuration()

	CustomGameEventManager:Send_ServerToAllClients( "boss_intro_begin", netTable )

	if self:GetBossIntroVoiceLine() ~= nil then
		self:BossSpeak( self:GetBossIntroVoiceLine() )
	end
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:StartBossFight()
	self.nAbilityListener = ListenToGameEvent( "dota_non_player_begin_cast", Dynamic_Wrap( getclass( self ), "OnNonPlayerBeginCast" ), self )
	self.bBossFightStarted = true
	self:ShowBossHP()	

	for _,hBoss in pairs ( self.Bosses ) do
		--hBoss:RemoveModifierByName( "modifier_boss_intro" 
		local hBuff = hBoss:FindModifierByName( "modifier_boss_intro" )
		if hBuff then
			hBuff:SetDuration( 1.0, false )
		end
		hBoss.Encounter = self
		hBoss:RemoveGesture( self:GetBossIntroGesture() )
	end

	for nPlayerID = 0,AGHANIM_PLAYERS-1 do
		local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
		if hPlayerHero then
			hPlayerHero:RemoveModifierByName( "modifier_boss_intro" )
		end

		local hPlayer = PlayerResource:GetPlayer( nPlayerID )
		if hPlayer then
			hPlayer:SetMusicStatus( 2, 0.8 ) -- turn on battle music
		end
	end

	CustomGameEventManager:Send_ServerToAllClients( "boss_intro_end", netTable )	
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetMaxSpawnedUnitCount()
	return #self.Bosses
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:Start()
	CMapEncounter.Start( self )

	self.nGoldReward = 0
	self.Bosses = {}

	self:GetSpawner( "spawner_boss" ):SpawnUnits()
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:OnSpawnerFinished( hSpawner, hSpawnedUnits )
	CMapEncounter.OnSpawnerFinished( self, hSpawner, hSpawnedUnits )

	if hSpawner:GetSpawnerName() == "spawner_boss" then
		for _,hUnit in pairs ( hSpawnedUnits ) do
			if hUnit then
				self:OnBossSpawned( hUnit )
			end
		end
	end
end

---------------------------------------------------------------------------

function CMapEncounter_BossBase:OnEnemyCreatureSpawned( hEnemyCreature )
	CMapEncounter.OnEnemyCreatureSpawned( self, hEnemyCreature )
end


---------------------------------------------------------------------------

function CMapEncounter_BossBase:OnEntityKilled( event )
	CMapEncounter.OnEntityKilled( self, event )

	local hVictim = nil
	local hAttacker = nil
	local hInflictor = nil
	if event.entindex_killed ~= nil then
		hVictim = EntIndexToHScript( event.entindex_killed )
	end
	if event.entindex_attacker ~= nil then
		hAttacker = EntIndexToHScript( event.entindex_attacker )
	end
	if event.entindex_inflictor ~= nil then
		hInflictor = EntIndexToHScript( event.entindex_inflictor )
	end

	if hVictim ~= nil then
		if hVictim.bIsBoss == true then
			local hAllies = FindUnitsInRadius(hVictim:GetTeamNumber(), hVictim:GetOrigin(), nil, 20000, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, 0, false)
            for _, hAlly in pairs( hAllies ) do
                if hAlly:GetUnitName() == "npc_dota_earth_spirit_stone" then
                    UTIL_Remove(hAlly)
                end
            end
			self:OnBossKilled( hVictim, hAttacker )
		end

		if hVictim:IsRealHero() and hAttacker.bIsBoss == true then
			self:BossSpeak( self:GetKillTauntLine(hVictim:GetUnitName()) )
		end
	end
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:OnBossKilled( hBoss, hAttacker )
	for k,Boss in pairs ( self.Bosses ) do
		if hBoss == Boss then
			table.remove( self.Bosses, k )
		end
	end

	if #self.Bosses == 0 then
		self.bBossKilled = true

		CustomGameEventManager:Send_ServerToAllClients( "boss_fight_finished", netTable )	

		for i=1,NUM_LIVES_FROM_BOSSES do
			self:DropLifeRuneFromUnit( hBoss, hAttacker, false )
		end

		self:DropNeutralItemFromUnit( hBoss, hAttacker, true )

		for nPlayerID = 0,AGHANIM_PLAYERS-1 do
			local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
			if hPlayerHero then
				hPlayerHero:RemoveModifierByName( "modifier_provide_vision" )
			end

			local hPlayer = PlayerResource:GetPlayer( nPlayerID )
			if hPlayer then
				hPlayer:SetMusicStatus( 0, 1.0 ) -- go back to laning music
			end
		end
	end
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:OnComplete()
	CMapEncounter.OnComplete( self )
	if self.nAbilityListener ~= nil then
		StopListeningToGameEvent( self.nAbilityListener )
	end
	if self.bBossFightStarted == false then
		-- Fix for test encounter
		for nPlayerID = 0,AGHANIM_PLAYERS-1 do
			local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
			if hPlayerHero then
				hPlayerHero:RemoveModifierByName( "modifier_boss_intro" )
			end
		end
		CustomGameEventManager:Send_ServerToAllClients( "boss_intro_end", netTable )	
	end

	for nPlayerID = 0,AGHANIM_PLAYERS-1 do
		local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
		if hPlayerHero then
			hPlayerHero:RemoveModifierByName( "modifier_provide_vision" )
		end

		local hPlayer = PlayerResource:GetPlayer( nPlayerID )
		if hPlayer then
			hPlayer:SetMusicStatus( 0, 1.0 ) -- go back to laning music
		end
	end
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:CheckForCompletion()
	if self.bBossKilled then
		return true
	end
	return false
end

--------------------------------------------------------------------------------

function CMapEncounter_BossBase:DestroyRemainingSpawnedUnits()

	-- Necessary to make bosses drop loot in the case of win_encounter
	for i = #self.Bosses,1,-1 do
		self.Bosses[i]:ForceKill( false )
	end

	CMapEncounter.DestroyRemainingSpawnedUnits( self )
end


--------------------------------------------------------------------------------

function CMapEncounter_BossBase:GetLaughLine()
	return nil
end

---------------------------------------------------------------------------

function CMapEncounter_BossBase:GetKillTauntLine(victim)
	return nil
end

---------------------------------------------------------------------------

function CMapEncounter_BossBase:GetAbilityUseLine( szAbilityName )
	return nil
end

---------------------------------------------------------------------------

function CMapEncounter_BossBase:BossSpeak( szSoundEvent, bLaugh )
	if szSoundEvent == nil then
	--print( "CMapEncounter_BossBase:BossSpeak - szSoundEvent is nil! This might be ok if the boss doesn't have a response for this." )
		return
	end

	local flNow = GameRules:GetGameTime() 
	if flNow > self.flBossSpeechCooldown then
		self.flBossSpeechCooldown = GameRules:GetGameTime() + BOSS_SPEECH_COOLDOWN
		EmitGlobalSound( szSoundEvent )
	end
end

---------------------------------------------------------
-- dota_non_player_begin_cast
-- * abilityname
-- * caster_entindex
---------------------------------------------------------
function CMapEncounter_BossBase:OnNonPlayerBeginCast( event )
	local hCaster = nil
	if event.caster_entindex ~= nil and event.abilityname ~= nil then
		hCaster = EntIndexToHScript( event.caster_entindex )
		if hCaster ~= nil and hCaster.bIsBoss then
			self:BossSpeak( self:GetAbilityUseLine( event.abilityname ) )
		end
	end
end


--------------------------------------------------------------------------------

return CMapEncounter_BossBase

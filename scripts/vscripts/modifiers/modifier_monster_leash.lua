LinkLuaModifier( "modifier_detect_invisible", "modifiers/modifier_detect_invisible", LUA_MODIFIER_MOTION_NONE )

modifier_monster_leash = class({})

--------------------------------------------------------------------------------

function modifier_monster_leash:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_monster_leash:IsPermanent()
	return true
end

--------------------------------------------------------------------------------

function modifier_monster_leash:OnCreated( kv )
	if IsServer() then
		self.flKillStartTime = -1
		self.bAddedGem = false
		self.nForcedReturns = 0
		self.nMaxReturns = 3
		
		self.bProvideVision = false
		self.fProvideVisionTime = TIME_BEFORE_PROVIDE_VISION

		self:StartIntervalThink( 0.01 )
	end
end

-----------------------------------------------------------------------

function modifier_monster_leash:OnIntervalThink()
	local hParent = self:GetParent()

	local hEncounter = hParent.Encounter
	if hEncounter == nil then
		self:Destroy()
		return
	end

	if hParent:GetTeamNumber() ~= DOTA_TEAM_GOODGUYS then

		-- Check to see if we want to add a gem as counter-invisibility
		if self.bAddedGem == false and hParent:IsConsideredHero() and 
			hEncounter:HasStarted() == true and ( ( GameRules:GetGameTime() - hEncounter:GetStartTime() ) > TIME_BEFORE_DETECT_INVIS ) then
			self.bAddedGem = true
			hParent:AddNewModifier( hParent, nil, "modifier_detect_invisible", {} )
		end

		-- Provide vision if the room has gone on for too long - helps to protect against enemies getting lost or stuck
		if self.bProvideVision == false and
			hEncounter:HasStarted() == true and ( ( GameRules:GetGameTime() - hEncounter:GetStartTime() ) > self.fProvideVisionTime ) then

			self.bProvideVision = true
			hParent:AddNewModifier( thisEntity, nil, "modifier_provide_vision", { duration = -1 } )
		end

	end

	local vOrigin = hParent:GetAbsOrigin()
	local vClampedPos = hEncounter:GetRoom():ClampPointToRoomBounds( vOrigin, 128.0 )
	if vOrigin ~= vClampedPos then
		FindClearSpaceForUnit( hParent, vClampedPos, true )
	end

	if vOrigin.z > -1000 then
		self.flKillStartTime = -1
		return
	end

	if self.flKillStartTime < 0 then
		self.flKillStartTime = GameRules:GetGameTime()
	end

	--print ("killcountdown = ", self.killcountdown )
	-- only kill the unit if they are in a bad position for 3 seconds, 
	-- to make sure it's not a weird flying unit thing that is actually behaving legally.
	if ( GameRules:GetGameTime() - self.flKillStartTime ) >= 3 then
		--SendToServerConsole( "say *** KILLING ROGUE UNIT " .. hParent:GetUnitName() .. " at " .. tostring( vOrigin ) )

		-- If we cant move them back, just kill.
		if self.nForcedReturns >= self.nMaxReturns then
			hParent:ForceKill( false )
			return
		end

		if hParent:IsBoss() or hParent:IsConsideredHero() or hParent.bAbsoluteNoCC or hParent.bIsBoss then
			local vReturningPoint = GameRules.Aghanim:GetCurrentRoom():GetOrigin() + RandomVector( Script_RandomFloat( 0, 500 ) )
			hParent:SetOrigin(vReturningPoint)
			FindClearSpaceForUnit( hParent, vReturningPoint, true )
			self.nForcedReturns = self.nForcedReturns + 1
			self.flKillStartTime = -1 -- reset kill time
		else
			hParent:ForceKill( false )
		end
	end

end
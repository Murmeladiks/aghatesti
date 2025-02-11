-- This is the modifier that punishes players for not being in the active room
LinkLuaModifier("modifier_battle_royale_damage", "modifiers/modifier_battle_royale_damage", LUA_MODIFIER_MOTION_NONE)

modifier_battle_royale = class({})

--------------------------------------------------------------------------------

function modifier_battle_royale:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_battle_royale:IsPermanent()
	return true
end

--------------------------------------------------------------------------------

function modifier_battle_royale:RemoveOnDeath()
	return false
end

--------------------------------------------------------------------------------

function modifier_battle_royale:OnCreated(kv)
	if IsServer() then
		self.nDeepestDepth = 0
		self.hDeepestRoom = nil
		self.vLastValidPos = self:GetParent():GetAbsOrigin()
		self.flLastTimeInCurrentRoom = GameRules:GetGameTime()
		self:StartIntervalThink(0.01)
	end
end

--------------------------------------------------------------------------------

function modifier_battle_royale:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_TAKEDAMAGE
	}

	return funcs
end

-----------------------------------------------------------------------

function modifier_battle_royale:OnIntervalThink()
	local bIsRidingMorty = self:GetParent():FindModifierByName("modifier_snapfire_gobble_up_creep") ~= nil
	if bIsRidingMorty == true or self:GetParent():HasModifier("modifier_dummy") then
		return
	end

	-- Determine whether we have a valid position and valid room

	local bValidRoom = false
	local bValidFlyingPos = false
	local bValidPosition = IsUnitInValidPosition(self:GetParent())

	local nDepth = 0
	local vCurrentPos = self:GetParent():GetAbsOrigin()
	local vClampedValidFlyingPos = self.vLastValidPos
	local hRoom = GameRules.Aghanim:FindRoomForPoint(vCurrentPos)
	if hRoom ~= nil then
		nDepth = hRoom:GetDepth()

		-- Update the deepest we've ever been in the dungeon
		-- But don't allow people to skip ahead to unselected rooms
		local hCurrentRoom = GameRules.Aghanim:GetCurrentRoom()
		if nDepth > self.nDeepestDepth then
			if
				(hCurrentRoom == hRoom) or (hCurrentRoom:GetExitRoomSelected() == hRoom:GetName()) or
					(GameRules.Aghanim:GetTestEncounterDebugRoom() == hRoom)
			 then
				if bValidPosition then
					self.nDeepestDepth = nDepth
					self.hDeepestRoom = hRoom
				end

				-- Ok, they advanced rooms. We can stop punishment.
				if self:GetParent():FindModifierByName("modifier_battle_royale_damage") ~= nil then
					self:GetParent():RemoveModifierByName("modifier_battle_royale_damage")
				end
			end
		end

		if hCurrentRoom == hRoom then
			self.flLastTimeInCurrentRoom = GameRules:GetGameTime()
		end

		bValidRoom = (nDepth == self.nDeepestDepth)

		vClampedValidFlyingPos = vCurrentPos
		if
			bValidPosition == false or bValidRoom == false and hCurrentRoom ~= "encounter_starting_room" and hCurrentRoom ~= nil
		 then
			local flBoundary = 192.0
			if bValidPosition == true then
				flBoundary = 4.0
			end
			if self.hDeepestRoom then
				vClampedValidFlyingPos = self.hDeepestRoom:ClampPointToRoomBounds(vCurrentPos, flBoundary)
			end
		end
	end

	if
		(GameRules:GetGameTime() - self.flLastTimeInCurrentRoom) > 8.0 and self:GetParent():IsSummoned() == false and
			not self:GetParent():HasModifier("modifier_hero_select") and
			self:GetParent():GetUnitName() ~= "npc_dota_hero_wisp" and
			not self:GetParent():HasModifier("modifier_dummy")
	 then
		GameRules.Aghanim:GetAnnouncer():OnLaggingHero(
			self:GetParent():GetUnitName(),
			GameRules.Aghanim:GetCurrentRoom():GetDepth()
		)
	end

	if bValidRoom == true and bValidPosition == true then
		self.vLastValidPos = vCurrentPos
	end

	local bIsMotionControlled = self:GetParent():IsCurrentlyHorizontalMotionControlled() or self:GetParent():IsCurrentlyVerticalMotionControlled()

	if self:GetParent():HasFlyMovementCapability() == false and bIsMotionControlled == false then
		if bValidRoom == false or bValidPosition == false then
			--print( "Teleporting to " .. tostring( self.vLastValidPos ) )
			FindClearSpaceForUnit(self:GetParent(), self.vLastValidPos, true)
		end
	else
		if bValidRoom == false or vCurrentPos ~= vClampedValidFlyingPos then
			--print( "Flying Teleporting to " .. tostring( vClampedValidFlyingPos ) )
			FindClearSpaceForUnit(self:GetParent(), vClampedValidFlyingPos, true)
		end
	end
end

-----------------------------------------------------------------------

function modifier_battle_royale:OnTakeDamage(params)
	if not IsServer() then
		return
	end
	local parent = self:GetParent()

	if not parent or parent:IsNull() then
		return
	end
	if not params.attacker or params.attacker:IsNull() then
		return
	end

	parent = PlayerResource:GetSelectedHeroEntity(parent:GetPlayerOwnerID())
	if not parent or parent:IsNull() then
		return
	end

	if params.attacker.GetPlayerOwnerID and params.attacker:GetPlayerOwnerID() ~= parent:GetPlayerOwnerID() then
		return
	end

	local hUnit = params.unit
	if hUnit == nil or hUnit.Encounter == nil then
		return
	end

	local bIsMotionControlled = parent:IsCurrentlyHorizontalMotionControlled() 
		or parent:IsCurrentlyVerticalMotionControlled()
		or parent:HasModifier("modifier_phoenix_icarus_dive_dash_dummy_pf")

	local nUnitDepth = hUnit.Encounter:GetRoom():GetDepth()
	local point_room = GameRules.Aghanim:FindRoomForPoint(parent:GetAbsOrigin())
	if bIsMotionControlled or not point_room or nUnitDepth <= point_room:GetDepth() then
		return
	end

	-- They are attacking a unit at the wrong depth. PUNISH THEM
	if parent:FindModifierByName("modifier_battle_royale_damage") == nil then
		parent:AddNewModifier(parent, nil, "modifier_battle_royale_damage", {})
		if parent:GetPlayerOwner() ~= nil then
			CustomGameEventManager:Send_ServerToPlayer(parent:GetPlayerOwner(), "battle_royale_damage_starting", {})
			GameRules.Aghanim:GetAnnouncer():OnCowardlyHero(parent:GetUnitName(), self:GetCaster():GetUnitName())
		end
	end
end

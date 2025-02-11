require("common/chat_wheel/chat_wheel_consts")

------------------------------------------------------------------------------------------------

if ChatWheel == nil then ChatWheel = class({}) end

------------------------------------------------------------------------------------------------

function ChatWheel:Start()
    if self.bStarted then return end
    
    self.bStarted = true
    self.tVOLimiter = {}

    self.tEarlyAccessPlayers = {
        ["76561199445281049"] = true,
        ["76561198052428500"] = true
    }
    
    CustomGameEventManager:RegisterListener("ChatWheel:RequestVoiceLinePacks", Dynamic_Wrap(self, 'VoiceLinesRequested'))
    CustomGameEventManager:RegisterListener("ChatWheel:UpdateVoiceLines", Dynamic_Wrap(self, 'UpdateVoiceLines'))
    CustomGameEventManager:RegisterListener("ChatWheel:RequestPlayerAccessStatus", Dynamic_Wrap(self, 'SendPlayerAccessStatus'))
	CustomGameEventManager:RegisterListener("SelectVoiceLine", Dynamic_Wrap(self, 'SelectVoiceLine'))
end

------------------------------------------------------------------------------------------------

function ChatWheel:VoiceLinesRequested(event)
    local player_id = event.PlayerID

    local data = {}

    for _, LINES in pairs(ALL_VOICE_LINES) do
        table.insert(data, LINES)
    end

    CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(player_id), "ChatWheel:SetupLines", {data = data})
end

------------------------------------------------------------------------------------------------

function ChatWheel:UpdateVoiceLines(event)
    local player_id = event.PlayerID

    if PlayerResource:IsValidPlayerID(player_id) and event.active_lines then
        CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(player_id), "ChatWheel:UpdateAllFavorites", {active_lines = event.active_lines})
    end
end

---------------------------------------------------------------------------------------------------

function ChatWheel:SelectVoiceLine(event)
	if ChatWheel:IsOnCooldown(event.PlayerID) or not event.id then
		return 0
	end

    local info

    for _, LINES in pairs(ALL_VOICE_LINES) do
        if LINES[event.id] then
            info = LINES[event.id]
            break
        end
    end

	if not info then return end

	info.player_id = event.PlayerID
	CustomGameEventManager:Send_ServerToAllClients("ChatWheel:EmitVoiceLine", info)
end

---------------------------------------------------------------------------------------------------

function ChatWheel:IsOnCooldown(nID)
	if IsInToolsMode() then
		return false
	end
	
	if self.tVOLimiter[nID] == nil then
        self.tVOLimiter[nID] = {
            [1] = -1,
            [2] = -1
        }
    elseif self.tVOLimiter[nID][1] > GameRules:GetGameTime() and self.tVOLimiter[nID][2] > GameRules:GetGameTime() then
    	local cd = self.tVOLimiter[nID][1] - GameRules:GetGameTime()

    	if cd > self.tVOLimiter[nID][2] - GameRules:GetGameTime() then
    		cd = self.tVOLimiter[nID][2] - GameRules:GetGameTime()
    	end

    	cd = tonumber(string.format("%.1f", cd))

    	EmitSoundOnClient("General.CastFail_AbilityInCooldown", PlayerResource:GetPlayer(nID))
        return true
    end

    if self.tVOLimiter[nID][1] == -1  or self.tVOLimiter[nID][1] < self.tVOLimiter[nID][2] then
        self.tVOLimiter[nID][1] = GameRules:GetGameTime() + 15
    else
        self.tVOLimiter[nID][2] = GameRules:GetGameTime() + 15
    end

    return false
end

---------------------------------------------------------------------------------------------------

function ChatWheel:SendPlayerAccessStatus(event)
    if not event or not event.PlayerID or PlayerResource:GetTeam(event.PlayerID) == TEAM_SPECTATOR then return end

    local bAllowedAccess = ChatWheel.tEarlyAccessPlayers[tostring(PlayerResource:GetSteamID(event.PlayerID))] == true

    CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(event.PlayerID), "ChatWheel:PlayerAccessStatus", {access = bAllowedAccess})
end

---------------------------------------------------------------------------------------------------

ChatWheel:Start()
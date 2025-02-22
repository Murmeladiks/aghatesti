WebApi = WebApi or {}
WebApi.player_settings = WebApi.player_settings or {}

local isTesting = false
for playerId = 0, 23 do
	WebApi.player_settings[playerId] = WebApi.player_settings[playerId] or {}
end
WebApi.matchId = IsInToolsMode() and RandomInt(-10000000, -1) or tonumber(tostring(GameRules:Script_GetMatchID()))

local serverHost = "https://errorserver.com"
local dedicatedServerKey = GetDedicatedServerKeyV2("1")

function WebApi:Send(path, data, onSuccess, onError, retryWhile)
	local request = CreateHTTPRequestScriptVM("POST", serverHost .. "/api/lua/" .. path)
	if isTesting then
		print("Request to " .. path)
		DeepPrintTable(data)
	end

	request:SetHTTPRequestHeaderValue("Dedicated-Server-Key", dedicatedServerKey)
	if data ~= nil then
		data.customGame = WebApi.custom_game
		request:SetHTTPRequestRawPostBody("application/json", json.encode(data))
	end

	request:Send(function(response)
		if response.StatusCode >= 200 and response.StatusCode < 300 then
			local data = json.decode(response.Body)
			if isTesting then
				print("Response from  " .. path .. ":")
				DeepPrintTable(data)
			end
			if onSuccess then
				onSuccess(data)
			end
		else
			local err = json.decode(response.Body)
			if type(err) ~= "table" then err = {} end

			if isTesting then
				print("Error from " .. path .. ": " .. response.StatusCode)
				if response.Body then
					local status, result = pcall(json.decode, response.Body)
					if status then
						DeepPrintTable(result)
					else
						print(response.Body)
					end
				end
			end

			local message = (response.StatusCode == 0 and "Could not establish connection to the server. Please try again later.") or err.title or "Unknown error."
			if err.traceId then
				message = message .. " Report it to the developer with this id: " .. err.traceId
			end
			
			err.message = message
			err.status_code = response.StatusCode

			if response.Body and type(response.Body) == "string" then
				err.body = response.Body
			end
			
			if retryWhile and retryWhile(err) then
				WebApi:Send(path, data, onSuccess, onError, retryWhile)
			elseif onError then
				onError(err)
			end
		end
	end)
end

local function retryTimes(times)
	return function()
		times = times - 1
		return times >= 0
	end
end

function WebApi:BeforeMatch()
	-- TODO: Smart random Init, patreon init, nettables init
	publicStats = {}
	local players = {}
	for playerId = 0, 23 do
		if PlayerResource:IsValidPlayerID(playerId) then
			table.insert(players, tostring(PlayerResource:GetSteamID(playerId)))
			Tipping:SetTipsLeftForPlayer(playerId, 10)
			Tipping:SetTipsUsedForPlayer(playerId, 0)

			publicStats[playerId] = {
				averageKills = 0,
				averageDeaths = 0,
				averageAssists = 0,
				wins = 0,
				loses = 0,
				rating = 0,
			}
		end
	end

	print("BEFORE MATCH")
	--DeepPrintTable(data)
	WebApi.player_ratings = {}
	WebApi.playerMatchesCount = {}


	CustomNetTables:SetTableValue("game_state", "player_stats", publicStats)
	--CustomNetTables:SetTableValue("game_state", "player_ratings", data.mapPlayersRating)
	--CustomNetTables:SetTableValue("game_state", "leaderboard", data.leaderboard)

	--Battlepass:OnDataArrival()
end

WebApi.scheduledUpdateSettingsPlayers = WebApi.scheduledUpdateSettingsPlayers or {}
function WebApi:ScheduleUpdateSettings(playerId)
	WebApi.scheduledUpdateSettingsPlayers[playerId] = true

	if WebApi.updateSettingsTimer then Timers:RemoveTimer(WebApi.updateSettingsTimer) end
	WebApi.updateSettingsTimer = Timers:CreateTimer(10, function()
		WebApi.updateSettingsTimer = nil
		WebApi:ForceSaveSettings()
		WebApi.scheduledUpdateSettingsPlayers = {}
	end)
end

function WebApi:ForceSaveSettings(_playerId)
	local players = {}
	for playerId = 0, 23 do
		if PlayerResource:IsValidPlayerID(playerId) and (WebApi.scheduledUpdateSettingsPlayers[playerId] or _playerId == playerId) then
			local settings = WebApi.player_settings[playerId]
			if next(settings) ~= nil then
				local steamId = tostring(PlayerResource:GetSteamID(playerId))
				table.insert(players, { steamId = steamId, settings = settings })
			end
		end
	end
	WebApi:Send("match/update-settings", { players = players })
end

function WebApi:AfterMatch(signoutTable, bWonGame)
	if not isTesting then
		if GameRules:IsCheatMode() then return end
		if GameRules:GetDOTATime(false, true) < 60 then return end
	end
	
	local depth = CustomNetTables:GetTableValue( "reward_choices", "current_depth")
	depth = depth and depth["1"]
	
	local requestBody = {
		mapName = GetMapName(),
		customGame = WebApi.custom_game,
		matchId = isTesting and RandomInt(1, 10000000) or tonumber(tostring(GameRules:Script_GetMatchID())),
		duration = math.floor(GameRules:GetDOTATime(false, true)),
		wonGame = bWonGame,
		depth = depth or 0,
		players = {},
		rooms = {},
		votes = HeroVoting:GetVotesData(),
	}

	local clear_tags_for_upgrades = {
		"aghsfort_special_",
		"pathfinder_",
	}
	
	for n = 1, PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS) do
		local playerId = PlayerResource:GetNthPlayerIDOnTeam(DOTA_TEAM_GOODGUYS, n)
		if PlayerResource:IsValidTeamPlayerID(playerId) and not PlayerResource:IsFakeClient(playerId) then
			local upgrades = {}
			local hero = PlayerResource:GetSelectedHeroEntity(playerId)
			for _,upgrade in pairs(SPECIAL_ABILITY_UPGRADES[hero:GetUnitName()]) do
				if hero:HasAbility(upgrade) then
					for _, tag in pairs(clear_tags_for_upgrades) do
						upgrade = upgrade:gsub(tag, "")
					end
					table.insert(upgrades, upgrade)
				end
			end

			local items = {}
			for slot = 0, 8 do
				local item = hero:GetItemInSlot(slot)
				if item then
					table.insert(items, item:GetAbilityName())
				end
			end
			local neutral_item = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_ACTIVE_SLOT )
			if neutral_item then
				table.insert(items, neutral_item:GetAbilityName())
			end
			
			local player_data = {
				steamId = tostring(PlayerResource:GetSteamID(playerId)),
				heroName = PlayerResource:GetSelectedHeroName(playerId):gsub("npc_dota_hero_", ""),
				deaths = PlayerResource:GetDeaths(playerId),
				damageTaken = PlayerResource:GetHeroDamageTaken(playerId, true) + PlayerResource:GetCreepDamageTaken(playerId, true),
				damageDealt = PlayerResource:GetRawPlayerDamage(0),
				upgrades = upgrades,
				items = items,
			}
			table.insert(requestBody.players, player_data)
		end
	end
	
	local depth_list = signoutTable.team_depth_list
	for num, depth in pairs(depth_list) do
		local room_info = {
			unpickedName = "",
			unpickedElite = false,
		}
		room_info["pickedName"] = depth["selected_encounter"]
		room_info["pickedElite"] = depth["selected_elite"]

		if depth["unselected_encounter"] then
			room_info["unpickedName"] = depth["unselected_encounter"]
		end

		if depth["unselected_elite"] then
			room_info["unpickedElite"] = depth["unselected_elite"]
		end

		room_info["modifiers"] = {}

		if depth["ascension_abilities"] then
			for mod,_ in pairs(depth["ascension_abilities"]) do
				table.insert(room_info["modifiers"], mod)
			end
		end

		room_info["livesLost"] = 0
		for nPlayerID = 0, AGHANIM_PLAYERS - 1 do
			if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS then
				if PlayerResource:IsValidPlayerID( nPlayerID ) then
					local room_table = signoutTable.player_list[nPlayerID].depth_list[tostring(num)]
					if room_table and room_table["death_count"] then
						room_info["livesLost"] = room_info["livesLost"] + room_table["death_count"]
					end
				end
			end
		end
		table.insert(requestBody.rooms, room_info)
	end
	
	if isTesting or #requestBody.players >= 1 then
		print("Sending aftermatch request: ", #requestBody.players)
		WebApi:Send(
			"match/after",
			requestBody,
			function(resp)
				print("Successfull after match")
			end,
			function(e)
				print("Error after match: ", e)
			end
		)
	else
		print("Aftermatch send failed: ", #requestBody.players)
	end
end

RegisterGameEventListener("player_connect_full", function()
	print("LOADED WEBAPI")
	if WebApi.firstPlayerLoaded then return end
	WebApi.firstPlayerLoaded = true
	WebApi:BeforeMatch()
end)

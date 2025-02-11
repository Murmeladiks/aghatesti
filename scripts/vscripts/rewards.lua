require("constants")
require("gameplay_shared")
require("map_room")
require("reward_tables")
require("utility_functions")
require("ai/shared")
require("aghanim_ability_upgrade_interface")

function GetMinMaxGoldChoiceReward(nRoomDepth, bElite)
	local nFixedGoldAwardOfDepth = ENCOUNTER_DEPTH_GOLD_REWARD[nRoomDepth]
	if bElite then
		--print( "Elite Room, increasing expected value of item reward " .. nFixedGoldAwardOfDepth .. " to " .. nFixedGoldAwardOfDepth * ELITE_VALUE_MODIFIER )
		nFixedGoldAwardOfDepth = nFixedGoldAwardOfDepth * ELITE_VALUE_MODIFIER
	end
	local nMaxValue = math.ceil(nFixedGoldAwardOfDepth * GOLD_REWARD_CHOICE_MAX_PCT)
	local nMinValue = math.floor(nFixedGoldAwardOfDepth * GOLD_REWARD_CHOICE_MIN_PCT)
	return nMinValue, nMaxValue
end

function GetPricedNeutralItems(nRoomDepth, bElite)
	local vecItemRewards = PRICED_ITEM_REWARD_LIST
	local nFixedGoldAwardOfDepth = ENCOUNTER_DEPTH_GOLD_REWARD[nRoomDepth]
	if bElite then
		--print( "Elite Room, increasing expected value of item reward " .. nFixedGoldAwardOfDepth .. " to " .. nFixedGoldAwardOfDepth * ELITE_NEUTRAL_ITEM_VALUE_MODIFIER )
		nFixedGoldAwardOfDepth = nFixedGoldAwardOfDepth * ELITE_NEUTRAL_ITEM_VALUE_MODIFIER
	end
	local flBonusPct = PRICED_ITEM_BONUS_DEPTH_PCT * nRoomDepth
	local nMaxValue = math.ceil(nFixedGoldAwardOfDepth * (PRICED_ITEM_GOLD_MAX_PCT + flBonusPct))
	local nMinValue = math.floor(nFixedGoldAwardOfDepth * (PRICED_ITEM_GOLD_MIN_PCT + flBonusPct))
	local vecPossibleItems = {}

	for szItemName, nValue in pairs(vecItemRewards) do
		if nValue >= nMinValue and nValue <= nMaxValue then
			table.insert(vecPossibleItems, szItemName)
		end
	end

	return vecPossibleItems
end

function GetRandomUnique(hRandomStream, Array, BlacklistValues)
	if Array == nil then
		return nil
	end

	--PrintTable( Array, "Array:" )
	--PrintTable( BlacklistValues, "BlacklistValues:" )

	local Whitelist = {}
	if BlacklistValues == nil then
		Whitelist = Array
	else
		for _, Value in pairs(Array) do
			if not TableContainsValue(BlacklistValues, Value) then
				table.insert(Whitelist, Value)
			end
		end
	end

	local bIgnoreBlacklist = false
	if #Whitelist < 1 then
		bIgnoreBlacklist = true
		Whitelist = Array
	end

	local Candidate = nil
	nIndex = hRandomStream:RandomInt(1, #Whitelist)
	Candidate = Whitelist[nIndex]

	if bIgnoreBlacklist then
		printf("WARNING: GetRandomUnique returning array[%d] = %s, ignoring blacklist.", nIndex, Candidate)
	end

	return Candidate
end

function GetRoomRewards(nRoomDepth, nRoomType, bElite, nPlayerID, vecExternalExcludeList)
	local vecRewardStruct = nil

	local hPlayerHero = PlayerResource:GetSelectedHeroEntity(nPlayerID)

	if hPlayerHero == nil then
		printf("GetRoomRewards; Aborting, no hero entity for Player %d", nPlayerID)
		return nil
	end

	if (vecExternalExcludeList == nil) then
		vecExternalExcludeList = {}
	end

	local bLimitUltimateUpgrades = tonumber(nRoomDepth) == 1

	local szHeroName = hPlayerHero:GetName()
	local bHardRoom = bElite --or nRoomType == ROOM_TYPE_TRAPS

	-- Rarity:
	-- Common = 0
	-- Rare = 1
	-- Epic = 2
	local iRewardRarity = 0

	if bHardRoom == true then
		iRewardRarity = 1
	end

	vecRewardStruct = ROOM_REWARDS["depth_" .. nRoomDepth].normal

	local hHeroRandomStream = GameRules.Aghanim:GetHeroRandomStream(nPlayerID)

	-- first, choose the appropriate reward tier for each option
	local vecGeneratedRewardTiers = {}

	for _, aRewardDef in pairs(vecRewardStruct) do
		local flRoll = hHeroRandomStream:RandomFloat(0, 100.0)
		local flThreshold = 0.0

		for eRewardTier, flPct in pairs(aRewardDef) do
			flThreshold = flThreshold + flPct
			if flRoll <= flThreshold then
				table.insert(vecGeneratedRewardTiers, eRewardTier)
				break
			end
		end
	end

	if TableLength(vecGeneratedRewardTiers) < 1 then
		return nil
	end

	-- shuffle the chosen reward tiers so that progressive probabilities are randomized
	ShuffleListInPlace(vecGeneratedRewardTiers, hHeroRandomStream)

	-- exclude any item or ability they've learned, chosen, have in inventory or are externally marked for exclusion
	local vecAbilitiesToExclude = GetPlayerAbilitiesAndItems(nPlayerID)
	for ii = 1, nRoomDepth - 1 do
		local RewardChoices = CustomNetTables:GetTableValue("reward_choices", tostring(ii))
		local RewardChoice = RewardChoices and RewardChoices[tostring(nPlayerID)] or nil
		if
			RewardChoice and RewardChoice["ability_name"] and RewardChoice["reward_type"] ~= "REWARD_TYPE_MINOR_ABILITY_UPGRADE" and
				RewardChoice["reward_type"] ~= "REWARD_TYPE_MINOR_STATS_UPGRADE"
		 then
			table.insert(vecAbilitiesToExclude, RewardChoice["ability_name"])
		end
	end

	for _, ExcludeAbility in pairs(vecExternalExcludeList) do
		table.insert(vecAbilitiesToExclude, ExcludeAbility)
	end

	local MinorUpgrades = deepcopy(MINOR_ABILITY_UPGRADES[szHeroName])
	local MinorStatsUpgrades = deepcopy(MINOR_ABILITY_UPGRADES["base_stats_upgrades"])
	--DeepPrintTable(MinorUpgrades)
	local tMarkedForDeletion = {}
	for _, upgrade in pairs(MinorUpgrades) do
		local szUpgradeName = upgrade["description"]
		--print("Looping on " .. szUpgradeName)
		if MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName] and MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName] then
			if hPlayerHero:GetHeroFacetID() == MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName]["RequiredFacetID"] then
				--DeepPrintTable(MinorUpgrades[_])
				local nID = upgrade["id"]
				MinorUpgrades[_] = MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName]["ReplacedMinor"]
				MinorUpgrades[_]["id"] = nID
			end
		end

		if upgrade.facet_changes ~= nil then 
			if hPlayerHero:GetHeroFacetID() == upgrade.facet_changes["facet_id"] and not upgrade.facet_changes["bAlreadyChanged"] then
				upgrade.facet_changes["bAlreadyChanged"] = true
				upgrade.value = upgrade.value * upgrade.facet_changes["value_mult"]
			end
		end

		if upgrade["required_facet"] ~= nil and hPlayerHero:GetHeroFacetID() ~= upgrade["required_facet"] then
			table.insert(tMarkedForDeletion, _)
		end
	end

	--print("*************************")
	--DeepPrintTable(tMarkedForDeletion)
	for i = #tMarkedForDeletion, 1, -1 do
		local id = tMarkedForDeletion[i]
		--print("DELETING FACET BASED UPGRADE : ")
		--DeepPrintTable(MinorUpgrades[id])
		table.remove(MinorUpgrades, id)
	end

	for nStatUpgrade = #MinorStatsUpgrades, 1, -1 do
		local Upgrade = MinorStatsUpgrades[nStatUpgrade]
		if STAT_UPGRADE_EXCLUDES[szHeroName] then
			for k, v in pairs(STAT_UPGRADE_EXCLUDES[szHeroName]) do
				if Upgrade["description"] == v then
				--print("blacklisting stat upgrade " .. v .. " for hero " .. szHeroName)
					table.remove(MinorStatsUpgrades, nStatUpgrade)
					break
				end
			end
		end
	end

	-- then for each option, roll a reward type, and don't repeat types
	local vecGeneratedRewards = {}
	local vecMinorAbilityIDsToExclude = {}
	for _, eRewardTier in pairs(vecGeneratedRewardTiers) do
		local eGeneratedRewardType = nil

		local aRewardTierDef = RebalanceRewards(REWARD_TIER_TABLE[eRewardTier], vecGeneratedRewards)

		local flRoll = hHeroRandomStream:RandomFloat(0, 100.0)
		local flThreshold = 0.0
		local MinorAbilityUpgrade = nil
		local MinorStatsUpgrade = nil

		for eRewardType, flPct in pairs(aRewardTierDef) do
			flThreshold = flThreshold + flPct
			if flRoll <= flThreshold then
				local szAbilityName = nil
				local nQuantity = nil

				if eRewardType == "REWARD_TYPE_ABILITY_UPGRADE" then
					szAbilityName = GetRandomUnique(hHeroRandomStream, SPECIAL_ABILITY_UPGRADES[szHeroName], vecAbilitiesToExclude)
					if SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName] and SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szAbilityName] then
						if hPlayerHero:GetHeroFacetID() == SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szAbilityName]["RequiredFacetID"] then
							szAbilityName = SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szAbilityName]["ReplacedSpecial"]
						end
					end
					iRewardRarity = 2
				elseif eRewardType == "REWARD_TYPE_MINOR_ABILITY_UPGRADE" then
					--table.insert( vecMinorAbilityIDsToExclude, MinorAbilityUpgrade[ "id" ] )
					local k = hHeroRandomStream:RandomInt(1, #MinorUpgrades)
					local Upgrade = MinorUpgrades[k]
					table.remove(MinorUpgrades, k)
					MinorAbilityUpgrade = deepcopy(Upgrade)
					if bHardRoom then
						--[[print(
							"Elite Room, increasing expected value of ability upgrade from " ..
								MinorAbilityUpgrade["value"] .. " to " .. MinorAbilityUpgrade["value"] * ELITE_VALUE_MODIFIER
						)]]
						if MinorAbilityUpgrade[ "special_values" ] == nil then 
							MinorAbilityUpgrade[ "value" ] = MinorAbilityUpgrade[ "value" ] * ELITE_VALUE_MODIFIER
						else
							for _,SpecialValue in pairs ( MinorAbilityUpgrade[ "special_values" ] ) do
								SpecialValue[ "value" ] = SpecialValue[ "value" ] * ELITE_VALUE_MODIFIER
							end
						end

						--MinorAbilityUpgrade["value"] = MinorAbilityUpgrade["value"] * ELITE_VALUE_MODIFIER
					end
				elseif eRewardType == "REWARD_TYPE_MINOR_STATS_UPGRADE" then
					local k = hHeroRandomStream:RandomInt(1, #MinorStatsUpgrades)
					local StatsUpgrade = MinorStatsUpgrades[k]
					table.remove(MinorStatsUpgrades, k)
					MinorStatsUpgrade = deepcopy(StatsUpgrade)
					if bHardRoom then
						--[[print(
							"Elite Room, increasing expected value of stats upgrade from " ..
								MinorStatsUpgrade["value"] .. " to " .. MinorStatsUpgrade["value"] * ELITE_VALUE_MODIFIER
						)]]
						MinorStatsUpgrade["value"] = MinorStatsUpgrade["value"] * ELITE_VALUE_MODIFIER
					end
				end

				if szAbilityName ~= nil then
					if bLimitUltimateUpgrades and szAbilityName and string.match(szAbilityName, ULTIMATE_ABILITY_NAMES[szHeroName]) then
						for _key, szAbilityUpgrade in pairs(SPECIAL_ABILITY_UPGRADES[szHeroName]) do
							if string.match(szAbilityUpgrade, ULTIMATE_ABILITY_NAMES[szHeroName]) then
								if SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName] and SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szAbilityName] then
									if hPlayerHero:GetHeroFacetID() == SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szAbilityUpgrade]["RequiredFacetID"] then
										szAbilityUpgrade = SPECIAL_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szAbilityUpgrade]["ReplacedSpecial"]
									end
								end
								table.insert(vecAbilitiesToExclude, szAbilityUpgrade)
							end
						end
					end

					table.insert(vecAbilitiesToExclude, szAbilityName)
				end

				local GeneratedReward = {
					reward_type = eRewardType,
					reward_tier = eRewardTier,
					ability_name = szAbilityName,
					quantity = nQuantity,
					rarity = iRewardRarity
				}

				if bHardRoom then
					GeneratedReward["elite"] = 1
				else
					GeneratedReward["elite"] = 0
				end

				if MinorAbilityUpgrade ~= nil then
					GeneratedReward["ability_name"] = MinorAbilityUpgrade["ability_name"]
					GeneratedReward["description"] = MinorAbilityUpgrade["description"]
					GeneratedReward["value"] = MinorAbilityUpgrade["value"]
					GeneratedReward[ "special_values" ] = MinorAbilityUpgrade [ "special_values" ]
					if MinorAbilityUpgrade [ "ability_image" ] then
						GeneratedReward["ability_image"] = MinorAbilityUpgrade["ability_image"]
					end
					if GeneratedReward[ "special_values" ] then 
						local nValue = 1
						for _,SpecialValue in pairs ( GeneratedReward[ "special_values" ] ) do
							GeneratedReward[ "value" .. tostring( nValue ) ] = tonumber( SpecialValue[ "value" ] )
							nValue = nValue + 1
						end
					end

					GeneratedReward["id"] = MinorAbilityUpgrade["id"]
				end

				if MinorStatsUpgrade ~= nil then
					GeneratedReward["ability_name"] = MinorStatsUpgrade["ability_name"]
					GeneratedReward["description"] = MinorStatsUpgrade["description"]
					GeneratedReward["value"] = MinorStatsUpgrade["value"]
					GeneratedReward["id"] = MinorStatsUpgrade["id"]
				end

				table.insert(vecGeneratedRewards, GeneratedReward)
				break
			end
		end

		table.insert(vecGeneratedRewards, GeneratedReward)
	end

	vecGeneratedRewards["drawID"] = DoUniqueString("RewardsDraw")

	return vecGeneratedRewards
end

function TestRoomRewardConsoleCommand(cmdName, szRoomDepth, szIsElite, szIsTrapRoom)
	--CustomNetTables:SetTableValue( "reward_options", "current_depth", { szRoomDepth } );

	local bIsElite = (szIsElite == "true")
	local bIsTrapRoom = (szIsTrapRoom == "true")
	local szRoomDepth = tostring(tonumber(szRoomDepth))
	local nPlayerID = Entities:GetLocalPlayer():GetPlayerID()
	local nRoomType = ROOM_TYPE_ENEMY
	if bIsTrapRoom == true then
		nRoomType = ROOM_TYPE_TRAPS
	end

	--printf( "Running %s %d %s %s %s...", cmdName, nPlayerID, szRoomDepth, szIsElite, szIsTrapRoom )

	CustomNetTables:SetTableValue("reward_options", "current_depth", {szRoomDepth})

	CustomNetTables:SetTableValue("reward_choices", szRoomDepth, {})

	local RewardOptions = {}
	local vecPlayerRewards = GetRoomRewards(tonumber(szRoomDepth), nRoomType, bIsElite, nPlayerID)
	RewardOptions[tostring(nPlayerID)] = vecPlayerRewards

	--DeepPrintTable( vecPlayerRewards )

	CustomNetTables:SetTableValue("reward_options", szRoomDepth, RewardOptions)
end

function RebalanceRewards(aRewardDef, vecPreviouslyGeneratedRewards)
	local aRebalancedRewardDef = deepcopy(aRewardDef)
	NormalizeFloatArrayInPlace(aRebalancedRewardDef, 100.0)
	return aRebalancedRewardDef
end

function NormalizeFloatArrayInPlace(aFloatValues, flDesiredSum)
	if flDesiredSum == nil then
		flDesiredSum = 1.0
	end

	local flSum = 0
	for _, flFloatValue in pairs(aFloatValues) do
		flSum = flSum + flFloatValue
	end

	for key, flFloatValue in pairs(aFloatValues) do
		aFloatValues[key] = (aFloatValues[key] / flSum) * flDesiredSum
	end
end

function GrantRewards(nPlayerID, szRoomDepth, aReward)
	local hPlayerHero = PlayerResource:GetSelectedHeroEntity(nPlayerID)
	if hPlayerHero == nil then
		printf("Aborting grant reward, no hero entity for Player %d", nPlayerID)
		return
	end

	local RewardChoices = CustomNetTables:GetTableValue("reward_choices", szRoomDepth)
	if RewardChoices == nil then
		RewardChoices = {}
	end

	local aExistingReward = RewardChoices[tostring(nPlayerID)]
	if aExistingReward ~= nil then
		printf(
			"GrantRewards: Player %d, Depth %s, aborting granting Reward %s to to existing Reward: %s",
			nPlayerID,
			szRoomDepth,
			DeepToString(aReward),
			DeepToString(aExistingReward)
		)
		return
	end

	printf("granting reward to %s: %s", hPlayerHero:GetName(), DeepToString(aReward))

	local eRewardType = aReward["reward_type"]
	local nQuantity = aReward["quantity"]
	local szAbilityName = aReward["ability_name"]
	local bEliteReward = aReward["elite"] == 1

	--local eRewardTier = aReward["reward_tier"
	if eRewardType == "REWARD_TYPE_ABILITY_UPGRADE" then
		local data = {}
		data["PlayerID"] = nPlayerID
		data["AbilityName"] = szAbilityName
		data["LevelReward"] = true
		CAghanim:OnAbilityUpgradeButtonClicked(1, data)
		GameRules.Aghanim:GetAnnouncer():OnRewardSelected(hPlayerHero, tonumber(szRoomDepth), eRewardType, szAbilityName)
	elseif eRewardType == "REWARD_TYPE_MINOR_ABILITY_UPGRADE" then
		local szHeroName = hPlayerHero:GetUnitName()
		local Upgrade = deepcopy(MINOR_ABILITY_UPGRADES[szHeroName][aReward["id"]])
		local szUpgradeName = Upgrade["description"]
		if MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName] and MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName] then
			if hPlayerHero:GetHeroFacetID() == MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName]["RequiredFacetID"] then
				Upgrade = MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName]["ReplacedMinor"]
				Upgrade["id"] = aReward["id"]
			end
		end

		if bEliteReward then
			if Upgrade[ "special_values" ] == nil then 
				Upgrade[ "value" ] = Upgrade[ "value" ] * ELITE_VALUE_MODIFIER
			else
				for _,SpecialValue in pairs ( Upgrade[ "special_values" ] ) do
					SpecialValue[ "value" ] = SpecialValue[ "value" ] * ELITE_VALUE_MODIFIER
				end
			end
		end
		CAghanim:AddMinorAbilityUpgrade(hPlayerHero, Upgrade)
		GameRules.Aghanim:GetAnnouncer():OnRewardSelected(
			hPlayerHero,
			tonumber(szRoomDepth),
			eRewardType,
			Upgrade.description
		)
	elseif eRewardType == "REWARD_TYPE_MINOR_STATS_UPGRADE" then
		--Hook up via the same path as the minor ability upgrades
		local StatsUpgrade = deepcopy(MINOR_ABILITY_UPGRADES["base_stats_upgrades"][aReward["id"]])
		if bEliteReward then
			StatsUpgrade["value"] = StatsUpgrade["value"] * ELITE_VALUE_MODIFIER
		end
		--Make sure to grant and level up the stats ability if we haven't taken this reward yet
		CAghanim:AddMinorAbilityUpgrade(hPlayerHero, StatsUpgrade)
		CAghanim:VerifyStatsAbility(hPlayerHero, StatsUpgrade["ability_name"])
		GameRules.Aghanim:GetAnnouncer():OnRewardSelected(
			hPlayerHero,
			tonumber(szRoomDepth),
			eRewardType,
			StatsUpgrade.description
		)
	end

	RewardChoices[tostring(nPlayerID)] = aReward
	CustomNetTables:SetTableValue("reward_choices", szRoomDepth, RewardChoices)
	CustomNetTables:SetTableValue("reward_choices", "current_depth", {szRoomDepth})

	local gameEvent = {}
	if aReward["quantity"] then
		gameEvent["int_value"] = tonumber(aReward["quantity"])
	end
	if aReward["ability_name"] then
		if eRewardType == "REWARD_TYPE_MINOR_ABILITY_UPGRADE" or eRewardType == "REWARD_TYPE_MINOR_STATS_UPGRADE" then
			--PrintTable( aReward, " reward choice: " )
			gameEvent["string_replace_token"] = aReward["description"]
			gameEvent["ability_name"] = aReward["ability_name"]
			if aReward[ "value" ] then 
				gameEvent["value"] = tonumber(aReward[ "value" ])
			else	
				if aReward[ "special_values" ] then 
					local nValue = 1
					for _,SpecialValue in pairs ( aReward[ "special_values" ] ) do
						local szValueName = "value" .. tostring( nValue )
						gameEvent[ szValueName ] = tonumber( SpecialValue[ "value" ] )
						nValue = nValue + 1
					end
				end
			end
		else
			gameEvent["locstring_value"] = "#DOTA_Tooltip_Ability_" .. aReward["ability_name"]
		end
	end
	gameEvent["player_id"] = nPlayerID
	gameEvent["teamnumber"] = -1
	gameEvent["message"] = "#DOTA_HUD_" .. aReward["reward_type"] .. "_Toast"

	--DeepPrintTable( RewardChoices )
	FireGameEvent("dota_combat_event_message", gameEvent)
end

--------------------------------------------------------------------------------

function GenerateRewardStatsForPlayer(hPlayerHero, reward)
	local szAbilityName = nil
	local szAbilityTexture = nil

	if reward.reward_type == "REWARD_TYPE_ABILITY_UPGRADE" then
		szAbilityName = reward.ability_name
		szAbilityTexture = GetAbilityTextureNameForAbility(szAbilityName)
	elseif reward.reward_type == "REWARD_TYPE_MINOR_ABILITY_UPGRADE" then
		szAbilityName = MINOR_ABILITY_UPGRADES[hPlayerHero:GetUnitName()][reward.id].description
		szAbilityTexture = GetAbilityTextureNameForAbility(reward.ability_name)
	elseif reward.reward_type == "REWARD_TYPE_MINOR_STATS_UPGRADE" then
		szAbilityName = MINOR_ABILITY_UPGRADES["base_stats_upgrades"][reward.id].description
		szAbilityTexture = "attribute_bonus"
	end

	if szAbilityName == nil then
		return nil
	end

	local rewardStats = {
		ability_name = szAbilityName,
		rarity = reward.rarity -- 0 - normal, 1 - elite, 2 - boss
	}

	if reward.value ~= nil then
		rewardStats.value = reward.value
	end

	if reward.reward_type == "REWARD_TYPE_MINOR_ABILITY_UPGRADE" and MINOR_ABILITY_UPGRADES[ hPlayerHero:GetUnitName() ][ reward.id ].special_values ~= nil then
		local nIndex = 1
		for k,v in pairs( MINOR_ABILITY_UPGRADES[ hPlayerHero:GetUnitName() ][ reward.id ].special_values ) do
			rewardStats[ "value" .. nIndex ] = v.value
			nIndex = nIndex + 1
		end
	end

	if szAbilityTexture ~= nil then
		rewardStats.ability_texture = szAbilityTexture
	end

	return rewardStats
end

--------------------------------------------------------------------------------

function GenerateRewardStats(nPlayerID, szRoomDepth, roomOptions, szRewardIndex)
	local hHero = PlayerResource:GetSelectedHeroEntity(nPlayerID)
	local rewardStats = {
		selected_reward = GenerateRewardStatsForPlayer(hHero, roomOptions[szRewardIndex]),
		unselected_rewards = {}
	}

	for key, reward in pairs(roomOptions) do
		if key ~= szRewardIndex then
			table.insert(rewardStats.unselected_rewards, GenerateRewardStatsForPlayer(hHero, reward))
		end
	end

	GameRules.Aghanim:RegisterRewardStats(nPlayerID, szRoomDepth, rewardStats)
end

--------------------------------------------------------------------------------

function OnRewardReroll(eventSourceIndex, data)
	--DeepPrintTable(data)

	local player_id = data.PlayerID
	if not player_id then
		return
	end

	local player = PlayerResource:GetPlayer(player_id)
	if not player or player:IsNull() then
		return
	end

	local drawID = data.drawID -- unique id for each reward options

	local currentRoom = GameRules.Aghanim:GetCurrentRoom()
	local currentDepth = currentRoom:GetDepth()
	local isValidDrawID = false

	local rerollRoom = currentRoom 
	local rerollDepth = currentDepth

	local RewardOptions
	for depth = currentDepth, 0, -1 do
		RewardOptions = CustomNetTables:GetTableValue("reward_options", tostring(depth))
		if RewardOptions then
			local playerRewards = RewardOptions[tostring(player_id)]

			if (playerRewards and playerRewards.drawID == drawID) then
				isValidDrawID = true
				rerollRoom =  GameRules.Aghanim.selected_rooms[depth]
				rerollDepth = depth
				break
			end
		end
	end

	if not isValidDrawID then
		return
	end

	local rewardRarity = RewardOptions.rarity
	local rerollType = rewardRarity == "epic" and REROLL_LEGENDARY or REROLL_COMMON
	local rerollCost = GetRerollCost(player_id, rerollType)

	local item_data = {
		steamId = Battlepass:GetSteamId(player_id),
		items = {},
		totalPrice = rerollCost,
		without_inventory = true
	}
	
	if not rerollRoom then rerollRoom = currentRoom end
	
	if rerollRoom then
		rerollRoom:GetEncounter():RollRewardsForPlayers({player_id}, nil, true)
		IncrementRerollCount(player_id, rerollType)
		UpdateRerrolsCostForPlayer(player_id)
	end
end

function OnRerollPriceRequested(eventSourceIndex, data)
	local player_id = data.PlayerID
	if not player_id then
		return
	end

	UpdateRerrolsCostForPlayer(player_id)
end

--------------------------------------------------------------------------------

function OnRewardChoice(eventSourceIndex, data)
	local nPlayerID = data["PlayerID"]
	local szRoomDepth = tostring(data["room_depth"])
	local szRewardIndex = tostring(data["reward_index"])

	--printf("Processing reward choice for Player %d, %s", nPlayerID, DeepToString(data))

	local rewardOptions = CustomNetTables:GetTableValue("reward_options", szRoomDepth)
	if rewardOptions == nil then
		return
	end

	local roomOptions = rewardOptions[tostring(nPlayerID)]

	--printf("reward options data %d %s %s %s", nPlayerID, szRewardIndex, DeepToString(roomOptions.keys), DeepToString(roomOptions));

	local aReward = roomOptions[szRewardIndex]

	GrantRewards(nPlayerID, szRoomDepth, aReward)

	GenerateRewardStats(nPlayerID, szRoomDepth, roomOptions, szRewardIndex)
end

function IncrementRerollCount(player_id, rerollRarity)
	if not GameRules.Aghanim.rerolls then
		GameRules.Aghanim.rerolls = {}
	end
	if not GameRules.Aghanim.rerolls[player_id] then
		GameRules.Aghanim.rerolls[player_id] = {}
	end

	local playerRerolls = GameRules.Aghanim.rerolls[player_id]

	playerRerolls[rerollRarity] = playerRerolls[rerollRarity] and playerRerolls[rerollRarity] + 1 or 1
end

function DecrementLegendaryRerollsForAll()
	for nPlayerID = 0, DOTA_MAX_PLAYERS - 1 do
        if PlayerResource:IsValidPlayerID(nPlayerID) then
            DecrementRerollCount(nPlayerID, REROLL_LEGENDARY)
			UpdateRerrolsCostForPlayer(nPlayerID)
        end
    end
end

function DecrementRerollCount(player_id, rerollRarity)
	if not GameRules.Aghanim.rerolls then
		GameRules.Aghanim.rerolls = {}
	end
	if not GameRules.Aghanim.rerolls[player_id] then
		GameRules.Aghanim.rerolls[player_id] = {}
	end

	local playerRerolls = GameRules.Aghanim.rerolls[player_id]
	playerRerolls[rerollRarity] = playerRerolls[rerollRarity] and playerRerolls[rerollRarity] - 1 or -1
end

function GetRerollCount(player_id, rerollRarity)
	if not GameRules.Aghanim.rerolls then
		GameRules.Aghanim.rerolls = {}
	end
	if not GameRules.Aghanim.rerolls[player_id] then
		GameRules.Aghanim.rerolls[player_id] = {}
	end

	local playerRerolls = GameRules.Aghanim.rerolls[player_id]
	return playerRerolls[rerollRarity] or 0
end

function GetRerollCost(player_id, rerollRarity)
	local baseCost = REROLL_COST[rerollRarity]
	local count = GetRerollCount(player_id, rerollRarity)

	if rerollRarity == REROLL_COMMON then
		return (count >= 3) and 9999 or 0
	else
		return (count >= 1) and 9999 or 0
	end
end

function UpdateRerrolsCostForPlayer(player_id)
	local player = PlayerResource:GetPlayer(player_id)

	if not player then
		return
	end

	CustomGameEventManager:Send_ServerToPlayer(
		player,
		"reward_reroll:result",
		{
			[REROLL_COMMON] = GetRerollCost(player_id, REROLL_COMMON),
			[REROLL_LEGENDARY] = GetRerollCost(player_id, REROLL_LEGENDARY)
		}
	)
end

-- Manages player perks (ascension shards).

if PerkManager == nil then PerkManager = class({}) end

function PerkManager:Init()

	self.perk_list = {
		["mp_regen"] = true,
		["hp_regen"] = true,
		["move_speed"] = true,
		["agi_per_level"] = true,
		["str_per_level"] = true,
		["int_per_level"] = true,
		["all_stats_per_level"] = true,
		["health"] = true,
		["attack_range"] = true,
		["cast_range"] = true,
		["cooldown_reduction"] = true,
		["attack_damage"] = true,
		["attack_speed"] = true,
		["evasion"] = true,
		["armor"] = true,
		["magic_resist"] = true,
		["damage_resist"] = true,
		["lifesteal"] = true,
		["spell_lifesteal"] = true,
		["spell_amp"] = true,
		["status_resist"] = true,
		["heal_amp"] = true,
		--["spell_radius"] = true,			-- Needs mode-specific debugging
		--["neutral_item_stats"] = true,	-- Needs mode-specific debugging
	}

	-- Link perk modifiers
	for perk_name, _ in pairs(self.perk_list) do
	    LinkLuaModifier("modifier_player_perk_"..perk_name, "libraries/perk_manager/perks/modifier_player_perk_"..perk_name, LUA_MODIFIER_MOTION_NONE)
		-- TODO: delete this when dummies are removed
	    LinkLuaModifier("modifier_player_perk_"..perk_name.."_dummy", "libraries/perk_manager/perks/modifier_player_perk_"..perk_name, LUA_MODIFIER_MOTION_NONE)
	end

	-- Fetch perk values per level
	local perk_abilities_kv = LoadKeyValues("scripts/vscripts/libraries/perk_manager/perk_abilities.kv")

	self.perk_values = {}

	for perk_ability_name, data in pairs(perk_abilities_kv) do
		local perk_name = string.sub(perk_ability_name, 21)

		if data.AbilityValues.value then
			self.perk_values[perk_name] = {}

			local values_string = data.AbilityValues.value
			local next_space = string.find(values_string, "%s")

			while next_space do
				table.insert(self.perk_values[perk_name], tonumber(string.sub(values_string, 1, next_space)))

				values_string = string.sub(values_string, next_space + 1)

				next_space = string.find(values_string, "%s")
			end

			table.insert(self.perk_values[perk_name], tonumber(values_string))
		end
	end

	self.chosen_perks = {}

	self.perk_selection_started = false
	self.perks_locked = false

	-- Initalize nettable
	-- Uses "game" nettable, also shared by custom chat module
	CustomNetTables:SetTableValue("game", "player_perks_data", self.chosen_perks)

	-- Listen to perk selection requests
	CustomGameEventManager:RegisterListener("player_perk_selected", function(_, event)
		return PerkManager:PerkSelectionRequested(event)
	end)

	-- Register test commands
    --Convars:RegisterCommand("test_perk", function(...)
    --    return TestPlayerPerk(...)
    --end, "Usage: test_perk <perkName> <playerId>", FCVAR_CHEAT)
end

function TestPlayerPerk(command, perk_name, player_id)
	local event = {
		PlayerID = tonumber(player_id),
		perk = perk_name,
	}

	PerkManager:PerkSelectionRequested(event)
end

function PerkManager:InitPerksForPlayer(player_id)
	self.chosen_perks[player_id] = {}
end

-- Starts allowing players to select their perks
function PerkManager:StartAllowingPerkSelection()
	self.perk_selection_started = true

	self:UpdateSelectionState()
end

-- Lock player perks in, preventing players from repicking them
function PerkManager:StopAllowingPerkRepicking()
	self.perks_locked = true

	self:UpdateSelectionState() 
end

function PerkManager:UpdateSelectionState() 
	CustomNetTables:SetTableValue("game", "perks_selection_state", { 
		start = self.perk_selection_started, 
		locked = self.perks_locked
	})
end

-- Also triggers when a player reconnects
function PerkManager:ShowPerkSelectionForPlayer(player_id)
	if (not self.perk_selection_started) then return end

	if self.perks_locked and self.chosen_perks[player_id] and type(self.chosen_perks[player_id]) == "string" then return end

	local player = PlayerResource:GetPlayer(player_id)

	if (not player) then return end

	CustomGameEventManager:Send_ServerToPlayer(player, "show_perk_selection", {})
end

-- Validates a perk selection request event
-- Activates the appropriate perk if all conditions are valid
function PerkManager:PerkSelectionRequested(event)
	if (not event.PlayerID) or (not self.perk_list[event.perk]) then return end

	local player = PlayerResource:GetPlayer(event.PlayerID)

	if (not player) then return end

	self.chosen_perks[event.PlayerID] = event.perk
	CustomNetTables:SetTableValue("game", "player_perks_data", self.chosen_perks)

	self:UpdateAllPerkModifiers()
end

function PerkManager:UpdateAllPerkModifiers()
	local all_heroes = HeroList:GetAllHeroes()

	-- Clean up all current modifiers
	for _, hero in pairs(all_heroes) do
		for perk_name, _ in pairs(self.perk_list) do
			hero:RemoveModifierByName("modifier_player_perk_"..perk_name)
			-- TODO: delete this when dummies are removed
			hero:RemoveModifierByName("modifier_player_perk_"..perk_name.."_dummy")
		end
	end

	-- Apply self modifiers
	for player_id, chosen_perk in pairs(self.chosen_perks) do
		local main_hero = PlayerResource:GetSelectedHeroEntity(player_id)

		if main_hero and chosen_perk and type(chosen_perk) == "string" then
			local modifier_name = "modifier_player_perk_"..chosen_perk
			local perk_value = self.perk_values[chosen_perk][Supporters:GetLevel(player_id) + 1]
			local perk_modifier = main_hero:AddNewModifier(main_hero, nil, modifier_name, {})

			-- TODO: delete this when dummies are removed
			main_hero:AddNewModifier(main_hero, nil, modifier_name.."_dummy", {})

			if perk_modifier then
				perk_modifier:SetStackCount(perk_value)
				if perk_modifier.AfterInitialStackCount then perk_modifier:AfterInitialStackCount() end
			end
		end
	end

	-- Apply ally modifiers
	for player_id, chosen_perk in pairs(self.chosen_perks) do
		for _, ally in pairs(all_heroes) do
			if chosen_perk and type(chosen_perk) == "string" then
				local modifier_name = "modifier_player_perk_"..chosen_perk
				local perk_value = 0.5 * self.perk_values[chosen_perk][Supporters:GetLevel(player_id) + 1]
				local perk_modifier = ally:FindModifierByName(modifier_name)

				if perk_modifier and perk_modifier:GetStackCount() < perk_value then
					perk_modifier:SetStackCount(perk_value)
					if perk_modifier.AfterInitialStackCount then perk_modifier:AfterInitialStackCount() end
				end
				
				if (not perk_modifier) then
					perk_modifier = ally:AddNewModifier(ally, nil, modifier_name, {})
					-- TODO: delete this when dummies are removed
					ally:AddNewModifier(ally, nil, modifier_name.."_dummy", {})
					if perk_modifier then
						perk_modifier:SetStackCount(perk_value)
						if perk_modifier.AfterInitialStackCount then perk_modifier:AfterInitialStackCount() end
					end
				end
			end
		end
	end
end

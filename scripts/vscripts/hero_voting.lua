HeroVoting = HeroVoting or {}
local b_voting_stop = true

function HeroVoting:Init()
	if b_voting_stop then return end
	
	CustomGameEventManager:RegisterListener("hero_voting:vote",function(_, keys)
		self:PlayerVote(keys)
	end)
	CustomGameEventManager:RegisterListener("hero_voting:get_init_data",function(_, keys)
		self:GetInitData(keys)
	end)

	self.player_votes = {}	
	self.voted_hero = {}	
	self.herolist = LoadKeyValues("scripts/npc/herolist.txt")

	self.disabled_heroes = {
		str = {},
		agi = {},
		int = {},
	}
	local stats = {
		[DOTA_ATTRIBUTE_STRENGTH] = "str",
		[DOTA_ATTRIBUTE_AGILITY] = "agi",
		[DOTA_ATTRIBUTE_INTELLECT] = "int",
	}
	
	for hero_name, enabled in pairs(self.herolist) do
		if enabled == 0 then
			local attribute = GetUnitKV(hero_name, "AttributePrimary")
			local parsed_attribute = _G[attribute]
			if parsed_attribute and stats[parsed_attribute] then
				table.insert(self.disabled_heroes[stats[parsed_attribute]], hero_name)
			end
		end
	end
end

function HeroVoting:GetInitData(data)
	if b_voting_stop then return end

	local player_id = data.PlayerID
	if not player_id then return end
	
	CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(player_id), "hero_voting:create_hero_list", {
		heroes = self.disabled_heroes,
		voted_hero = self.voted_hero[player_id]
	})
end

function HeroVoting:PlayerVote(data)
	if b_voting_stop then return end

	local player_id = data.PlayerID
	if not player_id then return end
	
	local hero_name = data.hero_name
	if not hero_name or not self.herolist["npc_dota_hero_" .. hero_name] then return end

	self.player_votes[player_id] = hero_name
end

function HeroVoting:GetVotesData()
	if b_voting_stop then return end

	local result = {}
	for player_id, hero_name in pairs(self.player_votes) do
		local steam_id = Battlepass:GetSteamId(player_id)
		if steam_id then
			table.insert(result, {steamId = steam_id, heroName = hero_name})
		end
	end
	return result
end

function HeroVoting:SetVotedHero(player_id, hero_name)
	if b_voting_stop then return end
	if not self.voted_hero then return end

	self.voted_hero[player_id] = "npc_dota_hero_" .. hero_name
end

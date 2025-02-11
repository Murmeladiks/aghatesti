Tipping = Tipping or {}

TIP_CURRENCY_COUNT = 30 --Only visual, true value in server
TIP_COOLDOWN = 10
TIP_LIMIT_PER_GAME = 3

function Tipping:Init()
	self.tips_left = {}
	self.tips_used = {}
	self.block_tip = {}
	self.tips_current_game = {}

	CustomGameEventManager:RegisterListener("tipping:tip",function(_, keys)
		self:Tip(keys)
	end)
	CustomGameEventManager:RegisterListener("tipping:get_init_info",function(_, keys)
		self:UpdateInfoForPlayer(keys.PlayerID)
	end)
end

function Tipping:UpdateInfoForPlayer(player_id)
	if not player_id then return end

	local player = PlayerResource:GetPlayer(player_id)
	if not player or player:IsNull() then return end

	CustomGameEventManager:Send_ServerToPlayer(player, "tipping:send_init_info", {
		left = self:GetTipsLeftForPlayer(player_id),
		block = (self.block_tip[player_id] or self:IsGameLimitForPlayer(player_id)) and true or false,
	})
end

function Tipping:Tip(keys)
	local source_pid = keys.PlayerID
	if not source_pid or self.block_tip[source_pid] then return end
	if self:IsGameLimitForPlayer(source_pid) then return end

	local source_steam_id = Battlepass:GetSteamId(source_pid)
	if not source_steam_id then return end

	local target_pid = keys.target_pid
	if not target_pid or target_pid == source_pid then return end
	local target_steam_id = Battlepass:GetSteamId(target_pid)
	if not target_steam_id then return end

	if self:GetTipsLeftForPlayer(source_pid) <= 0 then return end

	self.block_tip[source_pid] = true

	local after_web_request = function()
		Timers:CreateTimer(TIP_COOLDOWN, function()
			self.block_tip[source_pid] = nil
			self:UpdateInfoForPlayer(source_pid)
		end)
	end

	WebApi:Send(
		"match/tip",
		{
			sourcePlayerSteamId = source_steam_id,
			targetPlayerSteamId = target_steam_id,
		},
		function(data)
			if data.source and data.source.remainingTips then
				self:SetTipsLeftForPlayer(source_pid, data.source.remainingTips)
			end
			if data.target and data.target.glory then
				BP_PlayerProgress:SetGlory(target_pid, data.target.glory)
				BP_Inventory:UpdateClientGloryForPlayer(target_pid)
			end
			CustomGameEventManager:Send_ServerToAllClients("tipping:create_notification", {
				source_id = source_pid,
				target_id = target_pid,
				currency_count = TIP_CURRENCY_COUNT,
			})
			self.tips_current_game[source_pid] = self.tips_current_game[source_pid] and self.tips_current_game[source_pid] + 1 or 1
			after_web_request()
		end,
		function(e)
			after_web_request()
		--print("error while tips: ", e)
		end
	)
end

function Tipping:SetTipsLeftForPlayer(player_id, tips_left) self.tips_left[player_id] = tips_left end
function Tipping:GetTipsLeftForPlayer(player_id) return self.tips_left[player_id] or 0 end

function Tipping:SetTipsUsedForPlayer(player_id, tips_used) self.tips_used[player_id] = tips_used end
function Tipping:GetTipUsedForPlayer(player_id) return self.tips_used[player_id] or 0 end

function Tipping:IsGameLimitForPlayer(player_id) return self.tips_current_game[player_id] and self.tips_current_game[player_id] >= TIP_LIMIT_PER_GAME end

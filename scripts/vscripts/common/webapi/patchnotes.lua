t_player_languages = {}

function _DateWeight(date)
	local dateInNumber = date:gsub("[-|:| ]", "")
	return tonumber(dateInNumber)
end

function _DateSorting(a, b)
	if _DateWeight(a["date"]) > _DateWeight(b["date"]) then
		return true
	end
	return false
end

function CAghanim:GetPatchNotesInfo(data)
	local player_id = data.PlayerID
	local language = t_player_languages[player_id]

	if not language then
		Timers:CreateTimer(1, function() CAghanim:GetPatchNotesInfo(data) end)
		return 
	end

	if language == "schinese" or  language == "tchinese" then
		language = "chinese"
	elseif language ~= "russian"then
		language = "english"
	end

	if not WebApi.patch_notes then
		Timers:CreateTimer(1, function() CAghanim:GetPatchNotesInfo(data) end)
		return
	end
	
	local sortedPatchNotes = {}
	for date, patchData in pairs(WebApi.patch_notes) do
		table.insert(sortedPatchNotes, {
			date = date,
			data = patchData[language] or patchData["english"],
		})
	end
	table.sort(sortedPatchNotes, _DateSorting)

	local player = PlayerResource:GetPlayer(player_id)
	if player then
		CustomGameEventManager:Send_ServerToPlayer(player, "patch_notes:create_patch_notes", sortedPatchNotes)
	end
end

RegisterCustomEventListener("setlanguage", function(data)
	local player_id = data.PlayerID
	if not player_id then return end
	local player = PlayerResource:GetPlayer(player_id)
	if not player or player:IsNull() then return end
	t_player_languages[player_id] = data.language
end)

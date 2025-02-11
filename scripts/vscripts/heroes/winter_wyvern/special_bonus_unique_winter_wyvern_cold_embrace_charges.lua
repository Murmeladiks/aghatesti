special_bonus_unique_winter_wyvern_cold_embrace_charges = class({})

function special_bonus_unique_winter_wyvern_cold_embrace_charges:Spawn()
	if IsClient() then return end
	Timers:CreateTimer(0.07, function()
		local hEmbrace = self:GetCaster():FindAbilityByName("winter_wyvern_pf_cold_embrace")
		hEmbrace:RefreshCharges()
		hEmbrace:EndCooldown()
	end)
end

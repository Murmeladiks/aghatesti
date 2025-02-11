special_bonus_unique_magnataur_empower_charges = class({})

function special_bonus_unique_magnataur_empower_charges:Spawn()
	if IsClient() then return end
	Timers:CreateTimer(0.07, function()
		local hEmpower = self:GetCaster():FindAbilityByName("magnataur_pf_empower")
		hEmpower:RefreshCharges()
		hEmpower:EndCooldown()
	end)
end

special_bonus_unique_void_spirit_resonant_pulse_suppression = class({})

function special_bonus_unique_void_spirit_resonant_pulse_suppression:Spawn()
	if IsClient() then return end
	Timers:CreateTimer(0.07, function()
		local hPulse = self:GetCaster():FindAbilityByName("void_spirit_pf_resonant_pulse")
		hPulse:RefreshCharges()
		hPulse:EndCooldown()
	end)
end

aghsfort_special_sniper_assassinate_concussive_dummy = class({})

function aghsfort_special_sniper_assassinate_concussive_dummy:Spawn()
	if IsClient() then return end
	self:GetCaster():FindAbilityByName("sniper_pf_concussive_grenade"):SetHidden(false)
end

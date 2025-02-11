modifier_uncapped_movespeed = class({})

function modifier_uncapped_movespeed:IsHidden() return true end

function modifier_uncapped_movespeed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT
	}
end

function modifier_uncapped_movespeed:GetModifierIgnoreMovespeedLimit()
	return 1
end

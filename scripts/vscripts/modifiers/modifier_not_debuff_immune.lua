
modifier_not_debuff_immune = class({})

-----------------------------------------------------------------------------------------

function modifier_not_debuff_immune:IsHidden()
	return true
end

-----------------------------------------------------------------------------------------

function modifier_not_debuff_immune:IsPurgable()
	return false
end

--------------------------------------------------------------------------------

function modifier_not_debuff_immune:GetAttributes()
	return MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

--------------------------------------------------------------------------------

function modifier_not_debuff_immune:CheckState()
	return {[MODIFIER_STATE_DEBUFF_IMMUNE] = false}
end

--------------------------------------------------------------------------------

function modifier_not_debuff_immune:GetPriority()
    return MODIFIER_PRIORITY_SUPER_ULTRA + 200000
end
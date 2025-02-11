modifier_player_perk_cast_range = class({})

function modifier_player_perk_cast_range:IsHidden() return true end
function modifier_player_perk_cast_range:IsDebuff() return false end
function modifier_player_perk_cast_range:IsPurgable() return false end
function modifier_player_perk_cast_range:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_cast_range:GetTexture() return "perks/cast_range" end

function modifier_player_perk_cast_range:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_CAST_RANGE_BONUS
	}
end

function modifier_player_perk_cast_range:GetModifierCastRangeBonus()
	return self:GetStackCount()
end

modifier_player_perk_cast_range_dummy = class({})

function modifier_player_perk_cast_range_dummy:IsHidden() return false end
function modifier_player_perk_cast_range_dummy:IsDebuff() return false end
function modifier_player_perk_cast_range_dummy:IsPurgable() return false end
function modifier_player_perk_cast_range_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_cast_range_dummy:GetTexture() return "perks/cast_range" end

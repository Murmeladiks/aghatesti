modifier_player_perk_magic_resist = class({})

function modifier_player_perk_magic_resist:IsHidden() return true end
function modifier_player_perk_magic_resist:IsDebuff() return false end
function modifier_player_perk_magic_resist:IsPurgable() return false end
function modifier_player_perk_magic_resist:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_magic_resist:GetTexture() return "perks/magic_resist" end

function modifier_player_perk_magic_resist:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
	}
end

function modifier_player_perk_magic_resist:GetModifierMagicalResistanceBonus()
	return 0.1 * self:GetStackCount()
end

modifier_player_perk_magic_resist_dummy = class({})

function modifier_player_perk_magic_resist_dummy:IsHidden() return false end
function modifier_player_perk_magic_resist_dummy:IsDebuff() return false end
function modifier_player_perk_magic_resist_dummy:IsPurgable() return false end
function modifier_player_perk_magic_resist_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_magic_resist_dummy:GetTexture() return "perks/magic_resist" end

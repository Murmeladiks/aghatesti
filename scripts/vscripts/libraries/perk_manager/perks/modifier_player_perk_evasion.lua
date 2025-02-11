modifier_player_perk_evasion = class({})

function modifier_player_perk_evasion:IsHidden() return true end
function modifier_player_perk_evasion:IsDebuff() return false end
function modifier_player_perk_evasion:IsPurgable() return false end
function modifier_player_perk_evasion:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_evasion:GetTexture() return "perks/evasion" end

function modifier_player_perk_evasion:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_EVASION_CONSTANT
	}
end

function modifier_player_perk_evasion:GetModifierEvasion_Constant()
	return self:GetStackCount()
end

modifier_player_perk_evasion_dummy = class({})

function modifier_player_perk_evasion_dummy:IsHidden() return false end
function modifier_player_perk_evasion_dummy:IsDebuff() return false end
function modifier_player_perk_evasion_dummy:IsPurgable() return false end
function modifier_player_perk_evasion_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_evasion_dummy:GetTexture() return "perks/evasion" end

modifier_player_perk_armor = class({})

function modifier_player_perk_armor:IsHidden() return true end
function modifier_player_perk_armor:IsDebuff() return false end
function modifier_player_perk_armor:IsPurgable() return false end
function modifier_player_perk_armor:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_armor:GetTexture() return "perks/armor" end

function modifier_player_perk_armor:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
	}
end

function modifier_player_perk_armor:GetModifierPhysicalArmorBonus()
	return self:GetStackCount()
end

modifier_player_perk_armor_dummy = class({})

function modifier_player_perk_armor_dummy:IsHidden() return false end
function modifier_player_perk_armor_dummy:IsDebuff() return false end
function modifier_player_perk_armor_dummy:IsPurgable() return false end
function modifier_player_perk_armor_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_armor_dummy:GetTexture() return "perks/armor" end

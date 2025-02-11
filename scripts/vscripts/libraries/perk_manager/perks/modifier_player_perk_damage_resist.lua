modifier_player_perk_damage_resist = class({})

function modifier_player_perk_damage_resist:IsHidden() return true end
function modifier_player_perk_damage_resist:IsDebuff() return false end
function modifier_player_perk_damage_resist:IsPurgable() return false end
function modifier_player_perk_damage_resist:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_damage_resist:GetTexture() return "perks/damage_resist" end

function modifier_player_perk_damage_resist:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
	}
end

function modifier_player_perk_damage_resist:GetModifierIncomingDamage_Percentage()
	return (-1) * self:GetStackCount()
end

modifier_player_perk_damage_resist_dummy = class({})

function modifier_player_perk_damage_resist_dummy:IsHidden() return false end
function modifier_player_perk_damage_resist_dummy:IsDebuff() return false end
function modifier_player_perk_damage_resist_dummy:IsPurgable() return false end
function modifier_player_perk_damage_resist_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_damage_resist_dummy:GetTexture() return "perks/damage_resist" end

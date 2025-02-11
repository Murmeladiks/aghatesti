modifier_player_perk_status_resist = class({})

function modifier_player_perk_status_resist:IsHidden() return true end
function modifier_player_perk_status_resist:IsDebuff() return false end
function modifier_player_perk_status_resist:IsPurgable() return false end
function modifier_player_perk_status_resist:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_status_resist:GetTexture() return "perks/status_resist" end

function modifier_player_perk_status_resist:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING
	}
end

function modifier_player_perk_status_resist:GetModifierStatusResistanceStacking()
	return self:GetStackCount()
end

modifier_player_perk_status_resist_dummy = class({})

function modifier_player_perk_status_resist_dummy:IsHidden() return false end
function modifier_player_perk_status_resist_dummy:IsDebuff() return false end
function modifier_player_perk_status_resist_dummy:IsPurgable() return false end
function modifier_player_perk_status_resist_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_status_resist_dummy:GetTexture() return "perks/status_resist" end

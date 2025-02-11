modifier_player_perk_health = class({})

function modifier_player_perk_health:IsHidden() return true end
function modifier_player_perk_health:IsDebuff() return false end
function modifier_player_perk_health:IsPurgable() return false end
function modifier_player_perk_health:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_health:GetTexture() return "perks/health" end

function modifier_player_perk_health:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_EXTRA_HEALTH_PERCENTAGE
	}
end

function modifier_player_perk_health:GetModifierExtraHealthPercentage()
	return self:GetStackCount()
end

modifier_player_perk_health_dummy = class({})

function modifier_player_perk_health_dummy:IsHidden() return false end
function modifier_player_perk_health_dummy:IsDebuff() return false end
function modifier_player_perk_health_dummy:IsPurgable() return false end
function modifier_player_perk_health_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_health_dummy:GetTexture() return "perks/health" end

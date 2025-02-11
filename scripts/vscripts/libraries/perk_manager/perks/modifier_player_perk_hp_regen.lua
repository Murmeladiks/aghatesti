modifier_player_perk_hp_regen = class({})

function modifier_player_perk_hp_regen:IsHidden() return true end
function modifier_player_perk_hp_regen:IsDebuff() return false end
function modifier_player_perk_hp_regen:IsPurgable() return false end
function modifier_player_perk_hp_regen:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_hp_regen:GetTexture() return "perks/hp_regen" end

function modifier_player_perk_hp_regen:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
	}
end

function modifier_player_perk_hp_regen:GetModifierHealthRegenPercentage()
	return 0.01 * self:GetStackCount()
end

modifier_player_perk_hp_regen_dummy = class({})

function modifier_player_perk_hp_regen_dummy:IsHidden() return false end
function modifier_player_perk_hp_regen_dummy:IsDebuff() return false end
function modifier_player_perk_hp_regen_dummy:IsPurgable() return false end
function modifier_player_perk_hp_regen_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_hp_regen_dummy:GetTexture() return "perks/hp_regen" end

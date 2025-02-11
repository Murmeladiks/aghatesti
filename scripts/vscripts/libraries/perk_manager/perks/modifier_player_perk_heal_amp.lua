modifier_player_perk_heal_amp = class({})

function modifier_player_perk_heal_amp:IsHidden() return true end
function modifier_player_perk_heal_amp:IsDebuff() return false end
function modifier_player_perk_heal_amp:IsPurgable() return false end
function modifier_player_perk_heal_amp:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_heal_amp:GetTexture() return "perks/heal_amp" end

function modifier_player_perk_heal_amp:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_SOURCE
	}
end

function modifier_player_perk_heal_amp:GetModifierHealAmplify_PercentageSource()
	return self:GetStackCount()
end

modifier_player_perk_heal_amp_dummy = class({})

function modifier_player_perk_heal_amp_dummy:IsHidden() return false end
function modifier_player_perk_heal_amp_dummy:IsDebuff() return false end
function modifier_player_perk_heal_amp_dummy:IsPurgable() return false end
function modifier_player_perk_heal_amp_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_heal_amp_dummy:GetTexture() return "perks/heal_amp" end

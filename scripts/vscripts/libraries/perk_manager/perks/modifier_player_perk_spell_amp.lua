modifier_player_perk_spell_amp = class({})

function modifier_player_perk_spell_amp:IsHidden() return true end
function modifier_player_perk_spell_amp:IsDebuff() return false end
function modifier_player_perk_spell_amp:IsPurgable() return false end
function modifier_player_perk_spell_amp:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_spell_amp:GetTexture() return "perks/spell_amp" end

function modifier_player_perk_spell_amp:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
	}
end

function modifier_player_perk_spell_amp:GetModifierSpellAmplify_Percentage()
	return self:GetStackCount()
end

modifier_player_perk_spell_amp_dummy = class({})

function modifier_player_perk_spell_amp_dummy:IsHidden() return false end
function modifier_player_perk_spell_amp_dummy:IsDebuff() return false end
function modifier_player_perk_spell_amp_dummy:IsPurgable() return false end
function modifier_player_perk_spell_amp_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_spell_amp_dummy:GetTexture() return "perks/spell_amp" end

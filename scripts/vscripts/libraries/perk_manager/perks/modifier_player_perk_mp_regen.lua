modifier_player_perk_mp_regen = class({})

function modifier_player_perk_mp_regen:IsHidden() return true end
function modifier_player_perk_mp_regen:IsDebuff() return false end
function modifier_player_perk_mp_regen:IsPurgable() return false end
function modifier_player_perk_mp_regen:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_mp_regen:GetTexture() return "perks/mp_regen" end

function modifier_player_perk_mp_regen:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE
	}
end

function modifier_player_perk_mp_regen:GetModifierTotalPercentageManaRegen()
	return 0.01 * self:GetStackCount()
end

modifier_player_perk_mp_regen_dummy = class({})

function modifier_player_perk_mp_regen_dummy:IsHidden() return false end
function modifier_player_perk_mp_regen_dummy:IsDebuff() return false end
function modifier_player_perk_mp_regen_dummy:IsPurgable() return false end
function modifier_player_perk_mp_regen_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_mp_regen_dummy:GetTexture() return "perks/mp_regen" end

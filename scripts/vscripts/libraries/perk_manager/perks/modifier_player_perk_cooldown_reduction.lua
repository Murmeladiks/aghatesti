modifier_player_perk_cooldown_reduction = class({})

function modifier_player_perk_cooldown_reduction:IsHidden() return true end
function modifier_player_perk_cooldown_reduction:IsDebuff() return false end
function modifier_player_perk_cooldown_reduction:IsPurgable() return false end
function modifier_player_perk_cooldown_reduction:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_cooldown_reduction:GetTexture() return "perks/cooldown_reduction" end

function modifier_player_perk_cooldown_reduction:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE
	}
end

function modifier_player_perk_cooldown_reduction:GetModifierPercentageCooldown()
	return 0.1 * self:GetStackCount()
end

modifier_player_perk_cooldown_reduction_dummy = class({})

function modifier_player_perk_cooldown_reduction_dummy:IsHidden() return false end
function modifier_player_perk_cooldown_reduction_dummy:IsDebuff() return false end
function modifier_player_perk_cooldown_reduction_dummy:IsPurgable() return false end
function modifier_player_perk_cooldown_reduction_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_cooldown_reduction_dummy:GetTexture() return "perks/cooldown_reduction" end

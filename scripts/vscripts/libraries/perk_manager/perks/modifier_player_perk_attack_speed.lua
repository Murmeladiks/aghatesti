modifier_player_perk_attack_speed = class({})

function modifier_player_perk_attack_speed:IsHidden() return true end
function modifier_player_perk_attack_speed:IsDebuff() return false end
function modifier_player_perk_attack_speed:IsPurgable() return false end
function modifier_player_perk_attack_speed:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_attack_speed:GetTexture() return "perks/attack_speed" end

function modifier_player_perk_attack_speed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

function modifier_player_perk_attack_speed:GetModifierAttackSpeedBonus_Constant()
	local parent = self:GetParent()
	local level = parent and parent:GetLevel() or 0

	return (1 + 0.05 * level) * self:GetStackCount()
end

modifier_player_perk_attack_speed_dummy = class({})

function modifier_player_perk_attack_speed_dummy:IsHidden() return false end
function modifier_player_perk_attack_speed_dummy:IsDebuff() return false end
function modifier_player_perk_attack_speed_dummy:IsPurgable() return false end
function modifier_player_perk_attack_speed_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_attack_speed_dummy:GetTexture() return "perks/attack_speed" end

modifier_player_perk_move_speed = class({})

function modifier_player_perk_move_speed:IsHidden() return true end
function modifier_player_perk_move_speed:IsDebuff() return false end
function modifier_player_perk_move_speed:IsPurgable() return false end
function modifier_player_perk_move_speed:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_move_speed:GetTexture() return "perks/move_speed" end

function modifier_player_perk_move_speed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT
	}
end

function modifier_player_perk_move_speed:GetModifierMoveSpeedBonus_Constant()
	return self:GetStackCount()
end

modifier_player_perk_move_speed_dummy = class({})

function modifier_player_perk_move_speed_dummy:IsHidden() return false end
function modifier_player_perk_move_speed_dummy:IsDebuff() return false end
function modifier_player_perk_move_speed_dummy:IsPurgable() return false end
function modifier_player_perk_move_speed_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_move_speed_dummy:GetTexture() return "perks/move_speed" end

modifier_player_perk_attack_damage = class({})

function modifier_player_perk_attack_damage:IsHidden() return true end
function modifier_player_perk_attack_damage:IsDebuff() return false end
function modifier_player_perk_attack_damage:IsPurgable() return false end
function modifier_player_perk_attack_damage:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_attack_damage:GetTexture() return "perks/attack_damage" end

function modifier_player_perk_attack_damage:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE
	}
end

function modifier_player_perk_attack_damage:GetModifierBaseDamageOutgoing_Percentage()
	return self:GetStackCount()
end

modifier_player_perk_attack_damage_dummy = class({})

function modifier_player_perk_attack_damage_dummy:IsHidden() return false end
function modifier_player_perk_attack_damage_dummy:IsDebuff() return false end
function modifier_player_perk_attack_damage_dummy:IsPurgable() return false end
function modifier_player_perk_attack_damage_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_attack_damage_dummy:GetTexture() return "perks/attack_damage" end

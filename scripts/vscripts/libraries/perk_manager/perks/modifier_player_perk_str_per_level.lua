modifier_player_perk_str_per_level = class({})

function modifier_player_perk_str_per_level:IsHidden() return true end
function modifier_player_perk_str_per_level:IsDebuff() return false end
function modifier_player_perk_str_per_level:IsPurgable() return false end
function modifier_player_perk_str_per_level:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_str_per_level:GetTexture() return "perks/str_per_level" end

function modifier_player_perk_str_per_level:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS
	}
end

function modifier_player_perk_str_per_level:GetModifierBonusStats_Strength()
	local parent = self:GetParent()
	local level = parent and parent:GetLevel() or 0

	return 0.1 * level * self:GetStackCount()
end

modifier_player_perk_str_per_level_dummy = class({})

function modifier_player_perk_str_per_level_dummy:IsHidden() return false end
function modifier_player_perk_str_per_level_dummy:IsDebuff() return false end
function modifier_player_perk_str_per_level_dummy:IsPurgable() return false end
function modifier_player_perk_str_per_level_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_str_per_level_dummy:GetTexture() return "perks/str_per_level" end

modifier_player_perk_attack_range = class({})

function modifier_player_perk_attack_range:IsHidden() return true end
function modifier_player_perk_attack_range:IsDebuff() return false end
function modifier_player_perk_attack_range:IsPurgable() return false end
function modifier_player_perk_attack_range:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_attack_range:GetTexture() return "perks/attack_range" end

function modifier_player_perk_attack_range:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS
	}
end

function modifier_player_perk_attack_range:AfterInitialStackCount()
	if (not IsServer()) then return end

	local parent = self:GetParent()
	local attack_type = parent and parent:GetAttackCapability() or DOTA_UNIT_CAP_MELEE_ATTACK

	if attack_type ~= DOTA_UNIT_CAP_RANGED_ATTACK then self:SetStackCount(0.5 * self:GetStackCount()) end
end


function modifier_player_perk_attack_range:GetModifierAttackRangeBonus()
	return self:GetStackCount()
end

modifier_player_perk_attack_range_dummy = class({})

function modifier_player_perk_attack_range_dummy:IsHidden() return false end
function modifier_player_perk_attack_range_dummy:IsDebuff() return false end
function modifier_player_perk_attack_range_dummy:IsPurgable() return false end
function modifier_player_perk_attack_range_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_attack_range_dummy:GetTexture() return "perks/attack_range" end

modifier_player_perk_neutral_item_stats = class({})

function modifier_player_perk_neutral_item_stats:IsHidden() return false end
function modifier_player_perk_neutral_item_stats:IsDebuff() return false end
function modifier_player_perk_neutral_item_stats:IsPurgable() return false end
function modifier_player_perk_neutral_item_stats:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_neutral_item_stats:GetTexture() return "perks/neutral_item_stats" end

function modifier_player_perk_neutral_item_stats:OnCreated()
	self.ability = self:GetAbility()
	self.neutral_list = {}

	local neutralItemKV = LoadKeyValues("scripts/npc/neutral_items.txt")
	for neutralTier, levelData in pairs(neutralItemKV) do
		if levelData and type(levelData) == "table" then
			for key,data in pairs(levelData) do
				if key =="items" then
					for k,v in pairs(data) do
						self.neutral_list[k] = tonumber(neutralTier)
					end
				end
			end
		end
	end

	if IsServer() then self:StartIntervalThink(1) end
end

function modifier_player_perk_neutral_item_stats:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL,
		MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL_VALUE
	}
end

function modifier_player_perk_neutral_item_stats:GetModifierOverrideAbilitySpecial(keys)
	local ability_name = keys.ability:GetAbilityName()
	if keys.ability and self.neutral_list and self.neutral_list[ability_name] and not (ignored_special_values[ability_name] and ignored_special_values[ability_name][keys.ability_special_value]) then
		return 1
	end

	return 0
end

function modifier_player_perk_neutral_item_stats:GetModifierOverrideAbilitySpecialValue(keys)
	local value = keys.ability:GetLevelSpecialValueNoOverride(keys.ability_special_value, keys.ability_special_level)

	if self.ability and keys.ability and self.neutral_list and self.neutral_list[keys.ability:GetAbilityName()] then
		return value * (1 + 0.001 * self:GetStackCount())
	end

	return value
end

function modifier_player_perk_neutral_item_stats:OnIntervalThink()
	local parent = self:GetParent()
	local ability = self:GetAbility()

	if parent then
		local item = parent:GetItemInSlot(DOTA_ITEM_NEUTRAL_ACTIVE_SLOT)
		if item and not item:IsNull() then
			if ability then ability:SetLevel(self.neutral_list[item:GetAbilityName()]) end
		else
			if ability then ability:SetLevel(0) end
		end
	end
end

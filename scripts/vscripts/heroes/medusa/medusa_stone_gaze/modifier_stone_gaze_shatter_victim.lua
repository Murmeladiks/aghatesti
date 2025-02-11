modifier_stone_gaze_shatter_victim = class({})

function modifier_stone_gaze_shatter_victim:IsHidden() return true end
function modifier_stone_gaze_shatter_victim:IsPurgable() return false end

if not IsServer() then return end

function modifier_stone_gaze_shatter_victim:OnCreated()
	self.parent = self:GetParent()
	local ability = self:GetAbility()

	self.chance = ability:GetSpecialValueFor("shatter_chance")

	self.stone_gaze = self:GetCaster():FindAbilityByName("medusa_stone_gaze_lua")
end

function modifier_stone_gaze_shatter_victim:OnDestroy()
	if self:GetRemainingTime() <= 0 then return end

	if not self.parent or self.parent:IsNull() then return end

	local petrification_modifier = self.parent:FindModifierByName("modifier_medusa_petrified_lua")

	if petrification_modifier and petrification_modifier:GetRemainingTime() > 0 and RollPercentage(self.chance) then
		self.stone_gaze:ShatterPetrified(self.parent, petrification_modifier.latest_applied_duration)
	end
end

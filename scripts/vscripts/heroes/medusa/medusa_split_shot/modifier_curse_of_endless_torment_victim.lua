modifier_curse_of_endless_torment_victim = class({})

function modifier_curse_of_endless_torment_victim:IsHidden() return true end
function modifier_curse_of_endless_torment_victim:IsPurgable() return false end

if not IsServer() then return end

function modifier_curse_of_endless_torment_victim:OnCreated()
	self.ability = self:GetAbility()
	self.spawn_chance = self.ability:GetSpecialValueFor("spawn_chance")

	self.caster = self:GetCaster()

	self.split_shot = self.caster:FindModifierByName("modifier_medusa_split_shot_lua")
end

function modifier_curse_of_endless_torment_victim:OnDestroy()
	-- basic eventless death detection - if this modifier is removed while had duration left, then unit died
	if self:GetRemainingTime() <= 0 then return end

	local parent = self:GetParent()
	if not parent or parent:IsNull() then return end

	self.split_shot:RollPoleAt(parent:GetAbsOrigin(), self.spawn_chance)
end


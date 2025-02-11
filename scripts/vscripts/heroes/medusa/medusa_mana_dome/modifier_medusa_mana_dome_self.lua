modifier_medusa_mana_dome_self = class({})

function modifier_medusa_mana_dome_self:IsPurgable() return false end


function modifier_medusa_mana_dome_self:OnCreated()
	self.parent = self:GetParent()

	local ability = self:GetAbility()

	self.bonus_mana_regen_per_hero = self:GetAbility():GetSpecialValueFor("bonus_mana_regen") / 100
	self.bonus_mana_regen = 0

	self:StartIntervalThink(0.5)
end

function modifier_medusa_mana_dome_self:OnIntervalThink()
	local mana_regen = self.parent:GetManaRegen() - self.bonus_mana_regen

	self.bonus_mana_regen = mana_regen * self:GetStackCount() * self.bonus_mana_regen_per_hero
end


function modifier_medusa_mana_dome_self:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
	}
end


function modifier_medusa_mana_dome_self:GetModifierConstantManaRegen()
	return self.bonus_mana_regen
end

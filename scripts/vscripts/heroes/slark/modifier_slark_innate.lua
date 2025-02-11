modifier_slark_innate = class({})

function modifier_slark_innate:IsHidden() return true end
function modifier_slark_innate:IsPurgable() return false end
function modifier_slark_innate:RemoveOnDeath() return false end

function modifier_slark_innate:OnCreated()
	if not IsServer() then return end
	self.health_regen = self:GetAbility():GetSpecialValueFor("health_regen")
	self.bonus_ms = self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
	self:StartIntervalThink(0.5) -- Check every 0.5 seconds
end

function modifier_slark_innate:OnIntervalThink()
	if not IsServer() then return end
	local parent = self:GetParent()

	-- Check if Slark is visible to enemies
	if parent:IsInvisible() or not parent:CanBeSeenByAnyOpposingTeam() then
		if not self:GetParent():HasModifier("modifier_slark_innate_buff") then
			self:GetParent():AddNewModifier(parent, self:GetAbility(), "modifier_slark_innate_buff", {})
		end
	else
		self:GetParent():RemoveModifierByName("modifier_slark_innate_buff")
	end
end

-----------------------------------------------
-- Second modifier to apply HP regen & speed
-----------------------------------------------
modifier_slark_innate_buff = class({})

function modifier_slark_innate_buff:IsHidden() return false end
function modifier_slark_innate_buff:IsPurgable() return false end
function modifier_slark_innate_buff:GetEffectName() return "particles/units/heroes/hero_slark/slark_shadow_dance.vpcf" end

function modifier_slark_innate_buff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT
	}
end

function modifier_slark_innate_buff:GetModifierConstantHealthRegen()
	return self:GetAbility():GetSpecialValueFor("health_regen")
end

function modifier_slark_innate_buff:GetModifierMoveSpeedBonus_Constant()
	return self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

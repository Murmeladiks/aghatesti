LinkLuaModifier("modifier_item_pathfinder_travel_boots", "items/item_pathfinder_travel_boots", LUA_MODIFIER_MOTION_NONE)
item_pathfinder_travel_boots = class({})
item_pathfinder_travel_boots_2 = item_pathfinder_travel_boots

function item_pathfinder_travel_boots:GetIntrinsicModifierName()
	return "modifier_item_pathfinder_travel_boots"
end


-----
modifier_item_pathfinder_travel_boots = class({})
function modifier_item_pathfinder_travel_boots:IsHidden() return true end
function modifier_item_pathfinder_travel_boots:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_item_pathfinder_travel_boots:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT_UNIQUE
	}
end

function modifier_item_pathfinder_travel_boots:GetModifierMoveSpeedBonus_Constant_Unique()
	return self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

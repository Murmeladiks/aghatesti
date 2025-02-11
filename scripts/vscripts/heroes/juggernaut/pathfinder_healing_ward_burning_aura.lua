pathfinder_healing_ward_burning_aura = class({})
LinkLuaModifier("modifier_burning_aura", "heroes/juggernaut/modifier_burning_aura", LUA_MODIFIER_MOTION_NONE)


function pathfinder_healing_ward_burning_aura:GetIntrinsicModifierName()
	return "modifier_burning_aura"
end


	
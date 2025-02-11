LinkLuaModifier( "modifier_creature_entangle", "units/creature_entangle.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if creature_entangle == nil then
	creature_entangle = class({})
end
function creature_entangle:GetIntrinsicModifierName()
	return "modifier_creature_entangle"
end
---------------------------------------------------------------------
--Modifiers
if modifier_creature_entangle == nil then
	modifier_creature_entangle = class({})
end
function modifier_creature_entangle:OnCreated(params)
	if IsServer() then
	end
end
function modifier_creature_entangle:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_creature_entangle:OnDestroy()
	if IsServer() then
	end
end
function modifier_creature_entangle:DeclareFunctions()
	return {
	}
end
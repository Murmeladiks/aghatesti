LinkLuaModifier( "modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale", "heroes/venomancer/pathfinder_venomancer_venomous_gale.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale == nil then
	heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale = class({})
end
function heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale:GetIntrinsicModifierName()
	return "modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale"
end
---------------------------------------------------------------------
--Modifiers
if modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale == nil then
	modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale = class({})
end
function modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale:OnCreated(params)
	if IsServer() then
	end
end
function modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale:OnDestroy()
	if IsServer() then
	end
end
function modifier_heroes/venomancer/pathfinder_venomancer_venomous_galefinder_venomancer_venomous_gale:DeclareFunctions()
	return {
	}
end
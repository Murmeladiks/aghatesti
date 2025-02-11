LinkLuaModifier( "modifier_pf_skeleton_king_vampiric_aura", "abilities/pf_skeleton_king_vampiric_aura.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if pf_skeleton_king_vampiric_aura == nil then
	pf_skeleton_king_vampiric_aura = class({})
end
function pf_skeleton_king_vampiric_aura:GetIntrinsicModifierName()
	return "modifier_pf_skeleton_king_vampiric_aura"
end
---------------------------------------------------------------------
--Modifiers
if modifier_pf_skeleton_king_vampiric_aura == nil then
	modifier_pf_skeleton_king_vampiric_aura = class({})
end
function modifier_pf_skeleton_king_vampiric_aura:OnCreated(params)
	if IsServer() then
	end
end
function modifier_pf_skeleton_king_vampiric_aura:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_pf_skeleton_king_vampiric_aura:OnDestroy()
	if IsServer() then
	end
end
function modifier_pf_skeleton_king_vampiric_aura:DeclareFunctions()
	return {
	}
end
medusa_mana_dome = class({})
LinkLuaModifier("modifier_medusa_mana_dome", "heroes/medusa/medusa_mana_dome/modifier_medusa_mana_dome", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_mana_dome_effect", "heroes/medusa/medusa_mana_dome/modifier_medusa_mana_dome_effect", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_mana_dome_self", "heroes/medusa/medusa_mana_dome/modifier_medusa_mana_dome_self", LUA_MODIFIER_MOTION_NONE)


function medusa_mana_dome:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end


function medusa_mana_dome:Spawn()
	if not IsServer() then return end
	Timers:CreateTimer(0.1, function() self:SetLevel(1) end)
end


function medusa_mana_dome:OnSpellStart()
	if not IsServer() then return end
	
	if self.active_mana_dome and not self.active_mana_dome:IsNull() then self.active_mana_dome:Destroy() end

	local caster = self:GetCaster()
	local location = self:GetCursorPosition()

	local duration = self:GetSpecialValueFor("duration")

	caster:AddNewModifier(caster, self, "modifier_medusa_mana_dome_self", {duration = duration})

	self.active_mana_dome = CreateModifierThinker(
		caster, self, "modifier_medusa_mana_dome", {duration = duration}, location, caster:GetTeamNumber(), false
	)

	local mana_shield = caster:FindAbilityByName("medusa_mana_shield_lua")
	if mana_shield and not mana_shield:GetToggleState() then mana_shield:ToggleAbility() end

	EmitSoundOnLocationForAllies(location, "Medusa.ManaDome", caster)
end

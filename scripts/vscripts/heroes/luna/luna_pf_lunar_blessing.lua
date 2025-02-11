LinkLuaModifier("modifier_luna_pf_lunar_blessing", 		"heroes/luna/luna_pf_lunar_blessing", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_lunar_blessing_aura", "heroes/luna/luna_pf_lunar_blessing", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

if luna_pf_lunar_blessing == nil then luna_pf_lunar_blessing = class({}) end

--------------------------------------------------------------------------------

function luna_pf_lunar_blessing:GetIntrinsicModifierName()
	return "modifier_luna_pf_lunar_blessing_aura"
end

--------------------------------------------------------------------------------

if modifier_luna_pf_lunar_blessing_aura == nil then	modifier_luna_pf_lunar_blessing_aura = class({}) end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing_aura:IsHidden() 			return true end
function modifier_luna_pf_lunar_blessing_aura:IsPurgable() 			return false end
function modifier_luna_pf_lunar_blessing_aura:IsAura() 				return true end
function modifier_luna_pf_lunar_blessing_aura:GetModifierAura() 	return  "modifier_luna_pf_lunar_blessing" end
function modifier_luna_pf_lunar_blessing_aura:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_luna_pf_lunar_blessing_aura:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing_aura:GetAuraRadius()
	if IsClient() then return self.nRadius end

	return GameRules:IsDaytime() and self.nRadius or 10000
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing_aura:OnCreated()
	local hAbility = self:GetAbility()

	self.nRadius = hAbility:GetSpecialValueFor("radius")

	self.nOverriddenValues = {
		["bonus_damage_tooltip"] = true,
		["self_bonus_damage_tooltip"] = true,
		["self_bonus_night_vision_tooltip"] = true,
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing_aura:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL,
		MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL_VALUE
	}
end

-----------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing_aura:GetModifierOverrideAbilitySpecial( params )
	if params.ability ~= self:GetAbility() or not params.ability_special_value then return 0 end

	local szSpecialValueName = params.ability_special_value

	if self.nOverriddenValues and self.nOverriddenValues[szSpecialValueName] then
		return 1
	end

	return 0
end

-----------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing_aura:GetModifierOverrideAbilitySpecialValue( params )
	if params.ability ~= self:GetAbility() or not params.ability_special_value then return 0 end

	local hAbility = params.ability
	local szAbilityName = hAbility:GetAbilityName() 

	local szSpecialValueName = params.ability_special_value

	if self.nOverriddenValues and self.nOverriddenValues[szSpecialValueName] then
		local nBase = string.gsub(szSpecialValueName, "_tooltip", "")
		local nLevelValue = string.gsub(szSpecialValueName, "tooltip", "per_level")

		return hAbility:GetSpecialValueFor(nBase) + hAbility:GetSpecialValueFor(nLevelValue) * self:GetCaster():GetLevel()
	end

	return 0
end

--------------------------------------------------------------------------------

if modifier_luna_pf_lunar_blessing == nil then	modifier_luna_pf_lunar_blessing = class({}) end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing:OnCreated()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local nLevel = hCaster:GetLevel()
	local bIsOwner = hParent == hCaster

	self.nDamagePerLevel = bIsOwner and hAbility:GetSpecialValueFor("self_bonus_damage_per_level") or hAbility:GetSpecialValueFor("bonus_damage_per_level")
	self.nBaseNightVision = hAbility:GetSpecialValueFor("self_bonus_night_vision")
	self.nNightVisionPerLevel = hAbility:GetSpecialValueFor("self_bonus_night_vision_per_level")
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing:DeclareFunctions()
	if self:GetCaster() == self:GetParent() then
		return {
			MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
			MODIFIER_PROPERTY_BONUS_NIGHT_VISION
		}
	end
	return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing:GetModifierPreAttack_BonusDamage()
	return self.nDamagePerLevel * self:GetCaster():GetLevel()
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_blessing:GetBonusNightVision()
	return self.nBaseNightVision + self.nNightVisionPerLevel * self:GetCaster():GetLevel()
end
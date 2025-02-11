LinkLuaModifier("modifier_ursa_pf_overpower",			"heroes/ursa/ursa_pf_overpower", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ursa_pf_overpower_evasion",	"heroes/ursa/ursa_pf_overpower", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

ursa_pf_overpower = class({})

--------------------------------------------------------------------------------

function ursa_pf_overpower:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_ursa/ursa_overpower_buff.vpcf", context) -- fix
	PrecacheResource("particle", "particles/status_fx/status_effect_overpower.vpcf", context)
end

--------------------------------------------------------------------------------

function ursa_pf_overpower:OnSpellStart()
	local hCaster = self:GetCaster()
	local nStacks = self:GetSpecialValueFor("max_attacks")
	
	self:AddOverpowerAttacks(hCaster, nStacks, false, true)

	hCaster:EmitSound("Hero_Ursa.Overpower")

	if hCaster:HasShard("aghsfort_special_ursa_overpower_evasion") then
		hCaster:AddNewModifier(hCaster, self, "modifier_ursa_pf_overpower_evasion", {duration = hCaster:FindTalentValue("aghsfort_special_ursa_overpower_evasion", "value")})
	end
end

--------------------------------------------------------------------------------

function ursa_pf_overpower:AddOverpowerAttacks(hUnit, nStacks, bIgnoreMax, bCast)
	local hCaster = self:GetCaster()
	local nDuration = self:GetDuration()
	local hOverpowerMod = hUnit:FindModifierByName("modifier_ursa_pf_overpower")

	if hOverpowerMod then
		hOverpowerMod:SetDuration(nDuration, true)

		if bIgnoreMax then
			hOverpowerMod:SetStackCount(hOverpowerMod:GetStackCount() + nStacks)
		else
			hOverpowerMod:SetStackCount(math.max(hOverpowerMod:GetStackCount(), nStacks))
		end
	else
		hUnit:AddNewModifier(hCaster, self, "modifier_ursa_pf_overpower", {duration = nDuration}):SetStackCount(nStacks)

		if not bCast then hUnit:EmitSound("Hero_Ursa.Overpower") end
	end
end

--------------------------------------------------------------------------------

modifier_ursa_pf_overpower = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nAttackSpeed = hAbility:GetSpecialValueFor("attack_speed_bonus_pct")
	self.nSlowResistance = hAbility:GetSpecialValueFor("slow_resist")
	self.nCrit = hCaster:FindTalentValue("aghsfort_special_ursa_overpower_crit", "value")

	self.nCleavePct = hCaster:FindTalentValue("aghsfort_special_ursa_overpower_cleave", "value")
	self.nStartWidth = hCaster:FindTalentValue("aghsfort_special_ursa_overpower_cleave", "value2")
	self.nEndWidth = hCaster:FindTalentValue("aghsfort_special_ursa_overpower_cleave", "value3")
	self.nDistance = hCaster:FindTalentValue("aghsfort_special_ursa_overpower_cleave", "value4")
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:OnRefresh()
	self:OnCreated()
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
		MODIFIER_PROPERTY_SLOW_RESISTANCE_STACKING,
		MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetModifierAttackSpeedBonus_Constant(event)
	return self.nAttackSpeed
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetModifierPreAttack_CriticalStrike()
	if self:GetParent():HasShard("aghsfort_special_ursa_overpower_crit") then
		return self.nCrit
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetCritDamage()
	if self:GetParent():HasShard("aghsfort_special_ursa_overpower_crit") then
		return self.nCrit / 100
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:OnAttack(event)
	if event.attacker ~= self:GetParent() or event.no_attack_cooldown then return end
	self:DecrementStackCount()

	if self:GetStackCount() < 1 then self:Destroy() end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:OnAttackLanded(event)
	if IsClient() or event.attacker ~= self:GetParent() or not self:GetCaster():HasShard("aghsfort_special_ursa_overpower_cleave") then return end
	local hAttacker = event.attacker
	local hTarget = event.target

	if hTarget and hTarget:GetTeamNumber() ~= hAttacker:GetTeamNumber() and not hAttacker:IsRangedAttacker() and not hTarget:IsBuilding() and not hTarget:IsOther() then
		DoCleaveAttack(hAttacker, hTarget, self:GetAbility(), event.damage * self.nCleavePct / 100, self.nStartWidth, self.nEndWidth, self.nDistance, "particles/items_fx/battlefury_cleave.vpcf")
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetActivityTranslationModifiers()
	local nCurrentStacks = self:GetStackCount()
    local nLastActivity = 6

	if nCurrentStacks == 1 then
		return "overpower6"
	else
		if nCurrentStacks >= nLastActivity then
			return "overpower" .. ((nCurrentStacks - 1) % nLastActivity + 1)
		else
			return "overpower" .. (nLastActivity - nCurrentStacks + 1)
		end
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetModifierSlowResistance_Stacking()
	return self.nSlowResistance
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetEffectName()
	return "particles/units/heroes/hero_ursa/ursa_overpower_buff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:GetStatusEffectName()
	return "particles/status_fx/status_effect_overpower.vpcf"
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_ursa_pf_overpower_evasion = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower_evasion:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower_evasion:OnCreated()
	local hAbility = self:GetAbility()

	self.nEvasion = self:GetCaster():FindTalentValue("aghsfort_special_ursa_overpower_evasion", "value2")
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower_evasion:DeclareFunctions()
	return {MODIFIER_PROPERTY_EVASION_CONSTANT}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_overpower_evasion:GetModifierEvasion_Constant()
	return self.nEvasion
end
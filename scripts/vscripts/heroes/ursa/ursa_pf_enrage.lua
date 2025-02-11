LinkLuaModifier("modifier_ursa_pf_enrage", 			"heroes/ursa/ursa_pf_enrage", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ursa_pf_increase_damage", "heroes/ursa/ursa_pf_enrage", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

ursa_pf_enrage = class({})

--------------------------------------------------------------------------------

function ursa_pf_enrage:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_ursa/ursa_enrage_buff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_ursa/ursa_enrage_hero_effect.vpcf", context)
end

--------------------------------------------------------------------------------

function ursa_pf_enrage:GetCastRange(vLocation, hTarget)
	local hCaster = self:GetCaster()

	if hCaster:HasShard("aghsfort_special_ursa_enrage_attack_speed") then
		return hCaster:FindTalentValue("aghsfort_special_ursa_enrage_attack_speed", "value")
	elseif hCaster:HasShard("aghsfort_special_ursa_enrage_allies") then
		return hCaster:FindTalentValue("aghsfort_special_ursa_enrage_allies", "value")
	end
end

--------------------------------------------------------------------------------

function ursa_pf_enrage:OnSpellStart()
	local hCaster = self:GetCaster()
	local nDuration = self:GetSpecialValueFor("duration")
	local nGrudgeDuration = self:GetSpecialValueFor("damage_increase_duration")
	local hOverpower = hCaster:FindAbilityByName("ursa_pf_overpower")


	hCaster:AddNewModifier(hCaster, self, "modifier_ursa_pf_enrage", {duration = nDuration})
	hCaster:Purge(false, true, false, true, true)
	hCaster:EmitSound("Hero_Ursa.Enrage")

	if nGrudgeDuration > 0 then
		hCaster:AddNewModifier(hCaster, self, "modifier_ursa_pf_increase_damage", {duration = nDuration + nGrudgeDuration})
	end

	if hCaster:HasShard("aghsfort_special_ursa_enrage_attack_speed") and hOverpower and hOverpower:IsTrained() then
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hCaster:GetOrigin(), nil, hCaster:FindTalentValue("aghsfort_special_ursa_enrage_attack_speed", "value"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS, 0, false)

		for _, hAlly in pairs(hAllies) do
			hOverpower:AddOverpowerAttacks(hAlly, hOverpower:GetSpecialValueFor("max_attacks"), false, false)
		end
	end

	if hCaster:HasShard("aghsfort_special_ursa_enrage_allies") then
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hCaster:GetOrigin(), nil, hCaster:FindTalentValue("aghsfort_special_ursa_enrage_allies", "value"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS, 0, false)

		for _, hAlly in pairs(hAllies) do
			hAlly:AddNewModifier(hCaster, self, "modifier_ursa_pf_enrage", {duration = nDuration})
			hAlly:Purge(false, true, false, true, true)
			hAlly:EmitSound("Hero_Ursa.Enrage")
		end
	end
end

--------------------------------------------------------------------------------

modifier_ursa_pf_enrage = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:OnCreated()
	local hAbility = self:GetAbility()

	self.nDamageReduction = -hAbility:GetSpecialValueFor("damage_reduction")
	self.nStatusResistance = hAbility:GetSpecialValueFor("status_resistance")
	self.nDamageIncrease = hAbility:GetSpecialValueFor("damage_increase") / 100

	if IsClient() then return end

	if self:GetCaster():HasShard("aghsfort_special_ursa_enrage_earthshock") then
		self:StartIntervalThink(self:GetCaster():FindTalentValue("aghsfort_special_ursa_enrage_earthshock", "interval"))
		self:OnIntervalThink()
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:OnRefresh()
	self:OnCreated()
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:OnIntervalThink()
	local hEarthshock = self:GetCaster():FindAbilityByName("ursa_pf_earthshock")

	if not hEarthshock or not hEarthshock:IsTrained() then return end

	hEarthshock:ApplyEarthshock(self:GetParent())
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
		MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
		MODIFIER_PROPERTY_MODEL_SCALE,
	}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:GetModifierIncomingDamage_Percentage(event)
	if IsClient() then return self.nDamageReduction end
	local nDamage = (-self.nDamageReduction / 100) * event.damage * self.nDamageIncrease
	local hGrudgeMod = self:GetParent():FindModifierByName("modifier_ursa_pf_increase_damage")

	if nDamage > 0 and hGrudgeMod then
		hGrudgeMod:SetStackCount(hGrudgeMod:GetStackCount() + nDamage)
	end

	return self.nDamageReduction
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:GetModifierStatusResistanceStacking()
	return self.nStatusResistance
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:GetModelScale()
	return 10
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:GetEffectName()
	return "particles/units/heroes/hero_ursa/ursa_enrage_buff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_enrage:GetHeroEffectName()
	return "particles/units/heroes/hero_ursa/ursa_enrage_hero_effect.vpcf"
end

function modifier_ursa_pf_enrage:HeroEffectPriority()
    return MODIFIER_PRIORITY_ULTRA + 1
end

--------------------------------------------------------------------------------

modifier_ursa_pf_increase_damage = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_increase_damage:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_ursa_pf_increase_damage:DeclareFunctions()
	return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_increase_damage:GetModifierPreAttack_BonusDamage()
	return self:GetStackCount()
end
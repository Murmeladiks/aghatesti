LinkLuaModifier("modifier_ursa_pf_fury_swipes", 				"heroes/ursa/ursa_pf_fury_swipes", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ursa_pf_fury_swipes_damage_increase",	"heroes/ursa/ursa_pf_fury_swipes", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ursa_pf_fury_swipes_minor", 			"heroes/ursa/ursa_pf_fury_swipes", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

ursa_pf_fury_swipes = class({})

--------------------------------------------------------------------------------

function ursa_pf_fury_swipes:Precache( context )
    PrecacheResource("particle", "particles/units/heroes/hero_ursa/ursa_fury_swipes_debuff.vpcf", context)
	PrecacheUnitByNameSync("aghsfort_ursa_minor", context, -1)
end

--------------------------------------------------------------------------------

function ursa_pf_fury_swipes:GetIntrinsicModifierName()
    return "modifier_ursa_pf_fury_swipes"
end

--------------------------------------------------------------------------------

function ursa_pf_fury_swipes:GetBehavior()
	if self:GetCaster():HasShard("aghsfort_special_ursa_fury_swipes_ursa_minor") then
		return DOTA_ABILITY_BEHAVIOR_NO_TARGET
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function ursa_pf_fury_swipes:GetManaCost(iLevel)
	if self:GetCaster():HasShard("aghsfort_special_ursa_fury_swipes_ursa_minor") then
		return self:GetCaster():FindTalentValue("aghsfort_special_ursa_fury_swipes_ursa_minor", "mana_cost")
	end

	return self.BaseClass.GetManaCost(self, iLevel)
end

--------------------------------------------------------------------------------

function ursa_pf_fury_swipes:GetCooldown(iLevel)
	if self:GetCaster():HasShard("aghsfort_special_ursa_fury_swipes_ursa_minor") then
		return self:GetCaster():FindTalentValue("aghsfort_special_ursa_fury_swipes_ursa_minor", "cooldown")
	end

	return self.BaseClass.GetCooldown(self, iLevel)
end

--------------------------------------------------------------------------------

function ursa_pf_fury_swipes:OnSpellStart()
	local hCaster = self:GetCaster()
	local nDuration = hCaster:FindTalentValue("aghsfort_special_ursa_fury_swipes_ursa_minor", "duration")

	for i = 0, hCaster:FindTalentValue("aghsfort_special_ursa_fury_swipes_ursa_minor", "cubs") - 1 do
		local vLoc = hCaster:GetOrigin() + RandomVector( 165 )

		local hCub = CreateUnitByName("aghsfort_ursa_minor", vLoc, true, nil, nil, DOTA_TEAM_GOODGUYS)
		hCub:AddNewModifier(hCaster, self, "modifier_ursa_pf_fury_swipes_minor", {duration = nDuration})
		hCub:AddNewModifier(hCaster, self, "modifier_kill", {duration = nDuration})

		FindClearSpaceForUnit(hCub, hCub:GetOrigin(), false)				
	end
end

--------------------------------------------------------------------------------

modifier_ursa_pf_fury_swipes = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes:IsPurgable()	return false end
function modifier_ursa_pf_fury_swipes:IsHidden()	return true end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes:OnCreated(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nDuration = hAbility:GetSpecialValueFor("bonus_reset_time")
	self.nDamagePerStack = hAbility:GetSpecialValueFor("damage_per_stack")
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes:OnRefresh(kv)
	self:OnCreated(kv)
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
		MODIFIER_EVENT_ON_TAKEDAMAGE
	}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes:GetModifierProcAttack_BonusDamage_Physical(event)
	if IsClient() or event.attacker ~= self:GetParent() then return 0 end

	local hAttacker = event.attacker
	local hTarget = event.target
	local hAbility = self:GetAbility()

	if hAttacker:PassivesDisabled() or not hTarget or hTarget:IsBuilding() or hTarget:IsOther() or hTarget:GetTeam() == hAttacker:GetTeam() then
		return 0
	end

	local hMod = hTarget:AddNewModifier(hAttacker, hAbility, "modifier_ursa_pf_fury_swipes_damage_increase", {duration = self.nDuration})

	return hMod:GetStackCount() * self.nDamagePerStack
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes:OnTakeDamage(event)
	if IsClient() or event.attacker ~= self:GetParent() or not self:GetCaster():HasShard("aghsfort_special_ursa_fury_swipes_lifesteal") then return end
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()
	local hUnit = event.unit
	local nCategory = event.damage_category
	local nFlags = event.damage_flags

	if not hUnit:HasModifier("modifier_ursa_pf_fury_swipes_damage_increase") then return end

	if bit.band(nFlags, DOTA_DAMAGE_FLAG_REFLECTION ) == DOTA_DAMAGE_FLAG_REFLECTION or (bit.band(nFlags, DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL ) == DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL and nCategory == 0) then
		return
	end

	local nHealValue = (hUnit:GetModifierStackCount("modifier_ursa_pf_fury_swipes_damage_increase", hCaster) * hCaster:FindTalentValue("aghsfort_special_ursa_fury_swipes_lifesteal", "value") / 100) * event.damage

	hCaster:HealWithParams(nHealValue, hAbility, nCategory == 1, true, hCaster, nCategory == 0)

	if nCategory == 0 then
		ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster))
	else
		ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster))
	end
end

--------------------------------------------------------------------------------

modifier_ursa_pf_fury_swipes_damage_increase = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:OnCreated()
	local hAbility = self:GetAbility()

	self.nDamagePerStack = hAbility:GetSpecialValueFor("damage_per_stack")
	self.nMaxStacks = hAbility:GetSpecialValueFor("max_swipe_stack")
	
	if IsClient() then return end
	self:SetStackCount(1)
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:OnRefresh()
	local hAbility = self:GetAbility()

	self.nDamagePerStack = hAbility:GetSpecialValueFor("damage_per_stack")
	self.nMaxStacks = hAbility:GetSpecialValueFor("max_swipe_stack")

	if IsClient() then return end
	self:SetStackCount(math.min(self:GetStackCount() + 1, self.nMaxStacks))
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_TOOLTIP,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
	}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:OnTooltip()
	return self.nDamagePerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:GetModifierPhysicalArmorBonus()
	if self:GetCaster():HasShard("aghsfort_special_ursa_fury_swipes_armor_reduction") then
		return -self:GetStackCount()
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:GetEffectName()
	return "particles/units/heroes/hero_ursa/ursa_fury_swipes_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_damage_increase:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

modifier_ursa_pf_fury_swipes_minor = class({})

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_minor:IsHidden() 		return true end
function modifier_ursa_pf_fury_swipes_minor:IsPurgable() 	return false end
function modifier_ursa_pf_fury_swipes_minor:RemoveOnDeath()	return false end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_minor:OnCreated()
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nDuration = hAbility:GetSpecialValueFor("bonus_reset_time")
	self.nDamagePerStack = hAbility:GetSpecialValueFor("damage_per_stack") * self:GetCaster():FindTalentValue("aghsfort_special_ursa_fury_swipes_ursa_minor", "cub_swipes_modifier") / 100
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_minor:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_minor:DeclareFunctions()
	return {MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL}
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_fury_swipes_minor:GetModifierProcAttack_BonusDamage_Physical(event)
	if IsClient() or event.attacker ~= self:GetParent() then return 0 end

	local hAttacker = event.attacker
	local hTarget = event.target
	local hAbility = self:GetAbility()

	if not hTarget or hTarget:IsBuilding() or hTarget:IsOther() or hTarget:GetTeam() == hAttacker:GetTeam() then
		return 0
	end

	local hMod = hTarget:AddNewModifier(self:GetCaster(), hAbility, "modifier_ursa_pf_fury_swipes_damage_increase", {duration = self.nDuration})

	return hMod:GetStackCount() * self.nDamagePerStack
end
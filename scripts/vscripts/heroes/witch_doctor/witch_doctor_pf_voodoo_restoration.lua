LinkLuaModifier("modifier_pf_voodoo_restoration_aura", 			"heroes/witch_doctor/witch_doctor_pf_voodoo_restoration", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_voodoo_restoration_heal", 			"heroes/witch_doctor/witch_doctor_pf_voodoo_restoration", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_voodoo_restoration_damage", 		"heroes/witch_doctor/witch_doctor_pf_voodoo_restoration", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_voodoo_restoration_aura_amp", 		"heroes/witch_doctor/witch_doctor_pf_voodoo_restoration", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_voodoo_restoration_damage_amp", 	"heroes/witch_doctor/witch_doctor_pf_voodoo_restoration", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

witch_doctor_pf_voodoo_restoration = class({})

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_voodoo_restoration.vpcf", context)
end

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_voodoo_restoration.vpcf")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:OnToggle()
	if self:GetToggleState() then
		self:ToggleOn()
	else
		self:ToggleOff()
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:ToggleOn()
	print(ParticleManager:GetParticleReplacement("witch_doctor_voodoo_restoration", self:GetCaster()))
	local hCaster = self:GetCaster()

	hCaster:AddNewModifier(hCaster, self, "modifier_pf_voodoo_restoration_aura", {})
	hCaster:EmitSound("Hero_WitchDoctor.Voodoo_Restoration")
	hCaster:EmitSound("Hero_WitchDoctor.Voodoo_Restoration.Loop")

	if hCaster:HasShard("aghsfort_special_witch_doctor_voodoo_restoration_damage_amp") then
		hCaster:AddNewModifier(hCaster, self, "modifier_pf_voodoo_restoration_aura_amp", {})
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_voodoo_restoration:ToggleOff()
	local hCaster = self:GetCaster()

	hCaster:RemoveModifierByName("modifier_pf_voodoo_restoration_aura")
	hCaster:RemoveModifierByName("modifier_pf_voodoo_restoration_aura_amp")
	hCaster:EmitSound("Hero_WitchDoctor.Voodoo_Restoration.Off")
	hCaster:StopSound("Hero_WitchDoctor.Voodoo_Restoration.Loop")
end

--------------------------------------------------------------------------------

modifier_pf_voodoo_restoration_aura = class({})

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_aura:IsHidden()				return true end
function modifier_pf_voodoo_restoration_aura:IsPurgable() 			return false end
function modifier_pf_voodoo_restoration_aura:IsAura()				return true end
function modifier_pf_voodoo_restoration_aura:GetAuraRadius()		return self.nRadius end
function modifier_pf_voodoo_restoration_aura:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_pf_voodoo_restoration_aura:GetModifierAura()		return self.sAuraModifier end

function modifier_pf_voodoo_restoration_aura:GetAuraSearchTeam()
	local hAbility = self:GetAbility()
	local nTargetTeam = DOTA_UNIT_TARGET_TEAM_FRIENDLY

	if hAbility:GetSpecialValueFor("does_damage") > 0 then
		nTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY

		if hAbility:GetSpecialValueFor("does_heal") > 0 then
			nTargetTeam = DOTA_UNIT_TARGET_TEAM_BOTH
		end
	end

	return nTargetTeam
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_aura:GetAuraEntityReject(hEntity)
	self.sAuraModifier = hEntity:GetTeamNumber() == self:GetCaster():GetTeamNumber() and "modifier_pf_voodoo_restoration_heal" or "modifier_pf_voodoo_restoration_damage"
	return false
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_aura:OnCreated()
	if not IsServer() then return end
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	local nInterval = hAbility:GetSpecialValueFor("heal_interval")
	self.nRadius = hAbility:GetSpecialValueFor("radius")
	self.nManaPerTick = hAbility:GetSpecialValueFor("mana_per_second") * nInterval

	local nVoodooRestorationFX = ParticleManager:CreateParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_voodoo_restoration.vpcf", PATTACH_POINT_FOLLOW, hCaster)
	ParticleManager:SetParticleControl(nVoodooRestorationFX, 1, Vector(self.nRadius, 0, 0))
	ParticleManager:SetParticleControlEnt(nVoodooRestorationFX, 2, hCaster, PATTACH_POINT_FOLLOW, "attach_staff", hCaster:GetAbsOrigin(), true)
	self:AddParticle(nVoodooRestorationFX, false, false, -1, false, false)

	self:StartIntervalThink(nInterval)
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_aura:OnIntervalThink()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	if not hCaster:IsInvulnerable() and not hCaster:IsOutOfGame() then
		hCaster:SpendMana(self.nManaPerTick, hAbility)

		if hCaster:GetMana() < 0.1 then
			hAbility:ToggleAbility()
		end
	end
end

--------------------------------------------------------------------------------

modifier_pf_voodoo_restoration_heal = class({})

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_heal:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_heal:OnCreated()
	if not IsServer() then return end
	local hAbility = self:GetAbility()

	self.nInterval = hAbility:GetSpecialValueFor("heal_interval")
	self.nHealPerTick = hAbility:GetSpecialValueFor("heal") * self.nInterval

	self:StartIntervalThink(self.nInterval)	
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_heal:OnIntervalThink()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()

	if hParent:GetHealthPercent() < 100 then
		local nTalentHeal = (hCaster:FindTalentValue("special_bonus_unique_witch_doctor_2") / 100) * hParent:GetMaxHealth() * self.nInterval

		hParent:HealWithParams(self.nHealPerTick + nTalentHeal, hAbility, false, true, hCaster, false)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hParent, self.nHealPerTick + nTalentHeal, hCaster)
	end
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_heal:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_EVENT_ON_TAKEDAMAGE
	}
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_heal:OnAttackLanded( event )
	if not IsServer() then return end
	local hCaster = self:GetCaster()
	local hAttacker = event.attacker
	local hTarget = event.target
	local flDamage = event.damage
	local nCategory = event.damage_category
	local hAbility = self:GetAbility()

	if hAttacker ~= self:GetParent() or not hCaster:HasShard("aghsfort_special_witch_doctor_voodoo_restoration_lifesteal") or not hTarget or hAttacker == hTarget then
		return 0
	end

	if nCategory ~= DOTA_DAMAGE_CATEGORY_ATTACK or hTarget:IsBuilding() or hTarget:IsOther() then
		return 0
	end

	local hLegendary = hCaster:FindAbilityByName("aghsfort_special_witch_doctor_voodoo_restoration_lifesteal")
	local nLifestealPct = hLegendary:GetSpecialValueFor("lifesteal_pct")

	hAttacker:HealWithParams(flDamage * nLifestealPct / 100, hAbility, true, false, hCaster, false)
	ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker))
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_heal:OnTakeDamage(event)
	if not IsServer() then return end
	local hCaster = self:GetCaster()
	local hAttacker = event.attacker
	local hTarget = event.unit
	local hAbility = event.inflictor
	local flDamage = event.damage
	local nCategory = event.damage_category
	local nFlags = event.damage_flags

	if hAttacker ~= self:GetParent() or not hCaster:HasShard("aghsfort_special_witch_doctor_voodoo_restoration_lifesteal") or not hTarget or hAttacker == hTarget then
		return 0
	end

	if hTarget:IsBuilding() or hTarget:IsOther() then
		return 0
	end

	if bit.band(nFlags, DOTA_DAMAGE_FLAG_REFLECTION ) == DOTA_DAMAGE_FLAG_REFLECTION or bit.band(nFlags, DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL ) == DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL then
		return 0
	end

	if nCategory ~= DOTA_DAMAGE_CATEGORY_SPELL then
		return 0
	end
	
	local hLegendary = hCaster:FindAbilityByName("aghsfort_special_witch_doctor_voodoo_restoration_lifesteal")
	local nSpellLifestealPct = hLegendary:GetSpecialValueFor("spell_lifesteal_pct")

	local flHeal = math.max(flDamage, 0) * (nSpellLifestealPct / 100)

	hAttacker:HealWithParams(flHeal, self:GetAbility(), false, false, hCaster, true)
	ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker))
end

--------------------------------------------------------------------------------

modifier_pf_voodoo_restoration_damage = class({})

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage:OnCreated()
	if not IsServer() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	local nInterval = hAbility:GetSpecialValueFor("heal_interval")

	self.damageTable = {
		attacker = self:GetCaster(),
		victim = hParent,
		damage = hAbility:GetSpecialValueFor("heal") * nInterval,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility()
	}

	self.nSelfHealPct = hAbility:GetSpecialValueFor("self_only_heal_percentage") / 100

	self.nCasterHeal = hAbility:GetSpecialValueFor("heal") * nInterval

	if not hParent:IsBoss() and not hParent:IsBossCreature() and not hParent.bIsBoss then
		local nTalentDamage = (self:GetCaster():FindTalentValue("special_bonus_unique_witch_doctor_2") / 100) * hParent:GetMaxHealth() * nInterval
		self.damageTable.damage = self.damageTable.damage + nTalentDamage

		local nTalentHeal = (self:GetCaster():FindTalentValue("special_bonus_unique_witch_doctor_2") / 100) * self:GetCaster():GetMaxHealth() * nInterval

		self.nCasterHeal = self.nCasterHeal + nTalentHeal
	end	

	self.nCasterHeal = self.nCasterHeal * self.nSelfHealPct
	self.nTickTime = nInterval
	hAbility.nLastCasterTick = GameRules:GetDOTATime(true, true)
	self:StartIntervalThink(nInterval)
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage:OnIntervalThink()
	ApplyDamage(self.damageTable)

	if self:GetAbility().nLastCasterTick + self.nTickTime < GameRules:GetDOTATime(true, true) and self.nSelfHealPct > 0 and not self:GetCaster():HasShard("special_bonus_unique_witch_doctor_voodoo_restoration_ally_heal") then
		local hCaster = self:GetCaster()
		local hAbility = self:GetAbility()

		hCaster:HealWithParams(self.nCasterHeal, self:GetAbility(), false, true, hCaster, false)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hCaster, self.nCasterHeal, hCaster)

		hAbility.nLastCasterTick = GameRules:GetDOTATime(true, true)
	end
end

--------------------------------------------------------------------------------

modifier_pf_voodoo_restoration_aura_amp = class({})

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_aura_amp:IsHidden()				return true end
function modifier_pf_voodoo_restoration_aura_amp:IsPurgable() 			return false end
function modifier_pf_voodoo_restoration_aura_amp:IsAura()				return true end
function modifier_pf_voodoo_restoration_aura_amp:GetAuraRadius()		return self.nRadius end
function modifier_pf_voodoo_restoration_aura_amp:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_pf_voodoo_restoration_aura_amp:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_pf_voodoo_restoration_aura_amp:GetModifierAura()		return "modifier_pf_voodoo_restoration_damage_amp" end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_aura_amp:OnCreated()
	if not IsServer() then return end
	local hCaster = self:GetCaster()

	self.nRadius = self:GetAbility():GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

modifier_pf_voodoo_restoration_damage_amp = class({})

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage_amp:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage_amp:OnCreated()
	self.nDamageAmp = self:GetCaster():FindTalentValue("aghsfort_special_witch_doctor_voodoo_restoration_damage_amp")
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage_amp:DeclareFunctions()
	return {MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_pf_voodoo_restoration_damage_amp:GetModifierIncomingDamage_Percentage(event)
	return self.nDamageAmp
end
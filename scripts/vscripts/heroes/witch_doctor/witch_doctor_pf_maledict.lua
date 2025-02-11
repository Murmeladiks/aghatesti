LinkLuaModifier("modifier_pf_maledict", 		"heroes/witch_doctor/witch_doctor_pf_maledict", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_maledict_dot", 	"heroes/witch_doctor/witch_doctor_pf_maledict", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_maledict_ally", 	"heroes/witch_doctor/witch_doctor_pf_maledict", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

witch_doctor_pf_maledict = class({})

--------------------------------------------------------------------------------

function witch_doctor_pf_maledict:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_maledict.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_maledict_aoe.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_witch_doctor/witch_doctor_maledict_aoe_damage.vpcf", context)
end

--------------------------------------------------------------------------------

function witch_doctor_pf_maledict:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_maledict.vpcf")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_maledict:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_maledict:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPos =  self:GetCursorPosition()
	local nDuration = self:GetDuration()
	local nRadius = self:GetSpecialValueFor("radius")
	local bSuccess = false

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vPos, nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, self, "modifier_pf_maledict", {duration = nDuration})
		hEnemy:AddNewModifier(hCaster, self, "modifier_pf_maledict_dot", {duration = nDuration})
		bSuccess = true
	end

	if hCaster:HasShard("aghsfort_special_witch_doctor_maledict_affects_allies") then
		local hAllies = FindUnitsInRadius(hCaster:GetTeamNumber(), vPos, nil, nRadius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
		for _, hAlly in pairs(hAllies) do
			hAlly:AddNewModifier(hCaster, self, "modifier_pf_maledict_ally", {duration = nDuration})
			hAlly:AddNewModifier(hCaster, self, "modifier_pf_maledict_dot", {duration = nDuration})
			bSuccess = true
		end
	end
	
	local nMaledictAOEFx = ParticleManager:CreateParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_maledict_aoe.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nMaledictAOEFx, 0, vPos)
	ParticleManager:SetParticleControl(nMaledictAOEFx, 1, Vector(nRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nMaledictAOEFx)

	EmitSoundOnLocationWithCaster(vPos, bSuccess and "Hero_WitchDoctor.Maledict_Cast" or "Hero_WitchDoctor.Maledict_CastFail", hCaster)
end

--------------------------------------------------------------------------------

modifier_pf_maledict = class({})

--------------------------------------------------------------------------------

function modifier_pf_maledict:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_maledict:OnCreated()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local nInterval = self:GetDuration() / hAbility:GetSpecialValueFor("ticks") - FrameTime()
	
	self.nDamagePct = hAbility:GetSpecialValueFor("bonus_damage") / 100
	self.nMaxDamage = hAbility:GetSpecialValueFor("max_bonus_damage")
	self.nStartingHealth = hParent:GetHealth()
	
	if not IsServer() then return end
	local nMaledictFX = ParticleManager:CreateParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_maledict.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControl(nMaledictFX, 1, Vector(nInterval, 0, 0))
	self:AddParticle(nMaledictFX, false, false, -1, false, false)

	hParent:EmitSound("Hero_WitchDoctor.Maledict_Loop")

	self.damageInfo = {
		attacker = self:GetCaster(),
		victim = hParent,
		damage = 1,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(nInterval)	
end

--------------------------------------------------------------------------------

function modifier_pf_maledict:OnDestroy()
	if not IsServer() then return end
	self:GetParent():StopSound("Hero_WitchDoctor.Maledict_Loop")
end

--------------------------------------------------------------------------------

function modifier_pf_maledict:OnIntervalThink()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local nCurrentHealth = hParent:GetHealth()

	self.damageInfo.damage = math.min(math.ceil(math.max(1, self.nStartingHealth - nCurrentHealth) * self.nDamagePct), self.nMaxDamage)
	self.damageInfo.victim = hParent

	if hCaster:HasShard("aghsfort_special_witch_doctor_maledict_aoe_procs") then
		self:DealAreaDamage()
	else
		ApplyDamage(self.damageInfo)
	end

	SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, hParent, self.damageInfo.damage, hCaster:GetPlayerOwner())
	hParent:EmitSound("Hero_WitchDoctor.Maledict_Tick")

	if hCaster:HasShard("aghsfort_special_witch_doctor_maledict_death_restoration") then
		local nHeal = math.floor(self.damageInfo.damage * hCaster:FindTalentValue("aghsfort_special_witch_doctor_maledict_death_restoration") / 100)
		hCaster:HealWithParams(nHeal, self:GetAbility(), false, true, hCaster, false)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hCaster, nHeal, hCaster:GetPlayerOwner())
	end

	if hCaster:HasShard("aghsfort_special_witch_doctor_maledict_infectious") then
		local hAbility = self:GetAbility()
		local nDuration = hAbility:GetDuration()
		local nRadius = hCaster:FindTalentValue("aghsfort_special_witch_doctor_maledict_infectious")
		local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hParent:GetAbsOrigin(), nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hParent then
				hEnemy:AddNewModifier(hCaster, hAbility, "modifier_pf_maledict", {duration = nDuration})
				hEnemy:AddNewModifier(hCaster, hAbility, "modifier_pf_maledict_dot", {duration = nDuration})
			end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_pf_maledict:DealAreaDamage()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	local vOrigin = hParent:GetAbsOrigin()
	local nRadius = hCaster:FindTalentValue("aghsfort_special_witch_doctor_maledict_aoe_procs")

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vOrigin, nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	for _, hEnemy in pairs(hEnemies) do
		self.damageInfo.victim = hEnemy
		ApplyDamage(self.damageInfo)
	end

	local nAreaDamageFX = ParticleManager:CreateParticle("particles/units/heroes/hero_witch_doctor/witch_doctor_maledict_aoe_damage.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControl(nAreaDamageFX, 1, vOrigin)
	ParticleManager:SetParticleControl(nAreaDamageFX, 2, Vector(nRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nAreaDamageFX)
end

--------------------------------------------------------------------------------

function modifier_pf_maledict:GetStatusEffectName()
	return "particles/status_fx/status_effect_maledict.vpcf"
end

--------------------------------------------------------------------------------

function modifier_pf_maledict:StatusEffectPriority()
	return MODIFIER_PRIORITY_SUPER_ULTRA
end

--------------------------------------------------------------------------------

modifier_pf_maledict_dot = class({})

--------------------------------------------------------------------------------

function modifier_pf_maledict_dot:IsHidden()	return true end
function modifier_pf_maledict_dot:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_maledict_dot:OnCreated()
	if not IsServer() then return end
	local hAbility = self:GetAbility()
	self.bAlly = self:GetParent():GetTeam() == self:GetCaster():GetTeam()

	local nInterval = 0.5

	self.damageInfo = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = hAbility:GetAbilityDamage() * nInterval,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}
	
	self:OnIntervalThink()
	self:StartIntervalThink(nInterval)	
end

--------------------------------------------------------------------------------

function modifier_pf_maledict_dot:OnIntervalThink()
	if self.bAlly then
		self:GetParent():HealWithParams(self.damageInfo.damage, self:GetAbility(), false, true, self:GetCaster(), false)
	else
		ApplyDamage(self.damageInfo)
	end
end

--------------------------------------------------------------------------------

modifier_pf_maledict_ally = class({})

--------------------------------------------------------------------------------

function modifier_pf_maledict_ally:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_maledict_ally:OnCreated()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local nInterval = self:GetDuration() / hAbility:GetSpecialValueFor("ticks") - FrameTime()
	
	self.nDamagePct = hAbility:GetSpecialValueFor("bonus_damage") / 100
	self.nMaxDamage = hAbility:GetSpecialValueFor("max_bonus_damage")
	self.nStartingHealth = hParent:GetHealth()
	
	if not IsServer() then return end
	local nMaledictFX = ParticleManager:CreateParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_maledict.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControl(nMaledictFX, 1, Vector(nInterval, 0, 0))
	self:AddParticle(nMaledictFX, false, false, -1, false, false)

	hParent:EmitSound("Hero_WitchDoctor.Maledict_Loop")

	self:StartIntervalThink(nInterval)	
end

--------------------------------------------------------------------------------

function modifier_pf_maledict_ally:OnDestroy()
	if not IsServer() then return end
	self:GetParent():StopSound("Hero_WitchDoctor.Maledict_Loop")
end

--------------------------------------------------------------------------------

function modifier_pf_maledict_ally:OnIntervalThink()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local nCurrentHealth = hParent:GetHealth()
	local nHeal = math.min(math.ceil(math.max(1, self.nStartingHealth - nCurrentHealth) * self.nDamagePct), self.nMaxDamage)

	hParent:HealWithParams(nHeal, self:GetAbility(), false, true, hCaster, false)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hParent, nHeal, hParent:GetPlayerOwner())
	
	hParent:EmitSound("Hero_WitchDoctor.Maledict_Tick")
end

--------------------------------------------------------------------------------

function modifier_pf_maledict_ally:GetStatusEffectName()
	return "particles/status_fx/status_effect_maledict.vpcf"
end

--------------------------------------------------------------------------------

function modifier_pf_maledict_ally:StatusEffectPriority()
	return MODIFIER_PRIORITY_SUPER_ULTRA
end
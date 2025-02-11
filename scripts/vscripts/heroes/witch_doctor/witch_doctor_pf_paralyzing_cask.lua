LinkLuaModifier("modifier_witch_doctor_pf_paralyzing_cask_attack_procs", "heroes/witch_doctor/witch_doctor_pf_paralyzing_cask", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

witch_doctor_pf_paralyzing_cask = class({})

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_cask.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_witch_doctor/witch_doctor_paralyzing_cask_aoe_damage.vpcf", context)
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_cask.vpcf")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:GetIntrinsicModifierName()
	return "modifier_witch_doctor_pf_paralyzing_cask_attack_procs"
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget =  self:GetCursorTarget()
	local nBounces = self:GetSpecialValueFor("bounces")

	hCaster:EmitSound("Hero_WitchDoctor.Paralyzing_Cask_Cast")

	self:LaunchSkull(hCaster, hTarget, nBounces, true, nBounces)

	if hCaster:HasShard("aghsfort_special_witch_doctor_paralyzing_cask_multicask") then
		self:MultiCask(hTarget)
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:LaunchSkull(hSource, hTarget, nBounces, bMain, nOriginalBounces)
	if not hTarget then
		return 0
	end
	
	local hSkullProjectile = {
		EffectName = "particles/units/heroes/hero_witchdoctor/witchdoctor_cask.vpcf",
		Ability = self,
		Source = hSource,
		bProvidesVision = false,
		Target = hTarget,
		iMoveSpeed = self:GetSpecialValueFor("speed"),
		bDodgeable = false,
		bReplaceExisting = false,
		iSourceAttachment = bMain and DOTA_PROJECTILE_ATTACHMENT_ATTACK_1 or DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		ExtraData = {
			nBounces = nBounces,
			nOriginalBounces = nOriginalBounces
		}
	}

	ProjectileManager:CreateTrackingProjectile(hSkullProjectile)
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:MultiCask(hOriginalTarget)
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetAbsOrigin()
	local nBounces = self:GetSpecialValueFor("bounces")
	
	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vOrigin, nil, self:GetEffectiveCastRange(vOrigin, hCaster), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)
	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hOriginalTarget then
			self:LaunchSkull(hCaster, hEnemy, nBounces, true, nBounces)
			break
		end
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:OnProjectileHit_ExtraData(hTarget, vLocation, hExtra)
	local hCaster = self:GetCaster()
	local nDuration = self:GetSpecialValueFor("stun_duration")
	local nBounces = hExtra.nBounces
	local nOriginalBounces = hExtra.nOriginalBounces
	local bBounced = false

	local nBounceDamage = self:GetSpecialValueFor("bounce_bonus_damage") * (nOriginalBounces - nBounces)

	local hDamageTable = {
		victim = hTarget,
		attacker = hCaster,
		damage = self:GetSpecialValueFor("base_damage") + nBounceDamage,
		damage_type = self:GetAbilityDamageType(),
		ability = self
	}

	if not hTarget:TriggerSpellAbsorb(self) then
		ApplyDamage(hDamageTable)
		hTarget:AddNewModifier(hCaster, self, "modifier_stunned", {duration = nDuration * (1 - hTarget:GetStatusResistance())})
		EmitSoundOn("Hero_WitchDoctor.Paralyzing_Cask_Bounce", hTarget)

		if hCaster:HasShard("aghsfort_special_witch_doctor_paralyzing_cask_applies_maledict") then
			self:ApplyMaledict(hTarget)
		end
	end

	if hCaster:HasShard("aghsfort_special_witch_doctor_paralyzing_cask_aoe_damage") then
		local nRadius = hCaster:FindTalentValue("aghsfort_special_witch_doctor_paralyzing_cask_aoe_damage")
		local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hTarget:GetAbsOrigin(), nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				hDamageTable.victim = hEnemy
				ApplyDamage(hDamageTable)
			end
		end

		local nAreaDamageFX = ParticleManager:CreateParticle("particles/units/heroes/hero_witch_doctor/witch_doctor_paralyzing_cask_aoe_damage.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
		ParticleManager:SetParticleControl(nAreaDamageFX, 1, hTarget:GetAbsOrigin())
		ParticleManager:SetParticleControl(nAreaDamageFX, 2, Vector(nRadius, 0, 0))
		ParticleManager:ReleaseParticleIndex(nAreaDamageFX)
	end

	if nBounces == 0 then
		return
	end

	hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hTarget:GetAbsOrigin(), nil, self:GetSpecialValueFor("bounce_range"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)
	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			Timers:CreateTimer(
				self:GetSpecialValueFor("bounce_delay"), function() self:LaunchSkull(hTarget, hEnemy, nBounces - 1, false, nOriginalBounces)
			end)
			break
		end
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_paralyzing_cask:ApplyMaledict(hTarget)
	local hCaster = self:GetCaster()
	local hMaledict = hCaster:FindAbilityByName("witch_doctor_pf_maledict")

	if hMaledict and hMaledict:IsTrained() then
		local nDuration = hMaledict:GetDuration()

		hTarget:AddNewModifier(hCaster, hMaledict, "modifier_pf_maledict", {duration = nDuration})
		hTarget:AddNewModifier(hCaster, hMaledict, "modifier_pf_maledict_dot", {duration = nDuration})
	end
end

-------------------------------------------

modifier_witch_doctor_pf_paralyzing_cask_attack_procs = class({})

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_paralyzing_cask_attack_procs:IsHidden() 	return true end
function modifier_witch_doctor_pf_paralyzing_cask_attack_procs:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_paralyzing_cask_attack_procs:OnCreated()
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()

	if not IsServer() then return end
	self:StartIntervalThink(2)
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_paralyzing_cask_attack_procs:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ATTACK}
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_paralyzing_cask_attack_procs:OnAttack(event)
	if not IsServer() then return end
	if event.attacker ~= self:GetParent() or not self:GetCaster():HasShard("aghsfort_special_witch_doctor_paralyzing_cask_attack_procs") or event.target:IsBuilding() then
		return
	end

	if self.nLastProc and GameRules:GetGameTime() - self.nLastProc < 0.1 then
		return
	end

	local hAttacker = event.attacker
	local hAbility = self:GetAbility()
	local nBounces = hAbility:GetSpecialValueFor("bounces")

	if RollPseudoRandomPercentage(hAttacker:FindTalentValue("aghsfort_special_witch_doctor_paralyzing_cask_attack_procs"), DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, hAttacker) then
		self.nLastProc = GameRules:GetGameTime()
		hAbility:LaunchSkull(hAttacker, event.target, nBounces, true, nBounces)
	end
end
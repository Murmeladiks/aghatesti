queenofpain_pf_scream_of_pain = class({})

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_scream_of_pain.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_scream_of_pain_owner.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_scream_of_pain_restore.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queenofpain_scream_managain.vpcf", context )
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:OnSpellStart()
	self:SendScreams(self:GetCaster())
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("area_of_effect")
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:SendScreams(hSource, nDamagePct)
	local hCaster = self:GetCaster()

	local hScreamProjectile = {
		Target = nil,
		Source = hSource,
		Ability = self,	
		EffectName = "particles/units/heroes/hero_queenofpain/queen_scream_of_pain.vpcf",
		iMoveSpeed = self:GetSpecialValueFor( "projectile_speed" ),
		bReplaceExisting = false,
		bProvidesVision = false,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		bDodgeable = false,
		ExtraData = {
			nDamagePct = nDamagePct
		}
	}

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hSource:GetAbsOrigin(), nil, self:GetSpecialValueFor("area_of_effect"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )

	for _, hEnemy in pairs(hEnemies) do
		hScreamProjectile.Target = hEnemy
		ProjectileManager:CreateTrackingProjectile(hScreamProjectile)
	end
	local sSound = hSource == hCaster and "Hero_QueenOfPain.ScreamOfPain" or "Hero_QueenOfPain.ScreamOfPainShard"
	EmitSoundOnLocationWithCaster(hSource:GetOrigin(), sSound, hCaster)

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_queenofpain/queen_scream_of_pain_owner.vpcf", PATTACH_ABSORIGIN_FOLLOW, hSource)
	)
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:OnProjectileHit_ExtraData(hTarget, vLocation, hExtra)
	if not hTarget then return end

	local hCaster = self:GetCaster()

	if hCaster == hTarget then
		self:ShriekRestore(hExtra.nValue)
		return
	end

	local nMultiplier = hExtra.nDamagePct and (hExtra.nDamagePct / 100) or 1
	local nStunDuration = self:GetSpecialValueFor("stun_duration")
		
	ApplyDamage({
		attacker = hCaster,
		victim = hTarget,
		damage = self:GetSpecialValueFor("damage") * nMultiplier,
		damage_type = self:GetAbilityDamageType(),
		ability = self
	})
	
	if nStunDuration > 0 then
		hTarget:AddNewModifier(hCaster, self, "modifier_stunned", {duration = nStunDuration * (1 - hTarget:GetStatusResistance())})
	end

	if hCaster:HasShard("aghsfort_special_queenofpain_scream_of_pain_resets_blink") and not hTarget:IsAlive() then
		hCaster:FindAbilityByName("queenofpain_pf_blink"):EndCooldown()
	end

	if hCaster:HasShard("aghsfort_special_queenofpain_scream_of_pain_restores_caster") then
		self:SendRestoringShriek(self:GetSpecialValueFor("damage") * nMultiplier, hTarget)
	end

	if hCaster:HasShard("aghsfort_special_queenofpain_scream_of_pain_knockback") then
		self:KnockbackShard(hTarget)
	end
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:SendRestoringShriek(nValue, hSource)
	ProjectileManager:CreateTrackingProjectile({
		Target = self:GetCaster(),
		Source = hSource,
		Ability = self,	
		EffectName = "particles/units/heroes/hero_queenofpain/queen_scream_of_pain_restore.vpcf",
		iMoveSpeed = self:GetSpecialValueFor( "projectile_speed" ),
		bReplaceExisting = false,
		bProvidesVision = false,
		bDodgeable = false,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		ExtraData = {
			nValue = nValue
		}
	})
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:ShriekRestore(nValue)
	local hCaster = self:GetCaster()
	local nPercent = hCaster:FindTalentValue("aghsfort_special_queenofpain_scream_of_pain_restores_caster", "value") / 100

	hCaster:HealWithParams(nValue * nPercent, self, false, false, hCaster, true)
	hCaster:GiveMana(self:GetManaCost(self:GetLevel()) * nPercent)

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	)

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_queenofpain/queenofpain_scream_managain.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	)
end

--------------------------------------------------------------------------------

function queenofpain_pf_scream_of_pain:KnockbackShard(hTarget)
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetOrigin()
	local nSpeed = hCaster:FindTalentValue("aghsfort_special_queenofpain_scream_of_pain_knockback", "knockback_speed")

	local nCurrentDistance = (hTarget:GetOrigin() - vOrigin):Length2D()
	local nMaxDistance = self:GetEffectiveCastRange(vOrigin, hTarget)

	local nDistanceToCross = nMaxDistance - nCurrentDistance

	local nDuration = (nDistanceToCross / nSpeed) * (1 - hTarget:GetStatusResistance())

	hTarget:AddNewModifier(
		hCaster, 
		self, 
		"modifier_knockback", 
		{
			center_x = vOrigin.x,
			center_y = vOrigin.y,
			center_z = vOrigin.z,
			should_stun = false, 
			duration = nDuration,
			knockback_duration = nDuration,
			knockback_distance = nDistanceToCross,
			knockback_height = 0,
		}
	)

	local hSonicAbility = hCaster:FindAbilityByName("queenofpain_pf_sonic_wave")
	if not hSonicAbility or not hSonicAbility:IsTrained() or hSonicAbility:IsCooldownReady() then return end

	local nCooldown = hSonicAbility:GetCooldownTimeRemaining()
	hSonicAbility:EndCooldown()
	hSonicAbility:StartCooldown(nCooldown - hCaster:FindTalentValue("aghsfort_special_queenofpain_scream_of_pain_knockback", "sonic_wave_cd_reduction"))
end
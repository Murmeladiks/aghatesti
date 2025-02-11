LinkLuaModifier("modifier_witch_doctor_pf_death_ward_no_channel", 		"heroes/witch_doctor/witch_doctor_pf_death_ward_no_channel", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

witch_doctor_pf_death_ward_no_channel = class({})

--------------------------------------------------------------------------------

function witch_doctor_pf_death_ward_no_channel:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_ward_skull.vpcf", context)
    PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_ward_attack.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_ward_cast_staff_fire.vpcf", context)
end

--------------------------------------------------------------------------------

function witch_doctor_pf_death_ward_no_channel:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_witchdoctor/witchdoctor_ward_attack.vpcf")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_death_ward_no_channel:OnSpellStart()
	local hCaster = self:GetCaster()

	self:CreateWard(self:GetCursorPosition())

	if hCaster:HasShard("aghsfort_special_witch_doctor_death_ward_damage_resist") then
		hCaster:AddNewModifier(hCaster, self, "modifier_witch_doctor_pf_death_ward_resist", {duration = self:GetDuration()})
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_death_ward_no_channel:CreateWard(vPosition)
	local hCaster = self:GetCaster()
	local nAttackDamage = self:GetSpecialValueFor("damage")
	local nKillAfter = self:GetDuration()

	local hDeathWard = CreateUnitByName("npc_dota_witch_doctor_death_ward_pf", vPosition, true, hCaster, hCaster, hCaster:GetTeam())

	hDeathWard:SetBaseDamageMin(nAttackDamage)
	hDeathWard:SetBaseDamageMax(nAttackDamage)
	hDeathWard:SetOwner(hCaster)
	hDeathWard:SetControllableByPlayer(hCaster:GetPlayerID(), true)
	hDeathWard:AddNewModifier(hCaster, self, "modifier_phased", {})
	
	self.hWardModifier = hDeathWard:AddNewModifier(hCaster, self, "modifier_witch_doctor_pf_death_ward_no_channel", {nKillAfter = nKillAfter})

	hDeathWard:EmitSound("Hero_WitchDoctor.Death_WardBuild")
end

--------------------------------------------------------------------------------

function witch_doctor_pf_death_ward_no_channel:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not hTarget then
		return 0
	end
	
	local hWard = EntIndexToHScript(ExtraData.hWard)
	local hWardMod = hWard:FindModifierByName("modifier_witch_doctor_pf_death_ward_no_channel")

	hWardMod.bSilent = true
	hWard:PerformAttack(hTarget, false, true, true, false, false, false, false)
	hWardMod.bSilent = false
	
	EmitSoundOn("Hero_WitchDoctor_Ward.ProjectileImpact", hTarget)

	if ExtraData.nBounces > 0 then
		self:CreateBounceAttack(hTarget, ExtraData, false)
	end
end

--------------------------------------------------------------------------------

function witch_doctor_pf_death_ward_no_channel:CreateBounceAttack(hOrigin, tData, bFirstStrike, hForcedTarget)
	local hCaster = self:GetCaster()

	if bFirstStrike then
		tData.nBounces = self:GetSpecialValueFor("bounces")
	end

	if hForcedTarget then
		ProjectileManager:CreateTrackingProjectile({
			Target = hForcedTarget,
			Source = hOrigin,
			Ability = self,
			EffectName = "particles/units/heroes/hero_witchdoctor/witchdoctor_ward_attack.vpcf",
			bDodgable = true,
			bProvidesVision = false,
			iMoveSpeed = 1000,
			iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1,
			ExtraData = tData
		})
		return
	end

	tData[tostring(hOrigin:GetEntityIndex())] = 1

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hOrigin:GetAbsOrigin(), nil, self:GetSpecialValueFor("bounce_radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, self:GetAbilityTargetType(), self:GetAbilityTargetFlags(), FIND_CLOSEST, false)
	for _, hEnemy in pairs(hEnemies) do
		if tData[tostring(hEnemy:GetEntityIndex())] ~= 1 and not hEnemy:IsAttackImmune() and tData.nBounces > 0 then
			tData[tostring(hEnemy:GetEntityIndex())] = 1
			tData.nBounces = tData.nBounces - 1

			ProjectileManager:CreateTrackingProjectile({
				Target = hEnemy,
				Source = hOrigin,
				Ability = self,
				EffectName = "particles/units/heroes/hero_witchdoctor/witchdoctor_ward_attack.vpcf",
				bDodgable = true,
				bProvidesVision = false,
				iMoveSpeed = 1000,
				iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
				ExtraData = tData
			})
			break
		end
	end
end

-------------------------------------------

modifier_witch_doctor_pf_death_ward_no_channel = class({})

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:IsHidden() 		return true end
function modifier_witch_doctor_pf_death_ward_no_channel:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:OnCreated(kv)
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	
	self.nAttackRange = hAbility:GetSpecialValueFor("attack_range") - hParent:Script_GetAttackRange()

	if not IsServer() then return end
	self.bDisabled = false
	self.nAttackDamage = hParent:GetAttackDamage()

	self:StartIntervalThink(kv.nKillAfter + FrameTime())
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:OnIntervalThink()
	self:EndWard()
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_EVENT_ON_ATTACK_START,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND
	}
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:CheckState()
	return {
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = self.bDisabled,
		[MODIFIER_STATE_STUNNED] = self.bDisabled,
		[MODIFIER_STATE_CANNOT_MISS] = self.bCannotMiss
	}
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:GetModifierPreAttack_BonusDamage()
	if IsServer() then return -self.nAttackDamage end
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:GetModifierProcAttack_BonusDamage_Pure(event)
	return self.nAttackDamage
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:OnAttackStart(event)
	if not IsServer() then return end
	self.bCannotMiss = RollPercentage(50)
	self.bSilent = event.no_attack_cooldown

	if self:GetCaster():HasShard("aghsfort_special_witch_doctor_death_ward_splitshot") and not self.bDisabled then
		self:SplitShot(event.target)
	end

	if self:GetCaster():GetHeroFacetID() == 3 then
		self:CleftDeath(event)
	end
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:CleftDeath(event)
	if self.bDisabled then return end
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()
	local hPrimaryTarget = event.target

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hParent:GetOrigin(), nil, hParent:Script_GetAttackRange(), DOTA_UNIT_TARGET_TEAM_ENEMY, hAbility:GetAbilityTargetType(), hAbility:GetAbilityTargetFlags(), FIND_CLOSEST, false)
	
	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hPrimaryTarget then
			self:GetAbility():CreateBounceAttack(self:GetParent(), {hWard = self:GetParent():entindex()}, true, hEnemy)
			break
		end
	end
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:OnAttackLanded(event)
	if not IsServer() or event.no_attack_cooldown or event.attacker ~= self:GetParent() then return end
	self:GetAbility():CreateBounceAttack(event.target, {hWard = self:GetParent():entindex()}, true)
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:GetAttackSound(event)
	if self.bSilent then return "" end
end


--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:GetModifierAttackRangeBonus()
	return self.nAttackRange
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:EndWard(vPos)
	local hParent = self:GetParent()

	self.bDisabled = true

	hParent:AddNoDraw()
	hParent:StopSound("Hero_WitchDoctor.Death_WardBuild")

	Timers:CreateTimer(5, function()
		UTIL_Remove(hParent)
	end)
end

--------------------------------------------------------------------------------

function modifier_witch_doctor_pf_death_ward_no_channel:SplitShot(hOriginalTarget)
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	local hLegendary = hCaster:FindAbilityByName("aghsfort_special_witch_doctor_death_ward_splitshot")
	local nShotCount = hLegendary:GetSpecialValueFor("split_shot_count")
	local nBonusRange = hLegendary:GetSpecialValueFor("split_shot_bonus_range")
	local nShotsFired = 0

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hParent:GetAbsOrigin(), nil, hParent:Script_GetAttackRange() + nBonusRange, DOTA_UNIT_TARGET_TEAM_ENEMY, hAbility:GetAbilityTargetType(), hAbility:GetAbilityTargetFlags(), FIND_CLOSEST, false)

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hOriginalTarget then
			hParent:PerformAttack(hEnemy, false, true, true, false, true, false, false)
			nShotsFired = nShotsFired + 1

			if nShotsFired >= nShotCount then break end
		end
	end
end
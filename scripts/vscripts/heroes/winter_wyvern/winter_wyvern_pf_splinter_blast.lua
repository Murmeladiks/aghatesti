LinkLuaModifier("modifier_winter_wyvern_pf_splinter_blast_slow", 	"heroes/winter_wyvern/winter_wyvern_pf_splinter_blast", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_winter_wyvern_pf_splinter_blast_vacuum", 	"heroes/winter_wyvern/winter_wyvern_pf_splinter_blast", LUA_MODIFIER_MOTION_HORIZONTAL)

--------------------------------------------------------------------------------

winter_wyvern_pf_splinter_blast = class({})

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_splinter.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast_heal.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/winter_wyvern_splinter_vacuum.vpcf", context)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:GetAOERadius()
	return self:GetSpecialValueFor("split_radius")
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	return UnitFilter(hTarget, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	return ""
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget =  self:GetCursorTarget()

	hCaster:EmitSound("Hero_Winter_Wyvern.SplinterBlast.Cast")

	self:LaunchSplinter(hCaster, hTarget, true, false, false)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:LaunchSplinter(hSource, hTarget, bMain, bHeal, bReturning, nMultiplier)
	local hCaster = self:GetCaster()

	local sProjectile = "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast.vpcf"
	local nAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
	local nSoundID = -1

	if not nMultiplier then nMultiplier = 100 end

	if bHeal then
		sProjectile = "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast_heal.vpcf"
	end

	if bMain then
		sProjectile = "particles/units/heroes/hero_winter_wyvern/wyvern_splinter.vpcf"
		local hSoundEntity = CreateModifierThinker(hCaster, self, "", {duration = 4}, hSource:GetOrigin(), hCaster:GetTeam(), false)
		hSoundEntity:EmitSound("Hero_Winter_Wyvern.SplinterBlast.Projectile")
		nSoundID = hSoundEntity:entindex()
		nAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
	end

	local nDistance = (hTarget:GetOrigin() - hSource:GetOrigin()):Length2D()
	local nSpeed = self:GetSpecialValueFor("projectile_speed")

	if not bMain then
		nSpeed = self:GetSpecialValueFor("secondary_projectile_speed")
	end
	
	ProjectileManager:CreateTrackingProjectile({
		EffectName = sProjectile,
		Ability = self,
		Source = hSource,
		bProvidesVision = false,
		Target = hTarget,
		iMoveSpeed = nSpeed,
		bDodgeable = (not bMain and not bHeal),
		bReplaceExisting = false,
		iSourceAttachment = nAttachment,
		ExtraData = {
			bMain = bMain,
			bHeal = bHeal,
			nSoundID = nSoundID,
			nSource = hSource:entindex(),
			bReturning = bReturning,
			nMultiplier = nMultiplier
		}
	})
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:OnProjectileHit_ExtraData(hTarget, vLocation, hExtra)
	local hCaster = self:GetCaster()
	local nDuration = self:GetSpecialValueFor("duration")
	local nRadius = self:GetSpecialValueFor("split_radius")
	local bMain = hExtra.bMain == 1
	local bHeal = hExtra.bHeal == 1
	local nMultiplier = hExtra.nMultiplier

	if hExtra.nSoundID and hExtra.nSoundID ~= -1 then
		local hSoundEntity = EntIndexToHScript(hExtra.nSoundID)

		if hSoundEntity and not hSoundEntity:IsNull() then
			hSoundEntity:StopSound("Hero_Winter_Wyvern.SplinterBlast.Projectile")
			UTIL_Remove(hSoundEntity)
		end
	end

	if bMain then
		if hTarget:GetTeam() ~= hCaster:GetTeam() and hTarget:TriggerSpellAbsorb(self) then return end
		hTarget:EmitSound("Hero_Winter_Wyvern.SplinterBlast.Target")
		self:Splinter(hTarget)
		return
	end

	hTarget:EmitSound("Hero_Winter_Wyvern.SplinterBlast.Splinter")

	if bHeal then
		local nHealValue = self:GetSpecialValueFor("splinter_damage") * hCaster:FindTalentValue("aghsfort_special_winter_wyvern_splinter_blast_heal", "value") / 100
		nHealValue = nHealValue * nMultiplier / 100
		hTarget:HealWithParams(nHealValue, self, false, true, hCaster, false)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hTarget, nHealValue, hCaster)
		self:ReturnToSender(hTarget, bMain, hExtra)
		return
	end

	local nDamage = self:GetSpecialValueFor("splinter_damage")

	if hExtra.bReturning and hExtra.bReturning == 1 then
		nDamage = nDamage * hCaster:FindTalentValue("aghsfort_special_winter_wyvern_splinter_blast_main_target_hit", "value") / 100
	end

	ApplyDamage({
		attacker = hCaster,
		victim = hTarget,
		damage = nDamage * nMultiplier / 100,
		damage_type = self:GetAbilityDamageType(),
		ability = self
	})

	hTarget:AddNewModifier(hCaster, self, "modifier_winter_wyvern_pf_splinter_blast_slow", {duration = self:GetSpecialValueFor("duration") * (1 - hTarget:GetStatusResistance())})

	if self:GetSpecialValueFor("stun_duration") > 0 then
		hTarget:AddNewModifier(hCaster, self, "modifier_stunned", {duration = self:GetSpecialValueFor("stun_duration") * (1 - hTarget:GetStatusResistance())})
	end

	self:ReturnToSender(hTarget, bMain, hExtra)
end

-------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:ReturnToSender(hTarget, bMain, hExtra)
	local hCaster = self:GetCaster()

	if hCaster:HasShard("aghsfort_special_winter_wyvern_splinter_blast_main_target_hit") and hExtra.bReturning ~= 1 and not bMain and hExtra.nSource ~= nil then
		local hSource = EntIndexToHScript(hExtra.nSource)
		if hSource:GetTeam() == hCaster:GetTeam() then return end
		self:LaunchSplinter(hTarget, hSource, false, false, true)
	end
end

-------------------------------------------------------------------------------

function winter_wyvern_pf_splinter_blast:Splinter(hTarget, nValue)
	local hCaster = self:GetCaster()
	local bVacuum = hCaster:HasShard("aghsfort_special_winter_wyvern_splinter_blast_vacuum")
	local hArcticBurn = hCaster:FindAbilityByName("winter_wyvern_pf_arctic_burn")
	local bArctic = hArcticBurn and hArcticBurn:IsTrained()
	local vLoc = hTarget:GetOrigin()

	if not nValue then nValue = 100 end

	local tKV =
	{
		X = vLoc.x,
		Y = vLoc.y,
		duration = hCaster:FindTalentValue("aghsfort_special_winter_wyvern_splinter_blast_vacuum", "duration"),
	}

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLoc, nil, self:GetSpecialValueFor("split_radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		if hTarget ~= hEnemy then
			self:LaunchSplinter(hTarget, hEnemy, false, false, false, nValue)

			if bVacuum then
				hEnemy:AddNewModifier(hCaster, self, "modifier_winter_wyvern_pf_splinter_blast_vacuum", tKV)
				if hArcticBurn then
					hEnemy:AddNewModifier(hCaster, hArcticBurn, "winter_wyvern_pf_arctic_burn_slow", {duration = hArcticBurn:GetSpecialValueFor("damage_duration") * (1 - hEnemy:GetStatusResistance())})
				end
			end
		end
	end

	if hCaster:HasShard("aghsfort_special_winter_wyvern_splinter_blast_heal") then
		local hAllies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLoc, nil, self:GetSpecialValueFor("split_radius"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
		
		for _, hAlly in pairs(hAllies) do
			if hTarget ~= hAlly then
				self:LaunchSplinter(hTarget, hAlly, false, true, false, nValue)
			end
		end
	end

	if not bVacuum then return end

	local nVacuumFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/winter_wyvern_splinter_vacuum.vpcf", PATTACH_WORLDORIGIN, nil)
	ParticleManager:SetParticleControl(nVacuumFX, 0, vLoc)
	ParticleManager:SetParticleControl(nVacuumFX, 1, Vector(self:GetSpecialValueFor("split_radius"), 0, 0))
	ParticleManager:ReleaseParticleIndex(nVacuumFX)
end

--------------------------------------------------------------------------------

modifier_winter_wyvern_pf_splinter_blast_slow = class({})

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_slow:OnCreated()
	self.nMoveSlow = self:GetAbility():GetSpecialValueFor("bonus_movespeed")
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_slow:GetEffectName()
	return "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast_slow.vpcf"
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_slow:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

--------------------------------------------------------------------------------

modifier_winter_wyvern_pf_splinter_blast_vacuum = class({})

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_vacuum:OnCreated(kv)
	if IsClient() then return end

	local vOrigin = Vector(kv.X, kv.Y, 0)
	self.vDirection = vOrigin - self:GetParent():GetOrigin()
	self.nSpeed = self.vDirection:Length2D() / self:GetDuration()

	self.vDirection.z = 0
	self.vDirection = self.vDirection:Normalized()

	if not self:ApplyHorizontalMotionController() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_vacuum:OnDestroy()
	if IsClient() then return end
	self:GetParent():RemoveHorizontalMotionController( self )
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_vacuum:DeclareFunctions()
	return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_vacuum:GetOverrideAnimation()
	return ACT_DOTA_FLAIL
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_vacuum:UpdateHorizontalMotion(hParent, dt)
	hParent:SetOrigin(hParent:GetOrigin() + self.vDirection * self.nSpeed * dt)
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_splinter_blast_vacuum:OnHorizontalMotionInterrupted()
	self:Destroy()
end
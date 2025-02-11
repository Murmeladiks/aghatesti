void_spirit_pf_aether_remnant = class({})

--------------------------------------------------------------------------------

LinkLuaModifier("modifier_void_spirit_pf_aether_remnant_thinker", 				"heroes/void_spirit/void_spirit_pf_aether_remnant", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_aether_remnant_pull", 					"heroes/void_spirit/void_spirit_pf_aether_remnant", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_aether_remnant_phantom_attack",		"heroes/void_spirit/void_spirit_pf_aether_remnant", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_aether_remnant_bowling",				"heroes/void_spirit/void_spirit_pf_aether_remnant", LUA_MODIFIER_MOTION_HORIZONTAL)
LinkLuaModifier("modifier_void_spirit_pf_aether_remnant_bowling_impact_slow",	"heroes/void_spirit/void_spirit_pf_aether_remnant", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_void_spirit.vsndevts", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/aether_remnant/void_spirit_aether_remnant_run.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/aether_remnant/void_spirit_aether_remnant_watch.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/aether_remnant/void_spirit_aether_remnant_pull.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_void_spirit_aether_remnant.vpcf", context)
end

--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:GetVectorTargetStartRadius()
	return self:GetSpecialValueFor("start_radius")
end

--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:GetVectorTargetEndRadius()
	return self:GetSpecialValueFor("end_radius")
end


--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:GetVectorTargetRange()
	return self:GetSpecialValueFor("remnant_watch_distance")
end

--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:OnVectorCastStart(vStartPos, vDirection)
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetAbsOrigin()
	local vEndPos = self:GetVector2Position()
	local vDir = vStartPos - vOrigin
	vDir.z = 0.0
	vDir = vDir:Normalized()

	--if vStartPos == vEndPos then
		vEndPos = vStartPos + self:GetVectorDirection() * self:GetVectorTargetRange()
	--end

	ProjectileManager:CreateLinearProjectile({
		EffectName = "particles/units/heroes/hero_void_spirit/aether_remnant/void_spirit_aether_remnant_run.vpcf",
		Ability = self,
		Source = hCaster,
		vSpawnOrigin = vOrigin, 
		fStartRadius = self:GetSpecialValueFor("start_radius"),
		fEndRadius = self:GetSpecialValueFor("end_radius"),
		vVelocity = vDir * self:GetSpecialValueFor("projectile_speed"),
		fDistance = (vOrigin - vStartPos):Length2D(),
		ExtraData = {
			x = vEndPos.x,
			y = vEndPos.y
		}
	})

	hCaster:EmitSound("Hero_VoidSpirit.AetherRemnant.Cast")
	hCaster:EmitSound("Hero_VoidSpirit.AetherRemnant")
end

--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not vLocation or not self or self:IsNull() or ExtraData.isBowling then return end
	self:CreateRemnant(vLocation, ExtraData.x, ExtraData.y, self:GetSpecialValueFor("duration"), 100)
end

--------------------------------------------------------------------------------

function void_spirit_pf_aether_remnant:CreateRemnant(vStartPos, X, Y, nDuration, nStrength)
	local hCaster = self:GetCaster()

	CreateModifierThinker(
		hCaster,
		self,
		"modifier_void_spirit_pf_aether_remnant_thinker",
		{duration = nDuration, x = X, y = Y, strength = nStrength},
		GetGroundPosition(vStartPos, nil),
		hCaster:GetTeamNumber(),
		false
	)
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_aether_remnant_thinker = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_thinker:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_thinker:OnCreated(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()

	self.nRadius = hAbility:GetSpecialValueFor("radius")
	self.nDelay = hAbility:GetSpecialValueFor("activation_delay")
	self.nPullDuration = hAbility:GetSpecialValueFor("pull_duration")
	self.nInterval = hAbility:GetSpecialValueFor("think_interval")
	self.nWatchRadius = hAbility:GetSpecialValueFor("remnant_watch_radius")
	self.nViewerRadius = hAbility:GetSpecialValueFor("watch_path_vision_radius")
	
	self.vStartPos = hParent:GetOrigin()
	self.vEndPos = GetGroundPosition(Vector(kv.x, kv.y, 0), hCaster)
	self.vDirection = (self.vEndPos - self.vStartPos):Normalized()
	self.tAffectedEnemies = {}

	self.tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = hAbility:GetSpecialValueFor("impact_damage"),
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility,
	}
	
	local nWatchFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/aether_remnant/void_spirit_aether_remnant_watch.vpcf", PATTACH_CUSTOMORIGIN, hCaster)
	ParticleManager:SetParticleControl(nWatchFX, 0, self.vStartPos)
	ParticleManager:SetParticleControl(nWatchFX, 1, self.vEndPos)
	ParticleManager:SetParticleControlEnt(nWatchFX, 3, hCaster, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlForward(nWatchFX, 0, self.vDirection)
	ParticleManager:SetParticleControlForward(nWatchFX, 2, self.vDirection)
	self:AddParticle(nWatchFX, false, false, -1, false, false)
	hParent:EmitSound("Hero_VoidSpirit.AetherRemnant.Spawn_lp")
	
	self:StartIntervalThink(self.nDelay)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_thinker:OnIntervalThink()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	local bPhantomAttack = hCaster:HasShard("aghsfort_special_void_spirit_aether_remnant_phantom_attack")

	if not self.bActivated then
		self.bActivated = true
		local hCaster = self:GetCaster()

		self.nStartViewerID = AddFOWViewer(hCaster:GetTeam(), self.vStartPos + self.vDirection * 225, self.nViewerRadius, self:GetDuration(), false)
		self.nEndViewerID = AddFOWViewer(hCaster:GetTeam(), self.vStartPos + self.vDirection * 450, self.nViewerRadius, self:GetDuration(), false)
		self:StartIntervalThink(self.nInterval)
	end

	if not hAbility or hAbility:IsNull() then self:Destroy() return end

	local hEnemies = FindUnitsInLine(hParent:GetTeamNumber(), self.vStartPos, self.vEndPos, nil, self.nWatchRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE)

	if #hEnemies < 1 then return end
	local bLatched = false

	for _, hEnemy in pairs(hEnemies) do
		if not self.tAffectedEnemies[hEnemy:entindex()] and not hEnemy:HasModifier("modifier_void_spirit_pf_aether_remnant_pull") then
			self.tDamageTable.victim = hEnemy
			ApplyDamage(self.tDamageTable)

			if bPhantomAttack and hEnemy:IsAlive() then
				local hCritMod = hEnemy:AddNewModifier(hCaster, hAbility, "modifier_void_spirit_pf_aether_remnant_phantom_attack", {duration = 0.1})
				hCaster:PerformAttack(hEnemy, false, true, true, true, false, false, true)
				hCritMod:Destroy()
			end

			bLatched = true
			hEnemy:EmitSound("Hero_VoidSpirit.AetherRemnant.Triggered")
			
			if hEnemy:IsAlive() and not hEnemy:IsBoss() and not hEnemy.bAbsoluteNoCC and not hEnemy.bMotionControlExcluded and not hEnemy:HasModifier("modifier_boss_timbersaw_chakram_dance") then
				hEnemy:AddNewModifier(hCaster, hAbility, "modifier_void_spirit_pf_aether_remnant_pull", {duration = self.nPullDuration * (1 - hEnemy:GetStatusResistance()), x = self.vStartPos.x, y = self.vStartPos.y})
				hEnemy:EmitSound("Hero_VoidSpirit.AetherRemnant.Target")
			end
		end
	end

	if bLatched then
		self:StartIntervalThink(-1)
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_thinker:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	hParent:EmitSound("Hero_VoidSpirit.AetherRemnant.Destroy")
	hParent:StopSound("Hero_VoidSpirit.AetherRemnant.Spawn_lp")
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_aether_remnant_pull = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:OnCreated(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local nDistancePct = hAbility:GetSpecialValueFor("pull_destination") / 100
	self.bCommendRestricted = false;
	
	
	self.vDestination = GetGroundPosition(Vector(kv.x, kv.y, 0), hParent) 
	self.nDistance = (hParent:GetOrigin() - self.vDestination):Length2D() * nDistancePct
	self.nMoveSpeed = self.nDistance / self:GetDuration()
	self.vOrigin = hParent:GetOrigin()

	local vDirection = (self.vDestination - hParent:GetOrigin()):Normalized()
	local hThinker = CreateModifierThinker(hCaster, hAbility, "", {duration = self:GetDuration()}, self.vDestination, hParent:GetTeam(), false)
	hParent:InterruptMotionControllers(true)
	hParent:FaceTowards(hThinker:GetOrigin())
	hParent:MoveToNPC(hThinker)

	local nPullFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/aether_remnant/void_spirit_aether_remnant_pull.vpcf", PATTACH_CUSTOMORIGIN, hCaster)
	ParticleManager:SetParticleControl(nPullFX, 0, self.vDestination)
	ParticleManager:SetParticleControlEnt(nPullFX, 1, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlForward(nPullFX, 2, vDirection)
	ParticleManager:SetParticleControl(nPullFX, 3, self.vDestination)
	self:AddParticle(nPullFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	hParent:StopSound("Hero_VoidSpirit.AetherRemnant.Target")

	hParent:Interrupt()
	GridNav:DestroyTreesAroundPoint(hParent:GetOrigin(), 200, true)

	local hCaster = self:GetCaster()

	if hCaster:HasShard("aghsfort_special_void_spirit_aether_remnant_bowling") then
		local tKV = {
			duration = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "push_distance") / hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "push_speed"),
			X = self.vOrigin.x,
			Y = self.vOrigin.y,
		}
		hParent:AddNewModifier(hCaster, self:GetAbility(), "modifier_void_spirit_pf_aether_remnant_bowling", tKV)
		hParent:EmitSound("Hero_VoidSpirit.RemnantBowling.Push")
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:CheckState()
	return {
		[MODIFIER_STATE_FEARED] = true,
		--[MODIFIER_STATE_COMMAND_RESTRICTED] = self.bCommendRestricted,
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
		[MODIFIER_STATE_INVISIBLE] = false,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_SILENCED] = true,
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:GetModifierMoveSpeed_Absolute()
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:GetStatusEffectName()
	return "particles/status_fx/status_effect_void_spirit_aether_remnant.vpcf"
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_pull:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_aether_remnant_phantom_attack = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_phantom_attack:IsHidden() return true end
function modifier_void_spirit_pf_aether_remnant_phantom_attack:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_phantom_attack:OnCreated()
	self.nCritMult = self:GetCaster():FindTalentValue("aghsfort_special_void_spirit_aether_remnant_phantom_attack", "value")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_phantom_attack:DeclareFunctions()
	return {MODIFIER_PROPERTY_PREATTACK_TARGET_CRITICALSTRIKE}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_phantom_attack:GetModifierPreAttack_Target_CriticalStrike(event)
	return event.attacker == self:GetCaster() and self.nCritMult or 0
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_aether_remnant_bowling = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling:OnCreated(kv)
	if IsClient() then return end
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	
	local vOrigin = Vector(kv.X, kv.Y, 0)
	self.vDirection = vOrigin - self:GetParent():GetOrigin()
	self.nSpeed = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "push_speed")
	self.nRadius = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "projectile_radius")
	self.nSlowDuration = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "move_slow_duration")
	self.tAffectedEnemies = {}

	self.tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = hAbility:GetSpecialValueFor("impact_damage") * hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "remnant_damage_pct") / 100,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self.tKnockbackKV = {
		center_x = 0,
		center_y = 0,
		center_z = 0,
		should_stun = true, 
		duration = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "knockback_duration"),
		knockback_duration = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "knockback_duration"),
		knockback_distance = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "knockback_distance"),
		knockback_height = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "knockback_height"),
	}

	self.vDirection.z = 0
	self.vDirection = self.vDirection:Normalized()

	if not self:ApplyHorizontalMotionController() then
		self:Destroy()
	end

	self.nProjectileID = ProjectileManager:CreateLinearProjectile({
		EffectName = "particles/units/heroes/hero_void_spirit/remnant_bowling_push.vpcf",
		Ability = hAbility,
		Source = hCaster,
		vSpawnOrigin = vOrigin - self.vDirection * 200,
		vVelocity = self.vDirection * self.nSpeed,
		fDistance = hCaster:FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "push_distance"),
		ExtraData = {
			isBowling = 1
		}
	})
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling:OnDestroy()
	if IsClient() then return end
	self:GetParent():RemoveHorizontalMotionController( self )

	if self.nProjectileID and ProjectileManager:IsValidProjectile(self.nProjectileID) then
		ProjectileManager:DestroyLinearProjectile(self.nProjectileID)
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling:DeclareFunctions()
	return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling:GetOverrideAnimation()
	return ACT_DOTA_FLAIL
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling:UpdateHorizontalMotion(hParent, dt)
	local hCaster = self:GetCaster()
	local vOrigin = hParent:GetOrigin()
	local hAbility = self:GetAbility()

	hParent:SetOrigin(vOrigin + self.vDirection * self.nSpeed * dt)

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vOrigin, nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hParent and not self.tAffectedEnemies[hEnemy:entindex()] and not hEnemy:FindModifierByNameAndCaster("modifier_knockback", hCaster) then
			self.tAffectedEnemies[hEnemy:entindex()] = true

			if hEnemy:HasModifier("modifier_knockback") then
				hEnemy:RemoveModifierByName("modifier_knockback")
			end

			self.tDamageTable.victim = hEnemy
			ApplyDamage(self.tDamageTable)

			self.tKnockbackKV.center_x = vOrigin.x
			self.tKnockbackKV.center_y = vOrigin.z
			self.tKnockbackKV.center_z = vOrigin.z

			hEnemy:AddNewModifier(hCaster, hAbility, "modifier_knockback", self.tKnockbackKV)
			hEnemy:AddNewModifier(hCaster, hAbility, "modifier_void_spirit_pf_aether_remnant_bowling_impact_slow", {duration = self.nSlowDuration * (1 - hEnemy:GetStatusResistance())})
			hEnemy:EmitSound("Hero_VoidSpirit.RemnantBowling.Target")
		end
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling:OnHorizontalMotionInterrupted()
	self:Destroy()
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_aether_remnant_bowling_impact_slow = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling_impact_slow:OnCreated()
	self.nMoveSlow = -self:GetCaster():FindTalentValue("aghsfort_special_void_spirit_aether_remnant_bowling", "move_slow_pct")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling_impact_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_aether_remnant_bowling_impact_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end
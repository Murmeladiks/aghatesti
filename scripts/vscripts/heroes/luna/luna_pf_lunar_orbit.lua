LinkLuaModifier("modifier_luna_pf_lunar_orbit", 		"heroes/luna/luna_pf_lunar_orbit", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_lunar_orbit_leap", 	"heroes/luna/luna_pf_lunar_orbit", LUA_MODIFIER_MOTION_BOTH)

--------------------------------------------------------------------------------

luna_pf_lunar_orbit = class({})

--------------------------------------------------------------------------------

function luna_pf_lunar_orbit:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_luna/luna_moon_glaive_shield.vpcf", context)
end

--------------------------------------------------------------------------------

function luna_pf_lunar_orbit:GetCooldown(iLevel)
	if self:GetCaster():HasShard("aghsfort_special_luna_lunar_blessing_leap") then
		return self.BaseClass.GetCooldown(self, iLevel) * self:GetCaster():FindTalentValue("aghsfort_special_luna_lunar_blessing_leap", "cooldown_reduction") / 100
	end

	return self.BaseClass.GetCooldown(self, iLevel)
end

--------------------------------------------------------------------------------

function luna_pf_lunar_orbit:GetCastRange(vLocation, hTarget)
	if self:GetCaster():HasShard("aghsfort_special_luna_lunar_blessing_leap") then
		return self:GetCaster():FindTalentValue("aghsfort_special_luna_lunar_blessing_leap", "leap_distance")
	end

	return self:GetSpecialValueFor("rotating_glaives_movement_radius")
end

--------------------------------------------------------------------------------

function luna_pf_lunar_orbit:OnSpellStart()
	local hCaster = self:GetCaster()
	
	hCaster:AddNewModifier(hCaster, self, "modifier_luna_pf_lunar_orbit", {duration = self:GetSpecialValueFor("rotating_glaives_duration")})
	
	hCaster:EmitSound("Hero_Luna.LunarOrbit.Cast")

	if not hCaster:HasShard("aghsfort_special_luna_lunar_blessing_leap") then return end

	hCaster:AddNewModifier(hCaster, self, "modifier_luna_pf_lunar_orbit_leap", {duration = 0.6})
end

--------------------------------------------------------------------------------

if modifier_luna_pf_lunar_orbit == nil then	modifier_luna_pf_lunar_orbit = class({}) end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit:IsPurgable() 			return false end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	
	self.nDamageReduction = -hAbility:GetSpecialValueFor("rotating_glaives_damage_reduction")
	
	if IsClient() then return end
	
	self.nCount = hAbility:GetSpecialValueFor("rotating_glaives")
	self.nTargetRadius = hAbility:GetSpecialValueFor("rotating_glaives_movement_radius")
	self.nHitRadius = hAbility:GetSpecialValueFor("rotating_glaives_hit_radius")
	self.nDamagePct = hAbility:GetSpecialValueFor("rotating_glaives_collision_damage") / 100
	self.nSpeed = hAbility:GetSpecialValueFor("rotating_glaives_speed")
	
	self.nCurrentRadius = 0
	self.nExpansionTime = 1.2

	local nDamageResetTime = 360 / self.nSpeed
	
	self.tGlaives = {}
	
	for i = 1, self.nCount do
		local hGlaiveUnit = CreateUnitByName("npc_dota_wisp_spirit", hCaster:GetAbsOrigin(), false, hCaster, hCaster, hCaster:GetTeamNumber())
		hGlaiveUnit:AddNewModifier(hCaster, hAbility, "modifier_wisp_spirit_invulnerable", {})
		hGlaiveUnit:AddNewModifier(hCaster, hAbility, "modifier_no_healthbar", {})
		hGlaiveUnit.nHits = {}

		local nGlaiveFX = ParticleManager:CreateParticle("particles/units/heroes/hero_luna/luna_moon_glaive_shield.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
		ParticleManager:SetParticleControlEnt(nGlaiveFX, 0, hGlaiveUnit, PATTACH_OVERHEAD_FOLLOW, nil, Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nGlaiveFX, 1, hCaster, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nGlaiveFX, 4, hGlaiveUnit, PATTACH_OVERHEAD_FOLLOW, nil, Vector(0, 0, 0), true)
		self:AddParticle(nGlaiveFX, false, false, -1, false, false)

		Timers:CreateTimer(nDamageResetTime, function()
			if hGlaiveUnit and not hGlaiveUnit:IsNull() then
				hGlaiveUnit.nHits = {}
				return nDamageResetTime
			end
		end)
		table.insert(self.tGlaives, hGlaiveUnit)
	end
	
	self:StartIntervalThink(FrameTime())
end

function modifier_luna_pf_lunar_orbit:OnDestroy()
	if IsClient() then return end
	for _, hGlaive in ipairs(self.tGlaives) do
		UTIL_Remove(hGlaive)
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit:OnIntervalThink()
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetOrigin()
	
	self.nCurrentRadius = self.nTargetRadius * math.min(self:GetElapsedTime() / self.nExpansionTime, 1)

	local vOffsetPos = Vector(0, self.nCurrentRadius, 0) + vOrigin
	
	for i, hGlaive in ipairs(self.tGlaives) do
		local nCurrentOffsetPos = RotatePosition(vOrigin, QAngle(0, (360 / self.nCount) * i, 0), vOffsetPos)

		hGlaive:SetAbsOrigin(RotatePosition(vOrigin, QAngle(0, -self:GetElapsedTime() * self.nSpeed, 0), nCurrentOffsetPos))

		self:DamageEnemies(hGlaive)
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit:DamageEnemies(hGlaive)
	local hCaster = self:GetCaster()

	local tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = hCaster:GetAverageTrueAttackDamage(nil) * self.nDamagePct,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self:GetAbility()
	}

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hGlaive:GetOrigin(), nil, self.nHitRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		if not hGlaive.nHits[hEnemy] then
			hGlaive.nHits[hEnemy] = true
			tDamageTable.victim = hEnemy
			ApplyDamage(tDamageTable)
			hEnemy:EmitSound("Hero_Luna.ProjectileImpact")
		end
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit:DeclareFunctions()
	return {MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit:GetModifierIncomingDamage_Percentage()
	return self.nDamageReduction
end

---------------------------------------------------------------------

if modifier_luna_pf_lunar_orbit_leap == nil then
	modifier_luna_pf_lunar_orbit_leap = class({})
end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:IsHidden() 	return true end
function modifier_luna_pf_lunar_orbit_leap:IsPurgable()	return false end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:OnCreated(params)
	if not IsServer() then return end
	local hAbility = self:GetCaster():FindAbilityByName("aghsfort_special_luna_lunar_blessing_leap")
	local hParent = self:GetParent()

	local bMoving = hParent:IsMoving()
	self.nDistance = hAbility:GetSpecialValueFor("leap_distance")
	self.nHeight = hAbility:GetSpecialValueFor("leap_height")
	self.nSpeed = hAbility:GetSpecialValueFor("leap_speed")

	self.nSearchRange = hAbility:GetSpecialValueFor("search_range")
	self.nDamageMult = hAbility:GetSpecialValueFor("damage_multiplier")
	
	self.nHopDuration = self.nDistance / self.nSpeed
	self.nInitialHeight = GetGroundHeight(hParent:GetAbsOrigin(), nil)
	self.vDirection = hParent:GetForwardVector()

	self.tEnemiesHit = {}

	if not self:ApplyVerticalMotionController() or not self:ApplyHorizontalMotionController() then		
		self:Destroy()
		return
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:OnDestroy()
	if not IsServer() then return end
	local hParent = self:GetParent()

	hParent:RemoveHorizontalMotionController(self)
	hParent:RemoveVerticalMotionController(self)
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:OnVerticalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:CheckState()
	return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:DeclareFunctions()
	return {MODIFIER_PROPERTY_DISABLE_TURNING}
end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:GetModifierDisableTurning()
	return 1
end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:UpdateHorizontalMotion(hParent, dt)
	if not IsServer() then return end

	if hParent:GetOrigin().z < GetGroundHeight(hParent:GetOrigin(), hParent) and self:GetElapsedTime() > 0.1 then
		self:Destroy()
		return
	end

	hParent:SetAbsOrigin(hParent:GetAbsOrigin() + self.nSpeed * self.vDirection * dt)

	self:Beams(hParent:GetOrigin())
end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:UpdateVerticalMotion(hParent, nDT)
	if not IsServer() then return end
	local vPos = hParent:GetAbsOrigin()
	local nGroundHeight =  GetGroundHeight(vPos, hParent)
	local nVerticalDistance = -self:GetElapsedTime() * (self:GetElapsedTime() - self.nHopDuration) * self.nHeight / math.pow(self.nHopDuration * 0.5, 2) + self.nInitialHeight

	hParent:SetAbsOrigin(vPos * Vector(1, 1, 0) + Vector(0, 0, nVerticalDistance))

	if vPos.z < nGroundHeight and self:GetElapsedTime() > 0.1 then
		self:Destroy()
	end
end

---------------------------------------------------------------------

function modifier_luna_pf_lunar_orbit_leap:Beams(vPos)
	local hParent = self:GetParent()
	local hBeam = hParent:FindAbilityByName("luna_pf_lucent_beam")

	if not hBeam or not hBeam:IsTrained() then return end
	
	local hEnemies = FindUnitsInRadius(hParent:GetTeam(), vPos, nil, self.nSearchRange, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		if not self.tEnemiesHit[hEnemy:entindex()] then
			self.tEnemiesHit[hEnemy:entindex()] = true
			hBeam:LucentBeam(hEnemy, false, self:GetAbility():GetSpecialValueFor("rotating_glaives_collision_damage") * hParent:FindTalentValue("aghsfort_special_luna_lunar_blessing_leap", "damage_multiplier"))
		end
	end
end
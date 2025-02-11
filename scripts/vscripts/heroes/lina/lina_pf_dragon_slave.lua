LinkLuaModifier("modifier_lina_pf_dragon_slave", 			"heroes/lina/lina_pf_dragon_slave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lina_pf_dragon_slave_booster", 	"heroes/lina/lina_pf_dragon_slave", LUA_MODIFIER_MOTION_HORIZONTAL)

lina_pf_dragon_slave = class({})

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_lina.vsndevts", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_dragon_slave.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_dragon_slave_impact.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_dragon_slave_booster.vpcf", context)
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:Spawn()
	if IsClient() then return end
	self.Dragon_Projectiles = {}
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:GetCastPoint()
	if self:GetCaster():HasShard("aghsfort_special_lina_dragon_slave_booster") then
		return self:GetCaster():FindTalentValue("aghsfort_special_lina_dragon_slave_booster", "cast_point")
	end

	return self.BaseClass.GetCastPoint(self)
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:CastFilterResultTarget(hTarget)
	local nTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	
	if self:GetCaster():HasShard("aghsfort_special_lina_dragon_slave_booster") then
		nTeam = DOTA_UNIT_TARGET_TEAM_BOTH
	end

	return UnitFilter(hTarget, nTeam, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("dragon_slave_distance")
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:OnSpellStart()
	self.Dragon_Projectiles = self.Dragon_Projectiles or {}	

	local hCaster = self:GetCaster()
	local vPosition = self:GetCursorPosition()
	local hTarget = self:GetCursorTarget()

	if (vPosition - hCaster:GetOrigin()):Length2D() < 1 then
		vPosition = vPosition + hCaster:GetForwardVector() * 10
	end

	self:FireDragonSlave(vPosition, 100, self:GetCursorTarget())

	if not hCaster:HasShard("aghsfort_special_lina_dragon_slave_triwave") then return end

	local nDegree = hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_triwave", "degrees_between_waves")
	local nDamagePct = hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_triwave", "damage_pct")

	self:FireDragonSlave(RotatePosition(hCaster:GetAbsOrigin(), QAngle(0, -nDegree, 0), vPosition), nDamagePct)
	self:FireDragonSlave(RotatePosition(hCaster:GetAbsOrigin(), QAngle(0, nDegree, 0), vPosition), nDamagePct)
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:FireDragonSlave(vLocation, nDamagePct, hTarget)
	local hCaster = self:GetCaster()
	local vOrigin = (hTarget and hTarget:GetTeam() == hCaster:GetTeam()) and hTarget:GetOrigin() or hCaster:GetOrigin()
	local nSpeed = self:GetSpecialValueFor("dragon_slave_speed")
	local nDistance = self:GetEffectiveCastRange(vLocation, hCaster)

	local vDirection = (hTarget and hTarget:GetTeam() == hCaster:GetTeam()) and hTarget:GetForwardVector() or (vLocation - vOrigin)

	vDirection.z = 0
	vDirection = vDirection:Normalized()

	local nDragonHandle = ProjectileManager:CreateLinearProjectile({
		Ability				= self,
		EffectName			= "particles/units/heroes/hero_lina/lina_spell_dragon_slave.vpcf",
		vSpawnOrigin		= vOrigin,
		fDistance			= nDistance,
		fStartRadius		= self:GetSpecialValueFor("dragon_slave_width_initial"),
		fEndRadius			= self:GetSpecialValueFor("dragon_slave_width_end"),
		Source				= hCaster,
		bHasFrontalCone		= true,
		bReplaceExisting	= false,
		iUnitTargetTeam		= self:GetAbilityTargetTeam(),
		iUnitTargetFlags	= self:GetAbilityTargetFlags(),
		iUnitTargetType		= self:GetAbilityTargetType(),
		fExpireTime 		= GameRules:GetGameTime() + (nDistance / nSpeed) + 2,
		bDeleteOnHit		= false,
		vVelocity			= vDirection * nSpeed,
		bProvidesVision		= false
	})

	self.Dragon_Projectiles[nDragonHandle] = {
		vStartPosition = vOrigin,
		LSACount = 0,
		nDamagePct = nDamagePct
	}

	if hTarget and hTarget:GetTeam() == hCaster:GetTeam() and hCaster:HasShard("aghsfort_special_lina_dragon_slave_booster") then
		local vRealLocation = vOrigin + vDirection * nDistance * hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_booster", "length_pct") / 100
		hTarget:AddNewModifier(hCaster, self, "modifier_lina_pf_dragon_slave_booster", {duration = -1, X = vRealLocation.x, Y = vRealLocation.y, Z = vRealLocation.z})

		self.Dragon_Projectiles[nDragonHandle]["nDamagePct"] = self.Dragon_Projectiles[nDragonHandle]["nDamagePct"] * hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_booster", "damage_pct") / 100
	end

	EmitSoundOn("Hero_Lina.DragonSlave", hCaster)
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:OnProjectileThinkHandle(iProjectileHandle)
	local hCaster = self:GetCaster()
	
	if not hCaster:HasShard("aghsfort_special_lina_dragon_slave_lsa_trail") then return end

	local vLocation = ProjectileManager:GetLinearProjectileLocation(iProjectileHandle)
	local nRequiredDistance = hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_lsa_trail", "lsa_range")
	local nCurrentDistance = (vLocation - self.Dragon_Projectiles[iProjectileHandle]["vStartPosition"]):Length2D()

	if math.floor(nCurrentDistance / nRequiredDistance) > self.Dragon_Projectiles[iProjectileHandle]["LSACount"] then
		self.Dragon_Projectiles[iProjectileHandle]["LSACount"] = self.Dragon_Projectiles[iProjectileHandle]["LSACount"] +1

		local hLSA = hCaster:FindAbilityByName("lina_pf_light_strike_array")
		if not hLSA or not hLSA:IsTrained() then return end

		hLSA:StartLSA(vLocation, hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_lsa_trail", "lsa_power"), hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_lsa_trail", "lsa_delay"))
	end
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:OnProjectileHitHandle(hTarget, vLocation, iProjectileHandle)
	if not hTarget then self:ClearID(iProjectileHandle) return end

	local hCaster = self:GetCaster()
	local nDamage = self:GetSpecialValueFor("dragon_slave_damage") 

	if hCaster:GetHeroFacetID() == 2 then
		local hInnate = hCaster:FindAbilityByName("lina_slow_burn")

		if hInnate then
			nDamage = nDamage * hInnate:GetSpecialValueFor("impact_damage_pct")
			local nBurnDamage = nDamage * self.Dragon_Projectiles[iProjectileHandle]["nDamagePct"] / 100

			hTarget:AddNewModifier(hCaster, hInnate, "modifier_lina_pf_slow_burn", {duration = hInnate:GetSpecialValueFor("burn_duration") * (1 - hTarget:GetStatusResistance()), damage = nBurnDamage})
		end
	end

	nDamage = nDamage * self.Dragon_Projectiles[iProjectileHandle]["nDamagePct"] / 100

	ApplyDamage({
		attacker = hCaster,
		victim = hTarget,
		damage = nDamage,
		damage_type = self:GetAbilityDamageType(),
		ability = self
	})

	if hCaster:HasShard("aghsfort_special_lina_dragon_slave_ignite") then
		hTarget:AddNewModifier(hCaster, self, "modifier_lina_pf_dragon_slave", {duration = hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_ignite", "burn_duration") * (1 - hTarget:GetStatusResistance())})
	end

	local hInnate = hCaster:FindAbilityByName("lina_pf_fiery_soul")

	if hInnate then
		hInnate:CriticalMark(hTarget)
	end

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_dragon_slave_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
	)
end

--------------------------------------------------------------------------------

function lina_pf_dragon_slave:ClearID(iProjectileHandle)
	if self.Dragon_Projectiles[iProjectileHandle] then
		for i = 0, #self.Dragon_Projectiles[iProjectileHandle] do
			self.Dragon_Projectiles[iProjectileHandle][i] = nil
		end
	end

	self.Dragon_Projectiles[iProjectileHandle] = nil
end

--------------------------------------------------------------------------------

modifier_lina_pf_dragon_slave = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave:OnCreated(kv)
	if IsClient() then return end
	
	local hCaster = self:GetCaster()
	local hLaguna = hCaster:FindAbilityByName("lina_pf_laguna_blade")
	self.nInterval = hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_ignite", "burn_interval")	

	if not hLaguna or not hLaguna:IsTrained() then
		self:Destroy()
		return
	end

	self.tDamageTable = {
		attacker = hCaster,
		victim = self:GetParent(),
		damage = (hLaguna:GetSpecialValueFor("damage") * hCaster:FindTalentValue("aghsfort_special_lina_dragon_slave_ignite", "burn_pct") / 100) * self.nInterval,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = hLaguna
	}

	self:StartIntervalThink(self.nInterval)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

modifier_lina_pf_dragon_slave_booster = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:IsPurgable()			return false end
function modifier_lina_pf_dragon_slave_booster:IsPurgeException()	return false end
function modifier_lina_pf_dragon_slave_booster:RemoveOnDeath()		return true end
function modifier_lina_pf_dragon_slave_booster:IsHidden()			return true end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:OnCreated(kv)
	if IsClient() then return end
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	self.nSpeed = hAbility:GetSpecialValueFor("dragon_slave_speed")

	self.vOriginalPosition = hParent:GetAbsOrigin()
	self.vPosition = Vector(kv.X, kv.Y, kv.Z)
	self.nDistanceToWalk = self.vPosition - self.vOriginalPosition
	self.vDirection = self.nDistanceToWalk:Normalized()
	self.nDistanceToWalk = self.nDistanceToWalk:Length2D()

	if self:ApplyHorizontalMotionController() == false then 
		self:Destroy()
		return
	end
end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	hParent:RemoveHorizontalMotionController( self )
	GridNav:DestroyTreesAroundPoint(hParent:GetAbsOrigin(), 200, false)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:OnHorizontalMotionInterrupted()
	if IsClient() then return end
	self:Destroy()
end

--------------------------------------------------------------------------------


function modifier_lina_pf_dragon_slave_booster:CheckState()
	return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:UpdateHorizontalMotion(hParent, dt)
	hParent:SetAbsOrigin(hParent:GetAbsOrigin() + self.nSpeed * self.vDirection * dt )
	GridNav:DestroyTreesAroundPoint(hParent:GetAbsOrigin(), 200, false)

	if (hParent:GetAbsOrigin() - self.vOriginalPosition):Length2D() >= self.nDistanceToWalk then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:GetEffectName()
	return "particles/units/heroes/hero_lina/lina_dragon_slave_booster.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lina_pf_dragon_slave_booster:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end


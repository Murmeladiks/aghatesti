LinkLuaModifier("modifier_ursa_pf_earthshock", 		"heroes/ursa/ursa_pf_earthshock", LUA_MODIFIER_MOTION_BOTH)
LinkLuaModifier("modifier_ursa_pf_earthshock_move", "heroes/ursa/ursa_pf_earthshock", LUA_MODIFIER_MOTION_BOTH)

---------------------------------------------------------------------

if ursa_pf_earthshock == nil then
	ursa_pf_earthshock = class({})
end

---------------------------------------------------------------------

function ursa_pf_earthshock:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_ursa/ursa_earthshock.vpcf", context)
end

--------------------------------------------------------------------------------

function ursa_pf_earthshock:OnAbilityUpgrade(hUpgradeAbility)
	if hUpgradeAbility and hUpgradeAbility:GetName() == "special_bonus_unique_ursa_3" and not self.bTalentUpgraded then
		self.bTalentUpgraded = true
		self:RefreshCharges()
		self:EndCooldown()
	end
end

---------------------------------------------------------------------

function ursa_pf_earthshock:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("shock_radius")
end

---------------------------------------------------------------------

function ursa_pf_earthshock:OnSpellStart()
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetAbsOrigin()

	hCaster:AddNewModifier(hCaster, self, "modifier_ursa_pf_earthshock_move", {duration = self:GetSpecialValueFor("hop_duration")})
end

---------------------------------------------------------------------

function ursa_pf_earthshock:ApplyEarthshock(hUnit)
	local hCaster = self:GetCaster()
	local vOrigin = hUnit:GetOrigin()
	local nSlowDuration = self:GetSpecialValueFor("slow_duration")
	local bKnockback = hCaster:HasShard("aghsfort_special_ursa_earthshock_knockback")
	local nStunDuration = hCaster:FindTalentValue("aghsfort_special_ursa_earthshock_knockback", "value3")
	local nRadius = self:GetSpecialValueFor("shock_radius")
	local hFurySwipes = hCaster:FindAbilityByName("ursa_pf_fury_swipes")
	local nSwipesOnHit = self:GetSpecialValueFor("fury_swipe_stacks_on_hit")

	local tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = self:GetSpecialValueFor("impact_damage"),
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self
	}

	if hCaster:HasShard("aghsfort_special_ursa_earthshock_knockback") then
		tDamageTable.damage = tDamageTable.damage * (1 + hCaster:FindTalentValue("aghsfort_special_ursa_earthshock_knockback", "bonus_damage_pct") / 100)
	end

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), vOrigin, nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	local hKV = {
		center_x = vOrigin.x,
		center_y = vOrigin.y,
		center_z = vOrigin.z,
		should_stun = false, 
		duration = hCaster:FindTalentValue("aghsfort_special_ursa_earthshock_knockback", "value2"),
		knockback_duration = hCaster:FindTalentValue("aghsfort_special_ursa_earthshock_knockback", "value2"),
		knockback_distance = hCaster:FindTalentValue("aghsfort_special_ursa_earthshock_knockback", "value"),
		knockback_height = 0,
	}

	for _, hEnemy in pairs(hEnemies) do
		tDamageTable.victim = hEnemy
		ApplyDamage(tDamageTable)

		hEnemy:AddNewModifier(hCaster, self, "modifier_ursa_pf_earthshock", {duration = nSlowDuration * (1 - hEnemy:GetStatusResistance())})

		if bKnockback then
			hEnemy:AddNewModifier(hCaster, self, "modifier_knockback", hKV)
			hEnemy:AddNewModifier(hCaster, self, "modifier_stunned", {duration = nStunDuration * (1 - hEnemy:GetStatusResistance())})
		end

		if nSwipesOnHit > 0 and hFurySwipes and hFurySwipes:IsTrained() then
			hEnemy:AddNewModifier(hCaster, hFurySwipes, "modifier_ursa_pf_fury_swipes_damage_increase", {duration = hFurySwipes:GetSpecialValueFor("bonus_reset_time")})
			hEnemy:AddNewModifier(hCaster, hFurySwipes, "modifier_ursa_pf_fury_swipes_damage_increase", {duration = hFurySwipes:GetSpecialValueFor("bonus_reset_time")})
		end
	end

	nRadius = nRadius * 0.5

	local nEarthshockFX = ParticleManager:CreateParticle("particles/units/heroes/hero_ursa/ursa_earthshock.vpcf", PATTACH_ABSORIGIN_FOLLOW, hUnit)
	ParticleManager:SetParticleControl(nEarthshockFX, 1, Vector(nRadius, nRadius, nRadius))
	ParticleManager:ReleaseParticleIndex(nEarthshockFX)

	hUnit:EmitSound("Hero_Ursa.Earthshock")
end

---------------------------------------------------------------------

if modifier_ursa_pf_earthshock_move == nil then
	modifier_ursa_pf_earthshock_move = class({})
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:IsHidden() 	return true end
function modifier_ursa_pf_earthshock_move:IsPurgable()	return false end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:OnCreated(params)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nRadius = hAbility:GetSpecialValueFor("shock_radius")
	self.nDistance = hAbility:GetSpecialValueFor("hop_distance")
	self.nHeight = hAbility:GetSpecialValueFor("hop_height")
	self.nHopDuration = hAbility:GetSpecialValueFor("hop_duration")

	self.nInitialHeight = GetGroundHeight(hParent:GetAbsOrigin(), nil)
	self.nSpeed = self.nDistance / self.nHopDuration
	self.vDirection = hParent:GetForwardVector()

	if not self:ApplyVerticalMotionController() or not self:ApplyHorizontalMotionController() then		
		self:Destroy()
		return
	end

	self:StartIntervalThink(0.1)
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:OnDestroy()
	if not IsServer() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	hParent:RemoveHorizontalMotionController(self)
	hParent:RemoveVerticalMotionController(self)

	hAbility:ApplyEarthshock(hParent)
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:OnVerticalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:CheckState()
	return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:UpdateHorizontalMotion(hParent, dt)
	if not IsServer() then return end

	hParent:SetAbsOrigin(hParent:GetAbsOrigin() + self.nSpeed * self.vDirection * dt)
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock_move:UpdateVerticalMotion(hParent, nDT)
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

if modifier_ursa_pf_earthshock == nil then
	modifier_ursa_pf_earthshock = class({})
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock:OnCreated(kv)
	local hAbility = self:GetAbility()

	self.nMoveSlow = hAbility:GetSpecialValueFor("movement_slow")
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_EVENT_ON_DEATH
	}
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

---------------------------------------------------------------------

function modifier_ursa_pf_earthshock:OnDeath(event)
	if IsClient() or event.unit ~= self:GetParent() or not self:GetCaster():HasShard("special_bonus_unique_ursa_earthshock_overpower_stack") then return end
	local hCaster = self:GetCaster()
	local hOverpower = hCaster:FindAbilityByName("ursa_pf_overpower")

	if not hOverpower or not hOverpower:IsTrained() then return end

	hOverpower:AddOverpowerAttacks(hCaster, hCaster:FindTalentValue("special_bonus_unique_ursa_earthshock_overpower_stack", "value"), true, false)
end
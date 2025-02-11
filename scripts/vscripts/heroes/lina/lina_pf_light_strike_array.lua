LinkLuaModifier("modifier_lina_pf_light_strike_array_vacuum", 	"heroes/lina/lina_pf_light_strike_array", LUA_MODIFIER_MOTION_HORIZONTAL)

--------------------------------------------------------------------------------

lina_pf_light_strike_array = class({})

--------------------------------------------------------------------------------

function lina_pf_light_strike_array:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_light_strike_array.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_light_strike_array_ray_team.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_light_strike_array_secondary.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_spell_light_strike_array_ray_team_secondary.vpcf", context)
	
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_lsa_vacuum.vpcf", context)
end

--------------------------------------------------------------------------------

function lina_pf_light_strike_array:GetAOERadius()
	return self:GetSpecialValueFor("light_strike_array_aoe")
end

--------------------------------------------------------------------------------

function lina_pf_light_strike_array:OnSpellStart()	
	self:StartLSA(self:GetCursorPosition(), 100, self:GetSpecialValueFor("light_strike_array_delay_time"))
end

--------------------------------------------------------------------------------

function lina_pf_light_strike_array:StartLSA(vLocation, nPower, nDelay)
	local hCaster = self:GetCaster()
	local nRadius = self:GetSpecialValueFor("light_strike_array_aoe") * nPower / 100
	local sParticle = nPower == 100 and "particles/units/heroes/hero_lina/lina_spell_light_strike_array_ray_team.vpcf" or "particles/units/heroes/hero_lina/lina_spell_light_strike_array_ray_team_secondary.vpcf"

	EmitSoundOnLocationWithCaster(vLocation, "Ability.PreLightStrikeArray", hCaster)
	local nPrecastFX = ParticleManager:CreateParticleForTeam(sParticle, PATTACH_ABSORIGIN, hCaster, hCaster:GetTeamNumber())
	ParticleManager:SetParticleControl(nPrecastFX, 0, vLocation)
	ParticleManager:SetParticleControl(nPrecastFX, 1, Vector(nRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nPrecastFX)

	if hCaster:HasShard("aghsfort_special_lina_light_strike_array_vacuum") then
		self:Vacuum(vLocation, nRadius * hCaster:FindTalentValue("aghsfort_special_lina_light_strike_array_vacuum", "radius_pct") / 100)
	end

	Timers:CreateTimer(nDelay, function() self:ActivateLSA(vLocation, nPower) end)
end

--------------------------------------------------------------------------------

function lina_pf_light_strike_array:Vacuum(vLocation, nRadius)
	local hCaster = self:GetCaster()
	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLocation, nil, nRadius, self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), self:GetAbilityTargetFlags(), 0, false)

	local tKV =
	{
		X = vLocation.x,
		Y = vLocation.y,
		duration = hCaster:FindTalentValue("aghsfort_special_lina_light_strike_array_vacuum", "duration"),
	}

	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, self, "modifier_lina_pf_light_strike_array_vacuum", tKV)
	end


	local nVacuumFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_lsa_vacuum.vpcf", PATTACH_WORLDORIGIN, nil)
	ParticleManager:SetParticleControl(nVacuumFX, 0, vLocation)
	ParticleManager:SetParticleControl(nVacuumFX, 1, Vector(nRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nVacuumFX)
end

--------------------------------------------------------------------------------

function lina_pf_light_strike_array:ActivateLSA(vLocation, nPower, bPulsate)
	local hCaster = self:GetCaster()
	local nRadius = self:GetSpecialValueFor("light_strike_array_aoe") * nPower / 100
	local nStunDuration = self:GetSpecialValueFor("light_strike_array_stun_duration")
	local bPerformAttack = hCaster:HasShard("aghsfort_special_lina_light_strike_array_attacks")
	local sParticle = (nPower == 100 and not bPulsate) and "particles/units/heroes/hero_lina/lina_spell_light_strike_array.vpcf" or "particles/units/heroes/hero_lina/lina_spell_light_strike_array_secondary.vpcf"
	local bApplyBurn = false
	local hFacetInnate = hCaster:FindAbilityByName("lina_slow_burn")
	local nBurnDamage = 0

	local hInnate = hCaster:FindAbilityByName("lina_pf_fiery_soul")
	
	local hDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = self:GetSpecialValueFor("light_strike_array_damage"),
		damage_type = self:GetAbilityDamageType(),
		ability = self
	}

	if hCaster:GetHeroFacetID() == 2 then
		if hFacetInnate then
			bApplyBurn = true
			hDamageTable.damage = hDamageTable.damage * hFacetInnate:GetSpecialValueFor("impact_damage_pct")
			nBurnDamage = hDamageTable.damage * nPower / 100
		end
	end

	hDamageTable.damage = hDamageTable.damage * nPower / 100

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLocation, nil, nRadius, self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), self:GetAbilityTargetFlags(), 0, false)

	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, self, "modifier_stunned", {duration = nStunDuration * (1 - hEnemy:GetStatusResistance())})
		hDamageTable.victim = hEnemy

		ApplyDamage(hDamageTable)

		if bPerformAttack then
			hCaster:PerformAttack(hEnemy, false, true, true, false, true, false, false)
		end

		if hInnate then
			hInnate:CriticalMark(hEnemy)
		end

		if bApplyBurn then
			hEnemy:AddNewModifier(hCaster, hFacetInnate, "modifier_lina_pf_slow_burn", {duration = hFacetInnate:GetSpecialValueFor("burn_duration") * (1 - hEnemy:GetStatusResistance()), damage = nBurnDamage})
		end
	end

	EmitSoundOnLocationWithCaster(vLocation, "Ability.LightStrikeArray", hCaster)
	local nPrecastFX = ParticleManager:CreateParticle(sParticle, PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nPrecastFX, 0, vLocation)
	ParticleManager:SetParticleControl(nPrecastFX, 1, Vector(nRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nPrecastFX)

	GridNav:DestroyTreesAroundPoint(vLocation, nRadius, false)

	if hCaster:HasShard("aghsfort_special_lina_light_strike_array_pulsate") and not bPulsate then
		local nInterval = hCaster:FindTalentValue("aghsfort_special_lina_light_strike_array_pulsate", "pulse_inteval")
		local nPulses = hCaster:FindTalentValue("aghsfort_special_lina_light_strike_array_pulsate", "pulse_amount")
		Timers:CreateTimer(nInterval, function()
			self:ActivateLSA(vLocation, nPower, true)

			nPulses = nPulses - 1
			if nPulses > 0 then return nInterval end
		end)
	end
end

--------------------------------------------------------------------------------

modifier_lina_pf_light_strike_array_vacuum = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_light_strike_array_vacuum:OnCreated(kv)
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

function modifier_lina_pf_light_strike_array_vacuum:OnDestroy()
	if IsClient() then return end
	self:GetParent():RemoveHorizontalMotionController( self )
end

--------------------------------------------------------------------------------

function modifier_lina_pf_light_strike_array_vacuum:DeclareFunctions()
	return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_light_strike_array_vacuum:GetOverrideAnimation()
	return ACT_DOTA_FLAIL
end

--------------------------------------------------------------------------------

function modifier_lina_pf_light_strike_array_vacuum:UpdateHorizontalMotion(hParent, dt)
	hParent:SetOrigin(hParent:GetOrigin() + self.vDirection * self.nSpeed * dt)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_light_strike_array_vacuum:OnHorizontalMotionInterrupted()
	self:Destroy()
end
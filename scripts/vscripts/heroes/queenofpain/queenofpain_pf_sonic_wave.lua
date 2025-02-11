LinkLuaModifier("modifier_queenofpain_pf_sonic_wave", 				"heroes/queenofpain/queenofpain_pf_sonic_wave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_queenofpain_pf_sonic_wave_buff", 			"heroes/queenofpain/queenofpain_pf_sonic_wave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_queenofpain_pf_sonic_wave_trail", 		"heroes/queenofpain/queenofpain_pf_sonic_wave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_queenofpain_pf_sonic_wave_trail_burn", 	"heroes/queenofpain/queenofpain_pf_sonic_wave", LUA_MODIFIER_MOTION_NONE)

queenofpain_pf_sonic_wave = class({})

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_sonic_wave.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/sonic_wave_trail.vpcf", context)
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:Spawn()
	if IsClient() then return end
	self.Sonic_Projectiles = {}
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:OnAbilityPhaseStart()
	if IsServer() then
		self:GetCaster():EmitSound("Hero_QueenOfPain.SonicWave.Precast")
	end

	return true
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:OnAbilityPhaseInterrupted()
	if IsClient() then return end
	self:GetCaster():StopSound("Hero_QueenOfPain.SonicWave.Precast")
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("distance") - 200 --yes i hard code too sometimes, fuckoff nerd
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:OnSpellStart()
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetOrigin()
	local vPos = self:GetCursorPosition()

	if hCaster:HasShard("aghsfort_special_queenofpain_sonic_wave_circle") then
		local nCount = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_circle", "value")
		local nDegree = 360 / nCount

		for i = 1, nCount do
			self:SendSonicWave(RotatePosition(vOrigin, QAngle(0, nDegree * i, 0), vPos))
		end 
	else
		self:SendSonicWave(vPos)	
	end
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:SendSonicWave(vPos)
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetOrigin()
	local vDirection = (vPos - vOrigin):Normalized()
	local nDistance = self:GetSpecialValueFor("distance") + hCaster:GetCastRangeBonus()

	local nSonicHandle = ProjectileManager:CreateLinearProjectile({
		Source = hCaster,
		Ability = self,
    	vSpawnOrigin = vOrigin,
    	fDistance = nDistance,
    	fStartRadius = self:GetSpecialValueFor("starting_aoe"),
    	fEndRadius = self:GetSpecialValueFor("final_aoe"),
    	bHasFrontalCone = false,
		vVelocity = vDirection * self:GetSpecialValueFor("speed"),
		bDeleteOnHit = false,
    	bReplaceExisting = false,
    	fExpireTime = GameRules:GetGameTime() + 10.0,
    	iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
    	iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
    	iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		bProvidesVision = false
	})

	self.Sonic_Projectiles[nSonicHandle] = {
		vStartPosition = vOrigin,
		nDistance = nDistance,
		bFirstQuarter = false,
		bSecondQuarter = false
	}

	hCaster:EmitSound("Hero_QueenOfPain.SonicWave")

	local nSonicFX = ParticleManager:CreateParticle("particles/units/heroes/hero_queenofpain/queen_sonic_wave.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nSonicFX, 0, hCaster:GetOrigin() )
	ParticleManager:SetParticleControlForward(nSonicFX, 0, vDirection)
	ParticleManager:SetParticleControl(nSonicFX, 1, vDirection * self:GetSpecialValueFor("speed"))
	ParticleManager:ReleaseParticleIndex(nSonicFX)

	if hCaster:HasShard("aghsfort_special_queenofpain_sonic_wave_trail") then
		local nRadius = self:GetSpecialValueFor("starting_aoe")
		self:CreateTrail(vOrigin + vDirection * (nRadius / 2) , nRadius)
	end
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:OnProjectileThinkHandle(nSonicHandle)
	local hCaster = self:GetCaster()
	local vLocation = ProjectileManager:GetLinearProjectileLocation(nSonicHandle)

	if hCaster:HasShard("aghsfort_special_queenofpain_sonic_wave_trail") then
		local nCrossedDistance = (vLocation - self.Sonic_Projectiles[nSonicHandle]["vStartPosition"]):Length2D()
		local nIncValue = self:GetSpecialValueFor("final_aoe") - self:GetSpecialValueFor("starting_aoe")

		if not self.Sonic_Projectiles[nSonicHandle]["bFirstQuarter"] and nCrossedDistance > self.Sonic_Projectiles[nSonicHandle]["nDistance"] * 0.25 then
			self.Sonic_Projectiles[nSonicHandle]["bFirstQuarter"] = true
			self:CreateTrail(vLocation, self:GetSpecialValueFor("starting_aoe") + nIncValue * 0.25)
		elseif not self.Sonic_Projectiles[nSonicHandle]["bSecondQuarter"] and nCrossedDistance > self.Sonic_Projectiles[nSonicHandle]["nDistance"] * 0.5 then
			self.Sonic_Projectiles[nSonicHandle]["bSecondQuarter"] = true
			self:CreateTrail(vLocation, self:GetSpecialValueFor("starting_aoe") + nIncValue * 0.5)
		end
	end
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:OnProjectileHitHandle(hTarget, vLocation, iProjectileHandle)
	local hCaster = self:GetCaster()

	if not hTarget then
		if hCaster:HasShard("aghsfort_special_queenofpain_sonic_wave_trail") then
			self:CreateTrail(vLocation, self:GetSpecialValueFor("final_aoe"))
		end

		self:ClearID(iProjectileHandle) 
		return 
	end
	
	if self.Sonic_Projectiles[iProjectileHandle][hTarget:entindex()] then return end
	self.Sonic_Projectiles[iProjectileHandle][hTarget:entindex()] = true

	local nDuration = self:GetSpecialValueFor("knockback_duration") * (1 - hTarget:GetStatusResistance())
	local vOrigin = self.Sonic_Projectiles[iProjectileHandle]["vStartPosition"]

	hTarget:AddNewModifier(self:GetCaster(), self, "modifier_queenofpain_pf_sonic_wave", {duration = self:GetSpecialValueFor("knockback_duration")})

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
			knockback_distance = self:GetSpecialValueFor("knockback_distance"),
			knockback_height = 0,
		}
	)

	if hCaster:HasShard("aghsfort_special_queenofpain_sonic_wave_attack_buff") then
		hCaster:AddNewModifier(hCaster, self, "modifier_queenofpain_pf_sonic_wave_buff", {duration = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_attack_buff", "buff_duration")})
	end
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:CreateTrail(vPos, nRadius)
	local hCaster = self:GetCaster()

	CreateModifierThinker(
		hCaster, 
		self, 
		"modifier_queenofpain_pf_sonic_wave_trail", 
		{duration = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_trail", "trail_duration"), nRadius = nRadius}, 
		vPos, 
		hCaster:GetTeam(), 
		false
	)
end

--------------------------------------------------------------------------------

function queenofpain_pf_sonic_wave:ClearID(iProjectileHandle)
	if self.Sonic_Projectiles[iProjectileHandle] then
		for i = 0, #self.Sonic_Projectiles[iProjectileHandle] do
			self.Sonic_Projectiles[iProjectileHandle][i] = nil
		end
	end

	self.Sonic_Projectiles[iProjectileHandle] = nil
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_sonic_wave = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave:IsHidden()		return true end
function modifier_queenofpain_pf_sonic_wave:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave:OnCreated( kv )
	if IsClient() then return end

	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	local nInterval = hAbility:GetSpecialValueFor("tick_rate")

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = hParent,
		damage = hAbility:GetSpecialValueFor("damage") / (self:GetDuration() / nInterval),
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(nInterval)
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_sonic_wave_trail = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail:IsHidden()			return true end
function modifier_queenofpain_pf_sonic_wave_trail:IsPurgable()			return false end
function modifier_queenofpain_pf_sonic_wave_trail:IsAura()				return true end
function modifier_queenofpain_pf_sonic_wave_trail:GetAuraRadius()		return self.nRadius end
function modifier_queenofpain_pf_sonic_wave_trail:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_queenofpain_pf_sonic_wave_trail:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_queenofpain_pf_sonic_wave_trail:GetModifierAura()		return "modifier_queenofpain_pf_sonic_wave_trail_burn" end
function modifier_queenofpain_pf_sonic_wave_trail:GetAuraDuration()		return self.nDuration end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail:OnCreated(kv)
	if IsClient() then return end
	local hCaster = self:GetCaster()

	self.nDuration = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_trail", "linger_duration")
	self.nRadius = kv.nRadius

	local nTrailFX = ParticleManager:CreateParticle("particles/units/heroes/hero_queenofpain/sonic_wave_trail.vpcf", PATTACH_ABSORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(nTrailFX, 0, GetGroundPosition(self:GetParent():GetOrigin(), nil))
	ParticleManager:SetParticleControl(nTrailFX, 1, Vector(self.nRadius, 1, 1))
	self:AddParticle(nTrailFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail:GetEffectName()
	return "particles/units/heroes/hero_queenofpain/sonic_wave_trail.vpcf"
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_sonic_wave_trail_burn = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail_burn:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail_burn:OnCreated()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	local nInterval = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_trail", "burn_interval")
	self.nDamage = hAbility:GetSpecialValueFor("damage") * hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_trail", "damage_pct") / 100
	
	if IsClient() then return end

	self.tDamageTable = {
		attacker = hCaster,
		victim = self:GetParent(),
		damage = self.nDamage * nInterval,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_trail", "burn_interval"))
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail_burn:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail_burn:DeclareFunctions()
	return {MODIFIER_PROPERTY_TOOLTIP}
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_trail_burn:OnTooltip()
	return self.nDamage
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_sonic_wave_buff = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_buff:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_buff:OnCreated()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	self.nSpellAmp = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_attack_buff", "spell_amp")
	self.nDamage = hCaster:FindTalentValue("aghsfort_special_queenofpain_sonic_wave_attack_buff", "bonus_damage")
	
	if IsClient() then return end
	self:SetStackCount(1)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_buff:OnRefresh()
	if IsClient() then return end
	self:IncrementStackCount()
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_buff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE
	}
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_buff:GetModifierSpellAmplify_Percentage()
	return self.nSpellAmp * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_sonic_wave_buff:GetModifierPreAttack_BonusDamage()
	return self.nDamage * self:GetStackCount()
end
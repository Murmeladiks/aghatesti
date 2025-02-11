LinkLuaModifier("modifier_void_spirit_pf_resonant_pulse", 				"heroes/void_spirit/void_spirit_pf_resonant_pulse", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_resonant_pulse_cadence", 		"heroes/void_spirit/void_spirit_pf_resonant_pulse", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_resonant_pulse_suppression", 	"heroes/void_spirit/void_spirit_pf_resonant_pulse", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_ring", 						"heroes/void_spirit/void_spirit_pf_resonant_pulse", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

void_spirit_pf_resonant_pulse = class({})

--------------------------------------------------------------------------------

function void_spirit_pf_resonant_pulse:Precache(context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_void_spirit.vsndevts", context)
    PrecacheResource("particle", "particles/status_fx/status_effect_void_spirit_pulse_buff.vpcf", context)
    PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse.vpcf", context )
    PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_buff.vpcf", context )
    PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_shield.vpcf", context )
    PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_impact.vpcf", context )
    PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_absorb.vpcf", context )
    PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_shield_deflect.vpcf", context )
	PrecacheResource("particle", "particles/items_fx/black_king_bar_avatar.vpcf", context )
end

--------------------------------------------------------------------------------

function void_spirit_pf_resonant_pulse:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("radius")
end


--------------------------------------------------------------------------------

function void_spirit_pf_resonant_pulse:OnSpellStart()
	local hCaster = self:GetCaster()

	hCaster:AddNewModifier(hCaster, self, "modifier_void_spirit_pf_resonant_pulse", {duration = self:GetSpecialValueFor("buff_duration")})
	hCaster:EmitSound("Hero_VoidSpirit.Pulse.Cast")

	if hCaster:HasShard("special_bonus_unique_void_spirit_resonant_pulse_suppression") then
		hCaster:AddNewModifier(hCaster, self, "modifier_void_spirit_pf_resonant_pulse_suppression", {duration = hCaster:FindTalentValue("special_bonus_unique_void_spirit_resonant_pulse_suppression", "value2")})
	end
end

--------------------------------------------------------------------------------

function void_spirit_pf_resonant_pulse:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not hTarget then
		return 0
	end

	local hMod = hTarget:FindModifierByNameAndCaster("modifier_void_spirit_pf_resonant_pulse", self:GetCaster())

	if not hMod then return end
	
	hMod:Absorb(ExtraData.nEnemyEID)
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_resonant_pulse = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:OnCreated( kv )
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nRadius = hAbility:GetSpecialValueFor("radius")
	self.nSpeed = hAbility:GetSpecialValueFor("speed")
	self.nDamage = hAbility:GetSpecialValueFor("damage")
	self.nBaseAbsorb = hAbility:GetSpecialValueFor("base_absorb_amount")
	self.nUnitAbsorb = hAbility:GetSpecialValueFor("absorb_per_unit_hit")
	self.nHeroMultiplier = hAbility:GetSpecialValueFor("hero_absorb_multiplier")
	self.nBossMultiplier = hAbility:GetSpecialValueFor("boss_absorb_multiplier")
	self.nShield = self.nBaseAbsorb

	if IsClient() then return end

	self.tDamageTable = {
		attacker = hParent,
		victim = nil,
		damage = self.nDamage,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility,
	}

	self.tProjectile = {
		Target = hParent,
		Source = nil,
		Ability = hAbility,
		EffectName = "",
		iMoveSpeed = hAbility:GetSpecialValueFor("return_projectile_speed"),
		bDodgeable = false,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		ExtraData = {}
	}

	self.tKnockbackKV = {
		center_x = 0,
		center_y = 0,
		center_z = 0,
		should_stun = false, 
		duration = 0.25,
		knockback_duration = 0.25,
		knockback_distance = hParent:FindTalentValue("aghsfort_special_void_spirit_resonant_pulse_knockback", "value"),
		knockback_height = 0,
	}

	if not kv.shard then
		local pulse = hParent:AddNewModifier(
			hParent,
			hAbility,
			"modifier_void_spirit_pf_ring",
			{
				end_radius = self.nRadius,
				speed = self.nSpeed,
				target_team = hParent:HasShard("aghsfort_special_void_spirit_resonant_pulse_cadence") and DOTA_UNIT_TARGET_TEAM_BOTH or DOTA_UNIT_TARGET_TEAM_ENEMY,
				target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
			}
		)

		pulse:SetCallback(function(hEnemy)
			self:OnUnitHit(hEnemy)
		end)

		local nFXRadius = self.nRadius * 2

		local nPulseFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
		ParticleManager:SetParticleControl(nPulseFX, 1, Vector(nFXRadius, nFXRadius, nFXRadius))
		ParticleManager:ReleaseParticleIndex(nPulseFX)
		hParent:EmitSound("Hero_VoidSpirit.Pulse")
	end

	local nModelRadius = hParent:GetModelRadius()
	local nShieldFX = ParticleManager:CreateParticle( "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_shield.vpcf", PATTACH_POINT_FOLLOW, hParent )
	ParticleManager:SetParticleControl(nShieldFX, 1, Vector(nModelRadius, nModelRadius, nModelRadius))
	ParticleManager:SetParticleControlEnt(nShieldFX, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
	self:AddParticle(nShieldFX, false, false, -1, false, false)

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle( "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	)

	self:SetHasCustomTransmitterData(true)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:OnRefresh( kv )
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nDamage = hAbility:GetSpecialValueFor("damage")
	self.nBaseAbsorb = hAbility:GetSpecialValueFor("base_absorb_amount")
	self.nUnitAbsorb = hAbility:GetSpecialValueFor("absorb_per_unit_hit")

	self.nShield = self.nBaseAbsorb > self.nShield and self.nBaseAbsorb or self.nShield

	self.tDamageTable = {
		attacker = hParent,
		victim = nil,
		damage = self.nDamage,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility,
	}

	if not kv.shard then
		local pulse = hParent:AddNewModifier(
			hParent,
			hAbility,
			"modifier_void_spirit_pf_ring",
			{
				end_radius = self.nRadius,
				speed = self.nSpeed,
				target_team = hParent:HasShard("aghsfort_special_void_spirit_resonant_pulse_cadence") and DOTA_UNIT_TARGET_TEAM_BOTH or DOTA_UNIT_TARGET_TEAM_ENEMY,
				target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
			}
		)

		pulse:SetCallback(function(hEnemy)
			self:OnUnitHit(hEnemy)
		end)

		local nFXRadius = self.nRadius * 2
		
		local nPulseFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
		ParticleManager:SetParticleControl(nPulseFX, 1, Vector(nFXRadius, nFXRadius, nFXRadius))
		ParticleManager:ReleaseParticleIndex(nPulseFX)
		hParent:EmitSound("Hero_VoidSpirit.Pulse")
	end

	self:SendBuffRefreshToClients()
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:OnUnitHit(hEnemy)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	if hEnemy:GetTeam() == hParent:GetTeam() and hParent ~= hEnemy then
		hEnemy:AddNewModifier(hParent, hAbility, "modifier_void_spirit_pf_resonant_pulse_cadence", {duration = self:GetDuration()})
	elseif hEnemy:GetTeam() ~= hParent:GetTeam() then
		self.tDamageTable.victim = hEnemy
		ApplyDamage(self.tDamageTable)

		local nImapctFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, hEnemy)
		ParticleManager:SetParticleControlEnt(nImapctFX, 0, target,PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nImapctFX, 1, target,PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:ReleaseParticleIndex(nImapctFX)
		EmitSoundOn("Hero_VoidSpirit.Pulse.Target", hEnemy)

		self.tProjectile.Source = hEnemy
		self.tProjectile.ExtraData.nEnemyEID = hEnemy:entindex()
		ProjectileManager:CreateTrackingProjectile(self.tProjectile)

		local nAbsorbFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_absorb.vpcf", PATTACH_ABSORIGIN_FOLLOW, hEnemy)
		ParticleManager:SetParticleControlEnt(nAbsorbFX, 0, hEnemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nAbsorbFX, 1, hParent, PATTACH_POINT_FOLLOW,"attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:ReleaseParticleIndex(nAbsorbFX)

		if hParent:HasShard("aghsfort_special_void_spirit_resonant_pulse_knockback") then
			local vOrigin = hParent:GetOrigin()
			self.tKnockbackKV.center_x = vOrigin.x
			self.tKnockbackKV.center_y = vOrigin.y
			self.tKnockbackKV.center_z = vOrigin.z
			hEnemy:AddNewModifier(hParent, hAbility, "modifier_knockback", self.tKnockbackKV)

			hParent:PerformAttack(hEnemy, false, true, true, true, false, false, true)
		end
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:OnDestroy()
	if IsClient() then return end
	self:GetParent():EmitSound("Hero_VoidSpirit.Pulse.Destroy")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:AddCustomTransmitterData()
	return {nShield = self.nShield}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:HandleCustomTransmitterData(tData)
	self.nShield = tData.nShield
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:DeclareFunctions()
	if self:GetAbility():GetSpecialValueFor("is_all_barrier") == 1 then
		return {MODIFIER_PROPERTY_INCOMING_DAMAGE_CONSTANT}
	else
		return {MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_CONSTANT}
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:GetModifierIncomingDamageConstant(event)
	if IsServer() then
		local hParent = self:GetParent()

		local nDeflectFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_shield_deflect.vpcf", PATTACH_POINT_FOLLOW, hParent)
		ParticleManager:SetParticleControlEnt(nDeflectFX, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
		ParticleManager:SetParticleControl(nDeflectFX, 1, Vector(100, 100, 100))
		ParticleManager:ReleaseParticleIndex(nDeflectFX)

		if event.damage > self.nShield then
			local nReduction = -self.nShield

			self.nShield = 0

			if not hParent:HasModifier("modifier_void_spirit_pf_ring") then
				self:Destroy()
			end

			return nReduction
		else
			self.nShield = self.nShield - event.damage
			self:SendBuffRefreshToClients()
			return -event.damage
		end
	else
		return self.nShield
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:GetModifierIncomingPhysicalDamageConstant(event)
	if IsServer() then
		local hParent = self:GetParent()

		local nDeflectFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_shield_deflect.vpcf", PATTACH_POINT_FOLLOW, hParent)
		ParticleManager:SetParticleControlEnt(nDeflectFX, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
		ParticleManager:SetParticleControl(nDeflectFX, 1, Vector(100, 100, 100))
		ParticleManager:ReleaseParticleIndex(nDeflectFX)

		if event.damage > self.nShield then
			local nReduction = -self.nShield

			self.nShield = 0

			if not hParent:HasModifier("modifier_void_spirit_pf_ring") then
				self:Destroy()
			end

			return nReduction
		else
			self.nShield = self.nShield - event.damage
			self:SendBuffRefreshToClients()
			return -event.damage
		end
	else
		return self.nShield
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:Absorb(nEntityID)
	local nAbsorbAmount = self.nUnitAbsorb
	local hEnemy = EntIndexToHScript(nEntityID)

	--print("WARNING - TEST BOSS CHECKS BEFORE PUBLISH")

	if hEnemy and not hEnemy:IsNull() then
		if hEnemy:IsBoss() or hEnemy:IsBossCreature() or hEnemy.bIsBoss then
			nAbsorbAmount = nAbsorbAmount * self.nBossMultiplier
		elseif hEnemy:IsConsideredHero() then
			nAbsorbAmount = nAbsorbAmount * self.nHeroMultiplier
		end
	end

	self.nShield = self.nShield + nAbsorbAmount
	self:SendBuffRefreshToClients()
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:GetStatusEffectName()
	return "particles/status_fx/status_effect_void_spirit_pulse_buff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_ring = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_ring:IsHidden() 		return true end
function modifier_void_spirit_pf_ring:IsPurgable() 		return false end
function modifier_void_spirit_pf_ring:RemoveOnDeath() 	return false end
function modifier_void_spirit_pf_ring:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_ring:OnCreated( kv )
	if IsClient() then return end

	-- references
	self.start_radius = kv.start_radius or 0
	self.end_radius = kv.end_radius or 0
	self.width = kv.width or 100
	self.speed = kv.speed or 0
	self.outward = self.end_radius>=self.start_radius
	if not self.outward then
		self.speed = -self.speed
	end

	self.target_team = kv.target_team or 0
	self.target_type = kv.target_type or 0
	self.target_flags = kv.target_flags or 0

	self.IsCircle = kv.IsCircle or 1

	self.targets = {}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_ring:OnDestroy()
	if self.EndCallback then
		self.EndCallback()
	end

	if IsClient() then return end

	if self:GetParent():GetClassname() == "npc_dota_thinker" then
		UTIL_Remove(self:GetParent())
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_ring:SetCallback( callback )
	self.Callback = callback

	-- Start interval
	self:StartIntervalThink( 0.03 )
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_ring:SetEndCallback( callback )
	self.EndCallback = callback
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_ring:OnIntervalThink()
	local radius = self.start_radius + self.speed * self:GetElapsedTime()

	if not self.outward and radius<self.end_radius then
		self:Destroy()
		return
	elseif self.outward and radius>self.end_radius then
		self:Destroy()
		return
	end

	local hParent = self:GetParent()

	local targets = FindUnitsInRadius(hParent:GetTeamNumber(), hParent:GetOrigin(), nil, radius, self.target_team, self.target_type, self.target_flags, 0, false)

	for _, target in pairs(targets) do
		if not self.targets[target] then
			if (not self.IsCircle) or (target:GetOrigin() - hParent:GetOrigin()):Length2D() > (radius - self.width) then
				self.targets[target] = true
				self.Callback( target )
			end
		end
	end
end


--------------------------------------------------------------------------------

modifier_void_spirit_pf_resonant_pulse_cadence = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:OnCreated(kv)
	if IsClient() then return end

	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nShieldValue = hAbility:GetSpecialValueFor("base_absorb_amount") * self:GetCaster():FindTalentValue("aghsfort_special_void_spirit_resonant_pulse_cadence", "value2")
	self.nMaxShield = self.nShieldValue

	local nModelRadius = hParent:GetModelRadius()

	local nShieldFX = ParticleManager:CreateParticle( "particles/units/heroes/hero_void_spirit/pulse/void_spirit_pulse_shield.vpcf", PATTACH_POINT_FOLLOW, hParent)
	ParticleManager:SetParticleControl(nShieldFX, 1, Vector(nModelRadius, nModelRadius, nModelRadius))
	ParticleManager:SetParticleControlEnt(nShieldFX, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
	self:AddParticle(nShieldFX, false, false, -1, false, false)
	
	self:SetHasCustomTransmitterData(true)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:OnRefresh(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()

	self.nShieldValue = hAbility:GetSpecialValueFor("base_absorb_amount") * self:GetCaster():FindTalentValue("aghsfort_special_void_spirit_resonant_pulse_cadence", "value2")
	self.nMaxShield = self.nShieldValue

	self:SendBuffRefreshToClients()
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:AddCustomTransmitterData()
	return {
		nShieldValue = self.nShieldValue,
		nMaxShield = self.nMaxShield
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:HandleCustomTransmitterData(data)
	self.nShieldValue = data.nShieldValue
	self.nMaxShield = data.nMaxShield
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:DeclareFunctions()
	return {MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_CONSTANT}
end

--------------------------------------------------------------------------------


function modifier_void_spirit_pf_resonant_pulse_cadence:GetModifierIncomingPhysicalDamageConstant(event)
	if IsServer() then		
		local nDamage = event.damage
		local nReduction = -self.nShieldValue

		self.nShieldValue = math.max(0, self.nShieldValue - nDamage)

		if self.nShieldValue <= 0 then
			self:Destroy()
		end

		self:SendBuffRefreshToClients()

		return nReduction
	else
		return event.report_max and self.nMaxShield or self.nShieldValue
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:GetStatusEffectName()
	return "particles/status_fx/status_effect_void_spirit_pulse_buff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_cadence:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_void_spirit_pf_resonant_pulse_suppression = class({})

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_suppression:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_suppression:OnCreated()
	if IsClient() then return end
	local hParent = self:GetParent()

	local nImmunityFX = ParticleManager:CreateParticle("particles/items_fx/black_king_bar_avatar.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControlEnt(nImmunityFX, 2, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	self:AddParticle(nImmunityFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_suppression:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE_MAX,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_suppression:CheckState()
	return {
		[MODIFIER_STATE_DEBUFF_IMMUNE] = true
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_suppression:GetModifierMagicalResistanceBonus()
	return 60
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_resonant_pulse_suppression:GetPriority()
	return MODIFIER_PRIORITY_ULTRA
end
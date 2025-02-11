LinkLuaModifier("modifier_lich_pf_chainfrost_slow", "heroes/lich/lich_pf_chain_frost", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_chainfrost_frostbound", "heroes/lich/lich_pf_chain_frost", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

lich_pf_chain_frost = class({})

--------------------------------------------------------------------------------

function lich_pf_chain_frost:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_chain_frost.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_slowed_cold.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_chain_frost_frostbound.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_frost_lich.vpcf", context)
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:GetBehavior()
	if IsServer() and self:GetCaster():FindAbilityByName("lich_pf_sinister_gaze"):IsChanneling() then
		return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE + DOTA_ABILITY_BEHAVIOR_IGNORE_CHANNEL
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:CastFilterResultTarget(hTarget)
	local hCaster = self:GetCaster()

	if hTarget == hCaster then return UF_FAIL_CUSTOM end

	if hCaster:HasShard("special_bonus_unique_lich_chain_frost_applies_frost_shield") then
		return UnitFilter(hTarget, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, hCaster:GetTeamNumber())
	end

	return self.BaseClass.CastFilterResultTarget(self, hTarget)
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:GetCustomCastErrorTarget(hTarget)
	if hTarget == self:GetCaster() then return "#dota_hud_error_cant_cast_on_self" end
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget =  self:GetCursorTarget()
	local nJumps = self:GetSpecialValueFor("jumps")

	self:LaunchChainFrost(hCaster, hTarget, nJumps, true, nJumps)

	hCaster:EmitSound("Hero_Lich.ChainFrost")
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:LaunchChainFrost(hSource, hTarget, nJumps, bMain, nOriginalBounces, nSoundID)
	if not hTarget then
		return 0
	end

	local hCaster = self:GetCaster()
	
	local hChainFrostProj = {
		EffectName = "particles/units/heroes/hero_lich/lich_chain_frost.vpcf",
		Ability = self,
		Source = hSource,
		bProvidesVision = true,
		iVisionRadius = self:GetSpecialValueFor("vision_radius"),
		iVisionTeamNumber = hCaster:GetTeam(),
		Target = hTarget,
		iMoveSpeed = bMain and self:GetSpecialValueFor("initial_projectile_speed") or self:GetSpecialValueFor("projectile_speed"),
		bDodgeable = false,
		bReplaceExisting = false,
		bDrawsOnMinimap = false,
		iSourceAttachment = bMain and DOTA_PROJECTILE_ATTACHMENT_ATTACK_1 or DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		ExtraData = {
			nJumps = nJumps,
			nOriginalBounces = nOriginalBounces,
			bMain = bMain,
			nSoundID = nSoundID
		}
	}

	if bMain then
		local hSoundEntity = CreateModifierThinker(hCaster, self, "", {duration = 20}, hCaster:GetOrigin(), hCaster:GetTeam(), false)
		hSoundEntity:EmitSound("Hero_Lich.ChainFrostLoop")
		hChainFrostProj.ExtraData.nSoundID = hSoundEntity:entindex() 
	end

	ProjectileManager:CreateTrackingProjectile(hChainFrostProj)
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:OnProjectileThink_ExtraData(vLocation, ExtraData)
	if ExtraData.nSoundID then
		local hSoundEntity = EntIndexToHScript(ExtraData.nSoundID)

		if hSoundEntity and not hSoundEntity:IsNull() then
			hSoundEntity:SetOrigin(vLocation)
		end
	end
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:OnProjectileHit_ExtraData(hTarget, vLocation, hExtra)
	local hCaster = self:GetCaster()
	local nJumps = hExtra.nJumps
	local nOriginalBounces = hExtra.nOriginalBounces
	local bBounced = false
	local bMain = hExtra.bMain == 1
	local sSound = hTarget:IsConsideredHero() and "Hero_Lich.ChainFrostImpact.Hero" or "Hero_Lich.ChainFrostImpact.Creep"
	local nBounceDamage = self:GetSpecialValueFor("bonus_jump_damage") * (nOriginalBounces - nJumps)
	local bAlly = hTarget:GetTeam() == hCaster:GetTeam()
	local bCanSplit = hCaster:HasShard("aghsfort_special_lich_chain_frost_split")
	local nJumpRange = self:GetSpecialValueFor("jump_range")
	local bAllyJump = hCaster:HasShard("special_bonus_unique_lich_chain_frost_applies_frost_shield")

	if not hTarget or hTarget:IsNull() then
		self:StopChainSound(hExtra)
		return
	end

	hTarget:EmitSound(sSound)

	if not bAlly then
		local hDamageTable = {
			victim = hTarget,
			attacker = hCaster,
			damage = self:GetSpecialValueFor("damage") + nBounceDamage,
			damage_type = self:GetAbilityDamageType(),
			ability = self
		}

		if bMain and not hTarget:TriggerSpellAbsorb(self) then
			ApplyDamage(hDamageTable)
		elseif not bMain then
			ApplyDamage(hDamageTable)
		end

		if not hTarget:IsAlive() and hCaster:GetHeroFacetID() == 2 then
			local nAddedJumps = hTarget:IsConsideredHero() and self:GetSpecialValueFor("bonus_jumps_per_hero_killed") or self:GetSpecialValueFor("bonus_jumps_per_creep_killed")

			hExtra.nJumps = nJumps + nAddedJumps
			hExtra.nOriginalBounces = nOriginalBounces + nAddedJumps

			nJumps = hExtra.nJumps
			nOriginalBounces = hExtra.nOriginalBounces
		end

		hTarget:AddNewModifier(hCaster, self, "modifier_lich_pf_chainfrost_slow", {duration = self:GetSpecialValueFor("slow_duration") * (1 - hTarget:GetStatusResistance())})

		if hCaster:HasShard("aghsfort_special_lich_chain_frost_applies_frost_nova") then
			local hFrostNova = hCaster:FindAbilityByName("lich_pf_frost_nova")

			if hFrostNova and hFrostNova:IsTrained() then
				hFrostNova:FrostNova(hTarget)
			end
		end
	else
		if hTarget:GetUnitName() == "npc_dota_aghsfort_lich_ice_spire" then
			hTarget:StartGesture(ACT_DOTA_ATTACK)
		end

		if bAllyJump then
			local hShieldAbility = hCaster:FindAbilityByName("lich_pf_frost_shield")

			if hShieldAbility and hShieldAbility:IsTrained() then
				hShieldAbility:GiveShield(hTarget)
			end
		end
	end

	if nJumps == 0 then
		self:StopChainSound(hExtra)
		return
	end

	local bChaining = false

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, nJumpRange, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)

	if bAllyJump then
		local nAllyRange = nJumpRange * (hCaster:FindTalentValue("special_bonus_unique_lich_chain_frost_applies_frost_shield", "bonus_friend_range_pct") / 100 + 1)
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, nAllyRange, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0, false)
		hEnemies = table.shuffled(table.concat(hEnemies, hAllies))
	end

	if bCanSplit and nJumps > 1 and #hEnemies > 2 then
		local nJumpsX = math.floor(nJumps / 2) + nJumps % 2
		local nJumpsY = math.floor(nJumps / 2)
		local nTargets = 0

		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				local nCorrespondingJumps = nTargets == 0 and nJumpsX or nJumpsY
				Timers:CreateTimer(self:GetSpecialValueFor("bounce_delay"), function() 
					self:LaunchChainFrost(hTarget, hEnemy, nCorrespondingJumps - 1, false, nOriginalBounces, hExtra.nSoundID)
				end)
				bChaining = true
				nTargets = nTargets + 1

				if nTargets > 1 then break end
			end
		end
	else
		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				Timers:CreateTimer(self:GetSpecialValueFor("bounce_delay"), function() 
					self:LaunchChainFrost(hTarget, hEnemy, nJumps - 1, false, nOriginalBounces, hExtra.nSoundID)
				end)
				bChaining = true
				break
			end
		end
	end

	if not bChaining then 
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, self:GetSpecialValueFor("jump_range"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_OTHER, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, 0, false)
		for _, hAlly in pairs(hAllies) do
			if hAlly ~= hTarget and hAlly:GetUnitName() == "npc_dota_aghsfort_lich_ice_spire" then
				Timers:CreateTimer(self:GetSpecialValueFor("bounce_delay"), function() 
					self:LaunchChainFrost(hTarget, hAlly, nJumps - 1, false, nOriginalBounces, hExtra.nSoundID)
				end)
				bChaining = true
				break
			end
		end
	end

	if not bChaining then
		if hCaster:GetHeroFacetID() == 1 and hTarget:IsAlive() then
			local hFrostbound = hTarget:AddNewModifier(hCaster, self, "modifier_lich_pf_chainfrost_frostbound", {duration = self:GetSpecialValueFor("frostbound_duration")})
			hFrostbound.hExtra = hExtra
			hFrostbound.bAllyJump = bAllyJump
			hFrostbound.bCanSplit = bCanSplit
		else
			self:StopChainSound(hExtra)
		end
	end
end

--------------------------------------------------------------------------------

function lich_pf_chain_frost:StopChainSound(hExtra)
	if hExtra.nSoundID then
		local hSoundEntity = EntIndexToHScript(hExtra.nSoundID)

		if hSoundEntity and not hSoundEntity:IsNull() then
			hSoundEntity:StopSound("Hero_Lich.ChainFrostLoop")
			UTIL_Remove(hSoundEntity)
		end
	end
end

--------------------------------------------------------------------------------

modifier_lich_pf_chainfrost_slow = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:OnCreated()
	local hAbility = self:GetAbility()
	
	self.nMoveSlow = hAbility:GetSpecialValueFor("slow_movement_speed")
	self.nAttackSlow = hAbility:GetSpecialValueFor("slow_attack_speed")
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
	}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSlow
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:GetEffectName()
	return "particles/units/heroes/hero_lich/lich_slowed_cold.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:GetStatusEffectName()
	return "particles/status_fx/status_effect_frost_lich.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_slow:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_lich_pf_chainfrost_frostbound = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_frostbound:OnCreated()
	if IsClient() then return end
	self.nJumpRange = self:GetAbility():GetSpecialValueFor("jump_range")
	self:StartIntervalThink(FrameTime())
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_frostbound:OnDestroy()
	if IsClient() or self.bChained then return end
	self:GetAbility():StopChainSound(self.hExtra)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_frostbound:OnIntervalThink()
	local hAbility = self:GetAbility()
	local hTarget = self:GetParent()
	local hCaster = self:GetCaster()
	local nJumps = self.hExtra["nJumps"]
	local nOriginalBounces = self.hExtra["nOriginalBounces"]
	local bChaining = false

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, self.nJumpRange, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)

	if self.bAllyJump then
		local nAllyRange = self.nJumpRange * (hCaster:FindTalentValue("special_bonus_unique_lich_chain_frost_applies_frost_shield", "bonus_friend_range_pct") / 100 + 1)
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, nAllyRange, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0, false)
		hEnemies = table.shuffled(table.concat(hEnemies, hAllies))
	end

	if bCanSplit and nJumps > 1 and #hEnemies > 2 then
		local nJumpsX = math.floor(nJumps / 2) + nJumps % 2
		local nJumpsY = math.floor(nJumps / 2)
		local nTargets = 0

		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				local nCorrespondingJumps = nTargets == 0 and nJumpsX or nJumpsY
				Timers:CreateTimer(hAbility:GetSpecialValueFor("bounce_delay"), function() 
					hAbility:LaunchChainFrost(hTarget, hEnemy, nCorrespondingJumps - 1, false, nOriginalBounces, self.hExtra["nSoundID"])
				end)
				bChaining = true
				nTargets = nTargets + 1

				if nTargets > 1 then break end
			end
		end
	else
		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				Timers:CreateTimer(hAbility:GetSpecialValueFor("bounce_delay"), function() 
					hAbility:LaunchChainFrost(hTarget, hEnemy, nJumps - 1, false, nOriginalBounces, self.hExtra["nSoundID"])
				end)
				bChaining = true
				break
			end
		end
	end

	if not bChaining then 
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, hAbility:GetSpecialValueFor("jump_range"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_OTHER, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, 0, false)
		for _, hAlly in pairs(hAllies) do
			if hAlly ~= hTarget and hAlly:GetUnitName() == "npc_dota_aghsfort_lich_ice_spire" then
				Timers:CreateTimer(hAbility:GetSpecialValueFor("bounce_delay"), function() 
					hAbility:LaunchChainFrost(hTarget, hAlly, nJumps - 1, false, nOriginalBounces, self.hExtra["nSoundID"])
				end)
				bChaining = true
				break
			end
		end
	end

	if bChaining then
		self.bChained = true
		self:StartIntervalThink(-1)
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_chainfrost_frostbound:GetEffectName()
	return "particles/units/heroes/hero_lich/lich_chain_frost_frostbound.vpcf"
end
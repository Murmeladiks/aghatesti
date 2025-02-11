LinkLuaModifier("winter_wyvern_pf_arctic_burn_active", 	"heroes/winter_wyvern/winter_wyvern_pf_arctic_burn", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("winter_wyvern_pf_arctic_burn_slow", 	"heroes/winter_wyvern/winter_wyvern_pf_arctic_burn", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

winter_wyvern_pf_arctic_burn = class({})

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_buff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_flying.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_start.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_hero_effect.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_wyvern_arctic_burn.vpcf", context)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn:OnSpellStart()
	local hCaster = self:GetCaster()

	hCaster:AddNewModifier(hCaster, self, "winter_wyvern_pf_arctic_burn_active", {duration = self:GetSpecialValueFor("duration")})

	hCaster:EmitSound("Hero_Winter_Wyvern.ArcticBurn.Cast")

	local nStartFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_start.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nStartFX, 0, GetGroundPosition(hCaster:GetOrigin(), hCaster))	
	ParticleManager:ReleaseParticleIndex(nStartFX)
end

--------------------------------------------------------------------------------

winter_wyvern_pf_arctic_burn_active = class({})

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:OnCreated()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nAttackRange = hAbility:GetSpecialValueFor("attack_range_bonus")
	self.nProjectileSpeed = hAbility:GetSpecialValueFor("projectile_speed_bonus")
	self.nDamageDuration = hAbility:GetSpecialValueFor("damage_duration")
	self.nAttackPoint = hAbility:GetSpecialValueFor("attack_point")
	self.bCanDoubleAttack = true

	if IsClient() then return end

	local nBuffFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_buff.vpcf", PATTACH_CUSTOMORIGIN, hParent)
	ParticleManager:SetParticleControlEnt(nBuffFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, hParent:GetOrigin(), true)
	ParticleManager:SetParticleControlEnt(nBuffFX, 1, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", hParent:GetOrigin(), true)
	ParticleManager:SetParticleControlEnt(nBuffFX, 2, hParent, PATTACH_POINT_FOLLOW, "attach_attack1", hParent:GetOrigin(), true)
	ParticleManager:SetParticleControlEnt(nBuffFX, 3, hParent, PATTACH_POINT_FOLLOW, "attach_eye_l", hParent:GetOrigin(), true)
	ParticleManager:SetParticleControlEnt(nBuffFX, 4, hParent, PATTACH_POINT_FOLLOW, "attach_eye_r", hParent:GetOrigin(), true)
	self:AddParticle(nBuffFX, false, false, -1, false, false)

	if self:GetCaster() == hParent then
		local nSpineFX = ParticleManager:CreateParticle( "particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_flying.vpcf", PATTACH_CUSTOMORIGIN, hParent)
		ParticleManager:SetParticleControlEnt(nSpineFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, hParent:GetOrigin(), true)
		ParticleManager:SetParticleControlEnt(nSpineFX, 1, hParent, PATTACH_POINT_FOLLOW, "attach_spine_1", hParent:GetOrigin(), true)
		ParticleManager:SetParticleControlEnt(nSpineFX, 2, hParent, PATTACH_POINT_FOLLOW, "attach_spine_2", hParent:GetOrigin(), true)
		ParticleManager:SetParticleControlEnt(nSpineFX, 3, hParent, PATTACH_POINT_FOLLOW, "attach_spine_3", hParent:GetOrigin(), true)
		ParticleManager:SetParticleControlEnt(nSpineFX, 4, hParent, PATTACH_POINT_FOLLOW, "attach_spine_4", hParent:GetOrigin(), true)
		ParticleManager:SetParticleControlEnt(nSpineFX, 5, hParent, PATTACH_POINT_FOLLOW, "attach_spine_5", hParent:GetOrigin(), true)
		self:AddParticle(nSpineFX, false, false, -1, false, false)
	end
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:OnIntervalThink()
	self:StartIntervalThink(-1)
	self.bCanDoubleAttack = true
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_PROPERTY_BONUS_NIGHT_VISION,
		MODIFIER_PROPERTY_PROJECTILE_SPEED_BONUS,
		MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_PROJECTILE_NAME,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
		MODIFIER_PROPERTY_ATTACK_POINT_CONSTANT,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_VISUAL_Z_DELTA,
		MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
		MODIFIER_EVENT_ON_ATTACK
	}
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:CheckState()
	return {
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true
	}
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetModifierAttackRangeBonus()
	return self.nAttackRange
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetModifierProjectileSpeedBonus()
	return self.nProjectileSpeed
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetModifierProjectileName()
	return "particles/units/heroes/hero_winter_wyvern/winter_wyvern_arctic_attack.vpcf"
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetAttackSound()
	return "Hero_Winter_Wyvern.ArcticBurn.attack"
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetModifierAttackPointConstant()
	return self.nAttackPoint
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetVisualZDelta()
	return math.min(200, self:GetElapsedTime() * 300)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetActivityTranslationModifiers()
	return "flying"
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:OnAttack(event)
	if IsClient() then return end

	local hAttacker = event.attacker
	local hTarget = event.target
	local hCaster = self:GetCaster()

	if hAttacker ~= self:GetParent() or not hTarget or event.no_attack_cooldown then
		return 0
	end

	if hCaster:HasShard("aghsfort_special_winter_wyvern_arctic_burn_doubleattack") and self.bCanDoubleAttack then
		self.bCanDoubleAttack = false
		self:StartIntervalThink(hCaster:FindTalentValue("aghsfort_special_winter_wyvern_arctic_burn_doubleattack", "cooldown_tooltip"))

		Timers:CreateTimer(hCaster:FindTalentValue("aghsfort_special_winter_wyvern_arctic_burn_doubleattack", "delay"), function()
			if hTarget and not hTarget:IsNull() then
				hAttacker:PerformAttack(hTarget, false, true, true, false, true, false, false)
			end
		end)
	end


	if not hCaster:HasShard("aghsfort_special_winter_wyvern_arctic_burn_splitshot") then return end

	local nAttacks = hCaster:FindTalentValue("aghsfort_special_winter_wyvern_arctic_burn_splitshot", "arrow_count")
	local nRange = hAttacker:Script_GetAttackRange() + hCaster:FindTalentValue("aghsfort_special_winter_wyvern_arctic_burn_splitshot", "split_shot_bonus_range")
	
	local hEnemies = FindUnitsInRadius(hAttacker:GetTeamNumber(), hAttacker:GetOrigin(), nil, nRange, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)
	
	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			self.bActive = true
			hAttacker:PerformAttack(hEnemy, false, true, true, false, true, false, false)
			self.bActive = false

			nAttacks = nAttacks - 1

			if nAttacks < 1 then break end
		end
	end
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:OnAttackLanded(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target

	if hAttacker ~= self:GetParent() or not hTarget or hTarget:IsBuilding() or hTarget:IsOther() or hTarget:GetTeam() == hAttacker:GetTeam() then
		return
	end

	hTarget:AddNewModifier(hAttacker, self:GetAbility(), "winter_wyvern_pf_arctic_burn_slow", {duration = self.nDamageDuration * (1 - hTarget:GetStatusResistance())})
	hTarget:EmitSound("Hero_Winter_Wyvern.ArcticBurn.projectileImpact")

	if self:GetCaster():HasShard("aghsfort_special_winter_wyvern_arctic_burn_splash_damage") then
		local nRadius = self:GetCaster():FindTalentValue("aghsfort_special_winter_wyvern_arctic_burn_splash_damage", "value")
		local hEnemies = FindUnitsInRadius(hAttacker:GetTeamNumber(), hTarget:GetOrigin(), nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS, 0, false)

		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				ApplyDamage({
					attacker = hAttacker,
					victim = hEnemy,
					damage = event.damage,
					damage_type = event.damage_type,
					damage_flags = event.damage_flags,
					ability = self:GetAbility()
				})

				hEnemy:AddNewModifier(hAttacker, self:GetAbility(), "winter_wyvern_pf_arctic_burn_slow", {duration = self.nDamageDuration * (1 - hEnemy:GetStatusResistance())})
			end
		end
	end
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetModifierDamageOutgoing_Percentage()
	if self.bActive then
		return self:GetCaster():FindTalentValue("aghsfort_special_winter_wyvern_arctic_burn_splitshot", "damage_modifier")
	end
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_active:GetHeroEffectName()
	return "particles/units/heroes/hero_winter_wyvern/wyvern_arctic_burn_hero_effect.vpcf"
end

--------------------------------------------------------------------------------

winter_wyvern_pf_arctic_burn_slow = class({})

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_slow:OnCreated()
	local hAbility = self:GetAbility()

	self.nDamage = hAbility:GetSpecialValueFor("damage_per_second")
	self.nMoveSlow = -hAbility:GetSpecialValueFor("move_slow")

	if IsClient() then return end
	local nInterval = hAbility:GetSpecialValueFor("tick_rate")

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = self.nDamage * nInterval,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(nInterval)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_slow:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, self:GetParent(), self.tDamageTable.damage, self:GetCaster():GetPlayerOwner())
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_slow:GetStatusEffectName()
	return "particles/status_fx/status_effect_wyvern_arctic_burn.vpcf"
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_arctic_burn_slow:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end
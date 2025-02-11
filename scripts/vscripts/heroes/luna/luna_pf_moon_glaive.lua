LinkLuaModifier("modifier_luna_pf_moon_glaive",					"heroes/luna/luna_pf_moon_glaive", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_moon_glaive_knockback_buff",	"heroes/luna/luna_pf_moon_glaive", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_moon_glaive_knockback",		"heroes/luna/luna_pf_moon_glaive", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_moon_mark",					"heroes/luna/luna_pf_moon_glaive", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

luna_pf_moon_glaive = class({})

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:Precache( context )
    PrecacheResource("particle", "particles/units/heroes/hero_luna/luna_moon_glaive_bounce.vpcf", context)
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:GetIntrinsicModifierName()
    return "modifier_luna_pf_moon_glaive"
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:GetBehavior()
	if self:GetCaster():HasShard("aghsfort_special_luna_moon_glaive_knockback") then
		return DOTA_ABILITY_BEHAVIOR_NO_TARGET
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:GetCooldown(iLevel)
	if self:GetCaster():HasShard("aghsfort_special_luna_moon_glaive_knockback") then
		return self:GetCaster():FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "cooldown")
	end

	return self.BaseClass.GetCooldown(self, iLevel)
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:OnSpellStart()
	local hCaster = self:GetCaster()

	hCaster:AddNewModifier(hCaster, self, "modifier_luna_pf_moon_glaive_knockback_buff", {duration = hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "debuff_duration")})
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not hTarget then return end
	local hCaster = self:GetCaster()
	local hIntrinsic = hCaster:FindModifierByName(self:GetIntrinsicModifierName())

	ExtraData.nBounces = ExtraData.nBounces - 1
	ExtraData[tostring(hTarget:GetEntityIndex())] = 1
	ExtraData.nDamage = ExtraData.nDamage * (1 - self:GetSpecialValueFor("damage_reduction_percent") / 100)
	
	ApplyDamage({
		attacker = hCaster,
		victim = hTarget,
		damage = ExtraData.nDamage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_SECONDARY_PROJECTILE_ATTACK,
		ability = self
	})

	hTarget:EmitSound("Hero_Luna.ProjectileImpact")

	if (ExtraData.bKnockback and ExtraData.bKnockback == 1) or (hCaster:HasShard("aghsfort_special_luna_moon_glaive_knockback") and RollPseudoRandomPercentage(hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "passive_chance"), DOTA_PSEUDO_RANDOM_CUSTOM_GAME_3, hCaster)) then
		self:Knockback(hTarget)
	end

	Timers:CreateTimer(FrameTime(), function()
		if hCaster:HasShard("aghsfort_special_luna_glaives_moon_well") and not hTarget or hTarget:IsNull() or not hTarget:IsAlive() then
			self:Moonwell(vLocation)
		end
	end)

	if ExtraData.nBounces < 1 then return end

	local tAttackProjectile = {
		Target = nil,
		Source = hTarget,
		Ability = self,
		EffectName = "particles/units/heroes/hero_luna/luna_moon_glaive_bounce.vpcf",
		bDodgable = true,
		bIsAttack = true,
		bProvidesVision = false,
		iMoveSpeed = hCaster:GetProjectileSpeed(),
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		ExtraData = ExtraData
	}

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, self:GetSpecialValueFor("range"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)
	local bFound = false

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget and ExtraData[tostring(hEnemy:GetEntityIndex())] ~= 1 then
			tAttackProjectile.Target = hEnemy
			tAttackProjectile.ExtraData[tostring(hEnemy:GetEntityIndex())] = 1
			ProjectileManager:CreateTrackingProjectile(tAttackProjectile)
			bFound = true
			break
		end
	end

	if bFound or #hEnemies < 2 then return end

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			tAttackProjectile.Target = hEnemy
			ProjectileManager:CreateTrackingProjectile(tAttackProjectile)
			break
		end
	end
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:Knockback(hTarget)
	local hCaster = self:GetCaster()
	local vLocation = hCaster:GetOrigin()

	if hTarget:HasModifier("modifier_knockback") then
		hTarget:RemoveModifierByName("modifier_knockback")
	end

	local nKnockbackRadius = hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "knockback_radius")
	local nKnockbackDistance = math.max(0, nKnockbackRadius - (hTarget:GetOrigin() - hCaster:GetOrigin()):Length2D())

	hTarget:AddNewModifier(hCaster, self, "modifier_luna_pf_moon_glaive_knockback", {duration = hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "debuff_duration")})
	hTarget:AddNewModifier(hCaster, self, "modifier_knockback", {
		center_x = vLocation.x,
		center_y = vLocation.y,
		center_z = vLocation.z,
		should_stun = true, 
		duration = hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "stun_duration"),
		knockback_duration = hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "bounce_duration"),
		knockback_distance = nKnockbackDistance,
		knockback_height = 0,
	})
end

--------------------------------------------------------------------------------

function luna_pf_moon_glaive:Moonwell(vPos)
	local hCaster = self:GetCaster()
	local hEclipse = hCaster:FindAbilityByName("luna_pf_eclipse")

	if not hEclipse or not hEclipse:IsTrained() then return end

	local nEclipsePct = hCaster:FindTalentValue("aghsfort_special_luna_glaives_moon_well", "eclipse_pct") / 100

	CreateModifierThinker(hCaster, hEclipse, "modifier_luna_pf_eclipse", {nBeams = hEclipse:GetSpecialValueFor("beams") * nEclipsePct, nRadius = hCaster:FindTalentValue("aghsfort_special_luna_glaives_moon_well", "moon_well_radius")}, vPos, hCaster:GetTeam(), false)

	GameRules:BeginTemporaryNight(hEclipse:GetSpecialValueFor("night_duration") * nEclipsePct)
end

--------------------------------------------------------------------------------

modifier_luna_pf_moon_glaive = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive:IsPurgable()	return false end
function modifier_luna_pf_moon_glaive:IsHidden()	return true end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive:OnCreated(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nBounceRange = hAbility:GetSpecialValueFor("range")
	self.nBounces = hAbility:GetSpecialValueFor("bounces")

	if IsClient() then return end

	self.tAttackProjectile = {
		Target = nil,
		Source = nil,
		Ability = hAbility,
		EffectName = "particles/units/heroes/hero_luna/luna_moon_glaive_bounce.vpcf",
		bDodgable = true,
		bIsAttack = true,
		bProvidesVision = false,
		iMoveSpeed = hParent:GetProjectileSpeed(),
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
		ExtraData = {
			nBounces = self.nBounces
		}
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive:OnRefresh(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nBounceRange = hAbility:GetSpecialValueFor("range")
	self.nBounces = hAbility:GetSpecialValueFor("bounces")

	if IsClient() then return end

	self.tAttackProjectile.ExtraData = {
		nBounces = self.nBounces
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive:GetAttackSound()
	if self.bBounceActive then return "" end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive:OnAttackLanded(event)
	if event.attacker ~= self:GetParent() or IsClient() or event.no_attack_cooldown then return 0 end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hAbility = self:GetAbility()
	local bKnockback = false

	if not hTarget or hTarget:IsOther() or hAttacker:PassivesDisabled() then return end

	if hAttacker:HasModifier("modifier_luna_pf_moon_glaive_knockback_buff") then
		hAttacker:RemoveModifierByName("modifier_luna_pf_moon_glaive_knockback_buff")
		bKnockback = true		
	end

	if hAttacker:HasShard("aghsfort_special_luna_lunar_blessing_moon_mark") then
		hTarget:AddNewModifier(hAttacker, hAbility, "modifier_luna_pf_moon_mark", {duration = hAttacker:FindTalentValue("aghsfort_special_luna_lunar_blessing_moon_mark", "duration")})
	end

	local hEnemies = FindUnitsInRadius(hAttacker:GetTeam(), hTarget:GetOrigin(), nil, self.nBounceRange, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			self.tAttackProjectile.ExtraData = {}
			self.tAttackProjectile.ExtraData[tostring(hTarget:GetEntityIndex())] = 1
			self.tAttackProjectile.ExtraData.nBounces = self.nBounces
			self.tAttackProjectile.ExtraData.nDamage = event.original_damage
			self.tAttackProjectile.ExtraData.bKnockback = bKnockback

			self.tAttackProjectile.Target = hEnemy
			self.tAttackProjectile.Source = hTarget

			ProjectileManager:CreateTrackingProjectile(self.tAttackProjectile)
			break
		end
	end
end

--------------------------------------------------------------------------------

modifier_luna_pf_moon_glaive_knockback_buff = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive_knockback_buff:IsPurgable()	return false end

--------------------------------------------------------------------------------

modifier_luna_pf_moon_glaive_knockback = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive_knockback:OnCreated()
	local hCaster = self:GetCaster()

	self.nMoveSlow = -hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "move_speed_slow_pct")
	self.nAttackSlow = -hCaster:FindTalentValue("aghsfort_special_luna_moon_glaive_knockback", "attack_speed_slow")
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive_knockback:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive_knockback:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_glaive_knockback:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSlow
end

--------------------------------------------------------------------------------

modifier_luna_pf_moon_mark = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_mark:OnCreated()
	local hCaster = self:GetCaster()

	self.nSpellResist = -hCaster:FindTalentValue("aghsfort_special_luna_lunar_blessing_moon_mark", "spell_resist_pct")

	if IsClient() then return end
	local hBeam = hCaster:FindAbilityByName("luna_pf_lucent_beam")

	if hBeam then
		table.insert(hBeam.tMarkedTargets, self:GetParent())
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_mark:OnDestroy()
	if IsClient() then return end
	local hBeam = self:GetCaster():FindAbilityByName("luna_pf_lucent_beam")
	local hParent = self:GetParent()

	if not hBeam then return end

	for _, hEnemy in pairs(hBeam.tMarkedTargets) do
		if hEnemy == hParent then
			table.remove(hBeam.tMarkedTargets, _)
			break
		end
	end
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_mark:DeclareFunctions()
	return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_mark:GetModifierMagicalResistanceBonus()
	return self.nSpellResist
end

--------------------------------------------------------------------------------

function modifier_luna_pf_moon_mark:GetTexture()
	return "luna_lunar_blessing"
end
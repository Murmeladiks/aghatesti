LinkLuaModifier("modifier_aghsfort_dragon_knight_elder_dragon_form", 			"abilities/creatures/aghsfort_dragon_knight_elder_dragon_form", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion", 	"abilities/creatures/aghsfort_dragon_knight_elder_dragon_form", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_aghsfort_dragon_knight_elder_dragon_form_frost", 		"abilities/creatures/aghsfort_dragon_knight_elder_dragon_form", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

aghsfort_dragon_knight_elder_dragon_form = class({})

--------------------------------------------------------------------------------

function aghsfort_dragon_knight_elder_dragon_form:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_dragon_knight.vsndevts", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dragon_knight/dragon_knight_transform_blue.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_frost.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_frost.vpcf", context)
end

--------------------------------------------------------------------------------

function aghsfort_dragon_knight_elder_dragon_form:OnSpellStart()
	local hCaster = self:GetCaster()
	
	hCaster:AddNewModifier(hCaster, self, "modifier_aghsfort_dragon_knight_elder_dragon_form", {})
end

--------------------------------------------------------------------------------

modifier_aghsfort_dragon_knight_elder_dragon_form = class({})

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:OnCreated(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nMoveSpeed = hAbility:GetSpecialValueFor("bonus_movement_speed")
	self.nAttackRange = hAbility:GetSpecialValueFor("bonus_attack_range")
	self.nDamage = hAbility:GetSpecialValueFor("bonus_attack_damage")
	self.nCorrosiveDuration = hAbility:GetSpecialValueFor("corrosive_breath_duration")
	self.nSplashDamagePct = hAbility:GetSpecialValueFor("splash_damage_percent") / 100
	self.nFrostDuration = hAbility:GetSpecialValueFor("frost_duration")
	self.nFrostRadius = hAbility:GetSpecialValueFor("frost_aoe")
	self.nMagicRes = hAbility:GetSpecialValueFor("magic_resistance")
	self.nScale = hAbility:GetSpecialValueFor("model_scale")

	if IsClient() then return end

	hParent:SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
	EmitSoundOn("Hero_DragonKnight.ElderDragonForm", hParent)
	
	self:StartIntervalThink(FrameTime())
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:OnIntervalThink()
	self:GetParent():SetMaterialGroup("2")
	self:StartIntervalThink(-1)

	local nTrasnformFX = ParticleManager:CreateParticle("particles/units/heroes/hero_dragon_knight/dragon_knight_transform_blue.vpcf", PATTACH_ABSORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(nTrasnformFX, 0, self:GetParent():GetOrigin() + Vector(0, 0, 80))
	ParticleManager:ReleaseParticleIndex(nTrasnformFX)
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
		MODIFIER_PROPERTY_MODEL_CHANGE,
		MODIFIER_PROPERTY_MODEL_SCALE,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
		MODIFIER_PROPERTY_PROJECTILE_NAME,
		MODIFIER_PROPERTY_PROJECTILE_SPEED_BONUS,
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
	}
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierMoveSpeedBonus_Constant(event)
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierAttackRangeBonus(event)
	return self.nAttackRange
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierPreAttack_BonusDamage(event)
	return self.nDamage
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierMagicalResistanceBonus(event)
	return self.nMagicRes
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierModelScale(event)
	return self.nScale
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierModelChange()
	return "models/heroes/dragon_knight/dragon_knight_dragon.vmdl"
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetAttackSound()
	return "Hero_DragonKnight.ElderDragonShoot3.Attack"
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierProjectileName()
	return "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_frost.vpcf"
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierProjectileSpeedBonus()
	return 900
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form:GetModifierProcAttack_Feedback(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hAbility = self:GetAbility()

	local tSplashTable = {
		attacker = hAttacker,
		victim = nil,
		damage = event.damage * self.nSplashDamagePct,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
		ability = hAbility
	}

	local hEnemies = FindUnitsInRadius(hAttacker:GetTeamNumber(), hTarget:GetOrigin(), nil, self.nFrostRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	for _, hEnemy in pairs (hEnemies) do
		hEnemy:AddNewModifier(hAttacker, hAbility, "modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion", {duration = self.nCorrosiveDuration})
		hEnemy:AddNewModifier(hAttacker, hAbility, "modifier_aghsfort_dragon_knight_elder_dragon_form_frost", {duration = self.nFrostDuration})

		if hEnemy ~= hTarget then
			tSplashTable.victim = hEnemy
			ApplyDamage(tSplashTable)
		end
	end
end

--------------------------------------------------------------------------------

modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion = class({})

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion:OnCreated(kv)
	self.nDPS = self:GetAbility():GetSpecialValueFor("corrosive_breath_damage")
	if IsClient() then return end
	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = self.nDPS,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility()
	}

	self:StartIntervalThink(1 - FrameTime())
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion:DeclareFunctions()
	return {MODIFIER_PROPERTY_TOOLTIP}
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion:OnTooltip()
	return self.nDPS
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_corrosion:GetEffectName()
	return "particles/units/heroes/hero_dragon_knight/dragon_knight_corrosion_debuff.vpcf"
end

--------------------------------------------------------------------------------

modifier_aghsfort_dragon_knight_elder_dragon_form_frost = class({})

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_frost:OnCreated(kv)
	local hAbility = self:GetAbility()
	self.nMoveSlow = hAbility:GetSpecialValueFor("frost_bonus_movement_speed")
	self.nAttackSlow = hAbility:GetSpecialValueFor("frost_bonus_attack_speed")
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_frost:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_frost:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_frost:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSlow
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_frost:GetStatusEffectName()
	return "particles/status_fx/status_effect_frost.vpcf"
end

--------------------------------------------------------------------------------

function modifier_aghsfort_dragon_knight_elder_dragon_form_frost:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end
LinkLuaModifier("modifier_item_dragon_potion", 				"items/item_dragon_potion", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_dragon_potion_corrosion", 	"items/item_dragon_potion", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_dragon_potion_frost", 		"items/item_dragon_potion", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

item_dragon_potion = class({})

--------------------------------------------------------------------------------

function item_dragon_potion:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_dragon_knight.vsndevts", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dragon_knight/dragon_knight_transform_black.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_attack_black.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_frost.vpcf", context)
end

--------------------------------------------------------------------------------

function item_dragon_potion:OnSpellStart()
	local hCaster = self:GetCaster()
	
	hCaster:AddNewModifier(hCaster, self, "modifier_item_dragon_potion", {duration = self:GetSpecialValueFor("duration")})

	self:SpendCharge(FrameTime())
end

--------------------------------------------------------------------------------

modifier_item_dragon_potion = class({})

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:OnCreated(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	self.hAbility = self:GetAbility()

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
	self.nAttackType = hParent:GetAttackCapability()

	hParent:SetAttackCapability(DOTA_UNIT_CAP_RANGED_ATTACK)
	hParent:EmitSound("Hero_DragonKnight.ElderDragonForm")
	
	self:StartIntervalThink(FrameTime())
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	hParent:SetAttackCapability(self.nAttackType)
	hParent:EmitSound("Hero_DragonKnight.ElderDragonForm.Revert")
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:OnIntervalThink()
	self:GetParent():SetMaterialGroup("3")
	self:StartIntervalThink(-1)

	local nTrasnformFX = ParticleManager:CreateParticle("particles/units/heroes/hero_dragon_knight/dragon_knight_transform_black.vpcf", PATTACH_ABSORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(nTrasnformFX, 1, self:GetParent():GetOrigin() + Vector(0, 0, 80))
	ParticleManager:ReleaseParticleIndex(nTrasnformFX)
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:DeclareFunctions()
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
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
	}
end
--------------------------------------------------------------------------------

function modifier_item_dragon_potion:CheckState()
	return {
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true
	}
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierMoveSpeedBonus_Constant(event)
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierAttackRangeBonus(event)
	return self.nAttackRange
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierPreAttack_BonusDamage(event)
	return self.nDamage
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierMagicalResistanceBonus(event)
	return self.nMagicRes
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierModelScale(event)
	return self.nScale
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierModelChange()
	return "models/heroes/dragon_knight/dragon_knight_dragon.vmdl"
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetAttackSound()
	return "Hero_DragonKnight.ElderDragonShoot3.Attack"
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierProjectileName()
	return "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_attack_black.vpcf"
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierProjectileSpeedBonus()
	return 900
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetModifierProcAttack_Feedback(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target

	local tSplashTable = {
		attacker = hAttacker,
		victim = nil,
		damage = event.damage * self.nSplashDamagePct,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
		ability = self.hAbility
	}

	local hEnemies = FindUnitsInRadius(hAttacker:GetTeamNumber(), hTarget:GetOrigin(), nil, self.nFrostRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	for _, hEnemy in pairs (hEnemies) do
		hEnemy:AddNewModifier(hAttacker, self.hAbility, "modifier_item_dragon_potion_corrosion", {duration = self.nCorrosiveDuration})
		hEnemy:AddNewModifier(hAttacker, self.hAbility, "modifier_item_dragon_potion_frost", {duration = self.nFrostDuration})

		if hEnemy ~= hTarget then
			tSplashTable.victim = hEnemy
			ApplyDamage(tSplashTable)
		end
	end
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion:GetTexture()
	return "dragon_knight_elder_dragon_form"
end

--------------------------------------------------------------------------------

modifier_item_dragon_potion_corrosion = class({})

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_corrosion:OnCreated(kv)
	self.nDPS = 20

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

function modifier_item_dragon_potion_corrosion:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_corrosion:DeclareFunctions()
	return {MODIFIER_PROPERTY_TOOLTIP}
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_corrosion:OnTooltip()
	return self.nDPS
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_corrosion:GetEffectName()
	return "particles/units/heroes/hero_dragon_knight/dragon_knight_corrosion_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_corrosion:GetTexture()
	return "dragon_knight_elder_dragon_form"
end

--------------------------------------------------------------------------------

modifier_item_dragon_potion_frost = class({})

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_frost:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_frost:GetModifierMoveSpeedBonus_Percentage()
	return -60
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_frost:GetModifierAttackSpeedBonus_Constant()
	return -60
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_frost:GetStatusEffectName()
	return "particles/status_fx/status_effect_frost.vpcf"
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_frost:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

function modifier_item_dragon_potion_frost:GetTexture()
	return "dragon_knight_elder_dragon_form"
end
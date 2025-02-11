LinkLuaModifier("modifier_lich_pf_frost_shield", 						"heroes/lich/lich_pf_frost_shield", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_frost_shield_slow", 					"heroes/lich/lich_pf_frost_shield", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_frost_shield_magic_resist_debuff", 	"heroes/lich/lich_pf_frost_shield", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_frost_giant", 						"heroes/lich/lich_pf_frost_shield", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

lich_pf_frost_shield = class({})

--------------------------------------------------------------------------------

function lich_pf_frost_shield:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_frost_armor.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_frost_armor.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_ice_age.vpcf", context)	
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_ice_age_dmg.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_ice_age_debuff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_frost_shield_magic_res.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_lich_ice_age.vpcf", context)
end

--------------------------------------------------------------------------------

function lich_pf_frost_shield:CastFilterResultTarget(hTarget)
	if hTarget:GetUnitName() == "npc_dota_aghsfort_lich_ice_spire" then return UF_SUCCESS end

	return self.BaseClass.CastFilterResultTarget(self, hTarget)
end

--------------------------------------------------------------------------------

function lich_pf_frost_shield:GetBehavior()
	if IsServer() and self:GetCaster():FindAbilityByName("lich_pf_sinister_gaze"):IsChanneling() then
		return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_DONT_RESUME_ATTACK + DOTA_ABILITY_BEHAVIOR_IMMEDIATE + DOTA_ABILITY_BEHAVIOR_IGNORE_CHANNEL
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function lich_pf_frost_shield:OnSpellStart()
	self:GiveShield(self:GetCursorTarget())
end

--------------------------------------------------------------------------------

function lich_pf_frost_shield:GiveShield(hTarget)
	local hCaster = self:GetCaster()

	hTarget:AddNewModifier(hCaster, self, "modifier_lich_pf_frost_shield", {duration = self:GetSpecialValueFor("duration")})
	hTarget:EmitSound("Hero_Lich.IceAge")

	if hCaster:HasShard("aghsfort_special_lich_frost_shield_frost_giant") then
		hTarget:AddNewModifier(hCaster, self, "modifier_lich_pf_frost_giant", {duration = self:GetSpecialValueFor("duration")})
	end

	if hCaster:HasShard("aghsfort_special_lich_frost_shield_dispels") then
		hTarget:Purge(false, true, false, true, false)
		hTarget:AddNewModifier(hCaster, self, "modifier_black_king_bar_immune", {duration = self:GetSpecialValueFor("duration") * hCaster:FindTalentValue("aghsfort_special_lich_frost_shield_dispels", "immunity_duration_pct") / 100})
	end
end

--------------------------------------------------------------------------------

modifier_lich_pf_frost_shield = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:OnCreated()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	local nInterval = hAbility:GetSpecialValueFor("interval")
	self.nDamageReduction = -hAbility:GetSpecialValueFor("damage_reduction")
	self.nSlowDuration = hAbility:GetSpecialValueFor("slow_duration")
	self.nRadius = hAbility:GetSpecialValueFor("radius")
	self.nHealthRegen = hAbility:GetSpecialValueFor("health_regen")

	if IsClient() then return end

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = nil,
		damage = hAbility:GetSpecialValueFor("damage") * nInterval,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self.nShieldFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_ice_age.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(self.nShieldFX, 1, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
	ParticleManager:SetParticleControl(self.nShieldFX, 2, Vector(self.nRadius, self.nRadius, self.nRadius))
	self:AddParticle(self.nShieldFX, false, false, -1, false, false)

	self.nArmorFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_frost_armor.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(self.nArmorFX, 0, hParent, PATTACH_OVERHEAD_FOLLOW, nil, Vector(0, 0, 0), true)
	ParticleManager:SetParticleControl(self.nArmorFX, 1, Vector(self.nRadius, self.nRadius, self.nRadius))
	ParticleManager:SetParticleControlEnt(self.nArmorFX, 2, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
	self:AddParticle(self.nArmorFX, false, false, -1, false, false)

	self:StartIntervalThink(nInterval)
	
	Timers:CreateTimer(0.1, function()
		self:OnIntervalThink()
	end)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:OnIntervalThink()
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	local bShiverShield = hCaster:HasShard("aghsfort_special_lich_frost_shield_magic_resist_debuff_and_stun")
	local nShiverDuration = hCaster:FindTalentValue("aghsfort_special_lich_frost_shield_magic_resist_debuff_and_stun", "debuff_duration")
	local nShiverStunDuration = hCaster:FindTalentValue("aghsfort_special_lich_frost_shield_magic_resist_debuff_and_stun", "stun_duration")
	local bExtendDuration = hCaster:GetHeroFacetID() == 2

	local hEnemies = FindUnitsInRadius(hParent:GetTeam(), hParent:GetOrigin(), nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, hAbility, "modifier_lich_pf_frost_shield_slow", {duration = self.nSlowDuration * (1 - hEnemy:GetStatusResistance())})

		self.tDamageTable.victim = hEnemy
		ApplyDamage(self.tDamageTable)
		
		hEnemy:EmitSound("Hero_Lich.IceAge.Damage")

		if bShiverShield then
			hEnemy:AddNewModifier(hCaster, hAbility, "modifier_stunned", {duration = nShiverStunDuration})
			hEnemy:AddNewModifier(hCaster, hAbility, "modifier_lich_pf_frost_shield_magic_resist_debuff", {duration = nShiverDuration * (1 - hEnemy:GetStatusResistance())})
		end

		if bExtendDuration and not hEnemy:IsAlive() then
			local nAddedDuration = hEnemy:IsConsideredHero() and hAbility:GetSpecialValueFor("bonus_duration_per_hero_killed") or hAbility:GetSpecialValueFor("bonus_duration_per_creep_killed")
			self:SetDuration(self:GetRemainingTime() + nAddedDuration, true)
		end
	end

	local nDamageFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_ice_age_dmg.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
	ParticleManager:SetParticleControl(nDamageFX, 0, hParent:GetOrigin())
	ParticleManager:SetParticleControl(nDamageFX, 1, hParent:GetOrigin())
	ParticleManager:SetParticleControl(nDamageFX, 2, Vector(self.nRadius, self.nRadius, self.nRadius))
	ParticleManager:ReleaseParticleIndex(nDamageFX)

	hParent:EmitSound("Hero_Lich.IceAge.Tick")
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_PERCENTAGE,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:GetModifierIncomingPhysicalDamage_Percentage(event)
	if IsClient() then return end
	
	if event.damage_category == DOTA_DAMAGE_CATEGORY_ATTACK then
		return self.nDamageReduction
	end

	return 0
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:GetModifierConstantHealthRegen()
	return self.nHealthRegen
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:GetStatusEffectName()
	return "particles/status_fx/status_effect_frost_armor.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_lich_pf_frost_shield_slow = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_slow:OnCreated()
	self.nMoveSlow = -self:GetAbility():GetSpecialValueFor("movement_slow")
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_slow:GetEffectName()
	return "particles/units/heroes/hero_lich/lich_ice_age_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_slow:GetStatusEffectName()
	return "particles/status_fx/status_effect_lich_ice_age.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_slow:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_lich_pf_frost_shield_magic_resist_debuff = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_magic_resist_debuff:OnCreated()
	self.nMagicResistPerStack = -self:GetCaster():FindTalentValue("aghsfort_special_lich_frost_shield_magic_resist_debuff_and_stun", "magic_resist_reduction")
	self.nMaxStacks = self:GetCaster():FindTalentValue("aghsfort_special_lich_frost_shield_magic_resist_debuff_and_stun", "magic_resist_reduction")

	if IsClient() then return end
	self.nCurrentStacks = 1
	self:SetStackCount(1)

	Timers:CreateTimer(self:GetDuration(), function() 
		if self and not self:IsNull() then
			self.nCurrentStacks = self.nCurrentStacks - 1
			self:SetStackCount(math.min(self.nMaxStacks, self.nCurrentStacks))
			ParticleManager:SetParticleControl(self.nStacksFX, 1, Vector(0, self:GetStackCount(), 0))
		end
	end)

	self.nStacksFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_frost_shield_magic_res.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControl(self.nStacksFX, 1, Vector(0, 1, 0))
	self:AddParticle(self.nStacksFX, false, false, -1, false, true)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_magic_resist_debuff:OnRefresh()
	if IsClient() then return end

	self.nCurrentStacks = self.nCurrentStacks + 1
	self:SetStackCount(math.min(self.nMaxStacks, self.nCurrentStacks))
	ParticleManager:SetParticleControl(self.nStacksFX, 1, Vector(0, self:GetStackCount(), 0))

	Timers:CreateTimer(self:GetDuration(), function() 
		if self and not self:IsNull() then
			self.nCurrentStacks = self.nCurrentStacks - 1
			self:SetStackCount(math.min(self.nMaxStacks, self.nCurrentStacks))
			ParticleManager:SetParticleControl(self.nStacksFX, 1, Vector(0, self:GetStackCount(), 0))
		end
	end)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_magic_resist_debuff:DeclareFunctions()
	return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_magic_resist_debuff:GetModifierMagicalResistanceBonus()
	return self.nMagicResistPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_shield_magic_resist_debuff:ShouldUseOverheadOffset()
	return true
end

--------------------------------------------------------------------------------

modifier_lich_pf_frost_giant = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:OnCreated()
	local hLegendary = self:GetCaster():FindAbilityByName("aghsfort_special_lich_frost_shield_frost_giant")
	local nInterval = 0.5

	self.nMoveSpeed = hLegendary:GetSpecialValueFor("movement_speed")
	self.nScale = hLegendary:GetSpecialValueFor("model_scale")
	self.nIntDamage = self:GetCaster():GetIntellect(false) * hLegendary:GetSpecialValueFor("pct_int_damage_per_second") / 100
	self.nRadius = hLegendary:GetSpecialValueFor("damage_radius")

	if IsClient() then return end

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = nil,
		damage = self.nIntDamage * nInterval,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility()
	}

	self:StartIntervalThink(nInterval)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:OnIntervalThink()
	local hParent = self:GetParent()
	local hEnemies = FindUnitsInRadius(hParent:GetTeam(), hParent:GetOrigin(), nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		self.tDamageTable.victim = hEnemy
		ApplyDamage(self.tDamageTable)
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MODEL_SCALE,
		MODIFIER_PROPERTY_TOOLTIP
	}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:CheckState()
	return {[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:GetModifierMoveSpeedBonus_Constant()
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:GetModifierModelScale()
	return self.nScale
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_giant:OnTooltip()
	return self.nIntDamage
end
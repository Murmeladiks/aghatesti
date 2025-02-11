LinkLuaModifier("modifier_lina_pf_fiery_soul", 			"heroes/lina/lina_pf_fiery_soul", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lina_pf_fiery_soul_active", 	"heroes/lina/lina_pf_fiery_soul", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lina_pf_crit_debuff", 		"heroes/lina/lina_pf_fiery_soul", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lina_pf_slow_burn", 			"heroes/lina/lina_pf_fiery_soul", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

lina_pf_fiery_soul = class({})

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lina/lina_fiery_soul.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf", context)
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:GetIntrinsicModifierName()
	return "modifier_lina_pf_fiery_soul"
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:CastFilterResult()
	if self:GetCaster():GetModifierStackCount(self:GetIntrinsicModifierName(), self:GetCaster()) < 1 then
		return UF_FAIL_CUSTOM
	end

	return UF_SUCCESS
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:GetCustomCastError()
	return "#dota_hud_error_aghsfort_lina_no_fiery_soul_stacks"
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:GetBehavior()
	if self:GetCaster():HasShard("aghsfort_special_lina_fiery_soul_ally_cast") then
		return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_IGNORE_BACKSWING
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:GetCastRange(vLocation, hTarget)
	if self:GetCaster():HasShard("aghsfort_special_lina_fiery_soul_ally_cast") then
		return self:GetCaster():FindTalentValue("aghsfort_special_lina_fiery_soul_ally_cast", "value")
	end

	return 0
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:OnSpellStart()
	local hCaster = self:GetCaster()
	local hIntrinsic = hCaster:FindModifierByName("modifier_lina_pf_fiery_soul")
	local nStacks = hIntrinsic:GetStackCount()

	if hCaster:HasModifier("modifier_lina_pf_fiery_soul_active") then
		nStacks = math.max(nStacks, hCaster:GetModifierStackCount("modifier_lina_pf_fiery_soul_active", hCaster))
	end

	hCaster:AddNewModifier(hCaster, self, "modifier_lina_pf_fiery_soul_active", {duration = self:GetSpecialValueFor("active_duration")}):SetStackCount(nStacks)

	hIntrinsic:SetStackCount(0)
	hIntrinsic:StartIntervalThink(-1)

	hCaster:EmitSound("Hero_Lina.FlameCloak.Cast")
end

--------------------------------------------------------------------------------

function lina_pf_fiery_soul:CriticalMark(hTarget)
	local hCaster = self:GetCaster()
	if not hCaster:HasTalent("special_bonus_unique_lina_crit_debuff") then return end
	hTarget:AddNewModifier(hCaster, self, "modifier_lina_pf_crit_debuff", {duration = self:GetSpecialValueFor("target_crit_debuff_duration")})
end

--------------------------------------------------------------------------------

modifier_lina_pf_fiery_soul = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul:IsPurgable() 		return false end
function modifier_lina_pf_fiery_soul:DestroyOnExpire()	return false end
function modifier_lina_pf_fiery_soul:IsHidden()			return self:GetStackCount() == 0 end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul:OnIntervalThink()
	self:SetStackCount(0)
	self:StartIntervalThink(-1)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ABILITY_FULLY_CAST}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul:OnAbilityFullyCast(event)
	if IsClient() then return end
	local hUnit = event.unit
	local hUsedAbility = event.ability
	local hAbility = self:GetAbility()
	local sAbilityName = hUsedAbility:GetName()

	if not hUnit or hUnit ~= self:GetParent() or hUsedAbility:IsItem() or hUsedAbility:IsCosmetic(hUnit) or hUsedAbility == hAbility then
		return 0
	end

	self:SetStackCount(math.min(self:GetStackCount() + 1, hAbility:GetSpecialValueFor("fiery_soul_max_stacks")))
	self:SetDuration(hAbility:GetSpecialValueFor("fiery_soul_stack_duration"), true)
	self:StartIntervalThink(hAbility:GetSpecialValueFor("fiery_soul_stack_duration"))
end

--------------------------------------------------------------------------------

modifier_lina_pf_fiery_soul_active = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:OnCreated()
	local hAbility = self:GetAbility()

	self.nAttackSpeedPerStack = hAbility:GetSpecialValueFor("fiery_soul_attack_speed_bonus")
	self.nMoveSpeedPerStack = hAbility:GetSpecialValueFor("fiery_soul_move_speed_bonus")
	self.nMagicResistPerStack = hAbility:GetSpecialValueFor("fiery_soul_magic_resist")

	if IsClient() then return end

	self.nFierySoulFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_fiery_soul.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControl(self.nFierySoulFX, 1, Vector(self:GetStackCount(), 0, 0))
	self:AddParticle(self.nFierySoulFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:OnStackCountChanged(iStackCount)
	if IsClient() then return end
	ParticleManager:SetParticleControl(self.nFierySoulFX, 1, Vector(self:GetStackCount(), 0, 0))
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:OnAttack(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hCaster = self:GetCaster()

	if hAttacker ~= self:GetParent() or not hTarget or event.no_attack_cooldown or not hCaster:HasShard("aghsfort_special_lina_fiery_soul_multishot") then
		return 0
	end

	local nAttacks = hCaster:FindTalentValue("aghsfort_special_lina_fiery_soul_multishot", "arrow_count")
	local nRange = hAttacker:Script_GetAttackRange() + hCaster:FindTalentValue("aghsfort_special_lina_fiery_soul_multishot", "split_shot_bonus_range")

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

function modifier_lina_pf_fiery_soul_active:OnAttackLanded(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hCaster = self:GetCaster()
	local hLSA = hCaster:FindAbilityByName("lina_pf_light_strike_array")

	if hAttacker ~= self:GetParent() or not hTarget or event.no_attack_cooldown or not hCaster:HasShard("aghsfort_special_lina_fiery_soul_lsa_attacks") then
		return
	end

	if not hLSA or not hLSA:IsTrained() or not RollPseudoRandomPercentage(hCaster:FindTalentValue("aghsfort_special_lina_fiery_soul_lsa_attacks", "lsa_chance"), DOTA_PSEUDO_RANDOM_CUSTOM_GAME_2, hAttacker) then
		return
	end

	hLSA:StartLSA(hTarget:GetOrigin(), hCaster:FindTalentValue("aghsfort_special_lina_fiery_soul_lsa_attacks", "lsa_power"), hCaster:FindTalentValue("aghsfort_special_lina_fiery_soul_lsa_attacks", "lsa_delay"))
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeedPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSpeedPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:GetModifierMagicalResistanceBonus()
	return self.nMagicResistPerStack * self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_lina_pf_fiery_soul_active:GetModifierDamageOutgoing_Percentage()
	if self.bActive then
		return self:GetCaster():FindTalentValue("aghsfort_special_lina_fiery_soul_multishot", "damage_modifier")
	end
end

--------------------------------------------------------------------------------

modifier_lina_pf_crit_debuff = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_crit_debuff:OnCreated()
	self.nCritMult = self:GetAbility():GetSpecialValueFor("target_crit_multiplier")
end

--------------------------------------------------------------------------------

function modifier_lina_pf_crit_debuff:DeclareFunctions()
	return {MODIFIER_PROPERTY_PREATTACK_TARGET_CRITICALSTRIKE}
end

--------------------------------------------------------------------------------

function modifier_lina_pf_crit_debuff:GetModifierPreAttack_Target_CriticalStrike(event)
	return event.attacker == self:GetCaster() and self.nCritMult or 0
end

--------------------------------------------------------------------------------

modifier_lina_pf_slow_burn = class({})

--------------------------------------------------------------------------------

function modifier_lina_pf_slow_burn:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_lina_pf_slow_burn:OnCreated(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	self.nDPS = kv.damage * hAbility:GetSpecialValueFor("burn_percent") / 100

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = self.nDPS,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(1)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_slow_burn:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

function modifier_lina_pf_slow_burn:GetEffectName()
	return "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lina_pf_slow_burn:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
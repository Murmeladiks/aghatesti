LinkLuaModifier("modifier_lich_pf_frost_nova", "heroes/lich/lich_pf_frost_nova", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

lich_pf_frost_nova = class({})

--------------------------------------------------------------------------------

function lich_pf_frost_nova:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_frost_nova.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_slowed_cold.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_frost_nova_root.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_frost_lich.vpcf", context)
end

--------------------------------------------------------------------------------

function lich_pf_frost_nova:GetBehavior()
	if IsServer() and self:GetCaster():FindAbilityByName("lich_pf_sinister_gaze"):IsChanneling() then
		return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_AOE + DOTA_ABILITY_BEHAVIOR_IMMEDIATE + DOTA_ABILITY_BEHAVIOR_IGNORE_CHANNEL
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function lich_pf_frost_nova:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function lich_pf_frost_nova:OnSpellStart()
	local hTarget = self:GetCursorTarget()

	if hTarget:TriggerSpellAbsorb(self) then return end

	self:FrostNova(hTarget)
end

--------------------------------------------------------------------------------

function lich_pf_frost_nova:FrostNova(hTarget)
	local hCaster = self:GetCaster()
	local nAreaDamage = self:GetSpecialValueFor("aoe_damage")
	local nDuration = self:GetDuration()
	local nRadius = self:GetSpecialValueFor("radius")
	local nPrimaryDamageIncrease = hCaster:FindTalentValue("aghsfort_special_lich_frost_nova_execute_refund", "primary_target_damage_pct") / 100 + 1

	local nNovaFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_frost_nova.vpcf", PATTACH_CUSTOMORIGIN, hCaster)
	ParticleManager:SetParticleControl(nNovaFX, 0, hTarget:GetOrigin())
	ParticleManager:SetParticleControl(nNovaFX, 1, Vector(nRadius, nRadius, nRadius))
	ParticleManager:SetParticleControl(nNovaFX, 2, hTarget:GetOrigin())
	ParticleManager:ReleaseParticleIndex(nNovaFX)

	local tDamageTable = {
		attacker = hCaster,
		victim = hTarget,
		damage = self:GetAbilityDamage() * nPrimaryDamageIncrease,
		damage_type = self:GetAbilityDamageType(),
		ability = self
	}

	ApplyDamage(tDamageTable)

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy == hTarget then
			tDamageTable.damage = nAreaDamage * nPrimaryDamageIncrease
		else
			tDamageTable.damage = nAreaDamage
		end

		tDamageTable.victim = hEnemy
		ApplyDamage(tDamageTable)

		hEnemy:AddNewModifier(hCaster, self, "modifier_lich_pf_frost_nova", {duration = nDuration * (1 - hEnemy:GetStatusResistance()), bPrimary = hEnemy == hTarget})
	end

	if hCaster:HasShard("aghsfort_special_lich_frost_nova_execute_refund") and not hTarget:IsAlive() then
		hCaster:GiveMana(self:GetManaCost(self:GetLevel()) * hCaster:FindTalentValue("aghsfort_special_lich_frost_nova_execute_refund", "mana_cost_pct") / 100)
		self:EndCooldown()
	end

	hTarget:EmitSound("Ability.FrostNova")
end

--------------------------------------------------------------------------------

modifier_lich_pf_frost_nova = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:OnCreated(kv)
	local hAbility = self:GetAbility()
	
	self.nMoveSlow = hAbility:GetSpecialValueFor("slow_movement_speed")
	self.nAttackSlow = hAbility:GetSpecialValueFor("slow_movement_speed")

	if IsClient() then return end
	self.bPrimary = kv.bPrimary == 1
	self.nRadius = hAbility:GetSpecialValueFor("radius")
	self.nSplashDamage = self:GetCaster():FindTalentValue("aghsfort_special_lich_frost_nova_aoe_attacks", "splash_damage_pct") / 100

	if not self:GetCaster():HasShard("aghsfort_special_lich_frost_nova_root_disarm") then return end

	local nRootFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_frost_nova_root.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
	self:AddParticle(nRootFX, false, false, -1, false, true)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:OnRefresh(kv)
	if IsClient() then return end
	self.bPrimary = kv.bPrimary == 1
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:OnDestroy()
	if IsClient() or not self.bPrimary or self:GetParent():IsAlive() then return end

	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	if not hCaster:HasShard("aghsfort_special_lich_frost_nova_execute_refund") then return end

	hCaster:GiveMana(hAbility:GetManaCost(hAbility:GetLevel()) * hCaster:FindTalentValue("aghsfort_special_lich_frost_nova_execute_refund", "mana_cost_pct") / 100)
	hAbility:EndCooldown()
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
	}

	if self:GetCaster():HasShard("aghsfort_special_lich_frost_nova_aoe_attacks") then
		table.insert(funcs, MODIFIER_EVENT_ON_ATTACKED)
	end
	
	return funcs
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:CheckState()
	local state = {}

	if self:GetCaster():HasShard("aghsfort_special_lich_frost_nova_root_disarm") then
		state[MODIFIER_STATE_ROOTED] = true
		state[MODIFIER_STATE_DISARMED] = true
	end

	return state
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSlow
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:OnAttacked(event)
	if IsClient() then return end
	local hTarget = event.target
	local hAttacker = event.attacker

	if hTarget == self:GetParent() and hAttacker ~= nil then
		local hEnemies = FindUnitsInRadius(hAttacker:GetTeam(), hTarget:GetOrigin(), nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)

		local tDamageTable = {
			attacker = hAttacker,
			victim = nil,
			damage = event.damage * self.nSplashDamage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility()
		}

		for _, hEnemy in pairs(hEnemies) do
			if hEnemy ~= hTarget then
				tDamageTable.victim = hEnemy
				ApplyDamage(tDamageTable)
			end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:GetEffectName()
	return "particles/units/heroes/hero_lich/lich_slowed_cold.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:GetStatusEffectName()
	return "particles/status_fx/status_effect_frost_lich.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lich_pf_frost_nova:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end
LinkLuaModifier("modifier_templar_assassin_pf_psi_blades", 			"heroes/templar_assassin/templar_assassin_pf_psi_blades", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_templar_assassin_pf_psi_blades_slow", 	"heroes/templar_assassin/templar_assassin_pf_psi_blades", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

templar_assassin_pf_psi_blades = class({})

--------------------------------------------------------------------------------

function templar_assassin_pf_psi_blades:Precache( context )
    PrecacheResource("particle", "particles/units/heroes/hero_templar_assassin/templar_assassin_psi_blade.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_templar_slow.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_templar_assassin/templar_assassin_psi_blades_explode.vpcf", context)
end

--------------------------------------------------------------------------------

function templar_assassin_pf_psi_blades:GetIntrinsicModifierName()
    return "modifier_templar_assassin_pf_psi_blades"
end

--------------------------------------------------------------------------------

modifier_templar_assassin_pf_psi_blades = class({})

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:IsPurgable()	return false end
function modifier_templar_assassin_pf_psi_blades:IsHidden()		return true end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:OnCreated(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nAttackRange = hAbility:GetSpecialValueFor("bonus_attack_range")
	self.nSpillRange = hAbility:GetSpecialValueFor("attack_spill_range")
	self.nSpillWidth = hAbility:GetSpecialValueFor("attack_spill_width")
	self.nSpillPct = hAbility:GetSpecialValueFor("attack_spill_pct") / 100
	self.nSlowDuration = hAbility:GetSpecialValueFor("spill_slow_duration")
	self.bVoidblades = self.nSlowDuration > 0	
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:OnRefresh(kv)
	self:OnCreated(kv)
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:GetModifierAttackRangeBonus()
	return self.nAttackRange
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:OnAttackLanded(event)
	if IsClient() then return 0 end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hAbility = self:GetAbility()
	local hTrapAbility = self:GetCaster():FindAbilityByName("templar_assassin_pf_psionic_trap")
	local nTrapChance = self:GetCaster():FindTalentValue("aghsfort_special_templar_assassin_psi_blades_trap", "trap_chance")
	local bAttemptTrap = nTrapChance > 0 and hTrapAbility and hTrapAbility:IsTrained()
	local nMaxTraps = hTrapAbility and hTrapAbility:GetSpecialValueFor("max_traps")

	if hAttacker ~= self:GetParent() or not hTarget or hTarget:IsBuilding() then return end

	local vOrigin = hAttacker:GetOrigin()
	local vDir = (hTarget:GetOrigin() - vOrigin):Normalized()
	local vEndPos = vOrigin + vDir * (hAttacker:Script_GetAttackRange() * self.nSpillRange)

	local hEnemies = FindUnitsInLine(hAttacker:GetTeam(), vOrigin, vEndPos, nil, self.nSpillWidth, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES)

	local tDamageTable = {
		attacker = hAttacker,
		victim = nil,
		damage = event.damage * self.nSpillPct,
		damage_type = DAMAGE_TYPE_PURE,
		ability = hAbility
	}

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			tDamageTable.victim = hEnemy
			ApplyDamage(tDamageTable)

			if self.bVoidblades then
				hEnemy:AddNewModifier(hAttacker, hAbility, "modifier_templar_assassin_pf_psi_blades_slow", {duration = self.nSlowDuration * (1 - hEnemy:GetStatusResistance())})
			end

			hEnemy:EmitSound("Hero_TemplarAssassin.PsiBlade")

			local nSpillFX = ParticleManager:CreateParticle("particles/units/heroes/hero_templar_assassin/templar_assassin_psi_blade.vpcf", PATTACH_CUSTOMORIGIN, hAttacker)
			ParticleManager:SetParticleControlEnt(nSpillFX, 0, hTarget, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
			ParticleManager:SetParticleControlEnt(nSpillFX, 1, hEnemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
			ParticleManager:ReleaseParticleIndex(nSpillFX)

			if hAttacker:HasShard("aghsfort_special_templar_assassin_psi_blades_splash") then
				self:Splash(hEnemy, tDamageTable.damage)
			end

			if bAttemptTrap and nMaxTraps > 0 and RollPseudoRandomPercentage(nTrapChance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, hAttacker) then
				nMaxTraps = nMaxTraps - 1 -- Limit traps per spill
				hTrapAbility:CreateTrap(hEnemy:GetOrigin())
			end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades:Splash(hTarget, nDamage)
	local hCaster = self:GetCaster()
	local hLegendary = hCaster:FindAbilityByName("aghsfort_special_templar_assassin_psi_blades_splash")

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hTarget:GetOrigin(), nil, hLegendary:GetSpecialValueFor("value"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	local tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = nDamage * hLegendary:GetSpecialValueFor("damage_pct") / 100,
		damage_type = DAMAGE_TYPE_PURE,
		ability = self:GetAbility()
	}

	for _, hEnemy in pairs(hEnemies) do
		if hEnemy ~= hTarget then
			tDamageTable.victim = hEnemy
			ApplyDamage(tDamageTable)
		end
	end

	local nSplashFX = ParticleManager:CreateParticle("particles/units/heroes/hero_templar_assassin/templar_assassin_psi_blades_explode.vpcf", PATTACH_ABSORIGIN, hTarget)
	ParticleManager:SetParticleControl(nSplashFX, 1, hTarget:GetOrigin())
	ParticleManager:SetParticleControl(nSplashFX, 2, Vector(hLegendary:GetSpecialValueFor("value"), 0, 0))
	ParticleManager:ReleaseParticleIndex(nSplashFX)
end

--------------------------------------------------------------------------------

modifier_templar_assassin_pf_psi_blades_slow = class({})

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades_slow:OnCreated()
	self.nSlow = -self:GetAbility():GetSpecialValueFor("spill_movement_slow_pct")
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nSlow
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades_slow:GetStatusEffectName()
	return "particles/status_fx/status_effect_templar_slow.vpcf"
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_psi_blades_slow:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end
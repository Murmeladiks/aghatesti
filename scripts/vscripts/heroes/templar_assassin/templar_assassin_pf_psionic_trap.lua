LinkLuaModifier("modifier_templar_assassin_pf_trap", 		"heroes/templar_assassin/templar_assassin_pf_psionic_trap", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_templar_assassin_pf_trap_slow", 	"heroes/templar_assassin/templar_assassin_pf_psionic_trap", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_templar_assassin_pf_trap_heal", 	"heroes/templar_assassin/templar_assassin_pf_psionic_trap", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

templar_assassin_pf_psionic_trap = class({})

--------------------------------------------------------------------------------

function templar_assassin_pf_psionic_trap:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_templar_assassin/templar_assassin_trap.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_templar_assassin/templar_assassin_trap_explode.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_templar_assassin/templar_assassin_trap_slow.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_templar_slow.vpcf", context)
	PrecacheUnitByNameSync( "npc_dota_templar_assassin_psionic_trap", context, -1 )
end

--------------------------------------------------------------------------------

function templar_assassin_pf_psionic_trap:OnSpellStart()
	local hCaster = self:GetCaster()

	self:CreateTrap(self:GetCursorPosition())
end

--------------------------------------------------------------------------------

function templar_assassin_pf_psionic_trap:CreateTrap(vPosition)
	local hCaster = self:GetCaster()
	local nTriggerAfter = self:GetSpecialValueFor("trap_delay_time")

	local hTrapWard = CreateUnitByName("npc_dota_templar_assassin_psionic_trap", vPosition, false, hCaster, hCaster, hCaster:GetTeam())
	local hTriggerAbility = hTrapWard:FindAbilityByName("templar_assassin_self_trap")

	if hTriggerAbility then hTrapWard:RemoveAbilityByHandle(hTriggerAbility) end

	hTrapWard:SetOwner(hCaster)
	hTrapWard:AddNewModifier(hCaster, self, "modifier_templar_assassin_pf_trap", {nTriggerAfter = nTriggerAfter})

	hCaster:EmitSound("Hero_TemplarAssassin.Trap.Cast")
	hTrapWard:EmitSound("Hero_TemplarAssassin.Trap")
end


--------------------------------------------------------------------------------

modifier_templar_assassin_pf_trap = class({})

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap:IsHidden() 		return true end
function modifier_templar_assassin_pf_trap:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap:OnCreated(kv)
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	
	self.nRadius = hAbility:GetSpecialValueFor("trap_radius")
	self.nSlowDuration = hAbility:GetSpecialValueFor("slow_duration")

	if IsClient() then return end

	local nTrapFX = ParticleManager:CreateParticle("particles/units/heroes/hero_templar_assassin/templar_assassin_trap.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
	ParticleManager:SetParticleControl(nTrapFX, 0, hParent:GetOrigin())
	self:AddParticle(nTrapFX, true, false, -1, false, false)

	self.nTicks = math.max(self:GetCaster():FindTalentValue("aghsfort_special_templar_assassin_psionic_trap_multipulse", "value"), 1)

	self:StartIntervalThink(kv.nTriggerAfter + FrameTime())
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap:OnIntervalThink()
	self:TriggerWard()
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap:CheckState()
	return {
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_STUNNED] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	}
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap:TriggerWard(vPos)
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()
	local hMeld = hCaster:FindAbilityByName("templar_assassin_pf_meld")
	local bMeldAttack = hMeld and hMeld:IsTrained() and hCaster:HasShard("aghsfort_special_templar_assassin_psionic_trap_area_attack")
	
	local vOrigin = hParent:GetOrigin()
	
	local hEnemies = FindUnitsInRadius(hParent:GetTeam(), vOrigin, nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		hEnemy:AddNewModifier(hCaster, hAbility, "modifier_templar_assassin_pf_trap_slow", {duration = self.nSlowDuration * (1 - hEnemy:GetStatusResistance())})

		if bMeldAttack then
			hMeld:MeldAttack(hParent, hEnemy)
		end
	end

	if hCaster:HasShard("aghsfort_special_templar_assassin_psionic_trap_damage_heals") then
		local hAllies = FindUnitsInRadius(hParent:GetTeam(), vOrigin, nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

		for _, hAlly in pairs(hAllies) do
			hAlly:AddNewModifier(hCaster, hAbility, "modifier_templar_assassin_pf_trap_heal", {duration = self.nSlowDuration})
		end
	end

	local nTriggerFX = ParticleManager:CreateParticle("particles/units/heroes/hero_templar_assassin/templar_assassin_trap_explode.vpcf", PATTACH_CUSTOMORIGIN, hCaster)
	ParticleManager:SetParticleControl(nTriggerFX, 0, hParent:GetOrigin())
	ParticleManager:ReleaseParticleIndex(nTriggerFX)

	EmitSoundOnLocationWithCaster(vOrigin, "Hero_TemplarAssassin.Trap.Explode", hCaster)

	self.nTicks = self.nTicks - 1

	if self.nTicks < 1 then
		UTIL_Remove(hParent)
	end
end

--------------------------------------------------------------------------------

modifier_templar_assassin_pf_trap_slow = class({})

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:OnCreated(kv)
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	
	local nInterval = hAbility:GetSpecialValueFor("damage_tick_rate")
	self.nMoveSlow = -hAbility:GetSpecialValueFor("movement_speed_slow")

	if IsClient() then return end

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = hParent,
		damage = hAbility:GetSpecialValueFor("trap_damage") / self:GetDuration() * nInterval,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(nInterval)
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:GetEffectName()
	return "particles/units/heroes/hero_templar_assassin/templar_assassin_trap_slow.vpcf"
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:GetStatusEffectName()
	return "particles/status_fx/status_effect_templar_slow.vpcf"
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_templar_assassin_pf_trap_heal = class({})

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_heal:OnCreated(kv)
	local hAbility = self:GetAbility()

	local nInterval = hAbility:GetSpecialValueFor("damage_tick_rate")

	if IsClient() then return end

	self.nHeal = (hAbility:GetSpecialValueFor("trap_damage") / self:GetDuration() * nInterval) * self:GetCaster():FindTalentValue("aghsfort_special_templar_assassin_psionic_trap_damage_heals", "value") / 100
	self:StartIntervalThink(nInterval)
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_heal:OnIntervalThink()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()

	hParent:HealWithParams(self.nHeal, self:GetAbility(), false, true, hCaster, false)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hParent, self.nHeal, hCaster)
end

--------------------------------------------------------------------------------

function modifier_templar_assassin_pf_trap_slow:GetEffectName()
	return "particles/units/heroes/hero_templar_assassin/templar_assassin_trap_slow.vpcf"
end
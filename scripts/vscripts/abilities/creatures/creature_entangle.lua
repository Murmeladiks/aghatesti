LinkLuaModifier("modifier_creature_entangle", 		    "units/creature_entangle", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_creature_entangle_debuff",	"units/creature_entangle", LUA_MODIFIER_MOTION_NONE)
--------------------------------------------------------------------------------

creature_entangle = class({})

--------------------------------------------------------------------------------

function creature_entangle:Precache( context )
    PrecacheResource("particle",    "particles/units/heroes/hero_lone_druid/lone_druid_bear_entangle.vpcf", context)
    PrecacheResource("soundfile",   "soundevents/game_sounds_heroes/game_sounds_lone_druid.vsndevts", context)
end

--------------------------------------------------------------------------------

function creature_entangle:GetIntrinsicModifierName()
    return "modifier_creature_entangle"
end

--------------------------------------------------------------------------------

modifier_creature_entangle = class({})

--------------------------------------------------------------------------------

function modifier_creature_entangle:IsHidden()	    return true end
function modifier_creature_entangle:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_creature_entangle:OnCreated(kv)
	local ability = self:GetAbility()

	self.chance = ability:GetSpecialValueFor("entangle_chance")
    self.duration = ability:GetSpecialValueFor("duration")
end

--------------------------------------------------------------------------------

function modifier_creature_entangle:OnRefresh(kv)
	self:OnCreated(kv)
end

--------------------------------------------------------------------------------

function modifier_creature_entangle:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end

--------------------------------------------------------------------------------

function modifier_creature_entangle:OnAttackLanded(params)
	if not IsServer() then return end

    local attacker = params.attacker
    local target = params.target
    local ability = self:GetAbility()

    if attacker ~= self:GetParent() or not target or not ability or not ability:IsCooldownReady() then
        return
    end

    if attacker:PassivesDisabled() or target:IsBuilding() or target:IsOther() or target:GetTeamNumber() == attacker:GetTeamNumber() then
        return
    end

    if not RollPseudoRandomPercentage(self.chance, DOTA_PSEUDO_RANDOM_LONE_DRUID_ENTANGLE, attacker) then return end

    ability:UseResources(false, false, false, true)
    target:AddNewModifier(attacker, ability, "modifier_creature_entangle_debuff", {duration = self.duration * (1 - target:GetStatusResistance())})
    target:EmitSound("LoneDruid_SpiritBear.Entangle")
end

--------------------------------------------------------------------------------

modifier_creature_entangle_debuff = class({})

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:OnCreated(kv)
    if not IsServer() then return end

	local ability = self:GetAbility()
    local parent = self:GetParent()

	local damage = ability:GetSpecialValueFor("damage")
    local creep_multiplier = ability:GetSpecialValueFor("creep_damage_multiplier")
    local interval = ability:GetSpecialValueFor("interval")

    if not parent:IsHero() then
        damage = damage * creep_multiplier
    end

    self.damage_table = {
        attacker = self:GetCaster(),
        victim = self:GetParent(),
        damage = damage * interval,
        damage_type = ability:GetAbilityDamageType(),
        ability = ability
    }

    self:StartIntervalThink(interval)
    self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:OnRefresh(kv)
	self:OnCreated(kv)
end

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:OnIntervalThink()
    ApplyDamage(self.damage_table)
end

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:CheckState()
    return {
        [MODIFIER_STATE_ROOTED] = true,
        [MODIFIER_STATE_INVISIBLE] = false
    }
end

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:GetEffectName()
	return "particles/units/heroes/hero_lone_druid/lone_druid_bear_entangle.vpcf"
end

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_creature_entangle_debuff:GetPriority()
    return MODIFIER_PRIORITY_HIGH
end
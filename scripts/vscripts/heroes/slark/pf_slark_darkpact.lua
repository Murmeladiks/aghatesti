LinkLuaModifier("modifier_pf_slark_darkpact_custom", "abilities/pf_slark_darkpact.lua", LUA_MODIFIER_MOTION_NONE)

pf_slark_darkpact = class({})

function pf_slark_darkpact:OnSpellStart()
    local caster = self:GetCaster()
    local ability = self
    local delay = self:GetSpecialValueFor("delay")
    local pulse_duration = self:GetSpecialValueFor("pulse_duration")
    local total_damage = self:GetSpecialValueFor("total_damage")
    local total_pulses = self:GetSpecialValueFor("total_pulses")
    local pulse_interval = self:GetSpecialValueFor("pulse_interval")
    local heal_percent = 15 -- Heal 15% of the damage

    -- Apply the modifier that handles the pulses
    caster:AddNewModifier(caster, ability, "modifier_pf_slark_darkpact_custom", {
        duration = pulse_duration,
        delay = delay,
        total_damage = total_damage,
        total_pulses = total_pulses,
        pulse_interval = pulse_interval,
        heal_percent = heal_percent
    })
end

modifier_pf_slark_darkpact_custom = class({})

function modifier_pf_slark_darkpact_custom:OnCreated(kv)
    if not IsServer() then return end
    self.caster = self:GetParent()
    self.ability = self:GetAbility()
    self.delay = kv.delay
    self.total_damage = kv.total_damage
    self.total_pulses = kv.total_pulses
    self.pulse_interval = kv.pulse_interval
    self.heal_percent = kv.heal_percent
    self.damage_per_pulse = self.total_damage / self.total_pulses

    -- Start delay
    self:StartIntervalThink(self.delay)
end

function modifier_pf_slark_darkpact_custom:OnIntervalThink()
    if not IsServer() then return end

    -- Apply damage to enemies in radius
    local enemies = FindUnitsInRadius(
        self.caster:GetTeamNumber(),
        self.caster:GetAbsOrigin(),
        nil,
        400, -- Same as ability radius
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )

    for _, enemy in pairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = self.caster,
            damage = self.damage_per_pulse,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self.ability
        })
    end

    -- Heal Slark instead of dealing self-damage
    local heal_amount = self.damage_per_pulse * (self.heal_percent / 100)
    self.caster:Heal(heal_amount, self.ability)

    -- Show heal particle
    local particle = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.caster)
    ParticleManager:ReleaseParticleIndex(particle)

    -- Reduce remaining pulses
    self.total_pulses = self.total_pulses - 1

    -- Stop if all pulses are done
    if self.total_pulses <= 0 then
        self:Destroy()
    end
end

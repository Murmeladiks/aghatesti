LinkLuaModifier("modifier_snapfire_mortimer_kisses_burn", "abilities/snapfire_mortimer_kisses", LUA_MODIFIER_MOTION_NONE)

snapfire_mortimer_kisses = class({})

function snapfire_mortimer_kisses:OnSpellStart()
    local caster = self:GetCaster()
    local target_point = self:GetCursorPosition()
    local duration = self:GetSpecialValueFor("duration_tooltip")
    self.projectile_count = self:GetSpecialValueFor("projectile_count")
    self.projectiles_fired = 0
    self.projectile_interval = duration / self.projectile_count

    self:StartIntervalThink(self.projectile_interval)
    self.target_point = target_point
end

function snapfire_mortimer_kisses:OnIntervalThink()
    if self.projectiles_fired >= self.projectile_count then
        self:StartIntervalThink(-1)
        return
    end

    local caster = self:GetCaster()
    local projectile_speed = self:GetSpecialValueFor("projectile_speed")
    local impact_radius = self:GetSpecialValueFor("impact_radius")
    local projectile_vision = self:GetSpecialValueFor("projectile_vision")
    local min_range = self:GetSpecialValueFor("min_range")
    local max_range = self:GetCastRange(self:GetCursorPosition(), caster)
    
    local random_offset = RandomVector(RandomFloat(min_range, max_range))
    local target_pos = self.target_point + random_offset

    local info = {
        Source = caster,
        Ability = self,
        vSpawnOrigin = caster:GetAbsOrigin(),
        vVelocity = (target_pos - caster:GetAbsOrigin()):Normalized() * projectile_speed,
        fDistance = (target_pos - caster:GetAbsOrigin()):Length2D(),
        fStartRadius = impact_radius,
        fEndRadius = impact_radius,
        iVisionRadius = projectile_vision,
        iVisionTeamNumber = caster:GetTeamNumber(),
        EffectName = "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss.vpcf",
        bDodgeable = false,
        bProvidesVision = true,
        ExtraData = {target_x = target_pos.x, target_y = target_pos.y, target_z = target_pos.z}
    }

    ProjectileManager:CreateLinearProjectile(info)
    self.projectiles_fired = self.projectiles_fired + 1
end

function snapfire_mortimer_kisses:OnProjectileHit_ExtraData(target, location, extraData)
    if not location then return end
    
    local caster = self:GetCaster()
    local impact_radius = self:GetSpecialValueFor("impact_radius")
    local damage = self:GetSpecialValueFor("damage_per_impact")
    local burn_duration = self:GetSpecialValueFor("burn_ground_duration")
    local burn_damage = self:GetSpecialValueFor("burn_damage")

    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        location,
        nil,
        impact_radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )

    for _, enemy in pairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = caster,
            damage = damage,
            damage_type = self:GetAbilityDamageType(),
            ability = self
        })
        enemy:AddNewModifier(caster, self, "modifier_snapfire_mortimer_kisses_burn", {duration = burn_duration})
    end
end

modifier_snapfire_mortimer_kisses_burn = class({})

function modifier_snapfire_mortimer_kisses_burn:IsDebuff() return true end
function modifier_snapfire_mortimer_kisses_burn:IsPurgable() return true end

function modifier_snapfire_mortimer_kisses_burn:OnCreated()
    if not IsServer() then return end
    self.burn_damage = self:GetAbility():GetSpecialValueFor("burn_damage")
    self.burn_interval = self:GetAbility():GetSpecialValueFor("burn_interval")
    self:StartIntervalThink(self.burn_interval)
end

function modifier_snapfire_mortimer_kisses_burn:OnIntervalThink()
    if not IsServer() then return end
    ApplyDamage({
        victim = self:GetParent(),
        attacker = self:GetCaster(),
        damage = self.burn_damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self:GetAbility()
    })
end

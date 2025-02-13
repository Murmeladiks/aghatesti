aghsfort_special_snapfire_mortimer_kisses_fragmentation = class({})

function aghsfort_special_snapfire_mortimer_kisses_fragmentation:OnSpellStart()
    -- Launch the initial projectile (Mortimer Kisses base logic)
    local caster = self:GetCaster()
    local target_point = self:GetCursorPosition()
    local projectile_speed = self:GetSpecialValueFor("projectile_speed")
    local impact_radius = self:GetSpecialValueFor("split_impact_radius")

    local info = {
        Target = target_point,
        Source = caster,
        Ability = self,
        EffectName = "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss.vpcf",
        iMoveSpeed = projectile_speed,
        vSourceLoc = caster:GetAbsOrigin(),
        bDodgeable = false,
        bVisibleToEnemies = true,
        bProvidesVision = true,
        iVisionRadius = impact_radius,
        iVisionTeamNumber = caster:GetTeamNumber(),
        ExtraData = {}  -- Store extra data if needed
    }

    ProjectileManager:CreateTrackingProjectile(info)
end

function aghsfort_special_snapfire_mortimer_kisses_fragmentation:OnProjectileHit(hTarget, vLocation)
    if not hTarget then return end

    local caster = self:GetCaster()
    local split_projectiles = self:GetSpecialValueFor("split_projectiles")
    local split_radius = self:GetSpecialValueFor("split_radius")
    local split_impact_radius = self:GetSpecialValueFor("split_impact_radius")
    local split_speed = 700  -- Adjust speed as needed

    -- Play impact explosion effect
    local explosion_fx = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss_explosion.vpcf",
        PATTACH_WORLDORIGIN,
        nil
    )
    ParticleManager:SetParticleControl(explosion_fx, 0, vLocation)
    ParticleManager:ReleaseParticleIndex(explosion_fx)

    -- Deal damage at impact location
    local damage = self:GetSpecialValueFor("damage")
    local damage_table = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self
    }
    ApplyDamage(damage_table)

    -- Spawn split projectiles
    for i = 1, split_projectiles do
        local angle = math.rad((360 / split_projectiles) * i)
        local direction = Vector(math.cos(angle), math.sin(angle), 0)
        local split_target = vLocation + direction * split_radius

        local info = {
            Target = split_target,
            Source = vLocation,
            Ability = self,
            EffectName = "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss.vpcf",
            iMoveSpeed = split_speed,
            vSourceLoc = vLocation,
            bDodgeable = false,
            bVisibleToEnemies = true,
            bProvidesVision = true,
            iVisionRadius = split_impact_radius,
            iVisionTeamNumber = caster:GetTeamNumber(),
            ExtraData = {}
        }

        ProjectileManager:CreateTrackingProjectile(info)
    end
end

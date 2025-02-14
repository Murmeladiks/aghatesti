aghsfort_special_snapfire_mortimer_kisses_fragmentation = class({})

function aghsfort_special_snapfire_mortimer_kisses_fragmentation:OnProjectileHit(hTarget, vLocation)
    if not vLocation then return end

    local caster = self:GetCaster()
    local split_projectiles = self:GetSpecialValueFor("split_projectiles")
    local split_radius = self:GetSpecialValueFor("split_radius")
    local split_impact_radius = self:GetSpecialValueFor("split_impact_radius")
    local split_speed = self:GetSpecialValueFor("split_speed")
    if not aghsfort_special_snapfire_mortimer_kisses_fragmentation then
        aghsfort_special_snapfire_mortimer_kisses_fragmentation = class({})
    end
    
    -- OnProjectileHit function that handles the fragmentation logic
    function aghsfort_special_snapfire_mortimer_kisses_fragmentation:OnProjectileHit(hTarget, vLocation)
        if not vLocation then return end
    
        local caster = self:GetCaster()
        local split_projectiles = self:GetSpecialValueFor("split_projectiles")
        local split_radius = self:GetSpecialValueFor("split_radius")
        local split_impact_radius = self:GetSpecialValueFor("split_impact_radius")
        local split_speed = self:GetSpecialValueFor("split_speed")
        local damage = self:GetSpecialValueFor("damage")
    
        -- Explosion effect at the point of impact
        local explosion_fx = ParticleManager:CreateParticle(
            "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss_explosion.vpcf",
            PATTACH_WORLDORIGIN,
            nil
        )
        ParticleManager:SetParticleControl(explosion_fx, 0, vLocation)
        ParticleManager:ReleaseParticleIndex(explosion_fx)
    
        -- Deal damage to enemies around the impact location
        local enemies = FindUnitsInRadius(
            caster:GetTeamNumber(),
            vLocation,
            nil,
            split_impact_radius,
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
                damage_type = DAMAGE_TYPE_MAGICAL,
                ability = self
            })
        end
    
        -- Spawn the splitting projectiles
        for i = 1, split_projectiles do
            local angle = math.rad((360 / split_projectiles) * i)
            local direction = Vector(math.cos(angle), math.sin(angle), 0)
    
            local info = {
                Ability = self,
                EffectName = "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss.vpcf",
                vSpawnOrigin = vLocation,
                fDistance = split_radius,
                fStartRadius = 100,
                fEndRadius = 100,
                Source = caster,
                bHasFrontalCone = false,
                bReplaceExisting = false,
                iMoveSpeed = split_speed,
                bProvidesVision = true,
                iVisionRadius = split_impact_radius,
                iVisionTeamNumber = caster:GetTeamNumber()
            }
    
            -- Create the new projectile
            ProjectileManager:CreateLinearProjectile(info)
        end
    end
    
    -- Explosion effect
    local explosion_fx = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss_explosion.vpcf",
        PATTACH_WORLDORIGIN,
        nil
    )
    ParticleManager:SetParticleControl(explosion_fx, 0, vLocation)
    ParticleManager:ReleaseParticleIndex(explosion_fx)

    -- Damage at impact location
    local damage = self:GetSpecialValueFor("damage")
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        vLocation,
        nil,
        split_impact_radius,
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
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self
        })
    end

    -- Spawn split projectiles in an arc
    for i = 1, split_projectiles do
        local angle = math.rad((360 / split_projectiles) * i)
        local direction = Vector(math.cos(angle), math.sin(angle), 0)

        local info = {
            Ability = self,
            EffectName = "particles/units/heroes/hero_snapfire/hero_snapfire_mortimer_kiss.vpcf",
            vSpawnOrigin = vLocation,
            fDistance = split_radius,
            fStartRadius = 100,
            fEndRadius = 100,
            Source = caster,
            bHasFrontalCone = false,
            bReplaceExisting = false,
            iMoveSpeed = split_speed,
            bProvidesVision = true,
            iVisionRadius = split_impact_radius,
            iVisionTeamNumber = caster:GetTeamNumber()
        }

        ProjectileManager:CreateLinearProjectile(info)
    end
end

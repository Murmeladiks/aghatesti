LinkLuaModifier("modifier_aghsfort_special_omniknight_degen_aura_damage", "heroes/omniknight/aghsfort_special_omniknight_degen_aura_damage", LUA_MODIFIER_MOTION_NONE)

aghsfort_special_omniknight_degen_aura_damage = class({})

function aghsfort_special_omniknight_degen_aura_damage:GetIntrinsicModifierName()
    return "modifier_aghsfort_special_omniknight_degen_aura_damage"
end

modifier_aghsfort_special_omniknight_degen_aura_damage = class({})

function modifier_aghsfort_special_omniknight_degen_aura_damage:IsHidden() 
    return true 
end

function modifier_aghsfort_special_omniknight_degen_aura_damage:IsPurgable() 
    return false 
end

function modifier_aghsfort_special_omniknight_degen_aura_damage:RemoveOnDeath() 
    return false 
end

function modifier_aghsfort_special_omniknight_degen_aura_damage:OnCreated()
    if not IsServer() then return end

    -- Initialize values for the damage aura
    self.damage_interval = self:GetAbility():GetSpecialValueFor("damage_interval")
    self.attack_damage_pct = self:GetAbility():GetSpecialValueFor("attack_damage_pct") / 100
    self:StartIntervalThink(self.damage_interval)
end

function modifier_aghsfort_special_omniknight_degen_aura_damage:OnIntervalThink()
    if not IsServer() then return end
    local parent = self:GetParent()
    if not parent:IsAlive() then return end

    local radius = 300  -- Adjust the range as needed
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )

    for _, enemy in pairs(enemies) do
        if enemy and not enemy:IsNull() and enemy:IsAlive() then
            local damage = parent:GetAttackDamage() * self.attack_damage_pct
            local damageTable = {
                victim = enemy,
                attacker = parent,
                damage = damage,
                damage_type = DAMAGE_TYPE_MAGICAL,
                ability = self:GetAbility(),
            }
            ApplyDamage(damageTable)
        end
    end
end

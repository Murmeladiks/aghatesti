LinkLuaModifier("modifier_snapfire_scatterblast_shard_buff", "heroes/snapfire/custom_snapfire_scatterblast", LUA_MODIFIER_MOTION_NONE)

custom_snapfire_scatterblast = class({})

function custom_snapfire_scatterblast:HasUpgrade(upgrade_name)
    return self:GetCaster():HasShard(upgrade_name)
end

function custom_snapfire_scatterblast:OnUpgrade()
    if self:HasUpgrade("aghsfort_special_snapfire_scatterblast_triple_shot") then
        self:SetCurrentAbilityCharges(3)
    end
end

function custom_snapfire_scatterblast:OnSpellStart()
    local caster = self:GetCaster()
    local target_point = self:GetCursorPosition()
    local damage = self:GetSpecialValueFor("damage")
    local radius = self:GetSpecialValueFor("blast_width_end")

    -- Apply Knockback if the hero has the knockback upgrade
    if self:HasUpgrade("aghsfort_special_snapfire_scatterblast_knockback") then
        local enemies = FindUnitsInRadius(
            caster:GetTeamNumber(),
            target_point,
            nil,
            radius,
            DOTA_UNIT_TARGET_TEAM_ENEMY,
            DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
            DOTA_UNIT_TARGET_FLAG_NONE,
            FIND_ANY_ORDER,
            false
        )

        for _, enemy in pairs(enemies) do
            enemy:AddNewModifier(caster, self, "modifier_knockback", {
                center_x = target_point.x,
                center_y = target_point.y,
                center_z = target_point.z,
                duration = 0.5,
                knockback_distance = 300,
                knockback_height = 50
            })
        end
    end

    -- If Full Range Point Blank upgrade is active, remove damage falloff
    if self:HasUpgrade("aghsfort_special_snapfire_scatterblast_fullrange_pointblank") then
        self.point_blank_bonus_damage_pct = 100
    else
        self.point_blank_bonus_damage_pct = self:GetSpecialValueFor("point_blank_dmg_bonus_pct")
    end

    -- If Barrage upgrade is active, fire multiple Scatterblasts
    if self:HasUpgrade("aghsfort_special_snapfire_scatterblast_barrage") then
        for i = -1, 1 do
            local angle_offset = i * 20
            local new_direction = RotatePosition(caster:GetAbsOrigin(), QAngle(0, angle_offset, 0), target_point)
            local new_target = new_direction

            local dummy = CreateUnitByName("npc_dota_base_additive", new_target, false, nil, nil, caster:GetTeam())
            dummy:AddNewModifier(caster, self, "modifier_kill", {duration = 1})

            self:OnSpellStart(dummy)
        end
    end

    -- Standard Scatterblast damage
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        target_point,
        nil,
        radius,
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

    if self:HasUpgrade("aghsfort_special_snapfire_scatterblast_triple_shot") then
        self:UseCharge()
    end
end

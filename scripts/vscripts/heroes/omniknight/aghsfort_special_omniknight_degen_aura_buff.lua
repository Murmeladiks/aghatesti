LinkLuaModifier("modifier_aghsfort_special_omniknight_degen_aura_buff", "heroes/omniknight/omniknight_degen_aura_buff", LUA_MODIFIER_MOTION_NONE)

aghsfort_special_omniknight_degen_aura_buff = class({})

function aghsfort_special_omniknight_degen_aura_buff:GetIntrinsicModifierName()
    return "modifier_aghsfort_special_omniknight_degen_aura_buff"
end

modifier_aghsfort_special_omniknight_degen_aura_buff = class({})

function modifier_aghsfort_special_omniknight_degen_aura_buff:IsHidden() return true end
function modifier_aghsfort_special_omniknight_degen_aura_buff:IsPurgable() return false end
function modifier_aghsfort_special_omniknight_degen_aura_buff:RemoveOnDeath() return false end

function modifier_aghsfort_special_omniknight_degen_aura_buff:OnCreated()
    if not IsServer() then return end
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.move_speed_bonus = self:GetAbility():GetSpecialValueFor("move_speed_bonus")
    self.attack_speed_bonus = self:GetAbility():GetSpecialValueFor("attack_speed_bonus")
    self:StartIntervalThink(1.0)
end

function modifier_aghsfort_special_omniknight_degen_aura_buff:OnIntervalThink()
    if not IsServer() then return end
    local parent = self:GetParent()
    if not parent:IsAlive() then return end
    
    -- Ensure Omniknight has the required ability
    local degen_aura = parent:FindAbilityByName("aghsfort_omniknight_degen_aura")
    if not degen_aura or degen_aura:GetLevel() <= 0 then return end
    
    local allies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        self.radius,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY,
        DOTA_UNIT_TARGET_HERO,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )

    for _, ally in pairs(allies) do
        if ally and not ally:IsNull() and ally:IsAlive() then
            local buff = ally:FindModifierByName("modifier_aghsfort_special_omniknight_degen_aura_buff_effect")
            if not buff then
                ally:AddNewModifier(parent, self:GetAbility(), "modifier_aghsfort_special_omniknight_degen_aura_buff_effect", {})
            end
        end
    end
end

LinkLuaModifier("modifier_aghsfort_special_omniknight_degen_aura_buff_effect", "heroes/omniknight/omniknight_degen_aura_buff", LUA_MODIFIER_MOTION_NONE)

modifier_aghsfort_special_omniknight_degen_aura_buff_effect = class({})

function modifier_aghsfort_special_omniknight_degen_aura_buff_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
end

function modifier_aghsfort_special_omniknight_degen_aura_buff_effect:GetModifierMoveSpeedBonus_Constant()
    return self:GetAbility():GetSpecialValueFor("move_speed_bonus")
end

function modifier_aghsfort_special_omniknight_degen_aura_buff_effect:GetModifierAttackSpeedBonus_Constant()
    return self:GetAbility():GetSpecialValueFor("attack_speed_bonus")
end

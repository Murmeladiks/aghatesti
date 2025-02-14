LinkLuaModifier("modifier_aghsfort_special_omniknight_degen_aura_restoration", "heroes/omniknight/omniknight_degen_aura_restoration", LUA_MODIFIER_MOTION_NONE)

aghsfort_special_omniknight_degen_aura_restoration = class({})

function aghsfort_special_omniknight_degen_aura_restoration:GetIntrinsicModifierName()
    return "modifier_aghsfort_special_omniknight_degen_aura_restoration"
end

modifier_aghsfort_special_omniknight_degen_aura_restoration = class({})

function modifier_aghsfort_special_omniknight_degen_aura_restoration:IsHidden() return true end
function modifier_aghsfort_special_omniknight_degen_aura_restoration:IsPurgable() return false end
function modifier_aghsfort_special_omniknight_degen_aura_restoration:RemoveOnDeath() return false end

function modifier_aghsfort_special_omniknight_degen_aura_restoration:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_DEATH,
    }
end

function modifier_aghsfort_special_omniknight_degen_aura_restoration:OnDeath(params)
    if not IsServer() then return end
    local parent = self:GetParent()
    local radius = 450  -- Adjust the range as needed
    
    if params.unit and params.unit:GetTeam() ~= parent:GetTeam() then
        local distance = (params.unit:GetAbsOrigin() - parent:GetAbsOrigin()):Length2D()
        if distance <= radius then
            local healAmount = parent:GetMaxHealth() * 0.04
            local manaRestore = parent:GetMaxMana() * 0.04
            
            parent:Heal(healAmount, self:GetAbility())
            parent:GiveMana(manaRestore)
            
            local particle = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
            ParticleManager:ReleaseParticleIndex(particle)
        end
    end
end

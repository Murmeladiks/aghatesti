-- Jonjon Omniknight Purification Ability

if jonjon_omniknight_purification == nil then
    jonjon_omniknight_purification = class({})
end

LinkLuaModifier("modifier_jonjon_omniknight_purification", "abilities/jonjon_omniknight_purification.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_jonjon_omniknight_purification_heal", "abilities/jonjon_omniknight_purification.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_jonjon_omniknight_purification_damage", "abilities/jonjon_omniknight_purification.lua", LUA_MODIFIER_MOTION_NONE)

function jonjon_omniknight_purification:Precache(context)
    PrecacheResource("particle", "particles/units/heroes/hero_omniknight/omniknight_purification.vpcf", context)
    PrecacheResource("soundfile", "soundevents/heroes/omniknight/omniknight_purification.vsndevts", context)
end

-- Called when the ability is upgraded (handles talents, etc.)
function jonjon_omniknight_purification:OnAbilityUpgrade(hUpgradeAbility)
    if hUpgradeAbility and hUpgradeAbility:GetName() == "special_bonus_unique_omniknight_1" and not self.bTalentUpgraded then
        self.bTalentUpgraded = true
        self:EndCooldown()
    end
end

-- Get the cast range of Purification
function jonjon_omniknight_purification:GetCastRange(vLocation, hTarget)
    return self:GetSpecialValueFor("purification_range")
end

-- Called when the ability is cast
function jonjon_omniknight_purification:OnSpellStart()
    local caster = self:GetCaster()
    local target = self:GetTarget()

    -- Ensure valid target
    if not target or not target:IsAlive() then return end

    -- Check if the caster has enough mana
    local manaCost = self:GetManaCost(self:GetLevel() - 1)
    if caster:GetMana() < manaCost then
        return
    end

    caster:ReduceMana(manaCost)

    -- Apply the effects of Purification (heal/damage)
    local damage = self:GetSpecialValueFor("purification_damage")
    local heal = self:GetSpecialValueFor("purification_heal")
    
    -- Apply the damage or healing based on the target's team
    if target:GetTeamNumber() == caster:GetTeamNumber() then
        -- Heal for allies
        target:AddNewModifier(caster, self, "modifier_jonjon_omniknight_purification_heal", {duration = 0.1})
        target:Heal(heal, caster)
    else
        -- Deal pure damage for enemies
        ApplyDamage({
            victim = target,
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_PURE,
            ability = self
        })
        target:AddNewModifier(caster, self, "modifier_jonjon_omniknight_purification_damage", {duration = 0.1})
    end

    -- Play particle effect and sound
    local particleName = "particles/units/heroes/hero_omniknight/omniknight_purification.vpcf"
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_WORLDORIGIN, target)
    ParticleManager:SetParticleControl(particle, 0, target:GetAbsOrigin())
    ParticleManager:ReleaseParticleIndex(particle)

    target:EmitSound("Hero_Omniknight.Purification")

    -- Cooldown management
    self:StartCooldown(self:GetCooldown(self:GetLevel() - 1))
end

-- Modifier for healing allies
if modifier_jonjon_omniknight_purification_heal == nil then
    modifier_jonjon_omniknight_purification_heal = class({})
end

function modifier_jonjon_omniknight_purification_heal:IsHidden() return true end
function modifier_jonjon_omniknight_purification_heal:IsPurgable() return false end

-- Modifier for damaging enemies
if modifier_jonjon_omniknight_purification_damage == nil then
    modifier_jonjon_omniknight_purification_damage = class({})
end

function modifier_jonjon_omniknight_purification_damage:IsHidden() return true end
function modifier_jonjon_omniknight_purification_damage:IsPurgable() return false end

-- Precache the necessary resources for this modifier
function modifier_jonjon_omniknight_purification_damage:OnCreated(kv)
    self.damage_type = DAMAGE_TYPE_PURE
end

-- Apply the damage debuff logic
function modifier_jonjon_omniknight_purification_damage:OnCreated(kv)
    if not IsServer() then return end
    self.damage_type = DAMAGE_TYPE_PURE
end

-- Called when the target dies (to manage any additional debuffs)
function modifier_jonjon_omniknight_purification_damage:OnDeath(event)
    if event.unit == self:GetParent() and event.unit:IsAlive() then
        self:GetParent():RemoveModifierByName("modifier_jonjon_omniknight_purification_damage")
    end
end

-- Called when the target's status changes (you could add things like stun or slow effects here)
function modifier_jonjon_omniknight_purification_damage:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
    }
end

-- Handle any special status effects (e.g., slow, magic resistance)
function modifier_jonjon_omniknight_purification_damage:GetModifierMoveSpeedBonus_Percentage()
    return -20
end

function modifier_jonjon_omniknight_purification_damage:GetModifierMagicalResistanceBonus()
    return -20
end

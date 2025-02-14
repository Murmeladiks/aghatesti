-- Jonjon Omniknight Purification Ability

if jonjon_omniknight_purification == nil then
    jonjon_omniknight_purification = class({})
end

LinkLuaModifier("modifier_jonjon_omniknight_purification", "abilities/jonjon_omniknight_purification.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_jonjon_omniknight_purification_heal", "abilities/jonjon_omniknight_purification.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_jonjon_omniknight_purification_damage", "abilities/jonjon_omniknight_purification.lua", LUA_MODIFIER_MOTION_NONE)

function jonjon_omniknight_purification:Precache( context )
	PrecacheResource( "particle", "particles/units/heroes/hero_omniknight/omniknight_purification.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_omniknight/omniknight_purification_cast.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_omniknight/omniknight_purification_hit.vpcf", context )
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
    print("Casting Purification on target:", target)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()

    -- Ensure valid target
    if not target or not target:IsAlive() then return end

    -- Ability Values
    local heal = self:GetSpecialValueFor("heal")
    local radius = self:GetSpecialValueFor("radius")

    -- Apply Heal to Target and Allies in AoE
    local allies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        target:GetAbsOrigin(),
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY,
        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )

    for _, ally in pairs(allies) do
        ally:Heal(heal, self)
        SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, ally, heal, nil)
    end

    -- Apply Damage to Enemies in AoE
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        target:GetAbsOrigin(),
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
            damage = heal,  -- Damage is equal to heal amount
            damage_type = DAMAGE_TYPE_PURE,
            ability = self
        })
        SendOverheadEventMessage(nil, OVERHEAD_ALERT_DAMAGE, enemy, heal, nil)
    end

    -- Play Particle Effect
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_omniknight/omniknight_purification.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControl(particle, 0, target:GetAbsOrigin())
    ParticleManager:ReleaseParticleIndex(particle)

    -- Play Sound
    target:EmitSound("Hero_Omniknight.Purification")

    -- Start Animation
    caster:StartGesture(ACT_DOTA_CAST_ABILITY_1)
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

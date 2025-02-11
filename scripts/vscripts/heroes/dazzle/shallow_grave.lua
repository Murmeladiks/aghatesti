pf_shallow_grave = class({})

LinkLuaModifier("modifier_pf_shallow_grave_buff", "heroes/dazzle/shallow_grave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_shallow_grave_ground_aura", "heroes/dazzle/shallow_grave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_shallow_grave_ground_buff", "heroes/dazzle/shallow_grave", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

function pf_shallow_grave:OnSpellStart()
    local hCaster = self:GetCaster()
    local target = self:GetCursorTarget()
    local pos = self:GetCursorPosition()

    local hWeave = hCaster:FindAbilityByName("dazzle_pf_innate_weave")

    if hCaster:HasShard("special_bonus_unique_pf_shallow_grave_duplicate") and hCaster ~= target then
        hCaster:SetCursorCastTarget(hCaster)
        self:OnSpellStart()
    end

    local duration = self:GetSpecialValueFor("duration")

    if target then
        target:AddNewModifier(hCaster, self, "modifier_pf_shallow_grave_buff", {duration = duration})
        if hWeave then hWeave:ApplyWeave(target) end

        if hCaster:HasShard("pf_shallow_grave_aoe") then
            local circle = ParticleManager:CreateParticle("particles/pink_circle.vpcf", PATTACH_WORLDORIGIN, target)
            ParticleManager:SetParticleControl(circle, 0, target:GetAbsOrigin())
            ParticleManager:SetParticleControl(circle, 1, Vector(hCaster:FindTalentValue("pf_shallow_grave_aoe", "radius"), 1, 1))
            ParticleManager:SetParticleControl(circle, 62, Vector(210, 1, 210))
            ParticleManager:ReleaseParticleIndex(circle)
            
            local units = FindUnitsInRadius(hCaster:GetOpposingTeamNumber(),
                    pos,
                    nil,
                    hCaster:FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("radius",1),
                    DOTA_UNIT_TARGET_TEAM_BOTH,
                    DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
                    DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
                    FIND_ANY_ORDER,
                    false)
            for _,unit in pairs(units) do
                if unit ~= target then
                    if unit:GetTeamNumber() == hCaster:GetTeamNumber() then
                        unit:AddNewModifier(hCaster, -- player source
                            self, -- ability source
                            "modifier_pf_shallow_grave_buff", -- modifier name
                            {
                                duration = duration
                            } -- kv
                        )
                        if hWeave then hWeave:ApplyWeave(unit) end
                    else
                        if not unit:HasModifier("modifier_absolute_no_cc") then
                            unit:AddNewModifier(hCaster, self, "modifier_shadow_shaman_voodoo", {duration = duration / 100 * hCaster:FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("hex_duration",1)})
                            if hWeave then hWeave:ApplyWeave(unit) end
                        end
                    end
                end
            end
        end
    else
        if hCaster:HasShard("pf_shallow_grave_ground") then
            self.thinker = CreateModifierThinker(
                hCaster,
                self,
                "modifier_pf_shallow_grave_ground_aura",
                {},
                pos,
                hCaster:GetTeamNumber(),
                false		
            )
            EmitSoundOn("Ability.Torrent", self.thinker)
        end
    end

    
end

function pf_shallow_grave:GetBehavior()
    local behavior = DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_DONT_RESUME_ATTACK + DOTA_ABILITY_BEHAVIOR_IGNORE_BACKSWING     
     if self:GetCaster():FindAbilityByName("pf_shallow_grave_ground") then
        behavior = behavior + DOTA_ABILITY_BEHAVIOR_POINT
     end
     if self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe") then
        behavior = behavior + DOTA_ABILITY_BEHAVIOR_AOE      
     end
     return behavior
end

function pf_shallow_grave:GetAOERadius()
     if self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe") then
        return self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("radius",1)
     end
end

function pf_shallow_grave:GetCastRange(vLocation, hTarget)
    return self:GetSpecialValueFor("cast_range")
end

modifier_pf_shallow_grave_buff = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_pf_shallow_grave_buff:IsHidden()
    return false
end

function modifier_pf_shallow_grave_buff:IsDebuff()
    return false
end

function modifier_pf_shallow_grave_buff:IsPurgable()
    return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_pf_shallow_grave_buff:OnCreated(kv)
    if IsServer() then
        -- Play effects
        local sound_cast = "Hero_Dazzle.Shallow_Grave"
        EmitSoundOn(sound_cast, self:GetParent())

        if self:GetCaster():FindAbilityByName("pf_shallow_grave_invis") then
            self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_rune_invis", {duration = self:GetDuration()})
        end

    end
end

function modifier_pf_shallow_grave_buff:CheckState()
    local invis = {
        [MODIFIER_STATE_NO_UNIT_COLLISION ] = true,
    }

    if self:GetCaster():FindAbilityByName("pf_shallow_grave_invis") then
        return invis
    end
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_pf_shallow_grave_buff:DeclareFunctions()
    local funcs = {MODIFIER_PROPERTY_MIN_HEALTH, MODIFIER_EVENT_ON_TAKEDAMAGE}

    if self:GetCaster():FindAbilityByName("pf_shallow_grave_invis") then
        table.insert(funcs, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT)
        table.insert(funcs, MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT  )
        table.insert(funcs, MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT  )
    end

    return funcs
end

function modifier_pf_shallow_grave_buff:GetModifierIgnoreMovespeedLimit()
    if self:GetCaster():FindAbilityByName("pf_shallow_grave_invis") then
        return 1
    end
end

function modifier_pf_shallow_grave_buff:GetModifierMoveSpeedBonus_Constant()
    if self:GetCaster():FindAbilityByName("pf_shallow_grave_invis") then
        return self:GetCaster():FindAbilityByName("pf_shallow_grave_invis"):GetLevelSpecialValueFor("speed_bonus", 1)
    end
end

function modifier_pf_shallow_grave_buff:GetModifierConstantHealthRegen()
    if self:GetCaster():FindAbilityByName("pf_shallow_grave_invis") then
        return self:GetCaster():FindAbilityByName("pf_shallow_grave_invis"):GetLevelSpecialValueFor("regen_bonus", 1)
    end
end

function modifier_pf_shallow_grave_buff:GetMinHealth()
    return 1
end

function modifier_pf_shallow_grave_buff:OnTakeDamage(params)
    -- if IsServer() and false then
    -- 	if params.unit == self:GetParent() and self:GetParent():GetHealth() <= 1 then
    -- 		local heal = self:GetAbility():GetSpecialValueFor("heal")
    -- 		if heal then
    -- 			self:GetParent():Heal(heal, self:GetAbility())
    -- 			local particle_name = "particles/econ/items/dazzle/dazzle_ti9/dazzle_shadow_wave_ti9_embers.vpcf"

    -- 			local nFXIndex = ParticleManager:CreateParticle( particle_name, PATTACH_CUSTOMORIGIN, nil )				
    -- 			ParticleManager:SetParticleControl( nFXIndex, 0, self:GetParent():GetAbsOrigin())
    -- 			ParticleManager:SetParticleControl( nFXIndex, 1, self:GetParent():GetAbsOrigin() + Vector(0,0,550))
    -- 			ParticleManager:ReleaseParticleIndex(nFXIndex)

    -- 			self:GetParent():EmitSound("Hero_Dazzle.Attack")
    -- 		end			
    -- 	end
    -- end
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_pf_shallow_grave_buff:GetEffectName()
    return "particles/units/heroes/hero_dazzle/dazzle_shallow_grave.vpcf"
end

function modifier_pf_shallow_grave_buff:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end

--------
--------
--------
--------
--------
--------
modifier_pf_shallow_grave_ground_buff = class ({})

function modifier_pf_shallow_grave_ground_buff:IsHidden()					return true end

function modifier_pf_shallow_grave_ground_buff:DeclareFunctions()
    local funcs = {MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET, MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE}
    return funcs
end

function modifier_pf_shallow_grave_ground_buff:GetModifierHealAmplify_PercentageTarget()
    if self:GetCaster():FindAbilityByName("pf_shallow_grave_ground") then
        return self:GetCaster():FindAbilityByName("pf_shallow_grave_ground"):GetLevelSpecialValueFor("heal_amp", 1)
    end
end

function modifier_pf_shallow_grave_ground_buff:GetModifierIncomingDamage_Percentage(params)
	if not IsServer() then return end
	if self:GetParent() and not self:GetParent():IsNull() and self:GetParent():GetTeamNumber() == self:GetCaster():GetTeamNumber() and self:GetCaster():FindAbilityByName("pf_shallow_grave_ground") and self:GetParent():IsConsideredHero() and self:GetParent():HasModifier("modifier_pf_shallow_grave_ground_buff") and not self:GetParent():IsIllusion() then
        if params.damage >= self:GetParent():GetHealth() then         
            if self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe") then
                local units = FindUnitsInRadius(self:GetCaster():GetTeamNumber(),
				self:GetParent():GetAbsOrigin(),
				nil,
				self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("radius",1),
				DOTA_UNIT_TARGET_TEAM_FRIENDLY,
				DOTA_UNIT_TARGET_HERO,
				DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
				FIND_ANY_ORDER,
				false)

                for _,unit in pairs(units) do
                    unit:AddNewModifier(self:GetCaster(), -- player source
                    self:GetAbility(), -- ability source
                    "modifier_pf_shallow_grave_buff", -- modifier name
                    {
                        duration = self:GetAbility():GetSpecialValueFor("duration")
                    } -- kv
                    )
                end
            else
                self:GetParent():AddNewModifier(self:GetCaster(), -- player source
                self:GetAbility(), -- ability source
                "modifier_pf_shallow_grave_buff", -- modifier name
                {
                    duration = self:GetAbility():GetSpecialValueFor("duration")
                } -- kv
                )
            end
            if self:GetAbility().thinker then
				self:GetAbility().thinker:Destroy()
				self:GetAbility().thinker = nil
			end
            return -99999
        end
	end
end

function modifier_pf_shallow_grave_ground_buff:GetEffectName()
    return "particles/items_fx/healing_tango.vpcf"
end

modifier_pf_shallow_grave_ground_aura = class ({})

function modifier_pf_shallow_grave_ground_aura:DeclareFunctions()
    local funcs = {MODIFIER_EVENT_ON_ABILITY_FULLY_CAST}
    return funcs
end

function modifier_pf_shallow_grave_ground_aura:OnAbilityFullyCast(params)
    if params.ability and params.ability == self:GetCaster():FindAbilityByName("pf_shallow_grave") and self:GetCreationTime() ~= GameRules:GetGameTime() then
        self:Destroy()        
    end
end

function modifier_pf_shallow_grave_ground_aura:IsHidden()					return true end

function modifier_pf_shallow_grave_ground_aura:IsAura()					return true end
function modifier_pf_shallow_grave_ground_aura:IsAuraActiveOnDeath() 		return false end

function modifier_pf_shallow_grave_ground_aura:GetAuraRadius()				
	return self.ground_radius 
end

function modifier_pf_shallow_grave_ground_aura:GetAuraSearchTeam()			
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_pf_shallow_grave_ground_aura:GetAuraSearchType()			
	return DOTA_UNIT_TARGET_HERO
end

function modifier_pf_shallow_grave_ground_aura:GetModifierAura()			
	return "modifier_pf_shallow_grave_ground_buff" 
end

function modifier_pf_shallow_grave_ground_aura:OnCreated()
	if not IsServer() or not self:GetCaster():HasAbility("pf_shallow_grave_ground") then		
        return
	end

	self.ground_radius	= self:GetCaster():FindAbilityByName("pf_shallow_grave_ground"):GetLevelSpecialValueFor("radius",1)
	
	
	self.puddle_particle = ParticleManager:CreateParticle("particles/dazzle_puddle.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(self.puddle_particle, 0, self:GetParent():GetAbsOrigin())
	ParticleManager:SetParticleControl(self.puddle_particle, 1, Vector(self.ground_radius, 1, 1))
	ParticleManager:SetParticleControl(self.puddle_particle, 15, Vector(210, 1, 210))
	ParticleManager:SetParticleControl(self.puddle_particle, 16, Vector(1, 1, 1))
	self:AddParticle(self.puddle_particle, false, false, -1, false, false)

    if self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe") then
        local circle = ParticleManager:CreateParticle("particles/pink_circle.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
        ParticleManager:SetParticleControl(circle, 0, self:GetParent():GetAbsOrigin())
        ParticleManager:SetParticleControl(circle, 1, Vector(self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("radius",1), 1, 1))
        ParticleManager:SetParticleControl(circle, 62, Vector(210, 1, 210))

        local units = FindUnitsInRadius(self:GetCaster():GetTeamNumber(),
        self:GetParent():GetAbsOrigin(),
        nil,
        self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("radius",1),
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
        FIND_ANY_ORDER,
        false)

        for _,unit in pairs(units) do
            if not unit:HasModifier("modifier_absolute_no_cc") then
                unit:AddNewModifier(self:GetCaster(), -- player source
                    self, -- ability source
                    "modifier_shadow_shaman_voodoo", -- modifier name
                    {
                        duration = self:GetCaster():FindAbilityByName("pf_shallow_grave"):GetSpecialValueFor("duration") / 100 * self:GetCaster():FindAbilityByName("pf_shallow_grave_aoe"):GetLevelSpecialValueFor("hex_duration",1)
                    } -- kv                    
                )
            end
        end
    end
end

function modifier_pf_shallow_grave_ground_aura:OnDestroy()
	if not IsServer() then return end
	if self.puddle_particle then
		ParticleManager:DestroyParticle(self.puddle_particle, false)
		ParticleManager:ReleaseParticleIndex(self.puddle_particle)
	end
	self:GetParent():RemoveSelf()
end

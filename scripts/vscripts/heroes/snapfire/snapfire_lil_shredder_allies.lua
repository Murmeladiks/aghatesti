aghsfort_special_snapfire_lil_shredder_ally_cast = class( {} )


--------------------------------------------------------------------------------
LinkLuaModifier( "modifier_snapfire_lil_shredder_allies", "heroes/snapfire/snapfire_lil_shredder_allies", LUA_MODIFIER_MOTION_NONE )
function aghsfort_special_snapfire_lil_shredder_ally_cast:GetIntrinsicModifierName()
    return "modifier_snapfire_lil_shredder_allies"
end


modifier_snapfire_lil_shredder_allies = class({})

function modifier_snapfire_lil_shredder_allies:IsHidden()
	return true
end

function modifier_snapfire_lil_shredder_allies:IsPurgeException()
	return false
end

function modifier_snapfire_lil_shredder_allies:IsPurgable()
	return false
end

function modifier_snapfire_lil_shredder_allies:IsPermanent()
	return true
end



function modifier_snapfire_lil_shredder_allies:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ABILITY_START,
     
    }
end

function modifier_snapfire_lil_shredder_allies:OnCreated(kv)
    if IsServer() then
       
    end
end

function modifier_snapfire_lil_shredder_allies:OnAbilityStart(params)
    if not IsServer() then
        return
    end

    if params.unit ~= self:GetParent() then
        return
    end

    local unit = self:GetParent()
    self.snapfire_lil_shredder = unit:FindAbilityByName("aghsfort_snapfire_lil_shredder")

    -- Check if the ability exists and is learned
    if self.snapfire_lil_shredder and self.snapfire_lil_shredder:IsTrained() then
        local duration = self.snapfire_lil_shredder:GetSpecialValueFor("buff_duration_tooltip")
        local value = self.snapfire_lil_shredder:GetSpecialValueFor("value")  -- Fetch "value" from npc_abilities_custom.txt
        local bonus_attacks = self.snapfire_lil_shredder:GetSpecialValueFor("bonus_attacks")  -- Fetch "bonus_attacks"

        print("Buff Duration: " .. duration)
        print("Value: " .. value)
        print("Bonus Attacks: " .. bonus_attacks)

        if params.ability:GetAbilityName() == "aghsfort_snapfire_lil_shredder" then
            print("Ally detected!")
            local position = unit:GetAbsOrigin()
            local allies = FindUnitsInRadius(
                self:GetCaster():GetTeamNumber(),   -- int, team number
                position,   -- point, center point
                nil,    -- handle, cacheUnit
                600,   -- float, radius
                DOTA_UNIT_TARGET_TEAM_FRIENDLY,    -- int, team filter
                DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, -- int, type filter
                0,  -- int, flag filter
                0,  -- int, order filter
                false   -- bool, can grow cache
            )

            for _, ally in pairs(allies) do
                if ally ~= params.target then
                    if ally and not ally:IsNull() and ally:IsAlive() and not ally:IsInvulnerable() then
                        print("Applying buffs to ally...")
                        ally:AddNewModifier(self:GetParent(), self.snapfire_lil_shredder, "modifier_snapfire_lil_shredder_buff", { duration = duration })
                        ally:AddNewModifier(self:GetParent(), self.snapfire_lil_shredder, "modifier_snapfire_lil_shredder_attack", { duration = duration })
                    end
                end
            end
        end
    else
        print("[ERROR] aghsfort_snapfire_lil_shredder not found or not trained!")
    end
end

aghsfort_special_omniknight_repel_outgoing_damage = class( {} )

LinkLuaModifier( "modifier_omniknight_martyr_zeal", "heroes/omniknight/omniknight_martyr_zeal", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_omniknight_martyr_zeal_buff", "heroes/omniknight/omniknight_martyr_zeal", LUA_MODIFIER_MOTION_NONE )
--------------------------------------------------------------------------------

function aghsfort_special_omniknight_repel_outgoing_damage:GetIntrinsicModifierName()
	return "modifier_omniknight_martyr_zeal"
end

modifier_omniknight_martyr_zeal = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_omniknight_martyr_zeal:IsHidden()
	return true
end

function modifier_omniknight_martyr_zeal:IsPurgeException()
	return false
end

function modifier_omniknight_martyr_zeal:IsPurgable()
	return false
end

function modifier_omniknight_martyr_zeal:IsPermanent()
	return true
end


function modifier_omniknight_martyr_zeal:OnCreated( kv )
	if IsServer() then
    end
end

function modifier_omniknight_martyr_zeal:DeclareFunctions()
	local funcs = {
        MODIFIER_EVENT_ON_ABILITY_FULLY_CAST,
	}

	return funcs
end


function  modifier_omniknight_martyr_zeal:OnAbilityFullyCast(params)
    if not IsServer() then
        return
    end

    if params.unit ~= self:GetParent() then
        return
    end
    

    if params.ability:GetAbilityName() == "aghsfort_omniknight_repel" then
        self.omniknight_martyr = self:GetParent():FindAbilityByName("aghsfort_omniknight_repel")
        local duration = self.omniknight_martyr:GetSpecialValueFor("duration")
        if not params.target:HasModifier("modifier_omniknight_martyr_zeal_buff") then
            params.target:AddNewModifier(self:GetParent(), self.omniknight_martyr, "modifier_omniknight_martyr_zeal_buff", {duration =duration})
        else
            local buff = params.target:FindModifierByName("modifier_omniknight_martyr_zeal_buff")
            if buff then
                buff:ForceRefresh()
            end
        end
    end

end
modifier_omniknight_martyr_zeal_buff = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_omniknight_martyr_zeal_buff:IsHidden()
	return true
end

function modifier_omniknight_martyr_zeal_buff:IsPurgeException()
	return false
end

function modifier_omniknight_martyr_zeal_buff:IsPurgable()
	return false
end

function modifier_omniknight_martyr_zeal_buff:IsPermanent()
	return false
end


function modifier_omniknight_martyr_zeal_buff:OnCreated( kv )
	if IsServer() then
    end
end

function modifier_omniknight_martyr_zeal_buff:DeclareFunctions()
    local funcs = 
    {
        MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
        

    }
    return funcs
end
function modifier_omniknight_martyr_zeal_buff:GetModifierDamageOutgoing_Percentage( params )
    return 30
end
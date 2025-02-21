if modifier_snapfire_lil_shredder_lua_armor_reduction == nil then
	modifier_snapfire_lil_shredder_lua_armor_reduction = class({})
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:IsHidden()
    return false
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:IsDebuff()
    return true
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:IsPurgable()
    return true
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:OnCreated(kv)
    -- Fetch the passed armor_reduction value from kv
    if kv and kv.armor_reduction then
        self.armor_reduction = kv.armor_reduction
    else
        print("Armor reduction value not found in OnCreated")
    end

    -- Debug message to confirm armor reduction value
    print("Armor reduction_reduction: " .. self.armor_reduction)

    if not IsServer() then return end

    -- Set the initial stack count (if it's the first time applied)
    if self:GetStackCount() == 0 then
        self:SetStackCount(1)
    else
        self:IncrementStackCount()
    end
end


function modifier_snapfire_lil_shredder_lua_armor_reduction:OnRefresh( kv )
    if not IsServer() then return end
    -- Increment stack count when refreshed
    self:IncrementStackCount()
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:DeclareFunctions()
    return { MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS }
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:GetModifierPhysicalArmorBonus()
    return self.armor_reduction * -self:GetStackCount()
end

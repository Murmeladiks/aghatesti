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
    -- references
	self.armor_reduction = -self:GetAbility():GetSpecialValueFor( "armor_reduction_per_attack" )
    
    print("Passing armor_reduction per attack:", self.armor_reduction)
	if not IsServer() then return end
	self:SetStackCount( 1 )
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:OnRefresh(kv)
    if not IsServer() then return end
    self:IncrementStackCount()
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:DeclareFunctions()
    return { MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS }
end

function modifier_snapfire_lil_shredder_lua_armor_reduction:GetModifierPhysicalArmorBonus()
    return self.armor_reduction * self:GetStackCount()  -- Apply armor reduction based on stack count
end

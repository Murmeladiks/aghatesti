modifier_phantom_assassin_phantom_strike_lua = class({})

function modifier_phantom_assassin_phantom_strike_lua:IsHidden() 	return false end
function modifier_phantom_assassin_phantom_strike_lua:IsDebuff() 	return false end
function modifier_phantom_assassin_phantom_strike_lua:IsPurgable() 	return true end

function modifier_phantom_assassin_phantom_strike_lua:OnCreated( kv )
	self.attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed") 
end

function modifier_phantom_assassin_phantom_strike_lua:OnRefresh( kv )
	self.attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
end

function modifier_phantom_assassin_phantom_strike_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PRE_ATTACK,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
end

function modifier_phantom_assassin_phantom_strike_lua:GetModifierPreAttack( params )
	if IsServer() then
		-- Destroy if attacking invalid target
		local result = UnitFilter(
			params.target,	-- Target Filter
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- Team Filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,	-- Unit Filter
			DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- Unit Flag
			self:GetParent():GetTeamNumber()	-- Team reference
		)

		if result~=UF_SUCCESS then
			self:Destroy()
		end
	end
end

function modifier_phantom_assassin_phantom_strike_lua:GetModifierAttackSpeedBonus_Constant()
	return self.attack_speed
end

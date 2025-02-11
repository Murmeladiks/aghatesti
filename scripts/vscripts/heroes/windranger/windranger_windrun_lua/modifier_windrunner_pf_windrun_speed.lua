modifier_windrunner_pf_windrun_speed = class({})

--------------------------------------------------------------------------------

function modifier_windrunner_pf_windrun_speed:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_windrunner_pf_windrun_speed:OnCreated( kv )
	self.nMoveSpeed = self:GetAbility():GetSpecialValueFor( "ally_movespeed_bonus_pct" )
end

--------------------------------------------------------------------------------

function modifier_windrunner_pf_windrun_speed:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_windrunner_pf_windrun_speed:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_windrunner_pf_windrun_speed:GetEffectName()
	return "particles/units/heroes/hero_windrunner/windrunner_windrun_slow.vpcf"
end

--------------------------------------------------------------------------------

function modifier_windrunner_pf_windrun_speed:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

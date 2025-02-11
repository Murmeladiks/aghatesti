-- Created by Elfansoer
modifier_focus_fire_target = class({})

function modifier_focus_fire_target:IsHidden() 		return true end
function modifier_focus_fire_target:IsDebuff() 		return true end
function modifier_focus_fire_target:IsPurgable() 	return false end

function modifier_focus_fire_target:GetActivityTranslationModifiers()
	return "focusfire"
end

--------------------------------------------------------------------------------
function modifier_focus_fire_target:CheckState()
	return {		
		[MODIFIER_STATE_PASSIVES_DISABLED] = true,
	}	
end

function modifier_focus_fire_target:DeclareFunctions()
	return {		
		MODIFIER_EVENT_ON_ATTACKED,
		MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
	}
end

function modifier_focus_fire_target:OnAttacked( params )
	if not IsServer() then return end
	if params.attacker ~= nil and params.attacker == self:GetAbility():GetCaster() and params.target == self:GetParent() then
		self:GetParent():AddNewModifier(
				self:GetAbility():GetCaster(), -- player source
				self:GetAbility(), -- ability source
				"modifier_stunned", -- modifier name
				{ duration = 0.05 } -- kv
			)
		local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_crystalmaiden/maiden_frostbite.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
		ParticleManager:SetParticleControlEnt( nFXIndex, 1, self:GetParent(), PATTACH_ABSORIGIN_FOLLOW, nil, self:GetParent():GetAbsOrigin(), false )
		ParticleManager:ReleaseParticleIndex( nFXIndex )
		EmitSoundOn( "IceDragonMaw.Trigger", self:GetParent() )
	end		
end

function modifier_focus_fire_target:OnCreated( kv )
	if not IsServer() then return end

	self.nBreakFX = ParticleManager:CreateParticle( "particles/generic_gameplay/generic_break.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent() )
end


function modifier_focus_fire_target:OnDestroy()
	if not IsServer() then return end
	if self.nBreakFX ~= nil then
		ParticleManager:DestroyParticle( self.nBreakFX, false )
	end
end


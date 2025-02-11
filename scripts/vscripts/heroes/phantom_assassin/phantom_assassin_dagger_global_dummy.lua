phantom_assassin_dagger_global_dummy = class({})
LinkLuaModifier( "modifier_phantom_assassin_dagger_global_dummy", "heroes/phantom_assassin/phantom_assassin_dagger_global_dummy", LUA_MODIFIER_MOTION_NONE )

function phantom_assassin_dagger_global_dummy:GetIntrinsicModifierName()
	return "modifier_phantom_assassin_dagger_global_dummy"
end



modifier_phantom_assassin_dagger_global_dummy = class({})

function modifier_phantom_assassin_dagger_global_dummy:IsHidden() 			return true end
function modifier_phantom_assassin_dagger_global_dummy:IsDebuff() 			return false end
function modifier_phantom_assassin_dagger_global_dummy:IsPurgable() 		return false end
function modifier_phantom_assassin_dagger_global_dummy:DestroyOnExpire() 	return false end

function modifier_phantom_assassin_dagger_global_dummy:DeclareFunctions() 
	return {
		MODIFIER_PROPERTY_ABILITY_LAYOUT,
	}
end

function modifier_phantom_assassin_dagger_global_dummy:GetModifierAbilityLayout() 
	return 6
end

function modifier_phantom_assassin_dagger_global_dummy:OnCreated( kv )
	local caster = self:GetAbility():GetCaster()	
	if IsServer() then			
		caster:AddAbility("phantom_assassin_dagger_global"):SetLevel(1)
		caster:SwapAbilities("phantom_assassin_dagger_global", "phantom_assassin_coup_de_grace_lua", true, true)
	end				
end


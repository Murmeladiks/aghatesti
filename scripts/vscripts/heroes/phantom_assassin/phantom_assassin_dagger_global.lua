phantom_assassin_dagger_global = class({})

--------------------------------------------------------------------------------

function phantom_assassin_dagger_global:Precache( context )
	PrecacheResource("particle", "particles/econ/events/ti4/blink_dagger_start_smoke_ti4.vpcf", context)
end


--------------------------------------------------------------------------------

function phantom_assassin_dagger_global:GetCastAnimation()
	self:GetCaster():AddActivityModifier("assassin")
    return ACT_DOTA_TAUNT
end

--------------------------------------------------------------------------------


function phantom_assassin_dagger_global:OnSpellStart()
	local caster = self:GetCaster()
	local spell = caster:FindAbilityByName("phantom_assassin_stifling_dagger_lua")

	if spell:GetLevel() < 1 then
		return false
	end
	
	local nFxIndex = ParticleManager:CreateParticle( "particles/econ/events/ti4/blink_dagger_start_smoke_ti4.vpcf", PATTACH_ABSORIGIN, caster )
	ParticleManager:SetParticleControlEnt( nFxIndex, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), true )
	ParticleManager:SetParticleControl( nFxIndex, 0, caster:GetAbsOrigin() )
	ParticleManager:DestroyParticle(nFxIndex, false)
	ParticleManager:ReleaseParticleIndex( nFxIndex )

	local enemies = FindRadius(caster, 12000, true)
	for _,enemy in pairs(enemies) do
		caster:SetCursorCastTarget(enemy)
		spell:OnSpellStart()
	end		     	
end
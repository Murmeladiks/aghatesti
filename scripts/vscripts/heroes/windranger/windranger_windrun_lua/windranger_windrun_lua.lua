LinkLuaModifier("modifier_windranger_windrun_lua", 			"heroes/windranger/windranger_windrun_lua/modifier_windranger_windrun_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_windranger_windrun_lua_invis", 	"heroes/windranger/windranger_windrun_lua/modifier_windranger_windrun_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_windrunner_pf_windrun_speed", 	"heroes/windranger/windranger_windrun_lua/modifier_windrunner_pf_windrun_speed", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

windranger_windrun_lua = class({})

--------------------------------------------------------------------------------

function windranger_windrun_lua:OnSpellStart()
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor( "duration" )

	-- add modifier
	caster:AddNewModifier(caster, self, "modifier_windranger_windrun_lua", {duration = duration})

	if caster:HasAbility("pathfinder_special_windranger_windrun_aoe") then
		local radius = caster:FindAbilityByName("pathfinder_special_windranger_windrun_aoe"):GetSpecialValueFor("radius")
		local friendlies = FindUnitsInRadius( caster:GetTeamNumber(), caster:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0, false )

		for _,ally in pairs(friendlies) do
			ally:AddNewModifier(caster, self, "modifier_windranger_windrun_lua", {duration = duration})
		end
	end

	if caster:HasAbility("pathfinder_special_windranger_windrun_invis") then		
		caster:AddNewModifier(caster, self, "modifier_windranger_windrun_lua_invis", { duration = duration })		
	end

	caster:EmitSound("Ability.Windrun")
end
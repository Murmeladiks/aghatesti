-- Created by Elfansoer
ogre_magi_multicast_lua = class({})
ogre_magi_multicast_lua_curve = ogre_magi_multicast_lua
LinkLuaModifier( "modifier_ogre_magi_multicast_lua", "heroes/ogre_magi/ogre_magi_multicast_lua/modifier_ogre_magi_multicast_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ogre_magi_multicast_lua_proc", "heroes/ogre_magi/ogre_magi_multicast_lua/modifier_ogre_magi_multicast_lua_proc", LUA_MODIFIER_MOTION_NONE )

function ogre_magi_multicast_lua:GetIntrinsicModifierName()
	return "modifier_ogre_magi_multicast_lua"
end

function ogre_magi_multicast_lua:Spawn()
	if IsClient() then return end
	Timers:CreateTimer(0.1, function()
		local hPlayerHero = PlayerResource:GetSelectedHeroEntity(self:GetCaster():GetPlayerOwnerID())

		local vecAbilitiesToSwap = {
			"ogre_magi_fireblast_lua",
			"ogre_magi_ignite_lua",
			"ogre_magi_bloodlust_lua",
			"ogre_magi_multicast_lua",

		}

		if hPlayerHero:GetHeroFacetID() == 2 and not hPlayerHero.bSwappedToCurve then
			hPlayerHero.bSwappedToCurve = true
			for _, sAbilityName in pairs(vecAbilitiesToSwap) do
				local hCurveVersion = hPlayerHero:AddAbility(sAbilityName .. "_curve")
				hPlayerHero:SwapAbilities(sAbilityName, sAbilityName .. "_curve", false, true)
				hPlayerHero:RemoveAbility(sAbilityName)
			end
		end
	end)
end

function ogre_magi_multicast_lua:OnSpellStart()
	local caster = self:GetCaster()

	if not caster:FindAbilityByName("pathfinder_special_om_alive_multicast") or not caster:IsAlive() or caster:GetTimeUntilRespawn() > 0 then return end

	local heal = caster:FindAbilityByName("pathfinder_special_om_alive_multicast"):GetLevelSpecialValueFor("heal",1)
	local nFXIndex = ParticleManager:CreateParticle( "particles/econ/items/ogre_magi/ogre_magi_arcana/ogre_magi_arcana_fireblast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster )
	ParticleManager:SetParticleControlEnt( nFXIndex, 1, caster, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), true )
	ParticleManager:ReleaseParticleIndex( nFXIndex )
	EmitSoundOn( "DOTA_Item.ComboBreaker", caster )

	caster:HealWithParams(heal, self, false, true, caster, false)

	local enemies = FindUnitsInRadius(
		caster:GetTeamNumber(),	-- int, your team number
		caster:GetAbsOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			250,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- int, flag filter
			0,	-- int, order filter
			false	-- bool, can grow cache
		)
	
	for _,enemy in pairs(enemies) do
		local duration = 0.2 * (1 - enemy:GetStatusResistance())
		enemy:AddNewModifier(caster, self, "modifier_stunned", {duration = duration})

		local knockback =
			{
				knockback_duration = duration,
				duration = duration,
				knockback_distance = 100,
				knockback_height = 100,
				center_x = caster:GetAbsOrigin().x,
				center_y = caster:GetAbsOrigin().y,
				center_z = caster:GetAbsOrigin().z,
			}
		enemy:RemoveModifierByName("modifier_knockback")
		enemy:AddNewModifier(caster, self, "modifier_knockback", knockback)

		Timers(duration + FrameTime(), function()
			FindClearSpaceForUnit(enemy, enemy:GetAbsOrigin(), false)
		end)
	end
end


--------------------------------------------------------------------------------

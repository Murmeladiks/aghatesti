---------------------------------------------------------------------------
--	HealingFilter
--  *entindex_target_const
--	*entindex_healer_const
--	*entindex_inflictor_const
--	*heal
---------------------------------------------------------------------------

function CAghanim:HealingFilter( filterTable )
	return true
end

---------------------------------------------------------------------------
--	DamageFilter
--  *entindex_victim_const
--	*entindex_attacker_const
--	*entindex_inflictor_const
--	*damagetype_const
--	*damage
---------------------------------------------------------------------------

function CAghanim:DamageFilter( filterTable )
	return true
end


---------------------------------------------------------------------------
--	ItemAddedToInventoryFilter
--  *item_entindex_const
--	*item_parent_entindex_const
--	*inventory_parent_entindex_const
--	*suggested_slot
---------------------------------------------------------------------------

function CAghanim:ItemAddedToInventoryFilter( filterTable )
	return true
end

LinkLuaModifier("modifier_uncapped_movespeed", "modifiers/modifier_uncapped_movespeed", LUA_MODIFIER_MOTION_NONE)

local special_modifier_effects = {
	modifier_aghsfort_slark_shadow_dance_aura = function(parent, caster, ability, duration)
		
		if parent:HasAbility("aghsfort_special_slark_shadow_dance_essence_shift_bonus") then
			local essence_shift = parent:FindAbilityByName("aghsfort_slark_essence_shift")
			local stacks = essence_shift:GetSpecialValueFor("max_stacks")

			if stacks > 0 then
				Timers:CreateTimer(0, function()
					local mod = parent:FindModifierByName("modifier_aghsfort_slark_essence_shift_active")
					if mod then
						mod:SetStackCount(stacks*2)
					end
				end)
			end
		end
		return true
	end,

	modifier_aghsfort_weaver_shukuchi = function(parent, caster, ability, duration)
		if parent:HasAbility("aghsfort_weaver_shukuchi") then
			parent:AddNewModifier(parent, ability, "modifier_uncapped_movespeed", {duration = duration})
		end
		return true
	end
}


---------------------------------------------------------------------------
--	ModifierGainedFilter
--  *entindex_parent_const
--	*entindex_ability_const
--	*entindex_caster_const
--	*name_const
--	*duration
---------------------------------------------------------------------------

function CAghanim:ModifierGainedFilter( filterTable )
	if filterTable["entindex_parent_const"] == nil then 
		return true
	end

 	if filterTable[ "name_const" ] == nil then
		return true
	end

	local BlackListModiifers = 
	{
		"modifier_sheepstick_debuff",
		"modifier_stunned",
		"modifier_bashed",
		"modifier_aghsfort_tusk_walrus_punch_air_time",
		"modifier_aghsfort_mars_spear_stun",
		"modifier_tidehunter_ravage",
		"modifier_aghsfort_ravage_potion",
	}

	local hParent = EntIndexToHScript( filterTable[ "entindex_parent_const" ] )
	local caster = EntIndexToHScript(filterTable.entindex_caster_const or -1)
	local ability = EntIndexToHScript(filterTable.entindex_ability_const or -1)
	local modifier_name = filterTable.name_const
	--print(modifier_name)

	if ability and ability:GetName() == "undead_woods_skeleton_king_hellfire_blast" and hParent and hParent:IsRealHero() then
		hParent.bLastHellfireBlast = GameRules:GetDOTATime(true, true)
	end

	if special_modifier_effects[modifier_name] then
		local exit = special_modifier_effects[modifier_name](hParent, caster, ability, filterTable.duration)
		if (not exit) then return false end
	end

	if modifier_name == "modifier_item_shadow_amulet_fade" and hParent == caster then
		local cooldown = ability:GetSpecialValueFor("self_cooldown")

		Timers:CreateTimer(FrameTime(), function()
			if ability and not ability:IsNull() then
				ability:StartCooldown(cooldown)
			end
		end)
		
		return true
	end

	
	if hParent ~= nil and hParent.bAbsoluteNoCC ~= nil and hParent.bAbsoluteNoCC == true then
		if hParent.bNoNullifier ~= nil and hParent.bNoNullifier == true then
			table.insert( BlackListModiifers, "modifier_item_nullifier_mute" ) 
			table.insert( BlackListModiifers, "modifier_item_nullifier_slow" ) 
		end

		local bModifierInBlacklist = false
		for _,szModifierName in pairs ( BlackListModiifers ) do
			if szModifierName == filterTable[ "name_const" ] then
				bModifierInBlacklist = true
				break
			end
		end

		if bModifierInBlacklist then
			local vMaxs = hParent:GetBoundingMaxs()
			local vMins = hParent:GetBoundingMins()
			local flFXScale = ( vMaxs.z - vMins.z / 1.5 )

			local nFxIndex = ParticleManager:CreateParticle( "particles/generic_gameplay/disable_resist.vpcf", PATTACH_CUSTOMORIGIN, hParent )
			ParticleManager:SetParticleControlEnt( nFxIndex, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", hParent:GetAbsOrigin(), true )
			ParticleManager:SetParticleControl( nFxIndex, 1, Vector( flFXScale, flFXScale, flFXScale ) )
			ParticleManager:ReleaseParticleIndex( nFxIndex )

			EmitSoundOn( "DisableResistance.EarlyDebuffEnd", hParent )
			return false
		end

		return true
	end

	return true
end

require( "utility_functions" )
-- Created by Elfansoer
--[[
Ability checklist (erase if done/checked):
- Scepter Upgrade
- Break behavior
- Linken/Reflect behavior
- Spell Immune/Invulnerable/Invisible behavior
- Illusion behavior
- Stolen behavior
]]
require("libraries.has_shard")
require("libraries.timers")
--------------------------------------------------------------------------------
modifier_ogre_magi_multicast_lua = class({})
modifier_ogre_magi_multicast_lua.singles = {
	["ogre_magi_fireblast_lua"] = true,
	["ogre_magi_unrefined_fireblast_lua"] = true,
	["ogre_magi_fireblast"] = true,
	["ogre_magi_unrefined_fireblast"] = true,
	["item_ethereal_blade"] = true,
	["item_pf_dagon"] = true,
	["item_pf_dagon_2"] = true,
	["item_pf_dagon_3"] = true,
	["item_pf_dagon_4"] = true,
	["item_pf_dagon_5"] = true,
}

--------------------------------------------------------------------------------
-- Classifications
function modifier_ogre_magi_multicast_lua:IsHidden()
	return false
end

function modifier_ogre_magi_multicast_lua:IsDebuff()
	return false
end

function modifier_ogre_magi_multicast_lua:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ogre_magi_multicast_lua:OnCreated( kv )
	-- references
	self.chance_2 = self:GetAbility():GetSpecialValueFor( "multicast_2_times" ) 
	self.chance_3 = self:GetAbility():GetSpecialValueFor( "multicast_3_times" ) 
	self.chance_4 = self:GetAbility():GetSpecialValueFor( "multicast_4_times" ) 

	self:StartIntervalThink(1)

	self.buffer_range = 300	

	self.bDeathPrevented = 0
	self.bBufferTime = false
end

function modifier_ogre_magi_multicast_lua:OnRefresh( kv )
	-- references
	self.chance_2 = self:GetAbility():GetSpecialValueFor( "multicast_2_times" ) 
	self.chance_3 = self:GetAbility():GetSpecialValueFor( "multicast_3_times" ) 
	self.chance_4 = self:GetAbility():GetSpecialValueFor( "multicast_4_times" ) 
end

function modifier_ogre_magi_multicast_lua:OnRemoved()
end

function modifier_ogre_magi_multicast_lua:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_ogre_magi_multicast_lua:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ABILITY_FULLY_CAST,
		MODIFIER_PROPERTY_CAST_RANGE_BONUS ,
		MODIFIER_PROPERTY_MIN_HEALTH,
		MODIFIER_EVENT_ON_DEATH_PREVENTED,
		MODIFIER_PROPERTY_EXTRA_HEALTH_PERCENTAGE,
		MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL,
		MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL_VALUE,
	}
end

function modifier_ogre_magi_multicast_lua:GetModifierExtraHealthPercentage()
	if self:GetCaster():FindAbilityByName("pathfinder_special_om_alive_multicast") then	
		return -1 * self:GetCaster():FindAbilityByName("pathfinder_special_om_alive_multicast"):GetLevelSpecialValueFor("health_penalty",1)
	end
end


function modifier_ogre_magi_multicast_lua:GetModifierCastRangeBonus()
	return self:GetAbility():GetLevelSpecialValueFor("bonus_cast_range", self:GetAbility():GetLevel() - 1)
end

function modifier_ogre_magi_multicast_lua:OnIntervalThink()
	if IsClient() then return end
	if self:GetParent():GetHealth() < 0 then self:GetParent():ForceKill(false) end
	if self:GetAbility():GetCaster():HasAbility("pathfinder_special_om_aoe_multicast") then			

		local chance = self:GetAbility():GetCaster():FindAbilityByName("pathfinder_special_om_aoe_multicast"):GetLevelSpecialValueFor("chance", 1)

		if RandomInt(1,100) > chance then return end		
		local radius = self:GetAbility():GetCaster():FindAbilityByName("pathfinder_special_om_aoe_multicast"):GetLevelSpecialValueFor("radius", 1)

		local abilities = {}
		for i=0,10 do
			local ability = self:GetParent():GetAbilityByIndex(i)
			if ability and bitand(ability:GetBehaviorInt(),DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 and bitand(ability:GetAbilityTargetTeam(), DOTA_UNIT_TARGET_TEAM_ENEMY ) ~= 0 then			if ability:GetAbilityName() ~= "ogre_magi_unrefined_fireblast" then
					table.insert(abilities, ability)
				end
			end
		end
		for i=0,6 do
			local item = self:GetParent():GetItemInSlot(i)
			if item and bitand(item:GetAbilityTargetTeam(), DOTA_UNIT_TARGET_TEAM_ENEMY ) ~= 0  and bitand(item:GetBehaviorInt(),DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then	
				table.insert(abilities, item)
			end
		end
		local chosen = abilities[RandomInt(1, #abilities)]
		
		if chosen then
			local enemies = FindRadius(self:GetParent(), radius, true)
			local chosen_enemy = enemies[RandomInt(1,#enemies)]
			if chosen_enemy then
				self:GetParent():SetCursorCastTarget(chosen_enemy)
				chosen:OnSpellStart()				
				local param = {}
				param.unit = self:GetParent()
				param.ability = chosen
				param.target = chosen_enemy
				self:OnAbilityFullyCast(param)
			end
		end
	end
end

function modifier_ogre_magi_multicast_lua:OnAbilityFullyCast( params )
	if params.unit~=self:GetCaster() then return end
	if params.ability==self:GetAbility() then return end

	-- cancel if break
	if self:GetCaster():PassivesDisabled() then return end

	-- only spells that have target
	if not params.target then return end

	-- if the spell can do both target and point, it should not trigger
	if bitand( params.ability:GetBehaviorInt(), DOTA_ABILITY_BEHAVIOR_POINT ) ~= 0 then --[[print('not point')]] return end
	if bitand( params.ability:GetBehaviorInt(), DOTA_ABILITY_BEHAVIOR_OPTIONAL_UNIT_TARGET ) ~= 0 then --[[print('unit optional')]] return end

	-- roll multicasts
	local casts = 1
	if RandomInt( 0,100 ) < self.chance_2 then casts = 2 end
	if RandomInt( 0,100 ) < self.chance_3 then casts = 3 end
	if RandomInt( 0,100 ) < self.chance_4 then casts = 4 end
	-- check delay
	local delay = 0.6 --params.ability:GetSpecialValueFor( "multicast_delay" ) or 0

	-- only for fireblast multicast to single target
	local single = self.singles[params.ability:GetAbilityName()] or false
	
	-- multicast
	self:GetCaster():AddNewModifier(
		self:GetCaster(), -- player source
		self:GetAbility(), -- ability source
		"modifier_ogre_magi_multicast_lua_proc", -- modifier name
		{
			ability = params.ability:entindex(),
			target = params.target:entindex(),
			multicast = casts,
			delay = delay,
			single = single,
		} -- kv
	)
end

function modifier_ogre_magi_multicast_lua:GetMinHealth( params )
	if IsServer() and self:GetCaster():FindAbilityByName("pathfinder_special_om_alive_multicast") then
		if self.bBufferTime then return 1 end

		local casts = 0
		if RandomInt( 0,100 ) < self.chance_2 then casts = 1 end
		if RandomInt( 0,100 ) < self.chance_3 then casts = 2 end
		if RandomInt( 0,100 ) < self.chance_4 then casts = 3 end

		if casts > 0 then
			self.bDeathPrevented = casts
			return 1
		end
	end

	return 0
end

function modifier_ogre_magi_multicast_lua:OnDeathPrevented( params )
	if IsServer() and self:GetCaster():FindAbilityByName("pathfinder_special_om_alive_multicast") then
		if self:GetParent() == params.unit and self:GetParent():IsAlive() and self:GetParent():GetTimeUntilRespawn() == 0 and self.bDeathPrevented > 0 then
			self.bBufferTime = true
			Timers:CreateTimer(FrameTime(), function() self.bBufferTime = false end)

			if self.bDeathPrevented > 1 then
				local particle_cast = "particles/units/heroes/hero_ogre_magi/ogre_magi_multicast.vpcf"
				local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_OVERHEAD_FOLLOW, self:GetParent() )
				ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.bDeathPrevented, 1, 0 ) )
				ParticleManager:ReleaseParticleIndex( effect_cast )
			end

			local proc_count = self.bDeathPrevented
			self.bDeathPrevented = 0

			for i = 1, proc_count do
				local ability = self:GetAbility()
				Timers(0.1 + 0.25 * (i - 1), function()
					ability:OnSpellStart()
				end)
			end
		end
	end
	return 0
end

-----------------------------------------------------------------------

function modifier_ogre_magi_multicast_lua:GetModifierOverrideAbilitySpecial( params )
	if self:GetParent() == nil or params.ability == nil or self:GetCaster():GetHeroFacetID() ~= 1 or self.bChecking then
		return 0
	end

	local hAbility = params.ability
	local szSpecialValueName = params.ability_special_value

	local vecValuesToOverride = {
		["multicast_2_times"] = true,
		["multicast_3_times"] = true,
		["multicast_4_times"] = true,
	}

	if hAbility ~= self:GetAbility() or not vecValuesToOverride[szSpecialValueName] then
		return 0
	end

	return 1
end

-----------------------------------------------------------------------

function modifier_ogre_magi_multicast_lua:GetModifierOverrideAbilitySpecialValue( params )
	if self.bChecking then return end
	local hAbility = params.ability

	local szSpecialValueName = params.ability_special_value
	local nSpecialLevel = params.ability_special_level
	self.bChecking = true
	local nBaseValue = hAbility:GetLevelSpecialValueFor( szSpecialValueName, nSpecialLevel )
	self.bChecking = false

	if hAbility ~= self:GetAbility() then
		return nBaseValue
	end


	return nBaseValue + self:GetCaster():GetStrength() * hAbility:GetSpecialValueFor("strength_mult")
end

-----------------------------------------------------------------------

function modifier_ogre_magi_multicast_lua:GetPriority()
	return 100
end
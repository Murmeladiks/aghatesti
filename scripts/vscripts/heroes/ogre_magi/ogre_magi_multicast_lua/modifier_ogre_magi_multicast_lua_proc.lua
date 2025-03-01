modifier_ogre_magi_multicast_lua_proc = class({})

--------------------------------------------------------------------------------

function modifier_ogre_magi_multicast_lua_proc:IsHidden() 		return self:GetStackCount() < 1 end
function modifier_ogre_magi_multicast_lua_proc:GetAttributes() 	return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_ogre_magi_multicast_lua_proc:OnCreated( kv )	
	if not IsServer() then return end
	self.caster = self:GetParent()
	self.ability = EntIndexToHScript( kv.ability )
	self.target = EntIndexToHScript( kv.target )
	self.multicast = kv.multicast
	self.delay = kv.delay
	self.single = kv.single==1
	self.buffer_range = 300

	self:SetStackCount( self.multicast - 1)

	-- init multicast
	self.casts = 0
	if self.multicast==1 or not self.ability or self.ability:IsNull() or not self.target or self.target:IsNull() then
		-- no multicast if just 1
		self:Destroy()
		return
	end

	-- keep a table of targeted units
	self.targets = {}
	self.targets[self.target] = true

	-- get cast range
	self.radius = self.ability:GetCastRange( self.target:GetOrigin(), self.target ) + self.buffer_range

	-- get unit filters
	-- only target the same team as original target, even if the ability can cast on both team
	self.target_team = DOTA_UNIT_TARGET_TEAM_FRIENDLY
	if self.target:GetTeamNumber()~=self.caster:GetTeamNumber() then
		self.target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
	end

	-- if custom, findunitsinradius won't work
	self.target_type = self.ability:GetAbilityTargetType()
	if self.target_type==DOTA_UNIT_TARGET_CUSTOM then
		self.target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
	end

	-- only check for magic immunity piercing abilities
	self.target_flags = DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE
	if bitand(self.ability:GetAbilityTargetFlags(),DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES ) ~= 0 then
		self.target_flags = self.target_flags + DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
	end
	
	-- play effects
	self:PlayEffects( self.casts )

	-- Start interval
	self:StartIntervalThink( self.delay )
end

--------------------------------------------------------------------------------
-- Interval Effects
function modifier_ogre_magi_multicast_lua_proc:OnIntervalThink()
	local current_target = nil
	if not self.ability or self.ability:IsNull() then return end

	if self.single then
		current_target = self.target
	else
		-- find valid targets
		local units = FindUnitsInRadius(
			self.caster:GetTeamNumber(),	-- int, your team number
			self.caster:GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			self.target_team,	-- int, team filter
			self.target_type,	-- int, type filter
			self.target_flags,	-- int, flag filter
			FIND_CLOSEST,	-- int, order filter
			false	-- bool, can grow cache
		)

		-- select valid target
		for _,unit in pairs(units) do
			-- not already a multicast target
			if not self.targets[unit] then

				-- check filter
				local filter = false
				if self.ability and IsValidEntity(self.ability) and self.ability.CastFilterResultTarget then -- for customs
					filter = self.ability:CastFilterResultTarget( unit ) == UF_SUCCESS
				else
					filter = true
				end

				if filter then
					-- register unit
					self.targets[unit] = true
					current_target = unit

					break
				end
			end
		end

		-- if no one there, break multicast
		if not current_target then
			self:StartIntervalThink( -1 )
			self:Destroy()
			return
		end
	end

	-- cast to target
	local old_target = self.caster:GetCursorCastTarget()
	self.caster:SetCursorCastTarget( current_target )
	self.ability:OnSpellStart()
	self.caster:SetCursorCastTarget( old_target)
	-- increment count
	self.casts = self.casts + 1
	self:DecrementStackCount()

	if self.target and self:GetAbility():GetCaster():HasAbility("pathfinder_special_om_multi_multicast") and self.casts >= (self.multicast-1) then		
		local chance = self:GetAbility():GetCaster():FindAbilityByName( "pathfinder_special_om_multi_multicast" ):GetLevelSpecialValueFor("chance", 1)
		
		if RandomInt( 0,100 ) < chance then
			self.casts = 0
			self:GetAbility():GetCaster():EmitSound("ogre_magi_ogmag_ability_multi_hit_17")

			local chance_2 = self:GetAbility():GetSpecialValueFor( "multicast_2_times" ) * 100
			local chance_3 = self:GetAbility():GetSpecialValueFor( "multicast_3_times" ) * 100
			local chance_4 = self:GetAbility():GetSpecialValueFor( "multicast_4_times" ) * 100

			local casts = 1
			if RandomInt( 0,100 ) < chance_2 then casts = 2 end
			if RandomInt( 0,100 ) < chance_3 then casts = 3 end
			if RandomInt( 0,100 ) < chance_4 then casts = 4 end
			self.multicast = casts
		end				
	end

	if self.casts>=(self.multicast-1) then
		self:StartIntervalThink( -1 )
		self:Destroy()
	end

	-- play effects
	self:PlayEffects( self.casts )
end

--------------------------------------------------------------------------------

function modifier_ogre_magi_multicast_lua_proc:PlayEffects( value )
	value = value + 1

	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_ogre_magi/ogre_magi_multicast.vpcf"

	-- get data
	local counter_speed = 2
	if value==self.multicast then
		counter_speed = 1
	end

	local effect_cast = nil
	-- Create Particle
	if self.ability:GetAbilityName() ~= "ogre_magi_fireblast_lua" then
		effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_OVERHEAD_FOLLOW, self.caster )
	else
		effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_OVERHEAD_FOLLOW, self.target )
	end
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( value, counter_speed, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	local sound = math.min( value-1, 3 )
	local sound_cast = "Hero_OgreMagi.Fireblast.x" .. sound
	if sound > 0 then
		EmitSoundOn( sound_cast, self.caster )
	end
end
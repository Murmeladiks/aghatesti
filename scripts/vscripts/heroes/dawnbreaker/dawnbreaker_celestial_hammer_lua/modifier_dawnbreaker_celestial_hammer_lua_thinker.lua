-- Created by Elfansoer
modifier_dawnbreaker_celestial_hammer_lua_thinker = class({})

function modifier_dawnbreaker_celestial_hammer_lua_thinker:Precache( context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_leshrac.vsndevts", context )
end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:IsHidden() return true end
function modifier_dawnbreaker_celestial_hammer_lua_thinker:IsDebuff() return false end
function modifier_dawnbreaker_celestial_hammer_lua_thinker:IsPurgable() return false end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:OnCreated( kv )
	self.caster = self:GetCaster()
	self.parent = self:GetParent()
	self.ability = self:GetAbility()

	-- references
	self.name = "particles/units/heroes/hero_dawnbreaker/dawnbreaker_celestial_hammer_return.vpcf"
	self.speed = self:GetAbility():GetSpecialValueFor( "projectile_speed" )
	self.delay = self:GetAbility():GetSpecialValueFor( "pause_duration" )
	self.duration = self:GetAbility():GetSpecialValueFor( "flare_debuff_duration" )
	self.vision = 200
	self.interval = 0.1

	-- NOTE: arbitrary decision to mimic original spell
	self.max_return = 1.5

	if not IsServer() then return end

	local sound_loop = "Hero_Dawnbreaker.Celestial_Hammer.Projectile"
	EmitSoundOn( sound_loop, self.parent )
end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:OnDestroy()
	if not IsServer() then return end
	UTIL_Remove( self:GetParent() )
end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:OnIntervalThink()
	if not self.converge then
		self:Return()
		return
	end

	-- create trail
	local thinker = CreateModifierThinker(
		self.caster, -- player source
		self.ability, -- ability source
		"modifier_dawnbreaker_celestial_hammer_lua_trail", -- modifier name
		{
			duration = self.duration,
			x = self.prev_pos.x,
			y = self.prev_pos.y,
		}, -- kv
		self.parent:GetOrigin(),
		self.caster:GetTeamNumber(),
		false
	)
	self.prev_pos = self.parent:GetOrigin()
end

--------------------------------------------------------------------------------

function modifier_dawnbreaker_celestial_hammer_lua_thinker:GleamingHammer()
	local hCaster = self:GetCaster()
	local hGuardian = hCaster:FindAbilityByName("dawnbreaker_solar_guardian_lua")

	if hCaster:GetHeroFacetID() ~= 2 or not hGuardian or not hGuardian:IsTrained() then return end

	local hAbility = self:GetAbility()


	hGuardian:Pulse(self:GetParent():GetOrigin(), hAbility:GetSpecialValueFor("hammer_solar_guardian_effectiveness_pct") / 100, hAbility:GetSpecialValueFor("hammer_solar_guardian_radius"))

	Timers:CreateTimer(hGuardian:GetSpecialValueFor("pulse_interval"), function()
		if self and not self:IsNull() and not self.converge then
			self:GleamingHammer()
		end
	end)
end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:Delay()
	self:PlayEffects1()
	self:StartIntervalThink( self.delay )

	self:GleamingHammer()

	if self:GetCaster():HasAbility("dawnbreaker_celestial_hammer_lua_skewer") and not self:GetCaster():PassivesDisabled() then
		local sound = "Hero_Leshrac.Split_Earth"
		EmitSoundOn( sound, self:GetParent() )

		local attack_stun = self:GetCaster():FindAbilityByName("dawnbreaker_celestial_hammer_lua_skewer"):GetLevelSpecialValueFor("attack_stun",1)
		local radius = self:GetCaster():FindAbilityByName("dawnbreaker_celestial_hammer_lua_skewer"):GetLevelSpecialValueFor("radius",1)
		local enemies = FindUnitsInRadius(
				self:GetCaster():GetTeamNumber(),	-- int, your team number
				self:GetParent():GetAbsOrigin(),	-- point, center point
				nil,	-- handle, cacheUnit. (not known)
				radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
				DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
				DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
				0,	-- int, flag filter
				0,	-- int, order filter
				false	-- bool, can grow cache
			)
		local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_leshrac/leshrac_split_earth.vpcf", PATTACH_WORLDORIGIN, self:GetParent() )
		ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
		ParticleManager:SetParticleControl( effect_cast, 1, Vector(radius,0,0) )
		ParticleManager:ReleaseParticleIndex(effect_cast)
		for _,enemy in pairs(enemies) do	
			enemy:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = attack_stun * (1 - enemy:GetStatusResistance())})

			local knockback =
				{
					knockback_duration = 0.35,
					duration = 0.35,
					knockback_distance = radius / 9,
					knockback_height = 110,
					center_x = self:GetParent():GetAbsOrigin().x,
					center_y = self:GetParent():GetAbsOrigin().y,
					center_z = self:GetParent():GetAbsOrigin().z,
				}
			enemy:RemoveModifierByName("modifier_knockback")
			enemy:AddNewModifier(self:GetCaster(), self, "modifier_knockback", knockback)

			self:GetCaster():PerformAttack( enemy, true, true, true, true, false, false, true )			

			Timers(0.35, function()
				FindClearSpaceForUnit(enemy, enemy:GetAbsOrigin(), false)
			end)
		end
	end

	-- add viewer
	AddFOWViewer( self.caster:GetTeamNumber(), self.parent:GetOrigin(), self.vision, self.delay, false)
end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:Return()
	if self.converge then return end

	self.converge = true
	self.prev_pos = self.parent:GetOrigin()
	self:StartIntervalThink( self.interval )
	self:OnIntervalThink()

	-- calculate speed
	self.distance = (self.parent:GetOrigin()-self.caster:GetOrigin()):Length2D()
	if self.distance > self.speed*self.max_return then
		self.speed = self.distance/self.max_return
	end
	
	-- create projectile
	local info = {
		Target = self.caster,
		Source = self.parent,
		Ability = self.ability,	
		
		EffectName = self.name,
		iMoveSpeed = self.speed,
		bDodgeable = false,
	}
	local data = {
		cast = 2,
		targets = {},
		thinker = self.parent,
	}
	local id = ProjectileManager:CreateTrackingProjectile(info)
	self.ability.projectiles[id] = data

	-- play effects
	self:PlayEffects2()
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_dawnbreaker_celestial_hammer_lua_thinker:PlayEffects1()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_dawnbreaker/dawnbreaker_celestial_hammer_grounded.vpcf"
	local sound_cast = "Hero_Dawnbreaker.Celestial_Hammer.Impact"

	-- Get Data
	local direction = self:GetParent():GetOrigin()-self:GetCaster():GetOrigin()
	direction.z = 0
	direction = direction:Normalized()

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, self:GetCaster():GetOrigin() )
	ParticleManager:SetParticleControlForward( effect_cast, 0, direction )
	self.effect_cast = effect_cast

	-- buff particle
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOn( sound_cast, self.parent )
end

function modifier_dawnbreaker_celestial_hammer_lua_thinker:PlayEffects2()
	if self.effect_cast then
		ParticleManager:DestroyParticle( self.effect_cast, false )
		ParticleManager:ReleaseParticleIndex( self.effect_cast )
	end

	local sound_cast = "Hero_Dawnbreaker.Celestial_Hammer.Return"
	EmitSoundOn( sound_cast, self.parent )
end

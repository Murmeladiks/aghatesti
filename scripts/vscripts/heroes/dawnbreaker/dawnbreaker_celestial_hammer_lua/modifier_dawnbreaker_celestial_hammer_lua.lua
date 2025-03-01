-- Created by Elfansoer
modifier_dawnbreaker_celestial_hammer_lua = class({})

function modifier_dawnbreaker_celestial_hammer_lua:IsHidden()	return true end
function modifier_dawnbreaker_celestial_hammer_lua:IsDebuff()	return false end
function modifier_dawnbreaker_celestial_hammer_lua:IsPurgable()	return true end

function modifier_dawnbreaker_celestial_hammer_lua:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()

	-- references
	self.speed = self:GetAbility():GetSpecialValueFor( "projectile_speed" )
	self.speed_pct = self:GetAbility():GetSpecialValueFor( "travel_speed_pct" )
	self.duration = self:GetAbility():GetSpecialValueFor( "flare_debuff_duration" )
	self.interval = 0.1


	if not IsServer() then return end

	self.hit_list = {}

	-- NOTE: arbitrary decision to mimic original spell
	self.max_range = self:GetAbility():GetSpecialValueFor( "range" )
	self.origin = self.parent:GetOrigin()

	self.prev_pos = self.parent:GetOrigin()
	self.actual_speed = self.speed*self.speed_pct/100
	self.target = EntIndexToHScript( kv.target )

	-- set forward
	local direction = self.target:GetOrigin()-self.parent:GetOrigin()
	direction.z = 0
	direction = direction:Normalized()
	self.parent:SetForwardVector( direction )

	-- move
	if not self:ApplyHorizontalMotionController() then
		self:Destroy()
		return
	end

	-- Start interval
	self:StartIntervalThink( self.interval )
	self:OnIntervalThink()

	-- play effects
	self:PlayEffects()
end

function modifier_dawnbreaker_celestial_hammer_lua:OnDestroy()
	if not IsServer() then return end
	self:GetParent():RemoveHorizontalMotionController( self )
	self:GetParent():FadeGesture(ACT_DOTA_OVERRIDE_ABILITY_2)
end

function modifier_dawnbreaker_celestial_hammer_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_DISABLE_TURNING,
	}
end

function modifier_dawnbreaker_celestial_hammer_lua:GetModifierDisableTurning()
	return 1
end

function modifier_dawnbreaker_celestial_hammer_lua:CheckState()
	return {
		[MODIFIER_STATE_STUNNED] = true,
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
	}
end

function modifier_dawnbreaker_celestial_hammer_lua:OnIntervalThink()
	-- create trail
	local thinker = CreateModifierThinker(
		self.parent, -- player source
		self.ability, -- ability source
		"modifier_dawnbreaker_celestial_hammer_lua_trail", -- modifier name
		{
			duration = self.duration,
			x = self.prev_pos.x,
			y = self.prev_pos.y,
		}, -- kv
		self.parent:GetOrigin(),
		self.parent:GetTeamNumber(),
		false
	)
	self.prev_pos = self.parent:GetOrigin()	
end

function modifier_dawnbreaker_celestial_hammer_lua:UpdateHorizontalMotion( me, dt )
	local dist = (self.origin-me:GetOrigin()):Length2D()
	if dist > self.max_range then
		self:Destroy()
		return
	end

	local pos = me:GetOrigin() + me:GetForwardVector() * self.actual_speed * dt

	pos = GetGroundPosition( pos, me )
	me:SetOrigin( pos )
end

function modifier_dawnbreaker_celestial_hammer_lua:OnHorizontalMotionInterrupted()
	self:Destroy()
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_dawnbreaker_celestial_hammer_lua:PlayEffects()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_dawnbreaker/dawnbreaker_converge_trail.vpcf"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_POINT_FOLLOW, self.parent )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		1,
		self.parent,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlForward( effect_cast, 0, self.parent:GetForwardVector() )

	-- buff particle
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		true, -- bHeroEffect
		false -- bOverheadEffect
	)
end




-----------------------------------------------------------------------
-----------------------	TRAIL LEAVER
------------------------------------------

modifier_dawnbreaker_celestial_hammer_lua_attach_trail = class({})

function modifier_dawnbreaker_celestial_hammer_lua_attach_trail:IsHidden() 		return true end
function modifier_dawnbreaker_celestial_hammer_lua_attach_trail:IsDebuff() 		return true end
function modifier_dawnbreaker_celestial_hammer_lua_attach_trail:IsPurgable() 	return true end

function modifier_dawnbreaker_celestial_hammer_lua_attach_trail:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetCaster():FindAbilityByName("dawnbreaker_celestial_hammer_lua")

	self.duration = self.ability:GetSpecialValueFor( "flare_debuff_duration" )
	self.interval = 0.25

	if not IsServer() then return end

	self.prev_pos = self.parent:GetOrigin()

	-- Start interval
	self:StartIntervalThink( self.interval )
	self:OnIntervalThink()
end

function modifier_dawnbreaker_celestial_hammer_lua_attach_trail:OnIntervalThink()
	-- create trail
	local thinker = CreateModifierThinker(
		self.parent, -- player source
		self.ability, -- ability source
		"modifier_dawnbreaker_celestial_hammer_lua_trail", -- modifier name
		{
			duration = self.duration,
			x = self.prev_pos.x,
			y = self.prev_pos.y,
		}, -- kv
		self.parent:GetOrigin(),
		self.parent:GetTeamNumber(),
		false
	)
	self.prev_pos = self.parent:GetOrigin()	
end

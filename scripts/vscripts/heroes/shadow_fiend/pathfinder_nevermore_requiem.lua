LinkLuaModifier("modifier_pathfinder_nevermore_requiem_phase", 	"heroes/shadow_fiend/pathfinder_nevermore_requiem", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pathfinder_nevermore_requiem_debuff", "heroes/shadow_fiend/pathfinder_nevermore_requiem", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pathfinder_requiem_attack", 			"heroes/shadow_fiend/pathfinder_nevermore_requiem", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

pathfinder_nevermore_requiem = pathfinder_nevermore_requiem or class({})

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_nevermore/nevermore_requiemofsouls.vpcf")
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_nevermore/nevermore_wings.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_a.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_line.vpcf", context)
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:GetAssociatedSecondaryAbilities()
	return "pathfinder_nevermore_necromastery"
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("travel_distance")
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:OnAbilityPhaseStart()
	local hCaster = self:GetCaster()	

	self.wings_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_nevermore/nevermore_wings.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	ParticleManager:SetParticleControlForward(self.wings_particle, 0, hCaster:GetForwardVector())
	ParticleManager:SetParticleControlEnt(self.wings_particle, 1, hCaster, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(self.wings_particle, 5, hCaster, PATTACH_POINT_FOLLOW, "attach_arm_R", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(self.wings_particle, 6, hCaster, PATTACH_POINT_FOLLOW, "attach_arm_L", Vector(0, 0, 0), true)
	hCaster:EmitSound("Hero_Nevermore.RequiemOfSoulsCast")

	-- Start cast animation
	hCaster:StartGesture(ACT_DOTA_CAST_ABILITY_6)

	-- Caster becomes phased while casting
	hCaster:AddNewModifier(hCaster, self, "modifier_pathfinder_nevermore_requiem_phase", {})

	return true
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:OnAbilityPhaseInterrupted()
	local hCaster = self:GetCaster()
	hCaster:RemoveGesture(ACT_DOTA_CAST_ABILITY_6)

	-- Remove phased movement from caster
	hCaster:RemoveModifierByName("modifier_pathfinder_nevermore_requiem_phase")
	
	hCaster:StopSound("Hero_Nevermore.RequiemOfSoulsCast")
	
	if self.wings_particle then
		ParticleManager:DestroyParticle(self.wings_particle, true)
		ParticleManager:ReleaseParticleIndex(self.wings_particle)
	end
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_requiem:OnSpellStart(death_cast)	
	if self.wings_particle then
		ParticleManager:ReleaseParticleIndex(self.wings_particle)
	end

	local caster = self:GetCaster()
	
	local particle_caster_souls = "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_a.vpcf"
	local particle_caster_ground = "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls.vpcf"
	local modifier_phase = "modifier_pathfinder_nevermore_requiem_phase"
	local modifier_souls = "modifier_pathfinder_necromastery_souls"


	local souls_per_line = self:GetSpecialValueFor("souls_per_line")
	local travel_distance = self:GetSpecialValueFor("travel_distance")

	-- Play cast sound
	caster:EmitSound("Hero_Nevermore.RequiemOfSouls")

	-- Remove phased movement from caster
	caster:RemoveModifierByName(modifier_phase)

	-- Add particles for the caster and the ground
	local particle_caster_souls_fx = ParticleManager:CreateParticle(particle_caster_souls, PATTACH_ABSORIGIN, caster)
	ParticleManager:SetParticleControl(particle_caster_souls_fx, 0, caster:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle_caster_souls_fx, 1, Vector(lines, 0, 0))
	ParticleManager:SetParticleControl(particle_caster_souls_fx, 2, caster:GetAbsOrigin())
	ParticleManager:ReleaseParticleIndex(particle_caster_souls_fx)

	local particle_caster_ground_fx = ParticleManager:CreateParticle(particle_caster_ground, PATTACH_ABSORIGIN, caster)
	ParticleManager:SetParticleControl(particle_caster_ground_fx, 0, caster:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle_caster_ground_fx, 1, Vector(lines, 0, 0))
	ParticleManager:ReleaseParticleIndex(particle_caster_ground_fx)

	-- Find the Necromastery modifier, its stack count and the ability that used it
	local modifier_souls_handler
	local stacks
	local necro_ability
	local max_souls

	if caster:HasModifier(modifier_souls) then
		modifier_souls_handler = caster:FindModifierByName(modifier_souls)
		if modifier_souls_handler then
			stacks = modifier_souls_handler:GetStackCount()
			necro_ability = modifier_souls_handler:GetAbility()
		max_souls = modifier_souls_handler.max_souls
		end
	end

	-- If the modifier was not found, Requiem fails (no souls to release).
	if not modifier_souls_handler then
		return nil
	end

	-- Talent: Maximum Necromastery soul increase (REMOVED)
	-- max_souls = max_souls + caster:FindTalentValue("special_bonus_imba_nevermore_6")

	local line_count
	line_count = math.floor(stacks / souls_per_line)



	-- Calculate the first line location, in front of the caster
	local line_position = caster:GetAbsOrigin() + caster:GetForwardVector() * travel_distance

	if stacks >= 1 then
		-- Create the first line
		CreateRequiemSoulLine(caster, self, caster, line_position, death_cast)
	end

	-- Calculate the location of every other line
	local qangle_rotation_rate = 360 / line_count
	for i = 1, line_count - 1 do
		local qangle = QAngle(0, qangle_rotation_rate, 0)
		line_position = RotatePosition(caster:GetAbsOrigin(), qangle, line_position)

		-- Create every other line
		CreateRequiemSoulLine(caster, self, caster, line_position, death_cast)
	end
end

function pathfinder_nevermore_requiem:OnProjectileHit_ExtraData(target, location, extra_data)
	-- If there was no target, do nothing
	if not target or target:IsNull() then
		return nil
	end

	-- Ability properties
	local caster = self:GetCaster()
	local death_cast = extra_data.death_cast

	-- Ability specials
	local damage = self:GetSpecialValueFor("damage")	
	local slow_duration = self:GetSpecialValueFor("requiem_slow_duration")
	local max_time = self:GetSpecialValueFor("requiem_slow_duration_max")
	local hPreviousDebuff = target:FindModifierByName("modifier_pathfinder_nevermore_requiem_debuff")

	if hPreviousDebuff then
		slow_duration = math.min(hPreviousDebuff:GetRemainingTime() + slow_duration, max_time)
	end

	-- Apply the debuff on enemies hit
	target:AddNewModifier(caster, self, "modifier_pathfinder_nevermore_requiem_debuff", {duration = slow_duration * (1 - target:GetStatusResistance())})	
	target:EmitSound("Hero_Nevermore.RequiemOfSouls.Damage")
	
	-- Damage the target
	ApplyDamage({
		attacker = caster,
		victim = target,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self
	})

	-- F.E.A.R.	
	if not death_cast and target.bAbsoluteNoCC ~= true then

		if not target:HasModifier("modifier_nevermore_requiem_fear") then
			target:AddNewModifier(self:GetCaster(), self, "modifier_nevermore_requiem_fear", {duration = math.min(self:GetSpecialValueFor("requiem_slow_duration") * (1 - target:GetStatusResistance()), max_time)})
		else
			target:FindModifierByName("modifier_nevermore_requiem_fear"):SetDuration( math.min(max_time, target:FindModifierByName("modifier_nevermore_requiem_fear"):GetRemainingTime() + self:GetSpecialValueFor("requiem_slow_duration") * (1 - target:GetStatusResistance())), true)
		end

		if caster:HasAbility("pathfinder_nevermore_special_requiem_sleep") then
			Timers:CreateTimer(self:GetSpecialValueFor("requiem_slow_duration") * (1 - target:GetStatusResistance()), function()
				local special = caster:FindAbilityByName("pathfinder_nevermore_special_requiem_sleep")
				target:AddNewModifier(caster, self, "modifier_elder_titan_echo_stomp", {duration = special:GetLevelSpecialValueFor("duration",1)})
			end)
		end
	end
end

function CreateRequiemSoulLine(caster, ability, source_unit, line_end_position, death_cast)
	-- Ability properties
	local particle_lines = "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_line.vpcf"	

	-- Ability specials
	local travel_distance = ability:GetSpecialValueFor("travel_distance")
	local lines_starting_width = ability:GetSpecialValueFor("lines_starting_width")
	local lines_end_width = ability:GetSpecialValueFor("lines_end_width")
	local travel_distance = ability:GetSpecialValueFor("travel_distance")
	local lines_travel_speed = ability:GetSpecialValueFor("lines_travel_speed")

	-- Calculate the time that it would take to reach the maximum distance
	local max_distance_time = travel_distance / lines_travel_speed

	-- Calculate velocity
	local velocity = (line_end_position - source_unit:GetAbsOrigin())
	velocity.z = 0

	velocity = velocity:Normalized() * lines_travel_speed

	-- Launch the line
	projectile_info = {
		Ability = ability,
		EffectName = "",
		vSpawnOrigin = caster:GetAbsOrigin(),
		fDistance = travel_distance,
		fStartRadius = lines_starting_width,
		fEndRadius = lines_end_width,
		Source = source_unit,
		bHasFrontalCone = false,
		bReplaceExisting = false,
		iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
		iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
		iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		bDeleteOnHit = false,
		vVelocity = velocity,
		bProvidesVision = false,
		ExtraData = {
			scepter_line = false, 
			death_cast = death_cast
		}
	}

	-- Create the projectile
	ProjectileManager:CreateLinearProjectile(projectile_info)

	local nLineFX = ParticleManager:CreateParticle("particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_line.vpcf", PATTACH_CUSTOMORIGIN, caster)
	ParticleManager:SetParticleControlEnt(nLineFX, 0, caster:FirstMoveChild(), PATTACH_WORLDORIGIN, nil, Vector(0, 0, -2000), true)
	ParticleManager:SetParticleControl(nLineFX, 0, caster:GetOrigin())
	ParticleManager:SetParticleControl(nLineFX, 1, velocity)
	ParticleManager:SetParticleControl(nLineFX, 2, Vector(0, max_distance_time, 0))
	ParticleManager:ReleaseParticleIndex(nLineFX)

	-- Create the particle
	--[[local particle_lines_fx = ParticleManager:CreateParticle(particle_lines, PATTACH_ABSORIGIN, caster)
	ParticleManager:SetParticleControl(particle_lines_fx, 0, source_unit:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle_lines_fx, 1, velocity)
	ParticleManager:SetParticleControl(particle_lines_fx, 2, Vector(0, max_distance_time, 0))
	ParticleManager:ReleaseParticleIndex(particle_lines_fx)]]

end


-- Requiem of Souls caster phased modifier
modifier_pathfinder_nevermore_requiem_phase = modifier_pathfinder_nevermore_requiem_phase or class({})

function modifier_pathfinder_nevermore_requiem_phase:CheckState()
	local state = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true}
	return state
end

function modifier_pathfinder_nevermore_requiem_phase:IsHidden() return true end
function modifier_pathfinder_nevermore_requiem_phase:IsPurgable() return false end
function modifier_pathfinder_nevermore_requiem_phase:IsDebuff() return false end

--------------------------------------------------------------------------------

modifier_pathfinder_nevermore_requiem_debuff = modifier_pathfinder_nevermore_requiem_debuff or class({})

--------------------------------------------------------------------------------

function modifier_pathfinder_nevermore_requiem_debuff:OnCreated()
	local hAbility = self:GetAbility()

	self.nMoveSlow = -hAbility:GetSpecialValueFor("ms_slow_pct")
end

--------------------------------------------------------------------------------

function modifier_pathfinder_nevermore_requiem_debuff:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_pathfinder_nevermore_requiem_debuff:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

modifier_pathfinder_requiem_attack = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_pathfinder_requiem_attack:IsHidden()
	return false
end

function modifier_pathfinder_requiem_attack:IsDebuff()
	return false
end

function modifier_pathfinder_requiem_attack:GetTexture()
	return "nevermore_requiem"
end

function modifier_pathfinder_requiem_attack:OnRefresh()
	if not IsServer() then return end
	local req = self:GetParent():FindAbilityByName("pathfinder_nevermore_requiem")
	local special = self:GetParent():FindAbilityByName("pathfinder_nevermore_special_requiem_attack")
	if req and special and req:GetLevel() > 0 and self:GetStackCount() > special:GetLevelSpecialValueFor("trigger_threshold",1) then
		req:OnSpellStart()
		self:SetStackCount(0)
	end
end



pathfinder_nevermore_special_requiem_soul_projectile = pathfinder_nevermore_special_requiem_soul_projectile or class({})

function pathfinder_nevermore_special_requiem_soul_projectile:OnSpellStart()
	-- Ability properties
	local particle_lines = "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_line.vpcf"
	local ability = self:GetCaster():FindAbilityByName("pathfinder_nevermore_requiem")

	local caster = self:GetCaster()
	if not caster or not ability or ability:GetLevel() < 1 then
		return
	end
	
	local source_unit = self:GetCaster():GetCursorCastTarget()

	-- Ability specials
	local travel_distance = ability:GetSpecialValueFor("travel_distance")
	local lines_starting_width = 200
	local lines_end_width = 200
	local travel_distance = ability:GetSpecialValueFor("travel_distance")
	local lines_travel_speed = ability:GetSpecialValueFor("lines_travel_speed")

	-- Calculate the time that it would take to reach the maximum distance
	local max_distance_time = travel_distance / lines_travel_speed

	-- Calculate velocity
	-- local velocity = (caster:GetAbsOrigin() - source_unit:GetAbsOrigin()):Normalized() * lines_travel_speed

	local line_end_position = source_unit:GetAbsOrigin() + caster:GetForwardVector() * travel_distance
	local velocity = (line_end_position - source_unit:GetAbsOrigin()):Normalized() * lines_travel_speed

	-- Launch the line
	projectile_info = {Ability = self,
					   EffectName = particle_lines,
					   vSpawnOrigin = caster:GetAbsOrigin(),
					   fDistance = travel_distance,
					   fStartRadius = lines_starting_width,
					   fEndRadius = lines_end_width,
					   Source = source_unit,
					   bHasFrontalCone = false,
					   bReplaceExisting = false,
					   iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_FRIENDLY,
					   iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
					   iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
					   bDeleteOnHit = false,
					   vVelocity = velocity,
					   bProvidesVision = false,			
					   }

	-- Create the projectile
	ProjectileManager:CreateLinearProjectile(projectile_info)

	-- Create the particle
	local particle_lines_fx = ParticleManager:CreateParticle(particle_lines, PATTACH_ABSORIGIN, caster)
	ParticleManager:SetParticleControl(particle_lines_fx, 0, source_unit:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle_lines_fx, 1, velocity)
	ParticleManager:SetParticleControl(particle_lines_fx, 2, Vector(0, max_distance_time, 0))
	ParticleManager:ReleaseParticleIndex(particle_lines_fx)

end

function pathfinder_nevermore_special_requiem_soul_projectile:OnProjectileHit_ExtraData(target, location)	
	local req = self:GetCaster():FindAbilityByName("pathfinder_nevermore_requiem")
	local caster = self:GetCaster()

	if not caster or not target or not (caster:HasAbility("pathfinder_nevermore_special_requiem_soul_projectile") and req and req:GetLevel() > 0) then	
	-- If there was no target, do nothing
		return nil
	end

	
	-- Ability properties	
	local ability = req
	local modifier_debuff = "modifier_pathfinder_nevermore_requiem_debuff"

	-- Ability specials
	local damage = ability:GetSpecialValueFor("damage")

	-- print(damage)
	local slow_duration = ability:GetSpecialValueFor("requiem_slow_duration")


	-- Apply the debuff on enemies hit
	target:AddNewModifier(caster, ability, modifier_debuff, {duration = slow_duration * (1 - target:GetStatusResistance())})

	
	target:EmitSound("Hero_Nevermore.RequiemOfSouls.Damage")
	
	-- Damage the target

	ApplyDamage({
		attacker = caster,
		victim = target,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = ability
	})	

	if not target:HasModifier("modifier_absolute_no_cc") then
		if caster:HasAbility("pathfinder_nevermore_special_requiem_sleep") then
			Timers:CreateTimer(self:GetSpecialValueFor("requiem_slow_duration") * (1 - target:GetStatusResistance()), function()
				local special = caster:FindAbilityByName("pathfinder_nevermore_special_requiem_sleep")
				target:AddNewModifier(caster, self, "modifier_elder_titan_echo_stomp", {duration = special:GetLevelSpecialValueFor("duration",1)})
			end)
		end
	end
end

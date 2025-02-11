LinkLuaModifier( "modifier_pf_shadow_wave", "heroes/dazzle/shadow_wave", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

pf_shadow_wave = class({})

--------------------------------------------------------------------------------

function pf_shadow_wave:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_shadow_wave.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_shadow_wave_impact_heal.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_shadow_wave_impact_damage.vpcf", context)
	PrecacheResource("particle", "particles/pink_circle_no_dust.vpcf", context)
end

--------------------------------------------------------------------------------

function pf_shadow_wave:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_dazzle/dazzle_shadow_wave.vpcf")
end

--------------------------------------------------------------------------------

function pf_shadow_wave:GetIntrinsicModifierName()
	return "modifier_pf_shadow_wave"
end

--------------------------------------------------------------------------------

function pf_shadow_wave:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor( "cast_range" )
end

--------------------------------------------------------------------------------

function pf_shadow_wave:CastFilterResultTarget( target )
	if self:GetCaster():GetTeamNumber() ~= target:GetTeamNumber() then
		if not self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy") then
			return UF_FAIL_ENEMY
		end
	end
	return UF_SUCCESS
end

--------------------------------------------------------------------------------

function pf_shadow_wave:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	-- references
	self.radius = self:GetSpecialValueFor( "damage_radius" )
	self.bounce_radius = self:GetSpecialValueFor( "bounce_radius" )
	local jumps = self:GetLevelSpecialValueFor( "max_targets", self:GetLevel() - 1 )
	self.damage = self:GetLevelSpecialValueFor( "damage", self:GetLevel() - 1 )
	self.mana = self:GetLevelSpecialValueFor( "mana" , self:GetLevel() - 1)

	-- precache damage
	self.damageTable = {
		-- victim = target,
		attacker = caster,
		damage = self.damage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self, --Optional.
	}

	-- unit groups
	self.healedUnits = {}

	if self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy") and target:GetTeamNumber() ~= self:GetCaster():GetTeamNumber() then
		table.insert( self.healedUnits, target )
		-- Jump
		self:JumpInverse( jumps * self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy"):GetLevelSpecialValueFor("bounce_mult",1), caster, target )
	else
		table.insert( self.healedUnits, caster )
		-- Jump
		self:Jump( jumps, caster, target )
	end

	caster:EmitSound("Hero_Dazzle.Shadow_Wave")
	
	self.usedGlobalBounce = false
end

--------------------------------------------------------------------------------

function pf_shadow_wave:CastFromUnit(unit)
	if not IsServer() then return nil end

	local caster = self:GetCaster()

	-- references
	self.radius = self:GetSpecialValueFor( "damage_radius" )
	self.bounce_radius = self:GetSpecialValueFor( "bounce_radius" )
	local jumps = self:GetLevelSpecialValueFor( "max_targets", self:GetLevel() - 1 )
	self.damage = self:GetLevelSpecialValueFor( "damage", self:GetLevel() - 1 )
	self.mana = self:GetLevelSpecialValueFor( "mana" , self:GetLevel() - 1)

	-- precache damage
	self.damageTable = {
		-- victim = target,
		attacker = caster,
		damage = self.damage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self, --Optional.
	}

	local target_team = DOTA_UNIT_TARGET_TEAM_FRIENDLY
	if self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy") then
		target_team = DOTA_UNIT_TARGET_TEAM_BOTH
	end

	local targets = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		unit:GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self:GetSpecialValueFor( "cast_range" ),	-- float, radius. or use FIND_UNITS_EVERYWHERE
		target_team,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		FIND_ANY_ORDER,	-- int, order filter
		false	-- bool, can grow cache
	)

	if #targets > 0 then		

		self.healedUnits = {}

		if targets[1]:GetTeamNumber() ~= self:GetCaster():GetTeamNumber() then
			table.insert( self.healedUnits, targets[1] )
			-- Jump
			self:JumpInverse( jumps * self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy"):GetLevelSpecialValueFor("bounce_mult",1), unit, targets[1] )
		else
			table.insert( self.healedUnits, unit )
			-- Jump
			self:Jump( jumps, unit, targets[1] )
		end

		local sound_cast = "Hero_Dazzle.Shadow_Wave"
		EmitSoundOn( sound_cast, caster )
	end
end

--------------------------------------------------------------------------------

function pf_shadow_wave:JumpInverse( jumps, source, target )
	-- Heal
	local effect = ParticleManager:CreateParticle( "particles/pink_circle_no_dust.vpcf", PATTACH_WORLDORIGIN, source )
	ParticleManager:SetParticleControl(effect, 0, source:GetAbsOrigin())
	ParticleManager:SetParticleControl(effect, 1, Vector(self.radius,self.radius,self.radius))
	ParticleManager:ReleaseParticleIndex(effect)

	if source:GetTeamNumber() ~= self:GetCaster():GetTeamNumber() then
		self.damageTable.victim = source
		ApplyDamage( self.damageTable )

		local hWeave = self:GetCaster():FindAbilityByName("dazzle_pf_innate_weave")
		if hWeave then hWeave:ApplyWeave(source) end

		local allies = FindUnitsInRadius(
			self:GetCaster():GetTeamNumber(),	-- int, your team number
			source:GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_FRIENDLY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			DOTA_UNIT_TARGET_FLAG_NONE,	-- int, flag filter
			0,	-- int, order filter
			false	-- bool, can grow cache
		)

		local hWeave = self:GetCaster():FindAbilityByName("dazzle_pf_innate_weave")
		-- Damage
		for _,ally in pairs(allies) do
			if hWeave then hWeave:ApplyWeave(ally) end
			ally:Heal(self.damage / 100 * self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy"):GetLevelSpecialValueFor("heal_mult",1), self)
			ally:GiveMana(self.mana / 100 * self:GetCaster():FindAbilityByName("pf_shadow_wave_enemy"):GetLevelSpecialValueFor("heal_mult",1))

			if self:GetCaster():FindAbilityByName("pf_shadow_wave_dispel") then
				ally:Purge(false, true, false, true, true)
			end
		end
	end

	-- counter
	local jump = jumps-1
	if jump <0 then
		return
	end

	-- next target
	local nextTarget = nil
	if target and target~=source then
		nextTarget = target
	else
		local bounce_range = self.bounce_radius
		-- Find ally nearby
		if self:GetCaster():FindAbilityByName("pf_shadow_wave_dispel") and not self.usedGlobalBounce then
			bounce_range = 9000
			self.usedGlobalBounce = true
		end

		local enemies = FindUnitsInRadius(
			self:GetCaster():GetTeamNumber(),	-- int, your team number
			source:GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			bounce_range,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			0,	-- int, flag filter
			FIND_CLOSEST,	-- int, order filter
			false	-- bool, can grow cache
		)
		
		for _,enemy in pairs(enemies) do
			local pass = false
			for _,unit in pairs(self.healedUnits) do
				if enemy==unit then
					pass = true
				end
			end

			if not pass then
				nextTarget = enemy
				break
			end
		end
	end

	if nextTarget then
		table.insert( self.healedUnits, nextTarget )
		self:JumpInverse( jump, nextTarget )
	end

	-- Play effects
	self:PlayEffects1( source, nextTarget )

end

--------------------------------------------------------------------------------

function pf_shadow_wave:Jump( jumps, source, target )
	-- Heal
	local effect = ParticleManager:CreateParticle( "particles/pink_circle_no_dust.vpcf", PATTACH_WORLDORIGIN, source )
	ParticleManager:SetParticleControl(effect, 0, source:GetAbsOrigin())
	ParticleManager:SetParticleControl(effect, 1, Vector(self.radius,self.radius,self.radius))
	ParticleManager:ReleaseParticleIndex(effect)

	local nAllyFX = ParticleManager:CreateParticle("particles/units/heroes/hero_dazzle/dazzle_shadow_wave_impact_heal.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(nAllyFX, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nAllyFX, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:ReleaseParticleIndex(nAllyFX)

	local hWeave = self:GetCaster():FindAbilityByName("dazzle_pf_innate_weave")
	if hWeave then hWeave:ApplyWeave(source) end

	source:HealWithParams(self.damage, self, false, true, self:GetCaster(), false)
	if source ~= self:GetCaster() then
		source:GiveMana(self.mana)
	end

	if self:GetCaster():FindAbilityByName("pf_shadow_wave_dispel") then
		source:Purge(false, true, false, true, true)
	end

	-- Find enemy nearby
	local enemies = FindUnitsInRadius(
		source:GetTeamNumber(),	-- int, your team number
		source:GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	local hWeave = self:GetCaster():FindAbilityByName("dazzle_pf_innate_weave")
	
	for _,enemy in pairs(enemies) do
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )

		if hWeave then hWeave:ApplyWeave(enemy) end

		local nEnemyFX = ParticleManager:CreateParticle("particles/units/heroes/hero_dazzle/dazzle_shadow_wave_impact_damage.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
		ParticleManager:SetParticleControlEnt(nEnemyFX, 0, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nEnemyFX, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nEnemyFX, 2, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
		ParticleManager:ReleaseParticleIndex(nEnemyFX)
	end

	-- counter
	
	local jump = jumps - 1
	if jump <0 then
		return
	end

	-- next target

	local nextTarget = nil
	if target and target~=source then
		nextTarget = target		
	else
		local bounce_range = self.bounce_radius
		if self:GetCaster():FindAbilityByName("pf_shadow_wave_dispel") and not self.usedGlobalBounce then
			bounce_range = 9000
			self.usedGlobalBounce = true
		end

		-- Find ally nearby
		local allies = FindUnitsInRadius(
			source:GetTeamNumber(),	-- int, your team number
			source:GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			bounce_range,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_FRIENDLY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			0,	-- int, flag filter
			FIND_CLOSEST,	-- int, order filter
			false	-- bool, can grow cache
		)
		
		for _,ally in pairs(allies) do
			local pass = false
			for _,unit in pairs(self.healedUnits) do
				if ally==unit then
					pass = true
				end
			end

			if not pass then
				nextTarget = ally
				break
			end
		end
	end

	if nextTarget then
		table.insert( self.healedUnits, nextTarget )
		self:Jump( jump, nextTarget )
	end

	-- Play effects
	self:PlayEffects1( source, nextTarget )

end

--------------------------------------------------------------------------------
function pf_shadow_wave:PlayEffects1( source, target )
	if not target then
		target = source
	end

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle("particles/units/heroes/hero_dazzle/dazzle_shadow_wave.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		source,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		source:GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		1,
		target,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		target:GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:ReleaseParticleIndex( effect_cast )
	
end

-------
-------
-------
-------
-------

modifier_pf_shadow_wave = class({
    IsHidden    = function() return true end,
    IsPermanent     = function(self) return true end,

    DeclareFunctions    = function(self)
        return {
            MODIFIER_EVENT_ON_ATTACK_LANDED ,            
        }
    end,
})

function modifier_pf_shadow_wave:OnCreated(table)
	self.cooldown = 1.25
	self.isOffCooldown = true
end

function modifier_pf_shadow_wave:OnAttackLanded( params )
	if IsServer() and self:GetParent():FindAbilityByName("pf_shadow_wave_proc") and params.attacker and params.attacker == self:GetParent() and self.isOffCooldown and params.target:HasModifier("modifier_pf_poison_touch") then		local chance = self:GetParent():FindAbilityByName("pf_shadow_wave_proc"):GetLevelSpecialValueFor("chance",1)
		if RollPseudoRandomPercentage( chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_2, self:GetParent() ) == true then
			self.isOffCooldown = false
			Timers(self.cooldown, function()
				self.isOffCooldown = true
			end)
			self:GetAbility():CastFromUnit(self:GetCaster())
			
			if self:GetCaster():HasModifier("modifier_pf_bad_juju_passive") then
				keys = {
					unit = self:GetCaster(),
					ability = self:GetAbility()
				}
				self:GetCaster():FindModifierByName("modifier_pf_bad_juju_passive"):OnAbilityFullyCast(keys)
			end
		end
	end
end

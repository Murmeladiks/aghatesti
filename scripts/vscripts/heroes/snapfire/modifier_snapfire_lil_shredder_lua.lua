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
--------------------------------------------------------------------------------
modifier_snapfire_lil_shredder_lua = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_snapfire_lil_shredder_lua:IsHidden()
	return false
end

function modifier_snapfire_lil_shredder_lua:IsDebuff()
	return false
end

function modifier_snapfire_lil_shredder_lua:IsStunDebuff()
	return false
end

function modifier_snapfire_lil_shredder_lua:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_snapfire_lil_shredder_lua:OnCreated( kv )
	-- references
    self.attacks = self:GetAbility():GetSpecialValueFor( "buffed_attacks" )
    self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
    self.as_bonus = self:GetAbility():GetSpecialValueFor( "attack_speed_bonus" )
    self.range_bonus = self:GetAbility():GetSpecialValueFor( "attack_range_bonus" )
    self.bat = self:GetAbility():GetSpecialValueFor( "base_attack_time" )
	self.slow = self:GetAbility():GetSpecialValueFor( "slow_duration" )
    self.armor_reduction = self:GetAbility():GetSpecialValueFor( "armor_reduction_per_attack" ) -- Added
    self.armor_duration = self:GetAbility():GetSpecialValueFor( "armor_duration" )   -- Added

    self.records = {} -- Added to prevent nil table errors

    if not IsServer() then return end

	-- Check if the hero has the shard upgrade
    local upgrade_ability = self:GetParent():FindAbilityByName("aghsfort_special_snapfire_lil_shredder_upgrade")
    if upgrade_ability then
		print("Snapfire has the shard upgrade")
        -- Apply the bonus values from the linked special bonus fields
        local armor_reduction_bonus = upgrade_ability:GetSpecialValueFor("armor_reduction_per_attack")
        local armor_duration_bonus = upgrade_ability:GetSpecialValueFor("armor_duration")
		
		print("Shard Armor Reduction Bonus:", armor_reduction_bonus)
	    print("Shard Armor Duration Bonus:", armor_duration_bonus)

        -- Apply the bonuses from the shard upgrade
        self.armor_reduction = self.armor_reduction + armor_reduction_bonus
        self.armor_duration = self.armor_duration + armor_duration_bonus
		print("Armor Reduction:", self.armor_reduction)
	    print("Armor Duration:", self.armor_duration)
    end


    self:SetStackCount( self.attacks )

    -- play Effects & Sound
    self:PlayEffects()
    local sound_cast = "Hero_Snapfire.ExplosiveShells.Cast"
    EmitSoundOn( sound_cast, self:GetParent() )
end

function modifier_snapfire_lil_shredder_lua:OnRefresh( kv )
	-- references
	self.attacks = self:GetAbility():GetSpecialValueFor( "buffed_attacks" )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self.as_bonus = self:GetAbility():GetSpecialValueFor( "attack_speed_bonus" )
	self.range_bonus = self:GetAbility():GetSpecialValueFor( "attack_range_bonus" )
	self.bat = self:GetAbility():GetSpecialValueFor( "base_attack_time" )

	self.slow = self:GetAbility():GetSpecialValueFor( "slow_duration" )

	if not IsServer() then return end
	self:SetStackCount( self.attacks )

	-- play sound
	local sound_cast = "Hero_Snapfire.ExplosiveShells.Cast"
	EmitSoundOn( sound_cast, self:GetParent() )
end

function modifier_snapfire_lil_shredder_lua:OnRemoved()
end

function modifier_snapfire_lil_shredder_lua:OnDestroy()
	if not IsServer() then return end

	-- stop sound
	local sound_cast = "Hero_Snapfire.ExplosiveShells.Cast"
	StopSoundOn( sound_cast, self:GetParent() )
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_snapfire_lil_shredder_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_EVENT_ON_ATTACK_RECORD_DESTROY,

		MODIFIER_PROPERTY_PROJECTILE_NAME,
		MODIFIER_PROPERTY_OVERRIDE_ATTACK_DAMAGE,
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_BASE_ATTACK_TIME_CONSTANT,
	}

	return funcs
end

function modifier_snapfire_lil_shredder_lua:OnAttack( params )
	if params.attacker~=self:GetParent() then return end
	if self:GetStackCount()<=0 then return end

	-- record attack
	self.records[params.record] = true

	-- play sound
	local sound_cast = "Hero_Snapfire.ExplosiveShellsBuff.Attack"
	EmitSoundOn( sound_cast, self:GetParent() )

	-- decrement stack
	if self:GetStackCount()>0 then
		self:DecrementStackCount()
	end
end

function modifier_snapfire_lil_shredder_lua:OnAttackLanded( params )
	if self.records[params.record] then
		local target = params.target
		local parent = self:GetParent()
		local ability = self:GetAbility()

		-- Apply slow
		target:AddNewModifier(
			parent,
			ability,
			"modifier_snapfire_lil_shredder_lua_debuff",
			{ duration = self.slow }
		)

		-- Apply armor reduction
		target:AddNewModifier(
			parent,
			ability,
			"modifier_snapfire_lil_shredder_lua_armor_reduction",
			{ duration = self.armor_duration, armor_reduction = self.armor_reduction }
		)
	end

	-- Play sound
	local sound_cast = "Hero_Snapfire.ExplosiveShellsBuff.Target"
	EmitSoundOn( sound_cast, params.target )
end


function modifier_snapfire_lil_shredder_lua:OnAttackRecordDestroy( params )
	if self.records[params.record] then
		self.records[params.record] = nil

		-- if table is empty and no stack left, destroy
		if next(self.records)==nil and self:GetStackCount()<=0 then
			self:Destroy()
		end
	end
end

function modifier_snapfire_lil_shredder_lua:GetModifierProjectileName()
	if self:GetStackCount()<=0 then return end
	return "particles/units/heroes/hero_snapfire/hero_snapfire_shells_projectile.vpcf"
end

function modifier_snapfire_lil_shredder_lua:GetModifierOverrideAttackDamage()
	if self:GetStackCount()<=0 then return end
	return self.damage
end

function modifier_snapfire_lil_shredder_lua:GetModifierAttackRangeBonus()
	if self:GetStackCount()<=0 then return end
	return self.range_bonus
end

function modifier_snapfire_lil_shredder_lua:GetModifierAttackSpeedBonus_Constant()
	if self:GetStackCount()<=0 then return end
	return self.as_bonus
end

function modifier_snapfire_lil_shredder_lua:GetModifierBaseAttackTimeConstant()
	if self:GetStackCount()<=0 then return end
	return self.bat
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_snapfire_lil_shredder_lua:PlayEffects()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_snapfire/hero_snapfire_shells_buff.vpcf"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		3,
		self:GetParent(),
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		4,
		self:GetParent(),
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		5,
		self:GetParent(),
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)

	-- buff particle
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)
end


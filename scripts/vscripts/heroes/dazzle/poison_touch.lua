LinkLuaModifier("modifier_pf_poison_touch", 				"heroes/dazzle/poison_touch", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_dazzle_pf_poison_touch_counter", 	"heroes/dazzle/poison_touch", LUA_MODIFIER_MOTION_NONE)

-----------------------------------------------------------------------------------

pf_poison_touch = class({})

-----------------------------------------------------------------------------------

function pf_poison_touch:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_poison_touch.vpcf", context)
	PrecacheResource("particle", "particles/dazzle_poison_projectile.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_poison_debuff.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_poison_dazzle_copy.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_poison_touch_split_counter.vpcf", context)
end

-----------------------------------------------------------------------------------

function pf_poison_touch:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor( "end_distance" ) - 100
end

-----------------------------------------------------------------------------------

function pf_poison_touch:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local origin = caster:GetOrigin()

	if target:TriggerSpellAbsorb( self ) then return end

	-- load data
	local max_targets = self:GetSpecialValueFor( "targets" )
	local distance = self:GetSpecialValueFor( "end_distance" )
	local start_radius = self:GetSpecialValueFor( "start_radius" )
	local end_radius = self:GetSpecialValueFor( "end_radius" )
	self.max_stack = self:GetSpecialValueFor( "max_stack" )

	-- get direction
	local direction = target:GetOrigin()-origin
	direction.z = 0
	direction = direction:Normalized()

	local enemies = self:FindUnitsInCone(
		caster:GetTeamNumber(),	-- nTeamNumber
		target:GetOrigin(),	-- vCenterPos
		caster:GetOrigin(),	-- vStartPos
		caster:GetOrigin() + direction*distance,	-- vEndPos
		start_radius,	-- fStartRadius
		end_radius,	-- fEndRadius
		nil,	-- hCacheUnit
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- nTeamFilter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- nTypeFilter
		0,	-- nFlagFilter
		FIND_CLOSEST,	-- nOrderFilter
		false	-- bCanGrowCache
	)

	-- projectile data
	local projectile_name = "particles/units/heroes/hero_dazzle/dazzle_poison_touch.vpcf"
	local projectile_speed = self:GetSpecialValueFor( "projectile_speed" )

	-- precache projectile
	local info = {
		-- Target = target,
		Source = caster,
		Ability = self,	
		
		EffectName = projectile_name,
		iMoveSpeed = projectile_speed,
		bDodgeable = true,                           -- Optional
	
		bVisibleToEnemies = true,                         -- Optional
		bProvidesVision = false,                           -- Optional

		ExtraData = nil
	}

	if self:GetCaster():FindAbilityByName("pf_poison_touch_chain") then
		info.EffectName = "particles/dazzle_poison_projectile.vpcf"
		info.ExtraData = { bounce = max_targets }
		info.Target = target
		info.iMoveSpeed = info.iMoveSpeed * 0.75
		info.bDodgeable = false
		ProjectileManager:CreateTrackingProjectile(info)
	else
		-- create projectile
		local counter = 0
		for _,enemy in pairs(enemies) do
			info.Target = enemy
			ProjectileManager:CreateTrackingProjectile(info)

			counter = counter+1
			if counter>=max_targets then break end
		end
	end

	-- Play effects
	local sound_cast = "Hero_Dazzle.Poison_Cast"
	EmitSoundOn( sound_cast, caster )
end

-----------------------------------------------------------------------------------

function pf_poison_touch:OnProjectileHit_ExtraData(hTarget, vLocation, data)
	if data == nil or hTarget == nil or not self:GetCaster():FindAbilityByName("pf_poison_touch_chain") then
		return true
	end	

	local int_dmg = self:GetCaster():FindAbilityByName("pf_poison_touch_chain"):GetLevelSpecialValueFor("int_dmg",1)
	local splash_pct = self:GetCaster():FindAbilityByName("pf_poison_touch_chain"):GetLevelSpecialValueFor("splash_percent",1)
	local splash_radius = self:GetCaster():FindAbilityByName("pf_poison_touch_chain"):GetLevelSpecialValueFor("splash_radius",1)

	local damage = self:GetCaster():GetIntellect(false) / 100 * int_dmg
	local splash = damage / 100 * splash_pct

	local damageTable = {
		victim = hTarget,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self, --Optional.
	}
	ApplyDamage( damageTable )
	EmitSoundOn("Hero_Venomancer.VenomousGaleImpact", hTarget)

	local splash_targets = FindUnitsInRadius(self:GetCaster():GetTeamNumber(),
				hTarget:GetAbsOrigin(),
				nil,
				splash_radius,
				DOTA_UNIT_TARGET_TEAM_ENEMY,
				DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
				DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
				FIND_ANY_ORDER,
				false)
	for _,splashed in pairs(splash_targets) do
		if splashed ~= hTarget then
			damageTable.damage = splash
			damageTable.victim = splashed
			ApplyDamage( damageTable )

			splashed:AddNewModifier(
				self:GetCaster(), -- player source
				self, -- ability source
				"modifier_pf_poison_touch", -- modifier name
				{ duration = self:GetSpecialValueFor( "duration" ) } -- kv
			)
		end
	end
	
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(),
				hTarget:GetAbsOrigin(),
				nil,
				self:GetSpecialValueFor( "end_distance" ) * 0.75,
				DOTA_UNIT_TARGET_TEAM_ENEMY,
				DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
				DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
				FIND_ANY_ORDER,
				false)

	if #enemies > 1 and data.bounce and data.bounce > 0 then
		local i = 1		
		while enemies[i] == hTarget do
			i = i + 1			
		end
		local dest = enemies[i]

	--print(data.bounce)
	
		local info = {
			Target = dest,
			Source = hTarget,
			Ability = self,	
			
			EffectName = "particles/dazzle_poison_projectile.vpcf",
			iMoveSpeed = self:GetSpecialValueFor( "projectile_speed" ) * 0.75,
			bDodgeable = false,                           -- Optional
			iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
			bVisibleToEnemies = true,                         -- Optional
			bProvidesVision = false,                           -- Optional DOTA_PROJECTILE_ATTACHMENT_HITLOCATION

			ExtraData = { bounce = data.bounce - 1}
		}
		ProjectileManager:CreateTrackingProjectile(info)
	end
	return true
end

-----------------------------------------------------------------------------------

function pf_poison_touch:OnProjectileHit(hTarget, vLocation)
	if not hTarget or hTarget:IsNull() then return end

	local hCaster = self:GetCaster()

	local hPoisonModifier = hTarget:FindModifierByName("modifier_pf_poison_touch")
	if hPoisonModifier and hPoisonModifier:GetStackCount() < self.max_stack then
		hPoisonModifier:IncrementStackCount()

		if hCaster:HasShard("pf_poison_touch_chain") then
			hPoisonModifier:IncrementStackCount()
		end
	end

	hTarget:AddNewModifier(hCaster, self, "modifier_pf_poison_touch", {duration = self:GetSpecialValueFor("duration")})
	hTarget:EmitSound("Hero_Dazzle.Poison_Touch")

	local hWeave = hCaster:FindAbilityByName("dazzle_pf_innate_weave")
	if hWeave then hWeave:ApplyWeave(hTarget) end
end

-----------------------------------------------------------------------------------

function pf_poison_touch:FindUnitsInCone( nTeamNumber, vCenterPos, vStartPos, vEndPos, fStartRadius, fEndRadius, hCacheUnit, nTeamFilter, nTypeFilter, nFlagFilter, nOrderFilter, bCanGrowCache )
	-- vCenterPos is used to determine searching center (FIND_CLOSEST will refer to units closest to vCenterPos)

	-- get cast direction and length distance
	local direction = vEndPos-vStartPos
	direction.z = 0

	local distance = direction:Length2D()
	direction = direction:Normalized()

	-- get max radius circle search
	local big_radius = distance + math.max(fStartRadius, fEndRadius)

	-- find enemies closest to primary target within max radius
	local units = FindUnitsInRadius(
		nTeamNumber,	-- int, your team number
		vCenterPos,	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		big_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		nTeamFilter,	-- int, team filter
		nTypeFilter,	-- int, type filter
		nFlagFilter,	-- int, flag filter
		nOrderFilter,	-- int, order filter
		bCanGrowCache	-- bool, can grow cache
	)

	-- Filter within cone
	local targets = {}
	for _,unit in pairs(units) do

		-- get unit vector relative to vStartPos
		local vUnitPos = unit:GetOrigin()-vStartPos

		-- get projection scalar of vUnitPos onto direction using dot-product
		local fProjection = vUnitPos.x*direction.x + vUnitPos.y*direction.y + vUnitPos.z*direction.z

		-- clamp projected scalar to [0,distance]
		fProjection = math.max(math.min(fProjection,distance),0)
		
		-- get projected vector of vUnitPos onto direction
		local vProjection = direction*fProjection

		-- calculate distance between vUnitPos and the projected vector
		local fUnitRadius = (vUnitPos - vProjection):Length2D()

		-- calculate interpolated search radius at projected vector
		local fInterpRadius = (fProjection/distance)*(fEndRadius-fStartRadius) + fStartRadius

		-- if unit is within distance, add them
		if fUnitRadius<=fInterpRadius then
			table.insert( targets, unit )
		end
	end

	return targets
end

function pf_poison_touch:Spread( source, radius, count )
	if not source then return end

	local enemies = FindUnitsInRadius(
		source:GetTeamNumber(),	-- int, your team number
		source:GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_FRIENDLY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES,	-- int, flag filter
		FIND_ANY_ORDER,	-- int, order filter
		false	-- bool, can grow cache
	)

	-- precache projectile
	local info = {
		-- Target = target,
		Source = source,
		Ability = self,	
		
		EffectName = "particles/units/heroes/hero_dazzle/dazzle_poison_touch.vpcf",
		iMoveSpeed = self:GetSpecialValueFor( "projectile_speed" ),
		bDodgeable = true,                           -- Optional

		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
	
		bVisibleToEnemies = true,                         -- Optional
		bProvidesVision = false,                           -- Optional
	}

	local counter = 0
	for _,enemy in pairs(enemies) do
		if enemy ~= source then
			info.Target = enemy
			ProjectileManager:CreateTrackingProjectile(info)
			counter = counter+1
		end
		if counter>=count then break end
	end
end

-----------------------------------------------------------------------------------

modifier_pf_poison_touch = class({})

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:OnCreated( kv )
	local hAbility = self:GetAbility()

	self.nSlow = -hAbility:GetSpecialValueFor( "slow" )

	if IsClient() then return end

	self.nDamage = hAbility:GetSpecialValueFor("damage")
	self.bSplitFacet = hAbility:GetSpecialValueFor("split_radius") > 0

	self.duration = kv.duration

	self.tDamageTable = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = self.nDamage,
		damage_type = self:GetAbility():GetAbilityDamageType(),
		ability = self,
	}

	self:OnIntervalThink()
	self:StartIntervalThink(1)
	self:SetStackCount(1)
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:OnIntervalThink()
	self.tDamageTable.damage = self.nDamage * self:GetStackCount()
	ApplyDamage(self.tDamageTable)

	self:GetParent():EmitSound("Hero_Dazzle.Poison_Tick")
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_EVENT_ON_DEATH
	}
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:GetModifierMoveSpeedBonus_Percentage()
	return self.nSlow
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:OnAttackLanded(event)
	if IsClient() or event.target ~= self:GetParent() or event.attacker ~= self:GetCaster() then return end

	local hAbility = self:GetAbility()
	local hCaster = event.attacker

	self:SetDuration(self.duration, true)

	if self.bSplitFacet then
		event.target:AddNewModifier(hCaster, hAbility, "modifier_dazzle_pf_poison_touch_counter", {duration = self:GetDuration()})
	end
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:OnDeath( params )
	if IsClient() or params.unit ~= self:GetParent() then return end

	if self:GetCaster():FindAbilityByName("pf_poison_touch_ward") and self:GetCaster():FindAbilityByName("pf_shadow_wave"):IsTrained() then
		local chance = self:GetCaster():FindAbilityByName("pf_poison_touch_ward"):GetLevelSpecialValueFor("chance",1)
		local pulse = self:GetCaster():FindAbilityByName("pf_poison_touch_ward"):GetLevelSpecialValueFor("pulse",1)		

		if RollPseudoRandomPercentage( chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, self:GetCaster() ) == true then
			local ward = CreateUnitByName("pathfinder_dazzle_ward", self:GetParent():GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS)

			ward:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_kill", {duration = 3.5})
			ward:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_phased", {})
			ward:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_invulnerable", {})

			local caster = self:GetCaster()
			
			for i=1,pulse do
				Timers(1.5 * i, function()
					caster:FindAbilityByName("pf_shadow_wave"):CastFromUnit(ward)
				end)
			end
		end
	end
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:GetEffectName()
	return "particles/units/heroes/hero_dazzle/dazzle_poison_debuff.vpcf"
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:GetStatusEffectName()
	return "particles/status_fx/status_effect_poison_dazzle_copy.vpcf"
end

-----------------------------------------------------------------------------------

function modifier_pf_poison_touch:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

-----------------------------------------------------------------------------------

modifier_dazzle_pf_poison_touch_counter = class({})

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_poison_touch_counter:IsHidden()	return true end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_poison_touch_counter:OnCreated()
	if IsClient() then
		self.nCounterFX = ParticleManager:CreateParticle("particles/units/heroes/hero_dazzle/dazzle_poison_touch_split_counter.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
		ParticleManager:SetParticleControl(self.nCounterFX, 1, Vector(0, 1, 0))
		self:AddParticle(self.nCounterFX, false, false, -1, false, true)
		return
	end

	local hAbility = self:GetAbility()

	self.nProcStacks = hAbility:GetSpecialValueFor("attacks_to_split")
	self:SetStackCount(1)
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_poison_touch_counter:OnRefresh()
	if IsClient() then return end
	self:IncrementStackCount()
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_poison_touch_counter:OnStackCountChanged(iStackCount)
	if IsServer() then
		if self:GetStackCount() >= self.nProcStacks then
			local hAbility = self:GetAbility()

			ApplyDamage({
				attacker = self:GetCaster(),
				victim = self:GetParent(),
				damage = hAbility:GetSpecialValueFor("split_damage"),
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = hAbility
			})

			hAbility:Spread(self:GetParent(), hAbility:GetSpecialValueFor("split_radius"), hAbility:GetSpecialValueFor("targets"))
			self:Destroy()
		end

		return
	end

	ParticleManager:SetParticleControl(self.nCounterFX, 1, Vector(0, self:GetStackCount(), 0))
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_poison_touch_counter:ShouldUseOverheadOffset()
	return self:GetStackCount() > 0
end
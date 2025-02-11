LinkLuaModifier( "modifier_aghsfort_phoenix_fire_spirits", 			"abilities/creatures/aghsfort_phoenix_fire_spirits", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------

if aghsfort_phoenix_fire_spirits == nil then aghsfort_phoenix_fire_spirits = class({}) end

----------------------------------------------------------------------------------------

function aghsfort_phoenix_fire_spirits:Precache( context )
	PrecacheResource( "particle", "particles/creatures/phoenix/aghsfort_phoenix_fire_spirit_launch.vpcf", context )
	PrecacheResource( "particle", "particles/creatures/phoenix/aghsfort_phoenix_fire_spirit_ground.vpcf", context )
	PrecacheResource( "particle", "particles/creatures/phoenix/aghsfort_phoenix_fire_spirit_burn.vpcf", context )
end

--------------------------------------------------------------------------

function aghsfort_phoenix_fire_spirits:OnSpellStart()
	local caster = self:GetCaster()
	local position = GetGroundPosition(self:GetCursorPosition(), nil) 
	local origin = caster:GetAttachmentOrigin( caster:ScriptLookupAttachment( "attach_mouth" ) )
	local speed = self:GetSpecialValueFor("spirit_speed")

	local direction = position - origin


	local launch_fx = ParticleManager:CreateParticle("particles/creatures/phoenix/aghsfort_phoenix_fire_spirit_launch.vpcf", PATTACH_WORLDORIGIN, nil)
	ParticleManager:SetParticleControl(launch_fx, 0, origin)
	ParticleManager:SetParticleControl(launch_fx, 1, direction:Normalized() * speed)

	direction.z = 0
	direction = direction:Normalized()
	
	ProjectileManager:CreateLinearProjectile({
		EffectName = "",
		Ability = self,
		vSpawnOrigin = origin, 
		vVelocity = direction * speed,
		fDistance = (position - origin):Length2D(),
		Source = self:GetCaster(),
		flExpireTime = GameRules:GetGameTime() + 10,
		ExtraData = {
			fx = launch_fx
		}
	})

	caster:EmitSound("Hero_Phoenix.FireSpirits.Launch")
end

--------------------------------------------------------------------------

function aghsfort_phoenix_fire_spirits:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not self or self:IsNull() then return end
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("duration")

	local enemies = FindUnitsInRadius(caster:GetTeamNumber(), vLocation, nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	
	for _, enemy in pairs(enemies) do
		enemy:AddNewModifier(caster, self, "modifier_aghsfort_phoenix_fire_spirits", {duration = duration})
		enemy:EmitSound("Hero_Phoenix.FireSpirits.Target")
	end

	local launch_fx = ExtraData.fx

	if launch_fx then
		ParticleManager:DestroyParticle(launch_fx, false)
		ParticleManager:ReleaseParticleIndex(launch_fx)
	end

	EmitSoundOnLocationWithCaster(vLocation, "Hero_Phoenix.FireSpirits.ProjectileHit", caster)
	local ground_fx = ParticleManager:CreateParticle("particles/creatures/phoenix/aghsfort_phoenix_fire_spirit_ground.vpcf", PATTACH_WORLDORIGIN, nil)
	ParticleManager:SetParticleControl(ground_fx, 0, vLocation)
	ParticleManager:SetParticleControl(ground_fx, 1, Vector(self:GetSpecialValueFor("radius"), 0, 0))
	ParticleManager:ReleaseParticleIndex(ground_fx)
end

--------------------------------------------------------------------------

if modifier_aghsfort_phoenix_fire_spirits == nil then modifier_aghsfort_phoenix_fire_spirits = class({}) end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:OnCreated()
	local ability = self:GetAbility()

	if not ability then self:Destroy() return end

	self.attack_speed_slow = ability:GetSpecialValueFor("attackspeed_slow")
	self.damage = ability:GetSpecialValueFor("damage_per_second")

	if IsClient() then return end
	local interval = ability:GetSpecialValueFor("tick_interval")

	self.damage_table = {
		attacker = self:GetCaster(),
		victim = self:GetParent(),
		damage = self.damage * interval,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = ability
	}

	self:StartIntervalThink(interval)
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:OnIntervalThink()
	ApplyDamage(self.damage_table)
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:DeclareFunctions()
	return {MODIFIER_PROPERTY_TOOLTIP, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:GetModifierAttackSpeedBonus_Constant()
	return self.attack_speed_slow
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:OnTooltip()
	return self.damage
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:GetEffectName()
	return "particles/creatures/phoenix/aghsfort_phoenix_fire_spirit_burn.vpcf"
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_fire_spirits:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
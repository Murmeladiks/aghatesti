LinkLuaModifier("modifier_sniper_pf_headshot", 					"heroes/sniper/sniper_pf_headshot", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_headshot_slow", 			"heroes/sniper/sniper_pf_headshot", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_headshot_armor_reduction",	"heroes/sniper/sniper_pf_headshot", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

sniper_pf_headshot = class({})

--------------------------------------------------------------------------------

function sniper_pf_headshot:Precache( context )
    PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_headshot_slow.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_headshot_slow_caster.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shrapnel_shotgun.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_snapfire/hero_snapfire_shotgun_impact.vpcf", context)
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetIntrinsicModifierName()
    return "modifier_sniper_pf_headshot"
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetBehavior()
	if self:GetCaster():HasShard("aghsfort_special_sniper_headshot_shotgun") then
		return DOTA_ABILITY_BEHAVIOR_POINT
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetCastRange(vLocation, hTarget)
	if self:GetCaster():HasShard("aghsfort_special_sniper_headshot_shotgun") then
		return self:GetCaster():FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "distance")
	end

	return 0
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetManaCost(iLevel)
	if self:GetCaster():HasShard("aghsfort_special_sniper_headshot_shotgun") then
		return self:GetCaster():FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "mana_cost")
	end

	return 0
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetCooldown(iLevel)
	if self:GetCaster():HasShard("aghsfort_special_sniper_headshot_shotgun") then
		return self:GetCaster():FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "cooldown")
	end

	return 0
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetCastPoint()
	if self:GetCaster():HasShard("aghsfort_special_sniper_headshot_shotgun") then
		return 0.2
	end

	return 0
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:GetCastAnimation()
	return ACT_DOTA_ATTACK
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:OnAbilityPhaseStart()
	if IsServer() then
		self:GetCaster():EmitSound("Hero_Sniper.Shotgun.Load")
	end

	return true
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:OnAbilityPhaseInterrupted()
	if IsServer() then
		self:GetCaster():StopSound("Hero_Sniper.Shotgun.Load")
	end
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPosition = self:GetCursorPosition()
	local vOrigin = hCaster:GetOrigin()

	local vDirection = vPosition - vOrigin
	vDirection.z = 0
	vDirection = vDirection:Normalized()	

	ProjectileManager:CreateLinearProjectile({
		Source = hCaster,
		Ability = self,
		vSpawnOrigin = vOrigin,
		
	    bDeleteOnHit = false,
	    
	    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	    
	    EffectName = "particles/units/heroes/hero_sniper/sniper_shrapnel_shotgun.vpcf",
	    fDistance = self:GetEffectiveCastRange(vPosition, hCaster) - hCaster:FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "end_radius") * 0.4,
	    fStartRadius = hCaster:FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "start_radius") * 0.25,
	    fEndRadius = hCaster:FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "end_radius") * 0.5,
		vVelocity = vDirection * hCaster:FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "blast_speed"),
		bHasFrontalCone = true,
	
		bProvidesVision = false,
		ExtraData = {
			X = vOrigin.x,
			Y = vOrigin.y,
		}
	})

	EmitSoundOn("Hero_Sniper.Shotgun.Fire", hCaster)
end

--------------------------------------------------------------------------------

function sniper_pf_headshot:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not hTarget then return true end

	local hCaster = self:GetCaster()
	local vOrigin = Vector(ExtraData.X, ExtraData.Y, 0)
	local nHeadshotMultiplier = hCaster:FindTalentValue("aghsfort_special_sniper_headshot_shotgun", "headshot_multiplier")
	local nKnockbackDistance = self:GetSpecialValueFor("knockback_distance") * nHeadshotMultiplier
	local nDuration = self:GetSpecialValueFor("slow_duration") * nHeadshotMultiplier
	local hModifier = hCaster:FindModifierByName(self:GetIntrinsicModifierName())

	hModifier.bSilent = true
	hCaster:PerformAttack(hTarget, false, true, true, true, false, false, true)
	hModifier.bSilent = false
	hTarget:AddNewModifier(hCaster, self, "modifier_sniper_pf_headshot_slow", {duration = nDuration * (1 - hTarget:GetStatusResistance())})

	if not hTarget:IsCurrentlyVerticalMotionControlled() then
		if hTarget:HasModifier("modifier_knockback") then
			hTarget:RemoveModifierByName("modifier_knockback")
		end
		
		hTarget:AddNewModifier(
			hCaster, 
			self, 
			"modifier_knockback", 
			{
				center_x = vOrigin.x,
				center_y = vOrigin.y,
				center_z = vOrigin.z,
				should_stun = false, 
				duration = 0.2,
				knockback_duration = 0.2,
				knockback_distance = nKnockbackDistance,
				knockback_height = 0,
			}
		)
	end

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_snapfire/hero_snapfire_shotgun_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
	)

	hTarget:EmitSound("Hero_Sniper.Shotgun.Target")
end

--------------------------------------------------------------------------------

modifier_sniper_pf_headshot = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot:IsPurgable()	return false end
function modifier_sniper_pf_headshot:IsHidden()		return true end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot:OnCreated(kv)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nDuration = hAbility:GetSpecialValueFor("slow_duration")

	if IsClient() then return end

	if hParent:IsIllusion() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND
	}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot:GetAttackSound()
	if self.bSilent then return "" end
end

function modifier_sniper_pf_headshot:OnAttack(event)
	if IsClient() then return end
	if event.attacker ~= self:GetParent() or not self:GetParent():HasShard("aghsfort_special_sniper_headshot_assassinate") then return end

	local hAttacker = event.attacker
	local hTarget = event.target
	local hAbility = self:GetAbility()

	if hAttacker:PassivesDisabled() or not hTarget or hTarget:IsBuilding() or hTarget:IsOther() then
		return 0
	end

	local hShard = hAttacker:FindAbilityByName("aghsfort_special_sniper_headshot_assassinate")
	local nChance = hAbility:GetSpecialValueFor("proc_chance") * hShard:GetSpecialValueFor("chance_mod") / 100

	if hAttacker:HasModifier("modifier_sniper_pf_take_aim_bonus") then nChance = 100 * hShard:GetSpecialValueFor("chance_mod") / 100 end

	if not RollPseudoRandomPercentage(nChance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, hAttacker) then
		return 0
	end

	local hAssassinate = hAttacker:FindAbilityByName("sniper_pf_assassinate")

	if not hAssassinate:IsTrained() then return end

	hAssassinate:Fire(hTarget, hShard:GetSpecialValueFor("assassinate_pct"))
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot:GetModifierProcAttack_BonusDamage_Physical(params)
	if IsClient() then return 0 end

	local hAttacker = params.attacker
	local hTarget = params.target
	local hAbility = self:GetAbility()

	if hAttacker ~= self:GetParent() or hAttacker:PassivesDisabled() or not hTarget or hTarget:IsBuilding() or hTarget:IsOther() then
		return 0
	end
	
	if not hAttacker:HasModifier("modifier_sniper_pf_take_aim_bonus") and not RollPseudoRandomPercentage(hAbility:GetSpecialValueFor("proc_chance"), DOTA_PSEUDO_RANDOM_SNIPER_HEADSHOT, hAttacker) then
		return 0
	end

	hTarget:AddNewModifier(hAttacker, hAbility, "modifier_sniper_pf_headshot_slow", {duration = self.nDuration * (1 - hTarget:GetStatusResistance())})

	if not hTarget:IsCurrentlyHorizontalMotionControlled() and not hTarget:IsCurrentlyVerticalMotionControlled() then
		local vOrigin = hAttacker:GetOrigin()

		hTarget:AddNewModifier(
			hAttacker, 
			hAbility, 
			"modifier_knockback", 
			{
				center_x = vOrigin.x,
				center_y = vOrigin.y,
				center_z = vOrigin.z,
				should_stun = false, 
				duration = 0.1,
				knockback_duration = 0.1,
				knockback_distance = hAbility:GetSpecialValueFor("knockback_distance"),
				knockback_height = 0,
			}
		)
	end

	local nHeadshotCasterFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_headshot_slow_caster.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker)
	ParticleManager:SetParticleControlEnt(nHeadshotCasterFX, 0, hAttacker, PATTACH_POINT_FOLLOW, "attach_hitloc", hAttacker:GetAbsOrigin(), true)
	ParticleManager:SetParticleControlEnt(nHeadshotCasterFX, 1, hAttacker, PATTACH_POINT_FOLLOW, "attach_hitloc", hAttacker:GetAbsOrigin(), true)
	ParticleManager:ReleaseParticleIndex(nHeadshotCasterFX)

	hTarget:EmitSound("Hero_Sniper.Headshot")


	if hAttacker:HasShard("aghsfort_special_sniper_headshot_armor_reduction") then
		hTarget:AddNewModifier(hAttacker, hAbility, "modifier_sniper_pf_headshot_armor_reduction", {duration = hAttacker:FindTalentValue("aghsfort_special_sniper_headshot_armor_reduction", "debuff_duration") * (1 - hTarget:GetTrueStatusResistance())})
	end

	return hAbility:GetSpecialValueFor("damage")
end

--------------------------------------------------------------------------------

modifier_sniper_pf_headshot_slow = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_slow:OnCreated()
	local hAbility = self:GetAbility()

	self.nSlow = self:GetParent():IsConsideredHero() and hAbility:GetSpecialValueFor("slow_vs_considered_hero") or hAbility:GetSpecialValueFor("slow")
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_slow:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nSlow
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_slow:GetModifierAttackSpeedBonus_Constant()
	return self.nSlow
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_slow:GetEffectName()
	return "particles/units/heroes/hero_sniper/sniper_headshot_slow.vpcf"
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_slow:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

modifier_sniper_pf_headshot_armor_reduction = class({})

function modifier_sniper_pf_headshot_armor_reduction:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_armor_reduction:OnCreated()
	local hAbility = self:GetAbility()

	self.nArmorReduction = -self:GetCaster():FindTalentValue("aghsfort_special_sniper_headshot_armor_reduction", "armor_reduction")
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_armor_reduction:DeclareFunctions()
	return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_headshot_armor_reduction:GetModifierPhysicalArmorBonus()
	return self.nArmorReduction
end
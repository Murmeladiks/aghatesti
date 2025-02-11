LinkLuaModifier("modifier_queenofpain_pf_shadow_strike", 		"heroes/queenofpain/queenofpain_pf_shadow_strike", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_queenofpain_pf_shadow_strike_attack", "heroes/queenofpain/queenofpain_pf_shadow_strike", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

queenofpain_pf_shadow_strike = class({})

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_shadow_strike.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_shadow_strike_debuff.vpcf", context )
end

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:Spawn()
	if IsClient() then return end
	self.Shadow_Projectiles = {}
end

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:GetIntrinsicModifierName()
	return "modifier_queenofpain_pf_shadow_strike_attack"
end

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:OnSpellStart()
	local hCaster = self:GetCaster()
	local nBounces = 0

	if hCaster:HasShard("aghsfort_special_queenofpain_shadow_strike_chain") then
		nBounces = hCaster:FindTalentValue("aghsfort_special_queenofpain_shadow_strike_chain", "value")
	end

	self:ShadowStrike(hCaster, self:GetCursorTarget(), nBounces, {})
end

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:ShadowStrike(hCastOrigin, hTarget, nBounces, hHits, nSpeed)
	self.Shadow_Projectiles = self.Shadow_Projectiles or {}
	local hCaster = self:GetCaster()

	local nProjectileID = ProjectileManager:CreateTrackingProjectile({
		Target = hTarget,
		Source = hCastOrigin,
		Ability = self,	
		EffectName = "particles/units/heroes/hero_queenofpain/queen_shadow_strike.vpcf",
		iMoveSpeed = nSpeed or self:GetSpecialValueFor( "projectile_speed" ),
		bReplaceExisting = false,
		bProvidesVision = false,
	})

	self.Shadow_Projectiles[nProjectileID] = {
		nBounces = nBounces,
		hHits = hHits
	}
	
	hCastOrigin:EmitSound("Hero_QueenOfPain.ShadowStrike")
end

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:OnProjectileHitHandle(hTarget, vLocation, iProjectileHandle)
	if not hTarget or hTarget:TriggerSpellAbsorb(self) then return end
	local hCaster = self:GetCaster()
	
	self.Shadow_Projectiles[iProjectileHandle]["hHits"][hTarget:entindex()] = true
	
	hTarget:AddNewModifier(self:GetCaster(), self, "modifier_queenofpain_pf_shadow_strike", {duration = self:GetSpecialValueFor("duration")})
	hTarget:EmitSound("Hero_QueenOfPain.ShadowStrike.Target")

	if self.Shadow_Projectiles[iProjectileHandle]["nBounces"] > 0 then
		
		local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLocation, nil, self:GetEffectiveCastRange(vLocation, hTarget), self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, FIND_CLOSEST, false)
		for _, hEnemy in pairs(hEnemies) do
			if not self.Shadow_Projectiles[iProjectileHandle]["hHits"][hEnemy:entindex()] then
				self:ShadowStrike(hTarget, hEnemy, self.Shadow_Projectiles[iProjectileHandle]["nBounces"] - 1, self.Shadow_Projectiles[iProjectileHandle]["hHits"])
				break
			end
		end
	end

	self:ClearID(iProjectileHandle)
end

--------------------------------------------------------------------------------

function queenofpain_pf_shadow_strike:ClearID(iProjectileHandle)
	if self.Shadow_Projectiles[iProjectileHandle] then
		for i = 0, #self.Shadow_Projectiles[iProjectileHandle] do
			self.Shadow_Projectiles[iProjectileHandle][i] = nil
		end
	end

	self.Shadow_Projectiles[iProjectileHandle] = nil
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_shadow_strike = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:OnCreated( kv )
	local hParent = self:GetParent()
	local hAbility = self:GetAbility() 

	self.nMoveSlow = hAbility:GetSpecialValueFor( "movement_slow" )
	self.nDuration = hAbility:GetSpecialValueFor("duration")

	if not IsServer() then return end

	self.hDamageTable = {
		victim = hParent,
		attacker = self:GetCaster(),
		damage = hAbility:GetSpecialValueFor("strike_damage"),
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	ApplyDamage( self.hDamageTable )

	self.hDamageTable.damage = hAbility:GetSpecialValueFor( "duration_damage" )

	self:StartIntervalThink(hAbility:GetSpecialValueFor("damage_interval"))

	local nStrikeFX = ParticleManager:CreateParticle( "particles/units/heroes/hero_queenofpain/queen_shadow_strike_debuff.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent )
	ParticleManager:SetParticleControlEnt(nStrikeFX, 0, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	self:AddParticle(nStrikeFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:OnRefresh(kv)
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility() 

	self.nMoveSlow = hAbility:GetSpecialValueFor( "movement_slow" )
	self.nDuration = hAbility:GetSpecialValueFor("duration")

	if not IsServer() then return end
	self.hDamageTable = {
		victim = hParent,
		attacker = hCaster,
		damage = hAbility:GetSpecialValueFor("strike_damage"),
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	ApplyDamage( self.hDamageTable )

	self.hDamageTable.damage = hAbility:GetSpecialValueFor( "duration_damage" )

	if hCaster:HasShard("aghsfort_special_queenofpain_shadow_strike_scream") then
		self:Scream(hCaster:FindTalentValue("aghsfort_special_queenofpain_shadow_strike_scream", "refresh_damage_pct"))
	end
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:OnDestroy()
	if IsClient() then return end
	if self:GetCaster():HasShard("aghsfort_special_queenofpain_shadow_strike_scream") then
		self:Scream()
	end
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:Scream(nDamagePct)
	local hParent = self:GetParent()
	local vOrigin = hParent:GetOrigin()
	local hScream = self:GetCaster():FindAbilityByName("queenofpain_pf_scream_of_pain")

	if not hScream or not hScream:IsTrained() then return end

	hScream:SendScreams(hParent, nDamagePct)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:OnIntervalThink()
	if self:GetRemainingTime() < 1 then return end
	ApplyDamage(self.hDamageTable)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow * (self:GetRemainingTime() / self.nDuration)
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_shadow_strike_attack = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike_attack:IsPurgable() 	return false end
function modifier_queenofpain_pf_shadow_strike_attack:IsHidden()	return true end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike_attack:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike_attack:GetModifierAttackSpeedBonus_Constant(event)
	if IsClient() then return end
	if self:GetParent():GetAttackTarget() and self:GetParent():GetAttackTarget():HasModifier("modifier_queenofpain_pf_shadow_strike") then
		return self:GetAbility():GetSpecialValueFor("attack_speed")
	end
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_shadow_strike_attack:OnAttack(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hCaster = self:GetCaster()

	if hAttacker ~= self:GetParent() or not hTarget or event.no_attack_cooldown or not hCaster:HasShard("aghsfort_special_queenofpain_shadow_strike_on_attack") then
		return
	end

	if hTarget:IsBuilding() or hTarget:IsOther() or hAttacker:PassivesDisabled() then return end

	if not RollPseudoRandomPercentage(hCaster:FindTalentValue("aghsfort_special_queenofpain_shadow_strike_on_attack", "proc_chance_pct"), DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, hAttacker) then
		return
	end	

	if self:GetAbility() and self:GetAbility():IsTrained() then
		local nBounces = 0

		if hCaster:HasShard("aghsfort_special_queenofpain_shadow_strike_chain") then
			nBounces = hCaster:FindTalentValue("aghsfort_special_queenofpain_shadow_strike_chain", "value")
		end
		
		self:GetAbility():ShadowStrike(hAttacker, hTarget, nBounces, {})
	end
end
sniper_pf_assassinate = class({})

--------------------------------------------------------------------------------

function sniper_pf_assassinate:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_assassinate.vpcf", context )
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:GetCastPoint()
	return self:GetSpecialValueFor("cast_point")
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:OnAbilityPhaseStart()
	if IsServer() then
		local hCaster = self:GetCaster()

		self:GetCursorTarget():AddNewModifier(hCaster, self, "modifier_sniper_assassinate", {duration = 4})

		hCaster:EmitSound("Ability.AssassinateLoad")

		if hCaster:HasShard("special_bonus_unique_aghsfort_special_sniper_assassinate_original_scepter") and not self.bActivityAdded then
			self.bActivityAdded = true
			hCaster:AddActivityModifier("ultimate_scepter")
		end
	end

	return true
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:OnAbilityPhaseInterrupted()
	if IsClient() then return end
	local hTarget = self:GetCursorTarget()

	if hTarget ~= nil and hTarget.HasModifier and hTarget:HasModifier("modifier_sniper_assassinate") then
		hTarget:RemoveModifierByName( "modifier_sniper_assassinate" )
	end
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:OnSpellStart()
	self:Fire(self:GetCursorTarget(), 100)
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:Fire(hTarget, nMultiplier)
	local hCaster = self:GetCaster()
	local vOrigin = hCaster:GetAbsOrigin()

	local hSoundEntity = CreateModifierThinker(hCaster, self, "", {duration = 4}, hCaster:GetOrigin(), hCaster:GetTeam(), false)
	hSoundEntity:EmitSound("Hero_Sniper.AssassinateProjectile")

	ProjectileManager:CreateTrackingProjectile( {
		EffectName = "particles/units/heroes/hero_sniper/sniper_assassinate.vpcf";
		Target = hTarget,
		Source = hCaster,
		Ability = self,
		iMoveSpeed = self:GetSpecialValueFor("projectile_speed"),
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1,
		ExtraData = {
			nSoundID = hSoundEntity:entindex(),
			nMult = nMultiplier,
			X = vOrigin.x,
			Y = vOrigin.y
		}
	})
	if nMultiplier == 100 then
		hCaster:EmitSound("Ability.Assassinate")
	else
		hCaster:EmitSound("Ability.AssassinatePassive")
	end
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:OnProjectileThink_ExtraData(vLocation, ExtraData)
	if ExtraData.nSoundID then
		local hSoundEntity = EntIndexToHScript(ExtraData.nSoundID)

		if hSoundEntity and not hSoundEntity:IsNull() then
			hSoundEntity:SetOrigin(vLocation)
		end
	end
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	if not hTarget then
		return 0
	end

	if hTarget:HasModifier("modifier_sniper_assassinate") then
		hTarget:RemoveModifierByName( "modifier_sniper_assassinate" )
	end

	if ExtraData.nSoundID then
		local hSoundEntity = EntIndexToHScript(ExtraData.nSoundID)

		if hSoundEntity and not hSoundEntity:IsNull() then
			hSoundEntity:StopSound("Hero_Sniper.AssassinateProjectile")
			UTIL_Remove(hSoundEntity)
		end
	end

	local bIsScatter = ExtraData.bScatter and ExtraData.bScatter == 1

	local nDamage = self:GetSpecialValueFor("damage")

	if not hTarget:IsInvulnerable() then
		local hCaster = self:GetCaster()

		if ExtraData.nMult == 100 then
			hCaster:PerformAttack(hTarget, false, true, true, true, false, false, true)
		else
			nDamage = nDamage * ExtraData.nMult / 100
		end

		ApplyDamage({
			attacker = hCaster,
			victim = hTarget,
			damage = nDamage,
			damage_type = self:GetAbilityDamageType(),
			ability = self,
		})

		if bIsScatter then
			hTarget:EmitSound("Sniper.AssassinateDamage_Scatter")
		else
			hTarget:EmitSound("Hero_Sniper.AssassinateDamage")
		end
		
		local nStunDuration = self:GetSpecialValueFor("stun_duration") * ExtraData.nMult / 100
		
		hTarget:AddNewModifier(hCaster, self, "modifier_stunned", {duration = nStunDuration * (1 - hTarget:GetStatusResistance())})
	end


	if not bIsScatter and self:GetCaster():HasShard("aghsfort_special_sniper_assassinate_buckshot") then
		self:Scatter(hTarget, Vector(ExtraData.X, ExtraData.Y, 0), ExtraData.nMult)
	end

	return true
end

--------------------------------------------------------------------------------

function sniper_pf_assassinate:Scatter(hTarget, vOrigin, nOriginalMult)
	local hCaster = self:GetCaster()
	local vToTarget = hTarget:GetOrigin() - vOrigin 
	vToTarget = vToTarget:Normalized()

	local vSideTarget = Vector( vToTarget.y, -vToTarget.x, 0.0 )
	local scatter_range = hCaster:FindTalentValue("aghsfort_special_sniper_assassinate_buckshot", "value")
	local scatter_width = hCaster:FindTalentValue("aghsfort_special_sniper_assassinate_buckshot", "value2")
	local nMult = math.min(hCaster:FindTalentValue("aghsfort_special_sniper_assassinate_buckshot", "value3"), nOriginalMult)

	local enemies = FindUnitsInRadius( hCaster:GetTeamNumber(), hTarget:GetOrigin(), hCaster, scatter_range + scatter_width, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
	for _,enemy in pairs(enemies) do
		if not enemy:IsInvulnerable() then
			local vToPotentialTarget = enemy:GetOrigin() - hTarget:GetOrigin()
			local flSideAmount = math.abs( vToPotentialTarget.x * vSideTarget.x + vToPotentialTarget.y * vSideTarget.y + vToPotentialTarget.z * vSideTarget.z )
			local flLengthAmount = ( vToPotentialTarget.x * vToTarget.x + vToPotentialTarget.y * vToTarget.y + vToPotentialTarget.z * vToTarget.z )
			if ( flSideAmount < scatter_width ) and ( flLengthAmount > 0.0 ) and ( flLengthAmount < scatter_range ) then
				local info = 
				{
					EffectName = "particles/units/heroes/hero_sniper/sniper_assassinate.vpcf";
					Target = enemy,
					Source = hTarget,
					Ability = self,
					iMoveSpeed = math.max(self:GetSpecialValueFor( "projectile_speed" ) * nMult / 100, self:GetSpecialValueFor( "projectile_speed" ) * 0.5),
					iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
					ExtraData = {
						nMult = nMult,
						bScatter = 1
					}
				}

				ProjectileManager:CreateTrackingProjectile( info )
				EmitSoundOn("Sniper.AssassinateProjectile_Scatter", enemy)
			end
		end
	end
end

modifier_ogre_tank_melee_smash_thinker = class({})

-----------------------------------------------------------------------------

function modifier_ogre_tank_melee_smash_thinker:OnCreated( kv )
	if IsServer() then
		self.impact_radius = self:GetAbility():GetSpecialValueFor( "impact_radius" )
		self.stun_duration = self:GetAbility():GetSpecialValueFor( "stun_duration" )
		self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
		self.interrupted = false

		self:StartIntervalThink( 0.01 )
	end
end

-----------------------------------------------------------------------------

function modifier_ogre_tank_melee_smash_thinker:OnIntervalThink()
	if IsServer() then
		if self:GetCaster() == nil or self:GetCaster():IsNull() or self:GetCaster():IsAlive() == false or self:GetCaster():IsStunned() then
			--print( string.format( "Caster is nil, dead, or stunned, removing smash thinker" ) )
			self.interrupted = true
			self:Destroy()
			return -1
		end
	end
end

-----------------------------------------------------------------------------

function modifier_ogre_tank_melee_smash_thinker:OnDestroy()
	if IsServer() then
		if self:GetCaster() ~= nil and self:GetCaster():IsAlive() and not self.interrupted then
			EmitSoundOnLocationWithCaster( self:GetParent():GetOrigin(), "OgreTank.GroundSmash", self:GetCaster() )
			local nFXIndex = ParticleManager:CreateParticle( "particles/creatures/ogre/ogre_melee_smash.vpcf", PATTACH_WORLDORIGIN,  self:GetCaster()  )
			ParticleManager:SetParticleControl( nFXIndex, 0, self:GetParent():GetOrigin() )
			ParticleManager:SetParticleControl( nFXIndex, 1, Vector( self.impact_radius, self.impact_radius, self.impact_radius ) )
			ParticleManager:ReleaseParticleIndex( nFXIndex )

			local nTeamFlags = DOTA_UNIT_TARGET_TEAM_ENEMY
			if self:GetCaster():FindModifierByName( "modifier_winter_wyvern_pf_winters_curse" ) then
				nTeamFlags = DOTA_UNIT_TARGET_TEAM_BOTH
			end

			local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), self:GetParent(), self.impact_radius, nTeamFlags, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
			for _,enemy in pairs( enemies ) do
				if not ( enemy:IsNull() ) and enemy ~= nil and enemy:IsInvulnerable() == false then
					local damageInfo = 
					{
						victim = enemy,
						attacker = self:GetCaster(),
						damage = self.damage,
						damage_type = DAMAGE_TYPE_PHYSICAL,
						ability = self,
					}

					ApplyDamage( damageInfo )
					if not ( enemy:IsNull() ) and enemy ~= nil and enemy:IsAlive() == false then
						local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf", PATTACH_CUSTOMORIGIN, nil )
						ParticleManager:SetParticleControlEnt( nFXIndex, 0, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", enemy:GetOrigin(), true )
						ParticleManager:SetParticleControl( nFXIndex, 1, enemy:GetOrigin() )
						ParticleManager:SetParticleControlForward( nFXIndex, 1, -self:GetCaster():GetForwardVector() )
						ParticleManager:SetParticleControlEnt( nFXIndex, 10, enemy, PATTACH_ABSORIGIN_FOLLOW, nil, enemy:GetOrigin(), true )
						ParticleManager:ReleaseParticleIndex( nFXIndex )

						EmitSoundOn( "Dungeon.BloodSplatterImpact", enemy )
					elseif not ( enemy:IsNull() ) and enemy ~= nil and not enemy:IsMagicImmune() then
						enemy:AddNewModifier( self:GetCaster(), self:GetAbility(), "modifier_stunned", { duration = self.stun_duration * (1 - enemy:GetStatusResistance()) } )
					end
				end
			end
		end

		ScreenShake( self:GetParent():GetOrigin(), 10.0, 100.0, 0.5, 1300.0, 0, true )

		UTIL_Remove( self:GetParent() )
	end
end

-----------------------------------------------------------------------------


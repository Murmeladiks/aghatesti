item_watchers_gaze = class({})
LinkLuaModifier( "modifier_item_watchers_gaze", "modifiers/modifier_item_watchers_gaze", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function item_watchers_gaze:Precache( context )
	PrecacheResource( "particle", "particles/units/heroes/hero_medusa/medusa_stone_gaze_cast.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_medusa/medusa_stone_gaze_active.vpcf", context )
end


--------------------------------------------------------------------------------

function item_watchers_gaze:OnSpellStart()
	if IsServer() then
		local vision_cone = self:GetSpecialValueFor( "vision_cone" )
		local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_medusa/medusa_stone_gaze_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
		ParticleManager:ReleaseParticleIndex( nFXIndex )

		local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetCaster():GetOrigin(), nil, 800, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
		for _,enemy in pairs( enemies ) do
			if enemy ~= nil then
				local vToTarget = enemy:GetOrigin() - self:GetCaster():GetOrigin()
				vToTarget = vToTarget:Normalized()
				local flDirectionDot = DotProduct( vToTarget, self:GetCaster():GetForwardVector() )
				local flAngle = 180 * math.acos( flDirectionDot ) / math.pi
				if flAngle < 60 then
					enemy:AddNewModifier( self:GetCaster(), self, "modifier_medusa_stone_gaze_stone", {duration = self:GetSpecialValueFor( "stone_duration" ) } )
					EmitSoundOn( "WatchersGaze.Target" ,enemy )
				end
			end
			
		end
		local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_medusa/medusa_stone_gaze_active.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
		ParticleManager:SetParticleControlEnt( nFXIndex, 1, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetOrigin(), true )
		Timers:CreateTimer(2, function()
			ParticleManager:DestroyParticle(nFXIndex, false)
			ParticleManager:ReleaseParticleIndex( nFXIndex )
		end)
	end
end

--------------------------------------------------------------------------------

function item_watchers_gaze:GetIntrinsicModifierName()
	return "modifier_item_watchers_gaze"
end

--------------------------------------------------------------------------------

function item_watchers_gaze:Spawn()
	self.required_level = self:GetSpecialValueFor( "required_level" )
end

--------------------------------------------------------------------------------

function item_watchers_gaze:OnHeroLevelUp()
	if IsServer() then
		if self:GetCaster():GetLevel() == self.required_level and self:IsInBackpack() == false then
			self:OnUnequip()
			self:OnEquip()
		end
	end
end

--------------------------------------------------------------------------------

function item_watchers_gaze:IsMuted()	
	if self.required_level > self:GetCaster():GetLevel() then
		return true
	end
	if not self:GetCaster():IsHero() then
		return true
	end
	return self.BaseClass.IsMuted( self )
end

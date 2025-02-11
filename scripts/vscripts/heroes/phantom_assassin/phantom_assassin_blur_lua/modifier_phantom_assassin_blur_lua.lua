modifier_phantom_assassin_blur_lua = class({})

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:IsHidden() 		return true end 
function modifier_phantom_assassin_blur_lua:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:OnCreated( kv )
	if IsClient() then return end

	self.interval = 0.5	

	
	self.radius = self:GetCaster():FindAbilityByName("phantom_assassin_blur_lua"):GetSpecialValueFor( "radius" )
	
	self:StartIntervalThink( self.interval )
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT,
		MODIFIER_EVENT_ON_DEATH,
	}
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:OnDeath(kv)
	if IsClient() then return end

	if self:GetCaster():HasAbility("pathfinder_special_pa_blur_cdr") and not self:GetAbility():IsCooldownReady() then
		local special = self:GetCaster():FindAbilityByName("pathfinder_special_pa_blur_cdr")
		local cdr_seconds = self:GetAbility():GetCooldown(self:GetAbility():GetLevel()) / 100 * special:GetLevelSpecialValueFor("reduce_percent",1)
		local valid_radius = special:GetLevelSpecialValueFor("radius",1)
		if kv.unit:GetTeamNumber() ~= self:GetCaster():GetTeamNumber() and (kv.unit:GetAbsOrigin() - self:GetCaster():GetAbsOrigin()):Length2D() < valid_radius then
			local new_cd = math.max(0, self:GetAbility():GetCooldownTimeRemaining() - cdr_seconds)
			self:GetAbility():EndCooldown()
			self:GetAbility():StartCooldown(new_cd)
		end
	end
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:GetModifierIgnoreMovespeedLimit()	
	if self.bHasRegenBonus then
		return 1
	end
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:OnIntervalThink()
	if self:GetParent() == self:GetCaster() and self:GetCaster():HasAbility("pathfinder_special_pa_blur_aoe") and not self:GetCaster():HasModifier("modifier_phantom_assassin_blur_lua_aura") then
		self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_phantom_assassin_blur_lua_aura", {})	
	end
	
	self.bHasRegenBonus = self:GetCaster():HasAbility("pathfinder_special_pa_blur_regen")
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:GetEffectName()	
	return "particles/units/heroes/hero_phantom_assassin/phantom_assassin_blur.vpcf"	
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
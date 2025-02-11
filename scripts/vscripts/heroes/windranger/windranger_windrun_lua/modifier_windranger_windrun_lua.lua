modifier_windranger_windrun_lua = class({})

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:OnCreated( kv )
	local hAbility = self:GetAbility()

	self.radius = hAbility:GetSpecialValueFor( "radius" )
	self.evasion = hAbility:GetSpecialValueFor( "evasion_pct_tooltip" )
	self.ms_bonus = hAbility:GetSpecialValueFor( "movespeed_bonus_pct" )

	if IsServer() and hAbility:GetCaster():HasAbility("pathfinder_special_windranger_windrun_cyclone") then
		self:StartIntervalThink( hAbility:GetCaster():FindAbilityByName("pathfinder_special_windranger_windrun_cyclone"):GetLevelSpecialValueFor("duration", 1))
	end
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:OnIntervalThink()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	if hCaster:HasAbility("pathfinder_special_windranger_windrun_cyclone") then
		if hCaster:HasAbility("windranger_shackleshot_lua") then
			local enemies = FindUnitsInRadius(hCaster:GetTeamNumber(), hCaster:GetAbsOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)

			if #enemies > 0 then
				hCaster:SetCursorCastTarget(enemies[1])			
				hCaster:FindAbilityByName("windranger_shackleshot_lua"):OnSpellStart()
			end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:OnRefresh( kv )
	self:OnCreated( kv )
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
		MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS
	}
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:GetModifierMoveSpeedBonus_Percentage()
	return self.ms_bonus
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:GetModifierEvasion_Constant()
	return self.evasion
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:GetActivityTranslationModifiers()
	return "windrun"
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:IsAura() 				return self:GetParent() == self:GetCaster() and self:GetCaster():GetHeroFacetID() == 1 end
function modifier_windranger_windrun_lua:GetModifierAura()		return "modifier_windrunner_pf_windrun_speed" end
function modifier_windranger_windrun_lua:GetAuraRadius() 		return self.radius end
function modifier_windranger_windrun_lua:GetAuraSearchTeam() 	return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_windranger_windrun_lua:GetAuraSearchType() 	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:GetEffectName()
	return "particles/units/heroes/hero_windrunner/windrunner_windrun.vpcf"
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

--------------------------------------------------------------------------------

modifier_windranger_windrun_lua_invis = class({})

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua_invis:IsHidden() 		return true end
function modifier_windranger_windrun_lua_invis:GetAttributes() 	return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua_invis:OnCreated()	
	if IsClient() then return end

	if not self:GetCaster():FindAbilityByName("pathfinder_special_windranger_windrun_invis") then self:Destroy() end
	self.ability = self:GetCaster():FindAbilityByName("pathfinder_special_windranger_windrun_invis")

	local illusion_damage = self:GetCaster():FindAbilityByName("pathfinder_special_windranger_windrun_invis"):GetLevelSpecialValueFor("illusion_dmg_mult",1)						
		
	local modifierKeys = {}
	modifierKeys.outgoing_damage = -1 * illusion_damage
	modifierKeys.incoming_damage = -1 * illusion_damage
	modifierKeys.duration = self:GetDuration()
	
	local illusion = CreateIllusions( self:GetCaster(), self:GetCaster(), modifierKeys, 1, 0, true, true)
	illusion[1]:AddNewModifier(self:GetCaster(), self, "modifier_terrorblade_conjureimage", {})
	illusion[1]:AddNewModifier(self:GetCaster(), self, "modifier_phased", {})
	illusion[1]:AddNewModifier(self:GetCaster(), self, "modifier_no_healthbar", {})
	illusion[1]:SetControllableByPlayer(-1, true)			
	FindClearSpaceForUnit(illusion[1], self:GetCaster():GetAbsOrigin(), false)

	self.illusion = illusion[1]

	self:GetParent():AddNewModifier(self:GetParent(), self, "modifier_invisible", {duration = self:GetDuration()})
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua_invis:OnDestroy()
	if IsServer() then
		if self:GetParent():HasModifier("modifier_invisible") and not self:GetParent():HasModifier("modifier_windranger_windrun_lua_invis") then
			self:GetParent():RemoveModifierByName("modifier_invisible")
		end
	end
end

--------------------------------------------------------------------------------

function modifier_windranger_windrun_lua_invis:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end

--------------------------------------------------------------------------------


function modifier_windranger_windrun_lua_invis:OnAttackLanded(params)
	if IsServer() and params.attacker == self:GetParent() then		
		self:Destroy()
	end
end
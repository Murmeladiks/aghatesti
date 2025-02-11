LinkLuaModifier("modifier_phantom_assassin_blur_lua", 					"heroes/phantom_assassin/phantom_assassin_blur_lua/modifier_phantom_assassin_blur_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_phantom_assassin_blur_lua_aura", 				"heroes/phantom_assassin/phantom_assassin_blur_lua/phantom_assassin_blur_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_phantom_assassin_pf_blur_active", 			"heroes/phantom_assassin/phantom_assassin_blur_lua/phantom_assassin_blur_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_phantom_assassin_pf_blur_manacost_reduction", "heroes/phantom_assassin/phantom_assassin_blur_lua/phantom_assassin_blur_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_absorb_spell", 								"pathfinder/modifier_absorb_spell", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

phantom_assassin_blur_lua = class({})

--------------------------------------------------------------------------------

function phantom_assassin_blur_lua:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_phantom_assassin/phantom_assassin_blur.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_phantom_assassin/phantom_assassin_active_start.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_phantom_assassin/phantom_assassin_active_blur.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_phantom_assassin_active_blur.vpcf", context)
end

--------------------------------------------------------------------------------

function phantom_assassin_blur_lua:GetIntrinsicModifierName()
	return "modifier_phantom_assassin_blur_lua"
end

--------------------------------------------------------------------------------

function phantom_assassin_blur_lua:GetCastRange(vLocation, hTarget)
	if self:GetCaster():HasShard("pathfinder_special_pa_blur_aoe") then
		return self:GetCaster():FindTalentValue("pathfinder_special_pa_blur_aoe", "radius")
	end
	
	return self:GetLevelSpecialValueFor("radius", self:GetLevel())
end

--------------------------------------------------------------------------------

function phantom_assassin_blur_lua:OnSpellStart()
	local hCaster = self:GetCaster()
	local nDuration = self:GetSpecialValueFor("duration")
	local bSpellBlock = hCaster:HasShard("pathfinder_special_pa_blur_block")
	local nSpellBlockDuration = hCaster:FindTalentValue("pathfinder_special_pa_blur_block", "duration")

	hCaster:Purge(false, true, false, false, false)
	hCaster:AddNewModifier(hCaster, self, "modifier_phantom_assassin_pf_blur_active", {duration = nDuration})	
	hCaster:EmitSound("Hero_PhantomAssassin.Blur")
	

	if hCaster:HasShard("pathfinder_special_pa_blur_aoe") then
		local nRadius = hCaster:FindTalentValue("pathfinder_special_pa_blur_aoe", "radius")
		local hFriendlies = FindUnitsInRadius(hCaster:GetTeamNumber(), hCaster:GetAbsOrigin(), hCaster, nRadius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, 0, false)

		for _, hAlly in pairs(hFriendlies) do
			if hAlly ~= hCaster then
				hAlly:AddNewModifier(hCaster, self, "modifier_phantom_assassin_pf_blur_active", {duration = nDuration})				
				hAlly:Purge(false, true, false, false, false)
				hAlly:EmitSound("Hero_PhantomAssassin.Blur")
			end

			if bSpellBlock then
				hAlly:AddNewModifier(hCaster, self, "modifier_absorb_spell", {duration = nSpellBlockDuration})
			end
		end
	end

	if bSpellBlock then
		hCaster:AddNewModifier(hCaster, self, "modifier_absorb_spell", {duration = nSpellBlockDuration})
	end
end

--------------------------------------------------------------------------------

modifier_phantom_assassin_pf_blur_active = class({})

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()

	self.bInGracePeriod = true
	self.nGracePeriod = hAbility:GetSpecialValueFor("grace_period")
	self.bBreakOnAttack = hAbility:GetSpecialValueFor("break_on_attack") == 1
	self.nVanishBuffer = hAbility:GetSpecialValueFor("fade_duration")
	self.nVanishRadius = hAbility:GetSpecialValueFor("radius")
	self.nManaCostReduction = hAbility:GetSpecialValueFor("manacost_reduction_during_blur_pct")
	self.nBuffDuration = hAbility:GetSpecialValueFor("buff_duration_after_break")

	if hCaster:HasShard("pathfinder_special_pa_blur_regen") then
		self.nHealthRegenPct = hCaster:FindTalentValue("pathfinder_special_pa_blur_regen", "max_health_regen")
		self.nMoveSpeed = hCaster:FindTalentValue("pathfinder_special_pa_blur_regen", "bonus_movespeed_percentage")
	end

	if IsClient() then return end
	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_phantom_assassin/phantom_assassin_active_start.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	)


	Timers:CreateTimer(self.nGracePeriod, function()
		if self and not self:IsNull() then
			self.bInGracePeriod = false
		end
	end)

	if not self.bBreakOnAttack then
		Timers:CreateTimer(self.nVanishBuffer, function()
			if self and not self:IsNull() then
				self.bBreakOnAttack = true
			end
		end)
	end

	self:StartIntervalThink(FrameTime())
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()

	if self.nBuffDuration > 0 then
		hParent:AddNewModifier(hCaster, self:GetAbility(), "modifier_phantom_assassin_pf_blur_manacost_reduction", {duration = self.nBuffDuration})
	end

	hParent:EmitSound("Hero_PhantomAssassin.Blur.Break")
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:OnIntervalThink()
	if self.bInGracePeriod then return end

	if self.bDestroy then
		self:Destroy()
		return
	end

	local hParent = self:GetParent()

	local hEnemies = FindUnitsInRadius(hParent:GetTeam(), hParent:GetOrigin(), nil, self.nVanishRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING, 0, FIND_CLOSEST, false)

	if #hEnemies > 0 then
		self.bDestroy = true
		self:StartIntervalThink(0.5)
	end
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:CheckState()
	return {
		[MODIFIER_STATE_UNTARGETABLE_ENEMY] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP_FOR_ENEMIES] = true
	}
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
		MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:OnAttackLanded(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target

	if hAttacker ~= self:GetParent() or not hTarget or not self.bBreakOnAttack then return end

	self:Destroy()
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:GetModifierInvisibilityLevel()
	return 1.0
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:GetModifierPercentageManacostStacking()
	return self.nManaCostReduction
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:GetModifierMoveSpeedBonus_Percentage()	
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:GetModifierHealthRegenPercentage()	
	return self.nHealthRegenPct
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:GetEffectName()
	return "particles/units/heroes/hero_phantom_assassin/phantom_assassin_active_blur.vpcf"
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:GetStatusEffectName()
	return "particles/status_fx/status_effect_phantom_assassin_active_blur.vpcf"
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_active:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_phantom_assassin_pf_blur_manacost_reduction = class({})

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_manacost_reduction:OnCreated()
	self.nManaCostReduction = self:GetAbility():GetSpecialValueFor("manacost_reduction_after_blur_pct")
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_manacost_reduction:DeclareFunctions()
	return {MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING}
end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_pf_blur_manacost_reduction:GetModifierPercentageManacostStacking()
	return self.nManaCostReduction
end

--------------------------------------------------------------------------------

modifier_phantom_assassin_blur_lua_aura = class({})

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua_aura:IsHidden() 			return true end
function modifier_phantom_assassin_blur_lua_aura:IsPurgable() 			return false end
function modifier_phantom_assassin_blur_lua_aura:IsAura() 				return true end
function modifier_phantom_assassin_blur_lua_aura:GetModifierAura() 		return  "modifier_phantom_assassin_blur_lua" end
function modifier_phantom_assassin_blur_lua_aura:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_phantom_assassin_blur_lua_aura:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_OTHER end

--------------------------------------------------------------------------------

function modifier_phantom_assassin_blur_lua_aura:GetAuraRadius()
	local blur_aoe = self:GetParent():FindAbilityByName("pathfinder_special_pa_blur_aoe")
	if blur_aoe and not blur_aoe:IsNull() then
		return blur_aoe:GetSpecialValueFor("radius")
	end
	return 0
end
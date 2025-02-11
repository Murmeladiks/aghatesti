LinkLuaModifier("modifier_luna_pf_eclipse", 			"heroes/luna/luna_pf_eclipse", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_eclipse_hide_aura", 	"heroes/luna/luna_pf_eclipse", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_luna_pf_eclipse_hide", 		"heroes/luna/luna_pf_eclipse", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

luna_pf_eclipse = class({})

--------------------------------------------------------------------------------

function luna_pf_eclipse:Precache(context)
	PrecacheResource("particle", "particles/units/heroes/hero_luna/luna_eclipse_impact.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_luna/luna_eclipse_impact_notarget.vpcf", context)
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:GetCastRange()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:GetBehavior()
	if self:GetCaster():HasShard("special_bonus_unique_luna_eclipse_lunar_focus") then
		return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_POINT + DOTA_ABILITY_BEHAVIOR_AOE
	end

	return self.BaseClass.GetBehavior(self)
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:CastFilterResultTarget(hTarget)
	local hCaster = self:GetCaster()

	self.hTarget = hTarget

	if hCaster:HasShard("special_bonus_unique_luna_eclipse_lunar_focus") then
		return UnitFilter(hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, hCaster:GetTeamNumber())
	end

	return self.BaseClass.CastFilterResultTarget(self, hTarget)
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:CastFilterResultLocation(vLocation)
	self.hTarget = nil
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:GetAOERadius()
	return self.hTarget and self:GetSpecialValueFor("radius") or self:GetSpecialValueFor("point_cast_radius")
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:GetIntrinsicModifierName()
	return "modifier_luna_pf_eclipse_hide_aura"
end

--------------------------------------------------------------------------------

function luna_pf_eclipse:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget = self:GetCursorTarget() or hCaster
	local vPos = self:GetCursorPosition()

	if vPos and (vPos.x ~= 0 or vPos.y ~= 0) and vPos ~= hTarget:GetOrigin() then
		CreateModifierThinker(hCaster, self, "modifier_luna_pf_eclipse", {nBeams = self:GetSpecialValueFor("beams"), nRadius = self:GetSpecialValueFor("point_cast_radius"), nInterval = self:GetSpecialValueFor("point_cast_interval")}, vPos, hCaster:GetTeam(), false)
		AddFOWViewer(hCaster:GetTeam(), vPos, self:GetSpecialValueFor("point_cast_radius"), (self:GetSpecialValueFor("beams") + 1) * self:GetSpecialValueFor("point_cast_interval"), false)
	else
		hTarget:AddNewModifier(hCaster, self, "modifier_luna_pf_eclipse", {nBeams = self:GetSpecialValueFor("beams"), nRadius = self:GetSpecialValueFor("radius")})
	end


	hCaster:EmitSound("Hero_Luna.Eclipse.Cast")
	GameRules:BeginTemporaryNight(self:GetSpecialValueFor("night_duration"))
end

--------------------------------------------------------------------------------

modifier_luna_pf_eclipse = class({})

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse:IsPurgable()		return false end
function modifier_luna_pf_eclipse:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse:OnCreated(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	
	self.nBeams = math.floor(kv.nBeams)
	self.nRadius = kv.nRadius
	self.nInterval = kv.nInterval or hAbility:GetSpecialValueFor("beam_interval")

	self.nHitCount = 0

	local nEclipseFX = ParticleManager:CreateParticle("particles/units/heroes/hero_luna/luna_eclipse.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControl(nEclipseFX, 1, Vector(self.nRadius, 0, 0))
	self:AddParticle(nEclipseFX, false, false, -1, false, false)

	self:StartIntervalThink(self.nInterval)
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse:OnIntervalThink()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	local hBeamAbility = hCaster:FindAbilityByName("luna_pf_lucent_beam")
	local bHit = false

	if self.nHitCount >= self.nBeams then 
		self:Destroy()
		return
	end

	if hBeamAbility and hBeamAbility:IsTrained() then
		local hEnemies = FindUnitsInRadius(hParent:GetTeam(), hParent:GetOrigin(), nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)

		for _, hEnemy in pairs(hEnemies) do
			hBeamAbility:LucentBeam(hEnemy, true)

			local nHitFX = ParticleManager:CreateParticle("particles/units/heroes/hero_luna/luna_eclipse_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
			ParticleManager:SetParticleControlEnt(nHitFX, 1, hEnemy, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
			ParticleManager:SetParticleControlEnt(nHitFX, 5, hEnemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
			ParticleManager:ReleaseParticleIndex(nHitFX)
			hEnemy:EmitSound("Hero_Luna.Eclipse.Target")

			if hBeamAbility:GetSpecialValueFor("damage_buff_duration") > 0 then
				hCaster:AddNewModifier(hCaster, hBeamAbility, "modifier_luna_pf_lucent_beam_damage_buff", {duration = hBeamAbility:GetSpecialValueFor("damage_buff_duration"), nEclipseStacks = 1})
			end

			bHit = true
			break
		end
	end

	self.nHitCount = self.nHitCount + 1

	if bHit then return end

	local vPos = hParent:GetOrigin() + RandomVector(RandomInt(0, self.nRadius))
		
	EmitSoundOnLocationWithCaster(vPos, "Hero_Luna.Eclipse.NoTarget", hCaster)
	
	local nMissFX = ParticleManager:CreateParticle("particles/units/heroes/hero_luna/luna_eclipse_impact_notarget.vpcf", PATTACH_WORLDORIGIN, hCaster)
	ParticleManager:SetParticleControl(nMissFX, 1, vPos)
	ParticleManager:SetParticleControl(nMissFX, 5, vPos)
	ParticleManager:ReleaseParticleIndex(nMissFX)
end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse:DeclareFunctions()
	return {MODIFIER_EVENT_ON_DEATH}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse:OnDeath(event)
	if IsClient() or event.attacker ~= self:GetParent() or not self:GetCaster():HasShard("aghsfort_special_luna_eclipse_lunar_cycle") then return end

	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	if hAbility:IsCooldownReady() then return end

	local nCD = hAbility:GetCooldownTimeRemaining()

	hAbility:EndCooldown()
	hAbility:StartCooldown(math.max(0, nCD - hCaster:FindTalentValue("aghsfort_special_luna_eclipse_lunar_cycle", "cooldown_reduction")))
end

--------------------------------------------------------------------------------

if modifier_luna_pf_eclipse_hide_aura == nil then	modifier_luna_pf_eclipse_hide_aura = class({}) end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse_hide_aura:IsHidden() 			return true end
function modifier_luna_pf_eclipse_hide_aura:IsPurgable() 		return false end
function modifier_luna_pf_eclipse_hide_aura:IsAura() 			if IsServer() then return self:GetCaster():HasShard("special_bonus_unique_luna_eclipse_hide") and not GameRules:IsDaytime() end end
function modifier_luna_pf_eclipse_hide_aura:GetModifierAura() 	return "modifier_luna_pf_eclipse_hide" end
function modifier_luna_pf_eclipse_hide_aura:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_luna_pf_eclipse_hide_aura:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO end
function modifier_luna_pf_eclipse_hide_aura:GetAuraRadius() 	return 10000 end

--------------------------------------------------------------------------------

if modifier_luna_pf_eclipse_hide == nil then	modifier_luna_pf_eclipse_hide = class({}) end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse_hide:OnCreated()
	local hCaster = self:GetCaster()

	self.nValue = self:GetAbility():GetSpecialValueFor("beams") * hCaster:FindTalentValue("special_bonus_unique_luna_eclipse_hide", "multiplier")
end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse_hide:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_EVASION_CONSTANT
	}
end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse_hide:GetModifierMoveSpeedBonus_Constant()
	return self.nValue
end

--------------------------------------------------------------------------------

function modifier_luna_pf_eclipse_hide:GetModifierEvasion_Constant()
	return self.nValue
end
LinkLuaModifier("modifier_aghsfort_explosive_barrel_pf", "abilities/creatures/aghsfort_explosive_barrel", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

if aghsfort_explosive_barrel == nil then
	aghsfort_explosive_barrel = class({})
end

--------------------------------------------------------------------------------

function aghsfort_explosive_barrel:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_techies.vsndevts", context)	
	PrecacheResource("particle", "particles/dark_moon/darkmoon_creep_warning.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_techies/techies_remote_mines_detonate.vpcf", context)
end

--------------------------------------------------------------------------------

function aghsfort_explosive_barrel:GetIntrinsicModifierName()
	return "modifier_aghsfort_explosive_barrel_pf"
end

--------------------------------------------------------------------------------

if modifier_aghsfort_explosive_barrel_pf == nil then
	modifier_aghsfort_explosive_barrel_pf = class({})
end

function modifier_aghsfort_explosive_barrel_pf:IsHidden() return true end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:OnCreated()
	if IsClient() then return end
	self.bExploding = false
	self.bCanDie = false
	
	self:SetStackCount(1)
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:OnIntervalThink()
	self:StartIntervalThink(-1)
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	local nRadius = hAbility:GetSpecialValueFor("radius")
	local nStunDuration = hAbility:GetSpecialValueFor("stun_duration")

	local hKiller = self.hKiller

	if not hKiller or hKiller:IsNull() then
		hKiller = PlayerResource:GetSelectedHeroEntity(0)
	end

	local tDamageTable = {
		attacker = hKiller,
		victim = nil,
		damage = hAbility:GetSpecialValueFor("damage"),
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = hAbility
	}

	local hUnits = FindUnitsInRadius(hParent:GetTeam(), hParent:GetOrigin(), nil, nRadius, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hUnit in pairs(hUnits) do
		hUnit:AddNewModifier(hParent, hAbility, "modifier_stunned", {duration = nStunDuration})

		tDamageTable.victim = hUnit
		ApplyDamage(tDamageTable)
	end

	hParent:EmitSound("Hero_Techies.RemoteMine.Detonate")
	hParent:AddNoDraw()

	local nDetonationFX = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_remote_mines_detonate.vpcf", PATTACH_WORLDORIGIN, nil)
	ParticleManager:SetParticleControl(nDetonationFX, 0, hParent:GetOrigin())
	ParticleManager:SetParticleControl(nDetonationFX, 1, Vector(nRadius, nRadius, nRadius))
	ParticleManager:ReleaseParticleIndex(nDetonationFX)

	self.bCanDie = true

	hParent:Kill(hAbility, hKiller)
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:CheckState()
	return {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true,
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_FAKE_ALLY] = true,
	}
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACKED,
		MODIFIER_PROPERTY_MIN_HEALTH,
		MODIFIER_PROPERTY_MODEL_SCALE,
		MODIFIER_PROPERTY_PROVIDES_FOW_POSITION
	}
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:GetModifierProvidesFOWVision()
	return 1
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:OnAttacked(event)
	if IsClient() or event.target ~= self:GetParent() or self.bExploding then return end
	local hParent = self:GetParent()
	local hAbility = self:GetAbility()
	local nDelay = hAbility:GetSpecialValueFor("detonate_delay")
	local nModelRadius = hParent:GetAbsScale() * hParent:GetHullRadius() * 2

	self.bExploding = true

	local nWarningFX = ParticleManager:CreateParticle("particles/dark_moon/darkmoon_creep_warning.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControl(nWarningFX, 1, Vector(nModelRadius, nModelRadius, nModelRadius))
	self:AddParticle(nWarningFX, true, false, -1, false, false)

	self:SetStackCount(2)

	self:StartIntervalThink(nDelay)

	self.hKiller = event.attacker

	hParent:EmitSound("Hero_Techies.RemoteMine.Priming")
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:GetMinHealth()
	if not self.bCanDie then return 1 end
end

--------------------------------------------------------------------------------

function modifier_aghsfort_explosive_barrel_pf:GetModifierModelScale()
	if self:GetAbility() then return self:GetAbility():GetSpecialValueFor("model_scale") * self:GetStackCount() end
end
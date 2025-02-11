LinkLuaModifier("modifier_lich_pf_sinister_gaze", 			"heroes/lich/lich_pf_sinister_gaze", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_sinister_gaze_summon", 	"heroes/lich/lich_pf_sinister_gaze", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_ice_spire", 				"heroes/lich/lich_pf_sinister_gaze", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_lich_pf_ice_spire_debuff", 		"heroes/lich/lich_pf_sinister_gaze", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

lich_pf_sinister_gaze = class({})

--------------------------------------------------------------------------------

function lich_pf_sinister_gaze:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_gaze.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_lich_gaze.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_gaze_eyes.vpcf", context)
	PrecacheResource("particle", "particles/neutral_fx/skeleton_spawn.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_lich/lich_ice_spire.vpcf", context)
	PrecacheUnitByNameSync("npc_dota_aghsfort_lich_skeleton_warrior", context, -1)
	PrecacheUnitByNameSync("npc_dota_aghsfort_lich_ice_spire", context, -1)
end

--------------------------------------------------------------------------------

function lich_pf_sinister_gaze:GetAOERadius()
	return self:GetSpecialValueFor("aoe")
end

--------------------------------------------------------------------------------

function lich_pf_sinister_gaze:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("cast_range")
end

--------------------------------------------------------------------------------

function lich_pf_sinister_gaze:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPos = self:GetCursorPosition()
	local nDuration = self:GetChannelTime()
	local nRadius = self:GetSpecialValueFor("aoe")
	local bSpire = hCaster:HasShard("aghsfort_special_lich_sinister_gaze_spawns_ice_spire")
	local nSpireID = -1

	local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), vPos, nil, nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	self.tFearedTargets = {}
	self.nElapsedTime = 0
	self.nManaGivenSteps = -1
	self.nManaPercentPerStep = self:GetSpecialValueFor("mana_drain") / nDuration / 10
	self.nTotalGiven = 0

	if bSpire then
		local hSpire = CreateUnitByName("npc_dota_aghsfort_lich_ice_spire", vPos, false, hCaster, hCaster, hCaster:GetTeamNumber())
		hSpire:AddNewModifier(hCaster, self, "modifier_lich_pf_ice_spire", {duration = hCaster:FindTalentValue("aghsfort_special_lich_sinister_gaze_spawns_ice_spire", "duration")})
		nSpireID = hSpire:entindex()
	end

	for _, hEnemy in pairs(hEnemies) do
		local nGivenDuration = nDuration

		if hEnemy:IsConsideredHero() then
			nGivenDuration = nDuration * (1 - hEnemy:GetTrueStatusResistance())
		end

		hEnemy:AddNewModifier(hCaster, self, "modifier_lich_pf_sinister_gaze", {duration = nGivenDuration, nSpireID = nSpireID})
		hEnemy:EmitSound("Hero_Lich.SinisterGaze.Target")
		table.insert(self.tFearedTargets, hEnemy)
	end

	hCaster:EmitSound("Hero_Lich.SinisterGaze.Cast")

	self.nEyesFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_gaze_eyes.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	ParticleManager:SetParticleControlEnt(self.nEyesFX, 1, hCaster, PATTACH_POINT_FOLLOW, "attach_eye_l", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(self.nEyesFX, 2, hCaster, PATTACH_POINT_FOLLOW, "attach_eye_r", Vector(0, 0, 0), true)
end

--------------------------------------------------------------------------------

function lich_pf_sinister_gaze:OnChannelThink(flInterval)
	self.nElapsedTime = self.nElapsedTime + flInterval

	if #self.tFearedTargets < 1 then return end
	local hCaster = self:GetCaster()

	if math.floor(self.nElapsedTime / 0.1) > self.nManaGivenSteps then
		local nManaRestored = self.nManaPercentPerStep * self:GetCaster():GetMaxMana() / 100

		self:GetCaster():GiveMana(nManaRestored)
		self.nManaGivenSteps = self.nManaGivenSteps + 1

		if hCaster:HasShard("aghsfort_special_lich_sinister_gaze_drains_life") then
			hCaster:HealWithParams(nManaRestored, self, false, true, hCaster, false)

			local tDamageTable = {
				attacker = hCaster,
				victim = nil,
				damage = nManaRestored,
				damage_type = DAMAGE_TYPE_MAGICAL,
				ability = self
			}

			for _, hEnemy in pairs(self.tFearedTargets) do
				tDamageTable.victim = hEnemy
				ApplyDamage(tDamageTable)
			end
		end
	end
end

--------------------------------------------------------------------------------

function lich_pf_sinister_gaze:OnChannelFinish(bInterrupted)
	local hCaster = self:GetCaster()

	for _, hTarget in pairs(self.tFearedTargets) do
		hTarget:RemoveModifierByName("modifier_lich_pf_sinister_gaze")
	end

	hCaster:StopSound("Hero_Lich.SinisterGaze.Cast")
	ParticleManager:DestroyParticle(self.nEyesFX, false)
	ParticleManager:ReleaseParticleIndex(self.nEyesFX)
end

--------------------------------------------------------------------------------

modifier_lich_pf_sinister_gaze = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:CanBeFeared()
	local hParent = self:GetParent()

	if not hParent:IsBoss() and not hParent.bAbsoluteNoCC and not hParent.bMotionControlExcluded and hParent:GetUnitName() ~= "npc_dota_creature_bonus_chicken" and not hParent:HasModifier("modifier_boss_timbersaw_chakram_dance") then
		return true
	end

	return false
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:OnCreated(kv)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()
	local nSpireID = kv.nSpireID
	local hSpire = nSpireID and EntIndexToHScript(nSpireID) or nil
	local hFollowedUnit = hSpire and hSpire or hCaster

	local nDistancePct = hAbility:GetSpecialValueFor("destination")

	self.nManaDrain = hAbility:GetSpecialValueFor("mana_drain")
	self.nDistance = (hParent:GetOrigin() - hFollowedUnit:GetOrigin()):Length2D() * nDistancePct / 100

	self.nMoveSpeed = self.nDistance / self:GetDuration()

	if self:CanBeFeared() then
		hParent:MoveToNPC(hFollowedUnit)

		local nGazeFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_gaze.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
		ParticleManager:SetParticleControlEnt(nGazeFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nGazeFX, 2, hCaster, PATTACH_POINT_FOLLOW, "attach_portrait", Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nGazeFX, 3, hCaster, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
		ParticleManager:SetParticleControlEnt(nGazeFX, 10, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
		self:AddParticle(nGazeFX, false, false, -1, false, false)
	end

	if hCaster:HasShard("aghsfort_special_lich_sinister_gaze_raises_skeletons") then
		Timers:CreateTimer(RandomFloat(0, 0.3), function()
			self:RaiseSkeleton()
		end)
	end

	self:StartIntervalThink(0.1)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:RaiseSkeleton()
	if not self or self:IsNull() then return end
	local hCaster = self:GetCaster()
	local hSkeleton = CreateUnitByName("npc_dota_aghsfort_lich_skeleton_warrior", self:GetParent():GetOrigin() + RandomVector(200), true, hCaster, hCaster, hCaster:GetTeamNumber())

	hSkeleton:AddNewModifier(hCaster, self:GetAbility(), "modifier_lich_pf_sinister_gaze_summon", {duration = hCaster:FindTalentValue("aghsfort_special_lich_sinister_gaze_raises_skeletons", "skeleton_duration")})

	hSkeleton:SetOwner(hCaster:GetPlayerOwner())

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/neutral_fx/skeleton_spawn.vpcf", PATTACH_ABSORIGIN, hSkeleton)
	)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:OnIntervalThink()
	if not self:GetAbility():IsChanneling() then self:Destroy() end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	if self:GetAbility().tFearedTargets then
		for _, hEnemy in pairs(self:GetAbility().tFearedTargets) do
			if hEnemy == hParent then
				table.remove(self:GetAbility().tFearedTargets, _)
			end
		end
	end

	hParent:StopSound("Hero_Lich.SinisterGaze.Target")

	if self:CanBeFeared() then
		hParent:Interrupt()
		GridNav:DestroyTreesAroundPoint(hParent:GetOrigin(), 200, true)
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:CheckState()
	local state = {}
	local hParent = self:GetParent()

	if self:CanBeFeared() then
		return {
			[MODIFIER_STATE_FEARED] = true,
			[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
			[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
		}
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:DeclareFunctions()
	local hParent = self:GetParent()
	if self:CanBeFeared() then
		return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:GetModifierMoveSpeed_Absolute()
	local hParent = self:GetParent()
	if self:CanBeFeared() then
		return self.nMoveSpeed
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:GetStatusEffectName()
	local hParent = self:GetParent()
	if self:CanBeFeared() then
		return "particles/status_fx/status_effect_lich_gaze.vpcf"
	end
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_lich_pf_sinister_gaze_summon = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze_summon:OnCreated()
	self.nDamageAmp = self:GetAbility():GetSpecialValueFor("mana_drain")
	if IsClient() then return end
	self:StartIntervalThink(0.5)
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze_summon:OnDestroy()
	if IsClient() then return end
	self:GetParent():ForceKill(false)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze_summon:OnIntervalThink()
	local hParent = self:GetParent()

	if hParent:GetAggroTarget() then return end

	local hEnemies = FindUnitsInRadius(hParent:GetTeam(), hParent:GetOrigin(), nil, 2000, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)

	if #hEnemies < 1 then return end

	ExecuteOrderFromTable({
		UnitIndex = hParent:entindex(),
		OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
		TargetIndex = hEnemies[1]:entindex(),
		Queue = false,
	})
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze_summon:DeclareFunctions()
	return {MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze_summon:CheckState()
	return {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_UNTARGETABLE_ENEMY] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true
	}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_sinister_gaze_summon:GetModifierBaseDamageOutgoing_Percentage()
	return self.nDamageAmp
end

--------------------------------------------------------------------------------

modifier_lich_pf_ice_spire = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire:IsAura()				return true end
function modifier_lich_pf_ice_spire:GetAuraSearchTeam() 	return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_lich_pf_ice_spire:GetAuraSearchType() 	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP end
function modifier_lich_pf_ice_spire:GetModifierAura() 		return "modifier_lich_pf_ice_spire_debuff" end
function modifier_lich_pf_ice_spire:GetAuraRadius() 		return self.nRadius end
function modifier_lich_pf_ice_spire:IsPurgable() 			return false end
function modifier_lich_pf_ice_spire:IsHidden()				return true end

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire:OnCreated()
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nRadius = hAbility:GetSpecialValueFor("aoe")

	local nSpireFX = ParticleManager:CreateParticle("particles/units/heroes/hero_lich/lich_ice_spire.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControlEnt(nSpireFX, 1, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nSpireFX, 2, hParent, PATTACH_POINT_FOLLOW, "attach_top", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nSpireFX, 3, hParent, PATTACH_POINT_FOLLOW, "attach_bot", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControl(nSpireFX, 5, Vector(self.nRadius, self.nRadius, self.nRadius))
	self:AddParticle(nSpireFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire:OnDestroy()
	if IsClient() then return end
	self:GetParent():ForceKill(false)
end


--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire:CheckState()
	return {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_UNTARGETABLE_ENEMY] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true
	}
end

--------------------------------------------------------------------------------

modifier_lich_pf_ice_spire_debuff = class({})

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire_debuff:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire_debuff:OnCreated()
	self.nMoveSlow = self:GetCaster():FindTalentValue("aghsfort_special_lich_sinister_gaze_spawns_ice_spire", "bonus_movespeed")
end

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire_debuff:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_lich_pf_ice_spire_debuff:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end
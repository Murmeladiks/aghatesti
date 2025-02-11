if pf_skeleton_king_vampiric_aura == nil then pf_skeleton_king_vampiric_aura = class({}) end

-----------------------------------------------------------------------------------------------------------

LinkLuaModifier("modifier_pf_skeleton_king_vampiric_aura", 			"abilities/creatures/pf_skeleton_king_vampiric_aura", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_skeleton_king_vampiric_aura_buff", 	"abilities/creatures/pf_skeleton_king_vampiric_aura", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pf_skeleton_king_vampiric_aura_skeleton", "abilities/creatures/pf_skeleton_king_vampiric_aura", LUA_MODIFIER_MOTION_NONE)

-----------------------------------------------------------------------------------------------------------

function pf_skeleton_king_vampiric_aura:GetIntrinsicModifierName()
	return "modifier_pf_skeleton_king_vampiric_aura" 
end

-----------------------------------------------------------------------------------------------------------

function pf_skeleton_king_vampiric_aura:OnSpellStart()
	local hCaster = self:GetCaster()
	local hChargesModifier = hCaster:FindModifierByName("modifier_pf_skeleton_king_vampiric_aura")

	if not hChargesModifier or hChargesModifier:GetStackCount() < 1 then return end

	local nCharges = hChargesModifier:GetStackCount()
	local nDelay = self:GetSpecialValueFor("spawn_interval")
	local nSkeleonDuration = self:GetSpecialValueFor("skeleton_duration")
	local sSkeletonName = "npc_dota_pf_wraith_king_skeleton_warrior"

	hChargesModifier:SetStackCount(0)

	for i = 0, nCharges - 1 do
		Timers:CreateTimer(i * nDelay, function()
			local hSkeleton = CreateUnitByName(
				sSkeletonName,
				hCaster:GetAbsOrigin() + RandomVector(RandomFloat(100, 150)),
				true,
				hCaster,
				hCaster,
				hCaster:GetTeamNumber()
			)

			ParticleManager:ReleaseParticleIndex(
				ParticleManager:CreateParticle("particles/neutral_fx/skeleton_spawn.vpcf", PATTACH_ABSORIGIN_FOLLOW, hSkeleton)
			)

			hSkeleton:SetOwner(hCaster)
			hSkeleton:AddNewModifier(hCaster, self, "modifier_pf_skeleton_king_vampiric_aura_skeleton", {duration = nSkeleonDuration, reincarnate = 1})
		end)
	end
end

-----------------------------------------------------------------------------------------------------------

if modifier_pf_skeleton_king_vampiric_aura == nil then modifier_pf_skeleton_king_vampiric_aura = class({}) end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura:IsPurgable()	        return false end
--[[function modifier_pf_skeleton_king_vampiric_aura:IsAura()               return true end
function modifier_pf_skeleton_king_vampiric_aura:IsAuraActiveOnDeath()	return false end
function modifier_pf_skeleton_king_vampiric_aura:GetAuraRadius()       	return self.nRadius end
function modifier_pf_skeleton_king_vampiric_aura:GetAuraSearchFlags()	return DOTA_UNIT_TARGET_FLAG_INVULNERABLE end
function modifier_pf_skeleton_king_vampiric_aura:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_pf_skeleton_king_vampiric_aura:GetAuraSearchType()   	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_pf_skeleton_king_vampiric_aura:GetModifierAura()   	return "modifier_pf_skeleton_king_vampiric_aura_buff" end
function modifier_pf_skeleton_king_vampiric_aura:GetAuraEntityReject(hEntity)
	return (hEntity == self:GetCaster() or hEntity:GetUnitName() == "npc_dota_pf_wraith_king_skeleton_warrior") and false or true
end]]

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura:OnCreated()
	local hAbility = self:GetAbility()

	self.nRadius = hAbility:GetSpecialValueFor("vampiric_aura_radius")
    self.nMaxCharges = hAbility:GetSpecialValueFor("max_skeleton_charges")
	self.nLifesteal = hAbility:GetSpecialValueFor("vampiric_aura") / 100

	if not IsServer() then return end
	self:StartIntervalThink(1)
end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura:OnIntervalThink()
	if self:GetStackCount() < self.nMaxCharges then
		self:IncrementStackCount()
	end
end

function modifier_pf_skeleton_king_vampiric_aura:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura:OnAttackLanded( params )
	if not IsServer() then return end
	local hAttacker = params.attacker
	local hTarget = params.target
	local flDamage = params.damage
	local nCategory = params.damage_category
	local hAbility = self:GetAbility()

	if hAttacker ~= self:GetParent() or not hTarget or hAttacker == hTarget or not hAbility then
		return 0
	end

	if hTarget:IsBuilding() or hTarget:IsOther() or nCategory ~= DOTA_DAMAGE_CATEGORY_ATTACK then
		return 0
	end

	hAttacker:HealWithParams(flDamage * self.nLifesteal, hAbility, true, true, self:GetCaster(), false)
	ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker))
end

-----------------------------------------------------------------------------------------------------------

--[[if modifier_pf_skeleton_king_vampiric_aura_buff == nil then modifier_pf_skeleton_king_vampiric_aura_buff = class({}) end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_buff:IsPurgable()	return false end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_buff:OnCreated()
	local hAbility = self:GetAbility()

	self.nLifesteal = hAbility:GetSpecialValueFor("vampiric_aura") / 100
end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_buff:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end

-----------------------------------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_buff:OnAttackLanded( params )
	if not IsServer() then return end
	local hAttacker = params.attacker
	local hTarget = params.target
	local flDamage = params.damage
	local nCategory = params.damage_category
	local hAbility = self:GetAbility()

	if hAttacker ~= self:GetParent() or not hTarget or hAttacker == hTarget or not hAbility then
		return 0
	end

	if hTarget:IsBuilding() or hTarget:IsOther() or nCategory ~= DOTA_DAMAGE_CATEGORY_ATTACK then
		return 0
	end

	hAttacker:HealWithParams(flDamage * self.nLifesteal, hAbility, true, true, self:GetCaster(), false)
	ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker))
end]]


modifier_pf_skeleton_king_vampiric_aura_skeleton = class({})

--------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_skeleton:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_skeleton:OnCreated(kv)
	if not IsServer() then return end
	local hAbility = self:GetAbility()

	self:StartIntervalThink(5)
	self:OnIntervalThink()
	
	self.bReincarnate = kv.reincarnate

	if not self.bReincarnate or self.bReincarnate == 0 then return end

	self.nReincarnationTime = self:GetAbility():GetSpecialValueFor("reincarnate_time")
	self.nSkeleonDuration = self:GetAbility():GetSpecialValueFor("skeleton_duration")
end

--------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_skeleton:OnIntervalThink()
	local heroes = FindRealLivingEnemyHeroesInRadius( DOTA_TEAM_BADGUYS, GameRules.Aghanim:GetCurrentRoom():GetOrigin(), 5000 )
	if #heroes > 0 then
		local hero = heroes[RandomInt(1, #heroes)]
		if hero ~= nil then
			--printf( "Set initial goal entity for unit \"%s\" to \"%s\"", hSpawnedUnit:GetUnitName(), hero:GetUnitName() )
			self:GetParent():SetInitialGoalEntity( hero )
		end
	end
end

--------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_skeleton:OnDestroy()
	if not IsServer() then return end
	local hParent = self:GetParent()

	if hParent:IsAlive() then hParent:ForceKill(false) end

	if not self.bReincarnate or self.bReincarnate == 0 then return end

	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()
	local vOrigin = hParent:GetAbsOrigin()
	local nSkeleonDuration = self.nSkeleonDuration

	Timers:CreateTimer(self.nReincarnationTime, function()
		local hSkeleton = CreateUnitByName(
			"npc_dota_pf_wraith_king_skeleton_warrior",
			vOrigin,
			true,
			hCaster,
			hCaster,
			DOTA_TEAM_BADGUYS
		)

		ParticleManager:ReleaseParticleIndex(
			ParticleManager:CreateParticle("particles/neutral_fx/skeleton_spawn.vpcf", PATTACH_ABSORIGIN_FOLLOW, hSkeleton)
		)

		if hCaster then hSkeleton:SetOwner(hCaster) end
		hSkeleton:AddNewModifier(hCaster, self, "modifier_pf_skeleton_king_vampiric_aura_skeleton", {duration = nSkeleonDuration})
	end)
end

--------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_skeleton:DeclareFunctions()
	return {MODIFIER_PROPERTY_LIFETIME_FRACTION}
end

--------------------------------------------------------------------------------

function modifier_pf_skeleton_king_vampiric_aura_skeleton:GetUnitLifetimeFraction( params )
	return self:GetRemainingTime() / self:GetDuration()
end

function modifier_pf_skeleton_king_vampiric_aura_skeleton:GetTexture()	
	return "skeleton_king_vampiric_aura"
end
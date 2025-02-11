medusa_stone_gaze_lua = class({})
LinkLuaModifier("modifier_medusa_petrified_lua", "heroes/medusa/modifier_medusa_petrified_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_petrified_status_lua", "heroes/medusa/modifier_medusa_petrified_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_stone_gaze_shatter_victim", "heroes/medusa/medusa_stone_gaze/modifier_stone_gaze_shatter_victim", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_gaze_lua", "heroes/medusa/medusa_stone_gaze/modifier_medusa_stone_gaze_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_gaze_cd", "heroes/medusa/medusa_stone_gaze/medusa_stone_gaze_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_gaze_active", "heroes/medusa/medusa_stone_gaze/modifier_medusa_stone_gaze_active", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_gaze_debuff_lua", "heroes/medusa/medusa_stone_gaze/modifier_medusa_stone_gaze_debuff_lua", LUA_MODIFIER_MOTION_NONE)

function medusa_stone_gaze_lua:GetIntrinsicModifierName()
	return "modifier_medusa_stone_gaze_lua"
end

function medusa_stone_gaze_lua:Spawn() self:UpdateValues() end
function medusa_stone_gaze_lua:OnUpgrade() self:UpdateValues() end

function medusa_stone_gaze_lua:UpdateValues()
	local level = self:GetLevel()
	if level == 0 then level = 1 end

	self.physical_bonus = self:GetSpecialValueFor("bonus_physical_damage")
end

function medusa_stone_gaze_lua:OnSpellStart()
	if not IsServer() then return end
	self:UpdateValues()

	local caster = self:GetCaster()

	local duration = self:GetSpecialValueFor("duration") + caster:FindTalentValue("special_bonus_unique_medusa")

	caster:AddNewModifier(caster, self, "modifier_medusa_stone_gaze_active", {
		duration = duration
	})
end

function medusa_stone_gaze_lua:Petrify(target, duration, source)
	local petrify_controller = target:FindModifierByName("modifier_medusa_petrified_lua")
	if not petrify_controller then
		petrify_controller = target:AddNewModifier(self:GetCaster(), self, "modifier_medusa_petrified_lua", {
			physical_bonus = self.physical_bonus
		})
	end
	-- double-checking for modifier cause AddNewModifier may fail if unit dies / goes invulnerable etc
	if petrify_controller and not petrify_controller:IsNull() then
		petrify_controller:FromSource(source, duration)
	end
end


function medusa_stone_gaze_lua:RemoveSource(target, source)
	if not target or target:IsNull() then return end
	local petrify_controller = target:FindModifierByName("modifier_medusa_petrified_lua")
	if not petrify_controller then return end

	petrify_controller:RemoveSource(source)
end


function medusa_stone_gaze_lua:ShatterPetrified(target, petrify_duration)
	if not target or target:IsNull() then return end
	if not self.explosion_shard then --[[print("[Stone Gaze] no explosion shard in Shatter callback, something gone wrong!")]] end

	local caster = self:GetCaster()
	local shatter_radius = self.explosion_shard:GetSpecialValueFor("shatter_radius")

	local target_location = target:GetAbsOrigin()

	local enemies = FindUnitsInRadius(
		caster:GetTeamNumber(),
		target_location,
		nil,
		shatter_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		0,
		0,
		false
	)
	for _, enemy in pairs(enemies) do
		if enemy and not enemy:IsNull() and enemy:IsAlive() then
			self:Petrify(enemy, petrify_duration, self.explosion_shard)
		end
	end

	local p_id = ParticleManager:CreateParticle("particles/units/heroes/hero_visage/visage_stoneform_blast.vpcf", PATTACH_ABSORIGIN, target)
	ParticleManager:SetParticleControl(p_id, 0, target_location)
	ParticleManager:ReleaseParticleIndex(p_id)

	target:EmitSound("Hero_EarthSpirit.StoneRemnant.Destroy")
end


modifier_medusa_stone_gaze_cd = class({})

function modifier_medusa_stone_gaze_cd:IsHidden() return true end
function modifier_medusa_stone_gaze_cd:IsPurgable() return false end

--[[
Minor Shards:
- +1 Petrify duration
- +5% physical attack damage amplification
- -12% cooldown

+ STONE GAZE SHARD #1: [Gorgon Eyes]
	Stone Gaze now applies passively, petrifying enemy units  in range units that look at Medusa for accumulated time of 6 seconds. 
	The petrification lasts 2 seconds. Each unit can only be petrified by this effect once every 15 seconds. 
	Interval scales with CDR. 
	When activate, Stone Gaze entrance all enemies nearby, forcing them to look at her. 
	Enemies that are turned to stones remain petrified throughout Stone Gaze's duration
    -> the entrance effect is the same as Keeper of The Light's light bulb, but continuous

+ STONE GAZE SHARD #2 [Unlimited Arrowworks]: 
	While Stone Gaze is active medusa gain unlimited splitshot unto all enemies within Stone Gaze radius. 
	Additionally Medusa gains +200 movement speed, +25 attack speed, 
	and the ability to attack while moving.
    -> the attacks are automatic, similar to Windranger's Focus Fire
    -> Medusa gain phased movement during this buff, however she is still bound by the maximum movement speed limit
    -> the extra movement speed need to decay gradually over 2 seconds once the buff end, instead of immediately.

+ STONE GAZE SHARD #3 [Stone Shatter]: 
	If Medusa herself kills a petrified unit, they have a 50% chance to explode, petrifying all enemy units in a 275 radius for the same duration. 
	Medusa's basic attacks deal an additional 2% max health to petrified non-boss enemies. This bonus damage splashes in a 150 radius. 
	-> same grace period mechanic as SPLITSHOT SHARD #3
	-> the % health damage instance is pure and does not get amplified by the petrify debuff 
	-> the splash should be visually denoted with some sort of particle effect. 
		Clearly defined radius visual is not necessary, we simply need to indicate that the attack is splashing in a small AoE
]]

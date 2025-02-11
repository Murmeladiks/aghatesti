modifier_pathfinder_juggernaut_blade_dance = class({})
require("libraries.has_shard")

--------------------------------------------------------------------------------
-- Classifications
function modifier_pathfinder_juggernaut_blade_dance:IsHidden()
	return true
end

function modifier_pathfinder_juggernaut_blade_dance:IsPurgable()
	return false
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:OnCreated( kv )
	self.crit_chance = self:GetAbility():GetLevelSpecialValueFor( "blade_dance_crit_chance", self:GetAbility():GetLevel() - 1 )
	self.crit_mult = self:GetAbility():GetLevelSpecialValueFor( "blade_dance_crit_mult", self:GetAbility():GetLevel() - 1 )

	local caster = self:GetCaster()
	if not caster or caster:IsNull() then return end
	if caster:IsIllusion() then return end
	caster.illusions = caster.illusions or {}
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:OnRefresh( kv )
	self.crit_chance = self:GetAbility():GetLevelSpecialValueFor( "blade_dance_crit_chance", self:GetAbility():GetLevel() - 1 )
	self.crit_mult = self:GetAbility():GetLevelSpecialValueFor( "blade_dance_crit_mult", self:GetAbility():GetLevel() - 1 )
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
	}
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:GetModifierPreAttack_CriticalStrike( params )
	if IsServer() and (not self:GetParent():PassivesDisabled()) then
		if params.target:GetTeamNumber() == self:GetParent():GetTeamNumber() then
			return
		end

		-- Throw dice
		if RandomInt(0, 100) < self.crit_chance then
			self.record = params.record
			
			return self.crit_mult
		end
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:GetModifierProcAttack_Feedback( params )
	if not IsServer() or not self.record or self.record ~= params.record then return end

	self.record = nil

	local illusion_shard_name = "pathfinder_special_juggernaut_blade_dance_illusion"
	local caster = self:GetCaster()
	local ability = self:GetAbility()

	if HasShard(caster, illusion_shard_name) then
		self:CheckAndClearIllusions()

		local illusion_ability = caster:FindAbilityByName(illusion_shard_name)
		local illusion_number = illusion_ability:GetSpecialValueFor("illusion_number")
		local hero = PlayerResource:GetSelectedHeroEntity(caster:GetPlayerOwnerID())

		-- Only first 2 generations of illusion can spawn illusion to prevent infinite cycle
		if (not caster:IsIllusion() or (caster.generation and caster.generation <= 2)) and #hero.illusions < illusion_number then
			local modifierKeys = {}
			modifierKeys.outgoing_damage = -60--40
			modifierKeys.incoming_damage = 140
			modifierKeys.duration = illusion_ability:GetSpecialValueFor("illusion_duration")

			local illusion = CreateIllusions( caster, caster, modifierKeys, 1, caster:GetHullRadius(), true, true)[1]
			table.insert(hero.illusions, illusion)
			illusion:AddNewModifier(caster, ability, "modifier_phantom_lancer_juxtapose_illusion", {})
			illusion:AddNewModifier(caster, nil, "modifier_phased", {})
			illusion:AddNewModifier(caster, nil, "modifier_no_healthbar", {})
			illusion:SetControllableByPlayer(-1, true)

			local caster_gen = not caster:IsIllusion() and 0 or caster.generation or 1
			illusion.blade_dance_illusion = true
			illusion.generation = caster_gen + 1

			illusion:AddAbility(illusion_shard_name):SetLevel(1)
		end
	end

	if HasShard(caster, "pathfinder_special_juggernaut_blade_dance_reduce_omnislash_cooldown") then
		local omnislash = caster:FindAbilityByName("pathfinder_juggernaut_omni_slash")
		local cd_spell = caster:FindAbilityByName("pathfinder_special_juggernaut_blade_dance_reduce_omnislash_cooldown")
		if omnislash:GetCooldownTimeRemaining() > cd_spell:GetSpecialValueFor("seconds") then
			local cd = omnislash:GetCooldownTimeRemaining()
			omnislash:EndCooldown()
			omnislash:StartCooldown(cd - cd_spell:GetSpecialValueFor("seconds"))
		end
	end

	EmitSoundOn("Hero_Juggernaut.BladeDance", params.target)
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:CheckAndClearIllusions()
	local caster = self:GetCaster()
	local ability = self:GetAbility()

	local hero = PlayerResource:GetSelectedHeroEntity(caster:GetPlayerOwnerID())
	if caster ~= hero then return end
	

	for _, illusion in pairs(hero.illusions) do
		if self:IsInvalidIllusion(illusion) then
			table.remove(hero.illusions, _)
			if (illusion) then UTIL_Remove(illusion) end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_juggernaut_blade_dance:IsInvalidIllusion(illusion)
	return not illusion or illusion:IsNull() or not illusion:IsAlive()
end
pathfinder_nevermore_dark_lord = pathfinder_nevermore_dark_lord or class({})

--------------------------------------------------------------------------------

LinkLuaModifier("modifier_pathfinder_dark_lord_aura", "heroes/shadow_fiend/pathfinder_nevermore_dark_lord", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pathfinder_dark_lord_debuff", "heroes/shadow_fiend/pathfinder_nevermore_dark_lord", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_nevermore_dark_lord_raze", "heroes/shadow_fiend/pathfinder_nevermore_dark_lord", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

function pathfinder_nevermore_dark_lord:GetAbilityTextureName()
	return self:GetAbilityTextureNameFromParticle("particles/units/heroes/hero_nevermore/nevermore_death.vpcf")
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_dark_lord:GetIntrinsicModifierName()
	return "modifier_pathfinder_dark_lord_aura"
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_dark_lord:GetCastRange(vLocation, hTarget)
	return self:GetSpecialValueFor("aura_radius")
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_dark_lord:GetBehavior()
	local raze_shard = self:GetCaster():FindAbilityByName("pathfinder_nevermore_special_dark_lord_raze")
	if raze_shard and not raze_shard:IsNull() then
		return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_TOGGLE + DOTA_ABILITY_BEHAVIOR_IGNORE_CHANNEL
	end
	return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

--------------------------------------------------------------------------------

function pathfinder_nevermore_dark_lord:OnToggle()
end

--------------------------------------------------------------------------------

modifier_pathfinder_dark_lord_aura = modifier_pathfinder_dark_lord_aura or class({})

function modifier_pathfinder_dark_lord_aura:AllowIllusionDuplicate() return true end
function modifier_pathfinder_dark_lord_aura:IsHidden() 				return self:GetStackCount() < 1 end
function modifier_pathfinder_dark_lord_aura:IsPurgable() 			return false end
function modifier_pathfinder_dark_lord_aura:IsAura()				return not self:GetCaster():PassivesDisabled() end
function modifier_pathfinder_dark_lord_aura:GetAuraRadius() 		return self:GetAbility():GetSpecialValueFor("aura_radius") end
function modifier_pathfinder_dark_lord_aura:GetAuraSearchFlags()	return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES end
function modifier_pathfinder_dark_lord_aura:GetAuraSearchType() 	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_pathfinder_dark_lord_aura:GetModifierAura() 		return "modifier_pathfinder_dark_lord_debuff" end
function modifier_pathfinder_dark_lord_aura:DestroyOnExpire()		return false end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:GetAuraSearchTeam()
	if self:GetCaster():HasShard("pathfinder_nevermore_special_dark_lord_friendly") then
		return DOTA_UNIT_TARGET_TEAM_BOTH
	else
		return DOTA_UNIT_TARGET_TEAM_ENEMY
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:OnCreated()
	self.caster = self:GetCaster()
	self.ability = self:GetAbility()


	if IsClient() then return end
	self:StartIntervalThink(1)
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:OnIntervalThink()
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	if hCaster:HasShard("pathfinder_nevermore_special_dark_lord_raze") and hAbility:GetToggleState() then			
		local souls_cost = hCaster:FindTalentValue("pathfinder_nevermore_special_dark_lord_raze", "soul_cost")
		local necromastery_modifier = hCaster:FindModifierByName("modifier_pathfinder_necromastery_souls")
		local hRazeAbility = hCaster:FindAbilityByName("pathfinder_nevermore_shadowraze_far")

		if necromastery_modifier and necromastery_modifier:GetStackCount() >= souls_cost and hRazeAbility:GetLevel() > 0 then										
			local enemies = FindRadius(hCaster, hAbility:GetLevelSpecialValueFor("aura_radius",1),true)
			if #enemies > 0 then
				necromastery_modifier:RemoveNecromasterySouls(souls_cost)
				hCaster.CastShadowRazeOnPoint(hCaster, hRazeAbility, enemies[1]:GetAbsOrigin(), hRazeAbility:GetSpecialValueFor("radius"))						
				hCaster:EmitSound("Hero_Nevermore.Shadowraze")
			end
		else
			hAbility:ToggleAbility()
		end	
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:DeclareFunctions()
    return {
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:OnAttack(keys)
	if not IsServer() then return end
	if not keys.attacker or keys.attacker:IsNull() or keys.attacker ~= self:GetParent() then return end
	if not self:GetParent() or self:GetParent():IsNull() then return end
	if not keys.target or keys.target:IsNull() or keys.target:GetTeamNumber() == self:GetParent():GetTeamNumber() then return end
	if not self:GetAbility() or self:GetAbility():IsNull() then return end

	local special = self:GetParent():FindAbilityByName("pathfinder_nevermore_special_dark_lord_split_attack") 
	
	if special and not special:IsNull() and not keys.no_attack_cooldown and not self:GetParent():PassivesDisabled() and self:GetAbility():IsTrained() then	
		local enemies = FindRadius(self:GetCaster(), self:GetAbility():GetLevelSpecialValueFor("aura_radius", self:GetAbility():GetLevel() -1),true)
		
		local target_number = special:GetLevelSpecialValueFor("target_number", 1)			
		
		for _, enemy in pairs(enemies) do
			if enemy ~= keys.target then
				self.split_shot_target = true
				
				self:GetParent():PerformAttack(enemy, false, true, true, true, true, false, false)
				
				self.split_shot_target = false
				
				target_number = target_number - 1
				
				if target_number <= 0 then
					break
				end
			end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:OnAttackLanded(keys)
	if IsServer() then		
		local attacker = keys.attacker
		local target = keys.target
		
		if self:GetParent() ~= attacker or self:GetParent() == target then
			return
		elseif self:GetParent():PassivesDisabled() then
			return
		end
		
		if IsServer() and attacker:HasAbility("pathfinder_nevermore_special_requiem_attack") and target:HasModifier("modifier_pathfinder_dark_lord_debuff") then
			local special = attacker:FindAbilityByName("pathfinder_nevermore_special_requiem_attack")
			if not attacker:HasModifier("modifier_pathfinder_requiem_attack") then
				attacker:AddNewModifier(attacker, ability, "modifier_pathfinder_requiem_attack", {})
			end
			for i=1,special:GetLevelSpecialValueFor("stacks_per_hit",1) do			
				local mod = attacker:FindModifierByName("modifier_pathfinder_requiem_attack")
				if mod then
					mod:IncrementStackCount()			
					mod:ForceRefresh()
				end
			end
		end
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_aura:GetModifierDamageOutgoing_Percentage()
	if not IsServer() then return end
	if self.split_shot_target then
		return self:GetCaster():FindTalentValue("pathfinder_nevermore_special_dark_lord_split_attack", "damage_percent")
	else
		return 0
	end
end

--------------------------------------------------------------------------------

modifier_pathfinder_dark_lord_debuff = modifier_pathfinder_dark_lord_debuff or class({})

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:OnCreated()
	-- Ability properties
	self.caster = self:GetCaster()
	self.ability = self:GetAbility()

	-- Ability specials
	self.armor_reduction = self.ability:GetSpecialValueFor("armor_reduction")
	self.nKillBuffDuration = self.ability:GetSpecialValueFor("kill_buff_duration")
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_EVENT_ON_DEATH
	}
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:OnDeath(event)
	if IsClient() or self.nKillBuffDuration < 1 or event.unit ~= self:GetParent() or not self:GetParent():IsConsideredHero() then return end

	local hCaster = self:GetCaster()

	local hAura = hCaster:FindModifierByName("modifier_pathfinder_dark_lord_aura")
	
	if not hAura then return end
	local nStackPerKill = self.ability:GetSpecialValueFor("bonus_armor_per_stack")

	hAura:SetStackCount(hAura:GetStackCount() + nStackPerKill)
	hAura:SetDuration(self.nKillBuffDuration, true)
	Timers:CreateTimer(self.nKillBuffDuration, function()
		if hAura and not hAura:IsNull() then
			hAura:SetStackCount(hAura:GetStackCount() - nStackPerKill)
		end
	end)
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:GetModifierPhysicalArmorBonus()
	local hCaster = self:GetCaster()
	local total_armor_reduction = self.armor_reduction

	if hCaster:HasModifier("modifier_pathfinder_dark_lord_aura") then
		total_armor_reduction = total_armor_reduction + hCaster:GetModifierStackCount("modifier_pathfinder_dark_lord_aura", hCaster)
	end

	if self:GetParent():GetTeamNumber() ~= DOTA_TEAM_GOODGUYS then
		return total_armor_reduction * (-1)
	else
		return total_armor_reduction
	end
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:GetEffectName()	
	return "particles/units/heroes/hero_nevermore/nevermore_shadowraze_debuff_ground_embers.vpcf"
end

--------------------------------------------------------------------------------

function modifier_pathfinder_dark_lord_debuff:GetEffectAttachType()	
	return PATTACH_ABSORIGIN_FOLLOW
end
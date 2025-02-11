medusa_split_shot_lua = class({})
LinkLuaModifier("modifier_medusa_split_shot_lua", "heroes/medusa/medusa_split_shot/modifier_medusa_split_shot_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_curse_of_endless_torment_victim", "heroes/medusa/medusa_split_shot/modifier_curse_of_endless_torment_victim", LUA_MODIFIER_MOTION_NONE)

medusa_split_shot_lua.base_behavior = DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_TOGGLE + DOTA_ABILITY_BEHAVIOR_IMMEDIATE

function medusa_split_shot_lua:ProcsMagicStick() return false end

function medusa_split_shot_lua:GetIntrinsicModifierName()
	return "modifier_medusa_split_shot_lua"
end

function medusa_split_shot_lua:GetBehavior()
	if self:GetCaster():HasTalent("pathfinder_medusa_split_shot_bewitched_barrage") then
		return self.base_behavior + DOTA_ABILITY_BEHAVIOR_AUTOCAST
	end
	return self.base_behavior
end

function medusa_split_shot_lua:OnOwnerSpawned()
	if not IsServer() then return end
	
	if self.toggle_state then
		self:ToggleAbility()
	end
end

function medusa_split_shot_lua:OnOwnerDied()
	self.toggle_state = self:GetToggleState()
end

function medusa_split_shot_lua:Spawn()
	if not IsServer() then return end
	Timers:CreateTimer(0.1, function()
		-- refresh intrinsic here will apply modifier of level 0 for other stuff to work properly
		self:RefreshIntrinsicModifier()
	end)
end

function medusa_split_shot_lua:OnToggle()
	-- pass
end

-- follow caster toggle and auto-cast states for illusions
function medusa_split_shot_lua:GetToggleState()
	if not IsServer() then return self.BaseClass.GetToggleState(self) end
	local caster = self:GetCaster()
	if caster:IsIllusion() then
		local owner_hero = PlayerResource:GetSelectedHeroEntity(caster:GetPlayerOwnerID())
		if not owner_hero or owner_hero:IsNull() then return end
		local split_shot = owner_hero:FindAbilityByName("medusa_split_shot_lua")
		if not split_shot or split_shot:IsNull() then return end

		return split_shot:GetToggleState()
	else
		return self.BaseClass.GetToggleState(self)
	end
end

function medusa_split_shot_lua:GetAutoCastState()
	if not IsServer() then return self.BaseClass.GetAutoCastState(self) end
	local caster = self:GetCaster()
	if caster:IsIllusion() then
		local owner_hero = PlayerResource:GetSelectedHeroEntity(caster:GetPlayerOwnerID())
		if not owner_hero or owner_hero:IsNull() then return end
		local split_shot = owner_hero:FindAbilityByName("medusa_split_shot_lua")
		if not split_shot or split_shot:IsNull() then return end

		return split_shot:GetAutoCastState()
	else
		return self.BaseClass.GetAutoCastState(self)
	end
end

--[[
Minor Shards:
- +8% Outgoing Damage
- +75 Secondary Arrows Search Range
- +1 Attack Target.


Legendary Shards:

+ Snake-Oiled Enhancement: 
	Each of Medusa's attack projectile has a 5% pseudo-random chance to instead be the current level of Mystic Snake

+ Bewitched Barrage: 
	Medusa passively petrify any foes that have been hit by her attacks 16 times for 1 seconds. 
	Splitshot can have autocast enabled to direct all secondary arrows to the primary target. 
	Secondary arrows deal 50% of their usual damage while this is active.
	-> the secondary arrows directed to the main target should have a tiny delay similar to Echo Sabre attacks
	-> if possible uses a different attack projectile (mirana/windrunner/drow) for the secondary arrows
	
+ Curse of The Endless Torment: 
	Enemies killed by medusa has a 25% chance to spawn a Gorgon Pole. 
	Each gorgon pole will fire a single secondary arrow toward a nearby enemy whenever Medusa attacks, prioritizing Medusa's target. 
	Gorgon poles are destroyed after firing 20 attacks.
	-> Gorgon Pole's attack radius is the same as Medusa's
	-> Enemies killed by Gorgon Pole can spawn additional poles
	-> Enemies damaged by Medusa receives a modifier that last 1.5s. 
		This modifier rolls the chance for a gorgon pole spawn on parent death. 
		This way there's a grace period and Medusa doesnt have to actually land the last hit, and make for smoother gameplay.

Related Talents:
+ - Level 25: Split Shot secondary arrows apply on-hit modifiers on targets.
]]

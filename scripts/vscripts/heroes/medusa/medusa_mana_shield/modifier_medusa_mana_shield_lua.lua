modifier_medusa_mana_shield_lua = class({})

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:OnCreated()
	self:OnRefresh()

	if IsServer() then 
		self:StartIntervalThink(5)
		self:OnIntervalThink() 
	end
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:OnRefresh()
	self.ability = self:GetAbility()
	self.parent = self:GetParent()

	self.damage_per_mana = self.parent:IsIllusion() and self.ability:GetSpecialValueFor("illusion_damage_per_mana") or self.ability:GetSpecialValueFor("damage_per_mana")
	self.absorb_pct = self.ability:GetSpecialValueFor("absorption_pct") / 100

	self.is_illusion = self.parent:IsIllusion()

	self.impact_particle = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_medusa/medusa_mana_shield_impact.vpcf", self.parent)
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
		MODIFIER_PROPERTY_MIN_HEALTH,
	}
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:GetEffectName()
	return "particles/units/heroes/hero_medusa/medusa_mana_shield.vpcf"
end

--------------------------------------------------------------------------------

if not IsServer() then return end

-- Dazzle grave-like effect when we have stone form shard that haven't proced
-- to ensure it actually procs in time
function modifier_medusa_mana_shield_lua:GetMinHealth()
	if self.stone_form_shard and not self.parent:HasModifier("modifier_medusa_stone_form_cd") then
		return 1
	end
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:GetModifierIncomingDamage_Percentage(params)
	local mana_dome_modifier = self.parent:FindModifierByName("modifier_medusa_mana_dome_effect")
	local absorb_pct = self.absorb_pct + (mana_dome_modifier and mana_dome_modifier.bonus_damage_absorbtion or 0)

	local mana_to_block	= params.original_damage * absorb_pct / self.damage_per_mana
	local mana_spent = math.min(mana_to_block, self.parent:GetMana())
	self.parent:Script_ReduceMana(mana_spent, self.ability)
	
	self:_OnImpact()

	self.parent:EmitSound("Hero_Medusa.ManaShield.Proc")
	local shield_particle = ParticleManager:CreateParticle(self.impact_particle, PATTACH_ABSORIGIN_FOLLOW, self.parent)
	ParticleManager:ReleaseParticleIndex(shield_particle)

	return 100 * absorb_pct * (mana_spent / mana_to_block) * (-1)
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:_OnImpact()
	if self.stone_form_shard and self.stone_form_threshold then
		if self.parent:GetHealthPercent() <= self.stone_form_threshold 
		or self.parent:GetManaPercent() <= self.stone_form_threshold then
			self:_ProcStoneForm()
		end
	end
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:OnIntervalThink()
	if self.is_illusion then self:StartIntervalThink(-1) return end
	
	self.stone_form_shard = self.parent:FindAbilityByName("pathfinder_medusa_mana_shield_stone_form")
	if self.stone_form_shard then
		self.stone_form_threshold = self.stone_form_shard:GetSpecialValueFor("proc_threshold")
	end

	-- check for magic shield shard, if it appears, start magic shield cycle
	local magic_shield_shard = self.magic_shield_shard or self.parent:FindAbilityByName("pathfinder_medusa_mana_shield_magic_negation")
	if not self.magic_shield_shard and magic_shield_shard then
		self.magic_shield_shard = magic_shield_shard
		self:_MagicNegation()
	end

	local mana_dome_shard = self.mana_dome_shard or self.parent:FindAbilityByName("pathfinder_medusa_mana_shield_mana_dome")
	if not self.mana_dome_shard and mana_dome_shard then
		self.mana_dome_shard = mana_dome_shard
		self.parent:FindAbilityByName("medusa_mana_dome"):SetHidden(false)
	end

	self:OnRefresh()
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:_ProcStoneForm()
	if not self.stone_form_shard then return end

	if not self.parent:HasModifier("modifier_medusa_stone_form_cd") then
		self.parent:AddNewModifier(self.parent, self.stone_form_shard, "modifier_medusa_stone_form", {
			duration = self.stone_form_shard:GetSpecialValueFor("base_duration")
		})
		Timers:CreateTimer(0.1, function()
			self.parent:AddNewModifier(self.parent, self.stone_form_shard, "modifier_medusa_stone_form_cd", {
				duration = self.stone_form_shard:GetSpecialValueFor("proc_cooldown") - 0.1
			})
		end)
	end
end

--------------------------------------------------------------------------------

function modifier_medusa_mana_shield_lua:_MagicNegation()
	local interval = self.magic_shield_shard:GetSpecialValueFor("shield_interval")
	local duration = self.magic_shield_shard:GetSpecialValueFor("shield_duration")
	local mana_threshold = self.magic_shield_shard:GetSpecialValueFor("mana_threshold")

	Timers:CreateTimer(interval, function()
		if self.parent:HasItemInInventory("item_stonework_pendant") then return interval end
		if self.parent:GetManaPercent() > mana_threshold then return interval end
		self.parent:AddNewModifier(self.parent, self.magic_shield_shard, "modifier_medusa_magic_shield", {duration = duration})
		return interval
	end)
end
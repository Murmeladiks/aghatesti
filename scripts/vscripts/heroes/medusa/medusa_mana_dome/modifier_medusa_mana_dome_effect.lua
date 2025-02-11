modifier_medusa_mana_dome_effect = class({})

if not IsServer() then return end

function modifier_medusa_mana_dome_effect:OnCreated()
	local ability = self:GetAbility()

	self.caster = ability:GetCaster()

	self.mana_shield_mod = self.caster:FindModifierByName("modifier_medusa_mana_shield_lua")
	
	-- used from main mana shield modifier
	self.bonus_damage_absorbtion = ability:GetSpecialValueFor("bonus_damage_absorbtion") / 100
	self.mana_cost_multiplier = ability:GetSpecialValueFor("mana_cost_multiplier") / 100

	self.absorb_pct = self.mana_shield_mod.absorb_pct
	self.damage_per_mana = self.mana_shield_mod.damage_per_mana / self.mana_cost_multiplier
	self.impact_particle = self.mana_shield_mod.impact_particle
	self.ability = self.mana_shield_mod.ability

	self.is_medusa = self.caster == self:GetParent()

	-- increment mana regen modifier, does not work for medusa
	if self.is_medusa then return end

	local caster_effect = self.caster:FindModifierByName("modifier_medusa_mana_dome_self")
	if caster_effect then caster_effect:IncrementStackCount() end
end

if not IsServer() then return end

function modifier_medusa_mana_dome_effect:OnDestroy()
	if self.is_medusa then return end

	local caster_effect = self.caster:FindModifierByName("modifier_medusa_mana_dome_self")
	if caster_effect then caster_effect:DecrementStackCount() end
end


function modifier_medusa_mana_dome_effect:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
	}
end


function modifier_medusa_mana_dome_effect:GetModifierIncomingDamage_Percentage(params)
	if self.is_medusa then return end
	if not self.ability:GetToggleState() then return end

	local mana_to_block	= params.original_damage * self.absorb_pct / self.damage_per_mana
	local mana_spent = math.min(mana_to_block, self.caster:GetMana())
	self.caster:Script_ReduceMana(mana_spent, self.ability)

	self.mana_shield_mod:_OnImpact()

	self.caster:EmitSound("Hero_Medusa.ManaShield.Proc")
	local shield_particle = ParticleManager:CreateParticle(self.impact_particle, PATTACH_ABSORIGIN_FOLLOW, self.caster)
	ParticleManager:ReleaseParticleIndex(shield_particle)

	return 100 * self.absorb_pct * (mana_spent / mana_to_block) * (-1)
end

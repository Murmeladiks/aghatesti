LinkLuaModifier("modifier_item_pf_dagon", "items/item_pf_dagon.lua", LUA_MODIFIER_MOTION_NONE)

------------------------------------------------------------------------------------------------

if item_pf_dagon == nil then item_pf_dagon = class({}) end
item_pf_dagon_2 = item_pf_dagon
item_pf_dagon_3 = item_pf_dagon
item_pf_dagon_4 = item_pf_dagon
item_pf_dagon_5 = item_pf_dagon

------------------------------------------------------------------------------------------------

function item_pf_dagon:Precache(context)
	PrecacheResource("particle", "particles/items_fx/dagon.vpcf", context)
end

------------------------------------------------------------------------------------------------

function item_pf_dagon:GetIntrinsicModifierName()
	return "modifier_item_pf_dagon" 
end

------------------------------------------------------------------------------------------------

function item_pf_dagon:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget = self:GetCursorTarget()
	local nDamage = self:GetSpecialValueFor("damage")

	if hCaster:TriggerSpellAbsorb(self) then
		return
	end

	if hTarget:IsIllusion() then
		hTarget:Kill(self, hCaster)
	else
		ApplyDamage({
			attacker = hCaster,
			victim = hTarget,
			damage = nDamage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self,
		})

		local nHeal = math.floor(math.max(nDamage * self:GetSpecialValueFor("dagon_spell_lifesteal") / 100, 0))
		hCaster:HealWithParams(nHeal, self, false, true, hCaster, true)
	end

	EmitSoundOn("DOTA_Item.Dagon.Activate", hCaster)

	local nEnergyFX = ParticleManager:CreateParticle("particles/items_fx/dagon.vpcf", PATTACH_RENDERORIGIN_FOLLOW, hCaster)
	ParticleManager:SetParticleControlEnt(nEnergyFX, 0, hCaster, PATTACH_POINT_FOLLOW, "attach_attack1", hCaster:GetAbsOrigin(), false)
	ParticleManager:SetParticleControlEnt(nEnergyFX, 1, hTarget, PATTACH_POINT_FOLLOW, "attach_hitloc", hTarget:GetAbsOrigin(), false)
	ParticleManager:SetParticleControl(nEnergyFX, 2, Vector(nDamage, 0, 0))
	ParticleManager:ReleaseParticleIndex(nEnergyFX)
end

------------------------------------------------------------------------------------------

if modifier_item_pf_dagon == nil then modifier_item_pf_dagon = class({}) end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:IsHidden()		return true end
function modifier_item_pf_dagon:IsPurgable()	return false end
function modifier_item_pf_dagon:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:OnCreated()
	local hAbility = self:GetAbility()

	self.nBonusStats = hAbility:GetSpecialValueFor("bonus_stats")
	self.nSpellLifesteal = hAbility:GetSpecialValueFor("passive_spell_lifesteal") / 100
	self.nCreepSpellLifesteal = self.nSpellLifesteal / 5

	if not IsServer() then return end

	for _, hModifier in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
		hModifier:GetAbility():SetSecondaryCharges(_)
	end
end

--------------------------------------------------------------------------------

function modifier_item_pf_dagon:OnDestroy()
	if not IsServer() then return end

	for _, hModifier in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
		hModifier:GetAbility():SetSecondaryCharges(_)
	end
end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_EVENT_ON_TAKEDAMAGE
	}
end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:GetModifierBonusStats_Intellect()
	return self.nBonusStats
end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:GetModifierBonusStats_Strength()
	return self.nBonusStats
end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:GetModifierBonusStats_Agility()
	return self.nBonusStats
end

------------------------------------------------------------------------------------------------

function modifier_item_pf_dagon:OnTakeDamage(event)
	if not IsServer() then return end

	local hAttacker = event.attacker
	local hTarget = event.unit
	local hAbility = event.inflictor
	local nDamage = event.damage
	local nCategory = event.damage_category
	local nFlags = event.damage_flags

	if hAttacker ~= self:GetParent() or hAbility == nil or hTarget == nil or hAttacker == hTarget or hAttacker:IsIllusion() then
		return
	end

	if hTarget:IsBuilding() or hTarget:IsOther() or self:GetAbility():GetSecondaryCharges() ~= 1 then
		return
	end

	if bit.band(nFlags, DOTA_DAMAGE_FLAG_REFLECTION ) == DOTA_DAMAGE_FLAG_REFLECTION or bit.band(nFlags, DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL ) == DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL then
		return
	end

	if nCategory ~= DOTA_DAMAGE_CATEGORY_SPELL then
		return
	end

	local nPctUsed = self.nCreepSpellLifesteal

	if hTarget:IsBoss() or hTarget:IsConsideredHero() then
		nPctUsed = self.nSpellLifesteal
	end

	local nHeal = math.floor(math.max(nDamage * nPctUsed, 0))

	hAttacker:HealWithParams(nHeal, self:GetAbility(), false, true, self:GetCaster(), true)
	ParticleManager:ReleaseParticleIndex(ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hAttacker))
end
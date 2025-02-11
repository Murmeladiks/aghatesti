modifier_medusa_mana_dome = class({})


function modifier_medusa_mana_dome:OnCreated()
	local ability = self:GetAbility()

	self.radius = ability:GetSpecialValueFor("radius")
	self.caster = ability:GetCaster()

	-- particle
	local p_id = ParticleManager:CreateParticle(
		"particles/heroes/medusa/medusa_mana_dome/medusa_mana_dome.vpcf", PATTACH_ABSORIGIN, self:GetParent()
	)
	ParticleManager:SetParticleControl(p_id, 0, self:GetParent():GetAbsOrigin())
	ParticleManager:SetParticleControl(p_id, 1, Vector(self.radius, self.radius, self.radius))

	self:AddParticle(p_id, false, false, 1, false, false)
end


function modifier_medusa_mana_dome:IsDebuff() return false end
function modifier_medusa_mana_dome:IsHidden() return true end
function modifier_medusa_mana_dome:IsPurgable() return false end
function modifier_medusa_mana_dome:GetAttributes() return MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_medusa_mana_dome:IsAura() return true end

function modifier_medusa_mana_dome:GetAuraRadius() return self.radius end
function modifier_medusa_mana_dome:GetAuraSearchFlags() return DOTA_UNIT_TARGET_FLAG_INVULNERABLE end
function modifier_medusa_mana_dome:GetAuraSearchTeam() return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_medusa_mana_dome:GetAuraSearchType() return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_medusa_mana_dome:GetModifierAura() return "modifier_medusa_mana_dome_effect" end

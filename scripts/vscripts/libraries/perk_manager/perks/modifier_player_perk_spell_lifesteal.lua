modifier_player_perk_spell_lifesteal = class({})

function modifier_player_perk_spell_lifesteal:IsHidden() return true end
function modifier_player_perk_spell_lifesteal:IsDebuff() return false end
function modifier_player_perk_spell_lifesteal:IsPurgable() return false end
function modifier_player_perk_spell_lifesteal:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_spell_lifesteal:GetTexture() return "perks/spell_lifesteal" end

function modifier_player_perk_spell_lifesteal:DeclareFunctions()
	if IsServer() then return {	MODIFIER_EVENT_ON_TAKEDAMAGE } end
end

function modifier_player_perk_spell_lifesteal:OnTakeDamage(keys)
	if keys.attacker and self:GetParent() == keys.attacker and keys.unit and keys.inflictor and not (keys.attacker:IsNull() or keys.unit:IsNull() or keys.inflictor:IsNull() or keys.unit:IsBuilding()) and keys.damage > 0 then 
		if keys.damage_flags and bit.band(keys.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then return end
		if keys.damage_flags and bit.band(keys.damage_flags, DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL ) == DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL  then return end

		local lifesteal_pfx = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, keys.attacker)
		ParticleManager:ReleaseParticleIndex(lifesteal_pfx)

		local lifesteal_pct = 0.001 * self:GetStackCount()
		if not (keys.unit:IsConsideredHero() or keys.unit:IsBoss()) then lifesteal_pct = 0.2 * lifesteal_pct end

		keys.attacker:Heal(keys.damage * lifesteal_pct, keys.inflictor)
	end
end

modifier_player_perk_spell_lifesteal_dummy = class({})

function modifier_player_perk_spell_lifesteal_dummy:IsHidden() return false end
function modifier_player_perk_spell_lifesteal_dummy:IsDebuff() return false end
function modifier_player_perk_spell_lifesteal_dummy:IsPurgable() return false end
function modifier_player_perk_spell_lifesteal_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_spell_lifesteal_dummy:GetTexture() return "perks/spell_lifesteal" end

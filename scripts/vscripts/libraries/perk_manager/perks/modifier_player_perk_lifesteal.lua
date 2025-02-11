modifier_player_perk_lifesteal = class({})

function modifier_player_perk_lifesteal:IsHidden() return true end
function modifier_player_perk_lifesteal:IsDebuff() return false end
function modifier_player_perk_lifesteal:IsPurgable() return false end
function modifier_player_perk_lifesteal:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_lifesteal:GetTexture() return "perks/lifesteal" end

function modifier_player_perk_lifesteal:DeclareFunctions()
	if IsServer() then return {	MODIFIER_PROPERTY_PROCATTACK_FEEDBACK } end
end

function modifier_player_perk_lifesteal:GetModifierProcAttack_Feedback(keys)
	if keys.attacker and keys.target and not (keys.attacker:IsNull() or keys.target:IsNull() or keys.target:IsBuilding()) and keys.damage > 0 then 
		local lifesteal_pfx = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, keys.attacker)
		ParticleManager:ReleaseParticleIndex(lifesteal_pfx)

		keys.attacker:Heal(0.001 * keys.damage * self:GetStackCount(), nil)
	end
end

modifier_player_perk_lifesteal_dummy = class({})

function modifier_player_perk_lifesteal_dummy:IsHidden() return false end
function modifier_player_perk_lifesteal_dummy:IsDebuff() return false end
function modifier_player_perk_lifesteal_dummy:IsPurgable() return false end
function modifier_player_perk_lifesteal_dummy:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_player_perk_lifesteal_dummy:GetTexture() return "perks/lifesteal" end

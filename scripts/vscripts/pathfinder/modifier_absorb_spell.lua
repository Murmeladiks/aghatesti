modifier_absorb_spell = class({})

--------------------------------------------------------------------------------

function modifier_absorb_spell:IsHidden() 	return true end
function modifier_absorb_spell:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_absorb_spell:OnCreated(table)
	if IsClient() then return end
	local nFXIndex = ParticleManager:CreateParticle( "particles/items_fx/immunity_sphere_buff.vpcf", PATTACH_CUSTOMORIGIN, self:GetParent());
	ParticleManager:SetParticleControlEnt(nFXIndex, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)	
	self:AddParticle(nFXIndex, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_absorb_spell:DeclareFunctions()
	return {MODIFIER_PROPERTY_ABSORB_SPELL}
end

--------------------------------------------------------------------------------

function modifier_absorb_spell:GetAbsorbSpell(event)
	if IsClient() then return end
	local hParent = self:GetParent()
	local hAbility = event.ability


	-- why??
	--hAbility:StartCooldown(hAbility:GetCooldown(hAbility:GetLevel()))
			
	return 1
end
LinkLuaModifier( "modifier_item_arcanist_potion", "items/item_arcanist_potion", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

item_arcanist_potion = class({})

--------------------------------------------------------------------------------

function item_arcanist_potion:Precache( context )
	PrecacheResource( "particle", "particles/generic_gameplay/rune_arcane_owner.vpcf", context )
end

--------------------------------------------------------------------------------

function item_arcanist_potion:OnSpellStart()
	local caster = self:GetCaster()

	local kv =
	{
		duration = self:GetSpecialValueFor("duration"),
		cooldown_reduction_pct = self:GetSpecialValueFor("cooldown_reduction_pct"),
		manacost_reduction_pct = self:GetSpecialValueFor("manacost_reduction_pct"),
	}

	caster:AddNewModifier( caster, self, "modifier_item_arcanist_potion", kv )

	EmitSoundOn( "TorrentEffectPotion.Activate", caster )
	EmitSoundOn( "ArcanistEffectPotion.Activate", caster )

	self:SpendCharge(FrameTime())
end

--------------------------------------------------------------------------------

modifier_item_arcanist_potion = class({})

------------------------------------------------------------------------------

function modifier_item_arcanist_potion:GetTexture() return "item_arcanist_potion" end
function modifier_item_arcanist_potion:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:OnCreated( kv )
	if not IsServer() then return end
	self.cooldown_reduction_pct = kv.cooldown_reduction_pct
	self.manacost_reduction_pct = kv.manacost_reduction_pct

	self:SetHasCustomTransmitterData( true )
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:AddCustomTransmitterData( )
	return
	{
		cooldown_reduction_pct = self.cooldown_reduction_pct,
		manacost_reduction_pct = self.manacost_reduction_pct
	}
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:HandleCustomTransmitterData( data )
	self.cooldown_reduction_pct = data.cooldown_reduction_pct
	self.manacost_reduction_pct = data.manacost_reduction_pct
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE,
		MODIFIER_PROPERTY_MANACOST_PERCENTAGE
	}
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:GetModifierPercentageCooldown()
	return self.cooldown_reduction_pct
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:GetModifierPercentageManacost()
	return self.manacost_reduction_pct
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:GetEffectName()
	return "particles/generic_gameplay/rune_arcane_owner.vpcf"
end

--------------------------------------------------------------------------------

function modifier_item_arcanist_potion:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
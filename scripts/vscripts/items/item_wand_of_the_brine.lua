
item_wand_of_the_brine = class({})
LinkLuaModifier( "modifier_item_wand_of_the_brine_stats",	"modifiers/modifier_item_wand_of_the_brine_stats", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_item_wand_of_the_brine_bubble", 	"modifiers/modifier_item_wand_of_the_brine_bubble", LUA_MODIFIER_MOTION_NONE )


--------------------------------------------------------------------------------

function item_wand_of_the_brine:Precache( context )
	PrecacheResource( "particle", "particles/act_2/wand_of_the_brine_bubble.vpcf", context )
end

--------------------------------------------------------------------------------

function item_wand_of_the_brine:OnSpellStart()
	local hTarget = self:GetCursorTarget()

	hTarget:AddNewModifier(self:GetCaster(), self, "modifier_item_wand_of_the_brine_bubble", {duration = self:GetSpecialValueFor("bubble_duration" )})
	EmitSoundOn("DOTA_Item.GhostScepter.Activate", hTarget)
end

--------------------------------------------------------------------------------

function item_wand_of_the_brine:GetIntrinsicModifierName()
	return "modifier_item_wand_of_the_brine_stats"
end

--------------------------------------------------------------------------------

function item_wand_of_the_brine:Spawn()
	self.required_level = self:GetSpecialValueFor( "required_level" )
end

--------------------------------------------------------------------------------

function item_wand_of_the_brine:OnHeroLevelUp()
	if IsServer() then
		if self:GetCaster():GetLevel() == self.required_level and self:IsInBackpack() == false then
			self:OnUnequip()
			self:OnEquip()
		end
	end
end

--------------------------------------------------------------------------------

function item_wand_of_the_brine:IsMuted()	
	if self.required_level > self:GetCaster():GetLevel() then
		return true
	end
	if not self:GetCaster():IsHero() then
		return true
	end
	
	return self.BaseClass.IsMuted( self )
end

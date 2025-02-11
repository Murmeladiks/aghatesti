modifier_hexed = modifier_hexed or class({})

--------------------------------------------------------------------------------

function modifier_hexed:GetTexture() 	return "buyback" end
function modifier_hexed:RemoveOnDeath() return false end
function modifier_hexed:IsPurgable() 	return false end
function modifier_hexed:IsDebuff() 		return true end
function modifier_hexed:GetPriority()	return MODIFIER_PRIORITY_SUPER_ULTRA + 1000000 end

--------------------------------------------------------------------------------

function modifier_hexed:OnCreated( kv )
	self.model = courier_models[RandomInt(1, #courier_models)]
	
	if not IsServer() then return end
	self:DisableAbilitiesAndItems()

	local parent = self:GetParent()
	
	self:PlayEffects( true )
	
	local supp_effect = AddPatronEffect(parent)
	self.model = supp_effect.model
	self.effects = {}
	
	if supp_effect.scale then
		-- parent:SetModelScale(supp_effect.scale)
	end

	if supp_effect.material_group then
		Timers:CreateTimer(0, function()
			if parent:HasModifier(self:GetName()) then
				parent:SetMaterialGroup(tostring(supp_effect.material_group))
			end
		end)
	end

	if supp_effect.particles_data then
		WearFunc:_CreateParticlesFromConfigList(supp_effect.particles_data, parent, self.effects)
	end
end

--------------------------------------------------------------------------------

function modifier_hexed:OnRefresh( kv )
	if IsServer() then self:PlayEffects(true) end
end

--------------------------------------------------------------------------------

function modifier_hexed:OnDestroy( kv )
	if not IsServer() then return end
	self:RestoreAbilitiesAndItems()

	local parent = self:GetParent()

	self:PlayEffects(false)

	if self.effects then
		for _, particle in pairs(self.effects) do
			ParticleManager:DestroyParticle(particle, false)
			ParticleManager:ReleaseParticleIndex(particle)
		end
	end
end

--------------------------------------------------------------------------------

function modifier_hexed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,
		MODIFIER_PROPERTY_MODEL_CHANGE,
		MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
	}
end

--------------------------------------------------------------------------------

function modifier_hexed:GetModifierMoveSpeed_Absolute()
	return 350
end

--------------------------------------------------------------------------------

function modifier_hexed:GetModifierModelChange()
	return self.model
end

--------------------------------------------------------------------------------

function modifier_hexed:GetModifierHPRegenAmplify_Percentage( params )
	return -100
end

--------------------------------------------------------------------------------

function modifier_hexed:CheckState()
	if not IsServer() then return {} end
	return {
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_MUTED] = true,
		[MODIFIER_STATE_PASSIVES_DISABLED] = true,
		[MODIFIER_STATE_FLYING]	= false,
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY]	= false,
		[MODIFIER_STATE_HEXED] = true
	}
end

--------------------------------------------------------------------------------

function modifier_hexed:PlayEffects( bStart )
	local effect_cast = ParticleManager:CreateParticle(
		"particles/units/heroes/hero_shadowshaman/shadowshaman_voodoo.vpcf", PATTACH_ABSORIGIN, self:GetParent() 
	)
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

--------------------------------------------------------------------------------

function modifier_hexed:DisableAbilitiesAndItems()
	self.DisabledAbilitiesAndItems = {}

	local AbilitiesAndItems = GetPlayerAbilitiesAndItems( self:GetParent():GetPlayerID() )

	for i = 0, DOTA_MAX_ABILITIES - 1 do
		local hAbility = self:GetParent():GetAbilityByIndex( i )
		if hAbility and not hAbility:IsCosmetic( nil ) and not hAbility:IsAttributeBonus() and hAbility:GetAssociatedPrimaryAbilities() == nil and not hAbility:IsHidden() and hAbility:IsActivated() then
			--printf( "ability to disable: %s", hAbility:GetAbilityName() )
			table.insert( self.DisabledAbilitiesAndItems, hAbility )
		end
	end

	for i = 0, DOTA_ITEM_NEUTRAL_SLOT do
		local hItem = self:GetParent():GetItemInSlot( i )
		if hItem then
			hItem:OnUnequip()
			table.insert( self.DisabledAbilitiesAndItems, hItem )
		end
	end

	for nIndex, hAbilityOrItem in pairs( self.DisabledAbilitiesAndItems ) do
		--printf( "disabling %s", hAbilityOrItem:GetAbilityName() )
		if hAbilityOrItem:GetToggleState() then
			--print( "toggling ability off ("  ..hAbilityOrItem:GetName()..")")
			hAbilityOrItem:ToggleAbility()
			hAbilityOrItem.bToggleBack = true
		end

		hAbilityOrItem:SetActivated( false )
		hAbilityOrItem:SetHidden( true )
		hAbilityOrItem.nOriginalIndex = hAbilityOrItem:GetAbilityIndex()
	end
end

--------------------------------------------------------------------------------

function modifier_hexed:RestoreAbilitiesAndItems()
	for nIndex, hAbilityOrItem in pairs( self.DisabledAbilitiesAndItems ) do
		if hAbilityOrItem ~= nil and hAbilityOrItem:IsNull() == false then
			hAbilityOrItem:SetActivated( true )
			hAbilityOrItem:SetHidden( false )

			if hAbilityOrItem.bToggleBack then
				hAbilityOrItem:ToggleAbility()
				hAbilityOrItem.bToggleBack = nil
			end

			if hAbilityOrItem:IsItem() then
				local nSlot = hAbilityOrItem:GetItemSlot()
				if nSlot <= DOTA_ITEM_SLOT_6 or nSlot == DOTA_ITEM_TP_SCROLL or nSlot == DOTA_ITEM_NEUTRAL_SLOT then
					hAbilityOrItem:OnEquip()
				end
			end			
		end
	end
end

modifier_absolute_no_cc = class({})

-----------------------------------------------------------------------------------------

function modifier_absolute_no_cc:IsHidden()
	return true
end

-----------------------------------------------------------------------------------------

function modifier_absolute_no_cc:IsPurgable()
	return false
end

--------------------------------------------------------------------------------

function modifier_absolute_no_cc:GetPriority()
	return MODIFIER_PRIORITY_ULTRA + 10000
end

--------------------------------------------------------------------------------

function modifier_absolute_no_cc:OnCreated( kv )
	self:GetParent().bAbsoluteNoCC = true
	self:GetParent().bMotionControlExcluded = true
	
	if IsServer() then
		self.bMotionControlExcluded = true
		-- self:GetParent():SetUnitCanRespawn(true);

		if self:GetParent():GetUnitName() == "npc_dota_creature_phoenix" then
			self.bMotionControlExcluded = false
		end
	end
end

-----------------------------------------------------------------------------------------

function modifier_absolute_no_cc:CheckState()
	local state =
	{
		[MODIFIER_STATE_HEXED] = false,
		[MODIFIER_STATE_ROOTED] = false,
		[MODIFIER_STATE_SILENCED] = false,
		[MODIFIER_STATE_STUNNED] = false,
		[MODIFIER_STATE_FROZEN] = false,
		[MODIFIER_STATE_FEARED] = false,
		[MODIFIER_STATE_TAUNTED] = false,
		[MODIFIER_STATE_DISARMED] = false,
		[MODIFIER_STATE_CANNOT_BE_MOTION_CONTROLLED] = self.bMotionControlExcluded
	}
	return state
end

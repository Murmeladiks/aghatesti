modifier_pathfinder_healing_ward_root = class({})

function modifier_pathfinder_healing_ward_root:IsHidden() return false end
function modifier_pathfinder_healing_ward_root:IsDebuff() return true end
function modifier_pathfinder_healing_ward_root:IsStunDebuff() return false end
function modifier_pathfinder_healing_ward_root:IsPurgable() return true end

function modifier_pathfinder_healing_ward_root:GetPriority()
	return MODIFIER_PRIORITY_HIGH
end

function modifier_pathfinder_healing_ward_root:CheckState()
	return {
		[MODIFIER_STATE_INVISIBLE] = false,
		[MODIFIER_STATE_ROOTED] = true,
	}
end

function modifier_pathfinder_healing_ward_root:GetEffectName()
	return "particles/units/heroes/hero_siren/siren_net.vpcf"
end

function modifier_pathfinder_healing_ward_root:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

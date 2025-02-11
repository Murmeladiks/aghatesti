modifier_skeleton_king_boss_run = class({})

--------------------------------------------------------------------------------

function modifier_skeleton_king_boss_run:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_skeleton_king_boss_run:IsPurgable()
	return false
end

--------------------------------------------------------------------------------

function modifier_skeleton_king_boss_run:DeclareFunctions()
	return {MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS}
end

--------------------------------------------------------------------------------

function modifier_skeleton_king_boss_run:GetActivityTranslationModifiers( params )
	return "run"
end

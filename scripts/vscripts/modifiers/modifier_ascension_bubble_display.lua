
modifier_ascension_bubble_display = class({})

-----------------------------------------------------------------------------------------
-- All this does is display a visible icon, useful for abilities that trigger on death for example

function modifier_ascension_bubble_display:IsPurgable()
	return false
end

-----------------------------------------------------------------------------------------

function modifier_ascension_bubble_display:GetTexture()
	return "arc_warden_magnetic_field"
end

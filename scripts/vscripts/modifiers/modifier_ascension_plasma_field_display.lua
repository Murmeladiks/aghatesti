
modifier_ascension_plasma_field_display = modifier_ascension_plasma_field_display or class({})

-----------------------------------------------------------------------------------------
-- All this does is display a visible icon, useful for abilities that trigger on death for example

function modifier_ascension_plasma_field_display:IsPurgable()
	return false
end


modifier_ascension_glimmer_display = class({})

-----------------------------------------------------------------------------------------
-- All this does is display a visible icon, useful for abilities that trigger on death for example

function modifier_ascension_glimmer_display:IsPurgable()
	return false
end

-----------------------------------------------------------------------------------------

function modifier_ascension_glimmer_display:GetTexture()
	return "item_glimmer_cape"
end
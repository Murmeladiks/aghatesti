
-- This file is a redirection to events.lua
--print( "loaded triggers.lua" )

function OnStartTouch( trigger )
	local triggerName = thisEntity:GetName()
	--printf( "OnStartTouch - trigger \"%s\"", triggerName )

	if not trigger.activator or trigger.activator:IsNull() then return end

	local event = {}
	event["trigger_name"] = triggerName
	event["activator_entindex"] = trigger.activator:GetEntityIndex()
	event["caller_entindex"] = trigger.caller:GetEntityIndex()
	FireGameEvent( "trigger_start_touch", event )
end

--------------------------------------------------------------------------------

function OnEndTouch( trigger )
	local triggerName = thisEntity:GetName()
	--printf( "OnEndTouch - trigger \"%s\"", triggerName )
	
	if not trigger.activator or trigger.activator:IsNull() then return end
	if not trigger.caller or trigger.caller:IsNull() then return end

	local event = {}
	event["trigger_name"] = triggerName
	event["activator_entindex"] = trigger.activator:GetEntityIndex()
	event["caller_entindex"] = trigger.caller:GetEntityIndex()
	FireGameEvent( "trigger_end_touch", event )
end

--------------------------------------------------------------------------------

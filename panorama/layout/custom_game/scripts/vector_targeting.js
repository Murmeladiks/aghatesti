"use strict";

let active_ability;

function CheckVectorTargetingAbility() {

	const click_behavior = GameUI.GetClickBehaviors()
	const ability = Abilities.GetLocalPlayerActiveAbility()
	const cursor_pos = GameUI.GetCursorPosition()
	const location = GameUI.GetScreenWorldPosition(cursor_pos)
	const cursor_ents = GameUI.FindScreenEntities(cursor_pos).map((v) => v.entityIndex)

	if (click_behavior == CLICK_BEHAVIORS.DOTA_CLICK_BEHAVIOR_VECTOR_CAST) {
		if (active_ability == ability) {
			GameEvents.SendEventClientSide("ability_vector_target_think", {
				ability: ability, 
				location: location,
				cursor_ents: cursor_ents,
			})
		}
		else if (ability != -1) {
			GameEvents.SendEventClientSide("ability_vector_target_start", {
				ability: ability, 
				location: location,
				cursor_ents: cursor_ents
			})
			active_ability = ability
		}
	}
	else if (active_ability) {
		GameEvents.SendEventClientSide("ability_vector_target_end", {
			ability: active_ability, 
			location: location,
			cursor_ents: cursor_ents
		})
		active_ability = undefined
	}

	$.Schedule(0, CheckVectorTargetingAbility)
}

CheckVectorTargetingAbility()
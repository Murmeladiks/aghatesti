"use strict";

let selection_started = false;
let selection_locked = false;

const LOCAL_PERK_PANEL = $("#LocalPlayerPerk");

function LocalPerkClick() {
	if (selection_started && (!selection_locked || LOCAL_PERK_PANEL.player_id === undefined))
		GameUI.TogglePerksMenu();
}

function ShowPerkTooltip(i) {
	let panel = $(`#PlayerPerk${i}`)

	if (i == -1) panel = LOCAL_PERK_PANEL;

	if (panel.player_id === undefined ) {
		if (i == -1 && selection_started) $.DispatchEvent("UIShowTextTooltip", panel, "#perks_menu_title");
		return;
	}

	const tooltip_title = $.Localize("#perk_" + panel.perk_name);
	const tooltip_text = $.Localize("#DOTA_Tooltip_modifier_player_perk_" + panel.perk_name + "_dummy_Description");
	$.DispatchEvent("UIShowTitleTextTooltip", panel, tooltip_title, tooltip_text);
}

function UpdatePerk(panel, perk_name, player_id) {
	panel.FindChild("PerkImage").SetImage(`file://{resources}/images/custom_game/perks/${perk_name}.png`);
	panel.player_id = player_id;
	panel.perk_name = perk_name;
}
 
function OnPerksUpdated(data) {
	let i = 0;

	for (const pID in data) {
		const perk_name = data[pID];
		
		if (typeof(perk_name) == "string") {
			if (pID == Game.GetLocalPlayerID()) {
				UpdatePerk(LOCAL_PERK_PANEL, perk_name, pID);
			}
			else {
				const panel = $(`#PlayerPerk${i}`);
				UpdatePerk(panel, perk_name, pID);
				i++;
			}
		}
	}
} 

function OnPerksSelectionStateChanged(data) {
	selection_started = data.start == 1;
	selection_locked = data.locked == 1;
}

SubscribeToNetTableKey("game", "player_perks_data", OnPerksUpdated);
SubscribeToNetTableKey("game", "perks_selection_state", OnPerksSelectionStateChanged);
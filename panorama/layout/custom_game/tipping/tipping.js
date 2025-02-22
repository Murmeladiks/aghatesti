let tips_left = 0;
let current_ui_tips = [];

const MAX_TIPS_UI = 3;
const HUD_TIPS_CONTAINER = $("#Tips_Container");

function UpdateTipsForPlayer(data) {
	tips_left = data.left || 0;
	dotaHud.SetHasClass("DOTAU_BlockedTips", (data.block && data.block == 1) || tips_left <= 0);
}

function HideTipNotification(panel) {
	panel.RemoveClass("Show");
	current_ui_tips.shift();

	$.Schedule(0.17, () => {
		if (panel && panel.IsValid()) panel.DeleteAsync(0);
	});
}

function TipPlayer(data) {
	const target_id = data.target_id;
	if (target_id == undefined || target_id == LOCAL_PLAYER_ID) return;
	const info = Game.GetPlayerInfo(target_id);
	if (info == undefined) return;

	GameEvents.SendCustomGameEventToServer("tipping:tip", {
		target_pid: target_id,
	});
}
function CreateNotification(data) {
	const source_id = data.source_id;
	if (source_id == undefined) return;
	const target_id = data.target_id;
	if (target_id == undefined) return;

	if (current_ui_tips.length >= MAX_TIPS_UI) {
		HideTipNotification(current_ui_tips[0]);
	}

	const new_tip = $.CreatePanel("Panel", HUD_TIPS_CONTAINER, "");
	new_tip.BLoadLayoutSnippet("TipNotification");
	current_ui_tips.push(new_tip);

	const update_player_panel = (pid, type_name) => {
		const p_info = Game.GetPlayerInfo(pid);
		if (p_info.player_selected_hero)
			new_tip.FindChildTraverse(`${type_name}Hero`).SetImage(GetPortraitImage(pid, p_info.player_selected_hero));

		if (p_info.player_name) {
			const player_name_label = new_tip.FindChildTraverse(`${type_name}Name`);
			player_name_label.text = p_info.player_name;
			player_name_label.style.color = GetHEXPlayerColor(pid);
		}
	};

	update_player_panel(source_id, "Source");
	update_player_panel(target_id, "Target");
	new_tip.FindChildTraverse("TipsCurrenctNumber").text = data.currency_count || 0;
	new_tip.AddClass("Show");
	Game.EmitSound("General.Coins");

	$.Schedule(5, () => {
		if (new_tip && new_tip.IsValid()) HideTipNotification(new_tip);
	});
}

(function () {
	dotaHud.SetHasClass("DOTAU_BlockedTips", true);
	HUD_TIPS_CONTAINER.RemoveAndDeleteChildren();
	GameEvents.SendCustomGameEventToServer("tipping:get_init_info", {});
	GameEvents.Subscribe("tipping:send_init_info", UpdateTipsForPlayer);
	GameEvents.Subscribe("tipping:tip_from_client", TipPlayer);
	GameEvents.Subscribe("tipping:create_notification", CreateNotification);
})();

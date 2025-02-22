const LOCAL_PLAYER_ID = Game.GetLocalPlayerID();
const LOCAL_STEAM_ID = Game.GetLocalPlayerInfo().player_steamid;
const CURRENT_MAP = Game.GetMapInfo().map_display_name;

Object.values = function (object) {
	return Object.keys(object).map(function (key) {
		return object[key];
	});
};

Array.prototype.includes = function (searchElement, fromIndex) {
	return this.indexOf(searchElement, fromIndex) !== -1;
};

String.prototype.includes = function (searchString, position) {
	return this.indexOf(searchString, position) !== -1;
};

function setInterval(callback, interval) {
	interval = interval / 1000;
	$.Schedule(interval, function reschedule() {
		$.Schedule(interval, reschedule);
		callback();
	});
}

function createEventRequestCreator(eventName) {
	var idCounter = 0;
	return function (data, callback) {
		var id = ++idCounter;
		data.id = id;
		GameEvents.SendCustomGameEventToServer(eventName, data);
		var listener = GameEvents.Subscribe(eventName, function (data) {
			if (data.id !== id) return;
			GameEvents.Unsubscribe(listener);
			callback(data);
		});

		return listener;
	};
}

function SubscribeToNetTableKey(tableName, key, callback) {
	var immediateValue = CustomNetTables.GetTableValue(tableName, key) || {};
	if (immediateValue != null) callback(immediateValue);
	CustomNetTables.SubscribeNetTableListener(tableName, function (_tableName, currentKey, value) {
		if (currentKey === key && value != null) callback(value);
	});
}

const FindDotaHudElement = (id) => dotaHud.FindChildTraverse(id);
const dotaHud = (() => {
	let panel = $.GetContextPanel();
	while (panel) {
		if (panel.id === "DotaHud") return panel;
		panel = panel.GetParent();
	}
})();

var useChineseDateFormat = $.Language() === "schinese" || $.Language() === "tchinese";
/** @param {Date} date */
function formatDate(date) {
	return useChineseDateFormat
		? date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate()
		: date.getMonth() + "/" + date.getDate() + "/" + date.getFullYear();
}

function _AddMenuButton(buttonId) {
	return $.CreatePanel("Button", $.GetContextPanel(), buttonId);
}
function CreateButtonInTopMenu(button, activateEvent, overEvent, outEvent) {
	button.SetPanelEvent("onactivate", activateEvent);
	button.SetPanelEvent("onmouseover", overEvent);

	button.SetPanelEvent("onmouseout", outEvent);

	let menu = FindDotaHudElement("ButtonBar");
	let existingPanel = menu.FindChildTraverse(button.id);
	if (existingPanel) existingPanel.DeleteAsync(0.1);
	if (menu)
		menu.Children().forEach((button) => {
			button.style.verticalAlign = "top";
		});
	button.SetParent(menu);
}

let boostGlow = false;
let glowSchelude;
const CENTER_SCREEN_MENUS = ["CollectionDotaU", "HeroVoting_Root"];
function CloseMenus() {
	CENTER_SCREEN_MENUS.forEach((panelName) => {
		FindDotaHudElement(panelName).SetHasClass("show", false);
	});
}
function ToggleMenu(name) {
	FindDotaHudElement(name).ToggleClass("show");
	if (name == "CollectionDotaU") {
		if (glowSchelude) {
			glowSchelude = $.CancelScheduled(glowSchelude);
		}
		const glowPanel = FindDotaHudElement("DonateFocus");
		glowPanel.SetHasClass("show", boostGlow);
		if (boostGlow)
			glowSchelude = $.Schedule(4, () => {
				glowSchelude = undefined;
				glowPanel.SetHasClass("show", false);
			});
	}
	CENTER_SCREEN_MENUS.forEach((panelName) => {
		if (panelName != name) {
			const panel = FindDotaHudElement(panelName);
			if (panel) panel.SetHasClass("show", false);
		}
	});
}

function _GetVarFromUniquePortraitsData(player_id, hero_name, path) {
	const unique_portraits = CustomNetTables.GetTableValue("game_state", "portraits");
	if (unique_portraits && unique_portraits[player_id]) {
		return `${path}${unique_portraits[player_id]}.png`;
	} else {
		return `${path}${hero_name}.png`;
	}
}

function GetPortraitImage(player_id, hero_name) {
	return _GetVarFromUniquePortraitsData(player_id, hero_name, "file://{images}/heroes/");
}
function GetPortraitIcon(player_id, hero_name) {
	return _GetVarFromUniquePortraitsData(player_id, hero_name, "file://{images}/heroes/icons/");
}

function GetHEXPlayerColor(player_id) {
	var player_color = Players.GetPlayerColor(player_id).toString(16);
	return player_color == null
		? "#000000"
		: "#" +
				player_color.substring(6, 8) +
				player_color.substring(4, 6) +
				player_color.substring(2, 4) +
				player_color.substring(0, 2);
}
function LocalizeWithValues(line, kv) {
	let result = $.Localize(line);
	Object.entries(kv).forEach(([k, v]) => {
		result = result.replace(`%%${k}%%`, v);
	});
	return result;
}

function ParseBigNumber(x, separator) {
	return x ? x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, separator || ",") : "0";
}

function FragmentsHUD_ShowHint(panel) {
	$.DispatchEvent(
		"DOTAShowTextTooltip",
		panel,
		LocalizeWithValues("#glory_explanation", {
			current_bonus: owned_bonus * 3,
			limit_bonus: limit,
		}),
	);
}

function GetKeyBind(name) {
    var contextPanel = $.GetContextPanel();

    $.CreatePanel(`DOTAHotkey`, contextPanel, '', {
        keybind: name,
    });

    var keyElement = contextPanel.GetChild(contextPanel.GetChildCount() - 1);
    keyElement.DeleteAsync(0);
    return keyElement.GetChild(0).text;
}

function IsInSelectionArea(pt) {
    return (pt[0]*pt[0] + pt[1]*pt[1] >= radius*radius)
}

function sign(p1, p2, p3) {
    return (p1[0] - p3[0]) * (p2[1] - p3[1]) - (p2[0] - p3[0]) * (p1[1] - p3[1]);
}

function IsInTriangle(pt, vec1, vec2, vec3) {
    let d1, d2, d3, has_neg, has_pos;
    d1 = sign(pt, vec1, vec2);
    d2 = sign(pt, vec2, vec3);
    d3 = sign(pt, vec3, vec1);
    has_neg = (d1 < 0) || (d2 < 0) || (d3 < 0);
    has_pos = (d1 > 0) || (d2 > 0) || (d3 > 0);
    return !(has_neg && has_pos);
}

GameUI.CustomUIConfig().player_fullnames = {};
function RequestGuildName(player_id) {
    let playerInfo = Game.GetPlayerInfo(player_id);

    if (playerInfo == undefined) return;

    GameUI.CustomUIConfig().player_fullnames[player_id] = GameUI.CustomUIConfig().player_fullnames[player_id] ||playerInfo.player_name;
    let name_panel = $.CreatePanel("DOTAUserName", $.GetContextPanel(), "");
    name_panel.steamid = playerInfo.player_steamid;

    let name_label = name_panel.GetChild(0);

    $.Schedule(0.1, () => {
        if (name_label.text != undefined && name_label.text != "[!g:user_account_id]") {
            GameUI.CustomUIConfig().player_fullnames[player_id] = name_label.text
        }
        
        name_panel.DeleteAsync(0);
    });
}

function RequestAllGuildNames() {
    for (let i = 0; i < 5; i++) {
        RequestGuildName(i);
    }
}

function GetRealPlayerColor(player_id) {
    return ACCURATE_PLAYER_COLORS[Players.GetPlayerColor(player_id)];
}

const ACCURATE_PLAYER_COLORS = {
    "4294931763": "#3375FF",
    "4290772838": "#66FFBF",
    "4290707647": "#BF00BF",
    "4278972659": "#F3F00B",
    "4278217727": "#FF6B00"
};

let owned_bonus = 0;
let limit = 0;//1500;
function _UpdateFragmentsLimits(data) {
	owned_bonus = data.owned_bonus | 0;
	if (data.boosterStatus > 0) limit = limit * 2 * data.boosterStatus;
}
GameEvents.Subscribe("battlepass_inventory:update_coins", _UpdateFragmentsLimits);
GameEvents.Subscribe("battlepass_inventory:update_player_info", _UpdateFragmentsLimits);
GameEvents.SendCustomGameEventToServer("battlepass_inventory:get_glory_info", {});
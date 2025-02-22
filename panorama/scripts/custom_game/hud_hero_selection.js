$("#ChatBox").SetAcceptsFocus(true);
$("#ChatBox").SetFocus();


const CONTEXT_PANEL = $.GetContextPanel();
const HEROES_GRID = $("#slanted_grid_id");
const button = CONTEXT_PANEL.FindChildrenWithClassTraverse("RedConfirm")[0];
const buttonL = $("#RedConfirmLeft");
const buttonR = $("#RedConfirmRight");

const ATTRIBUTES_MAP = {
	[Attributes.DOTA_ATTRIBUTE_STRENGTH]: "face_str",
	[Attributes.DOTA_ATTRIBUTE_AGILITY]: "face_agi",
	[Attributes.DOTA_ATTRIBUTE_INTELLECT]: "face_int",
	[Attributes.DOTA_ATTRIBUTE_ALL]: "face_all",
};
const ATTRIBUTES_CALLBACK_MAP = {
	[Attributes.DOTA_ATTRIBUTE_STRENGTH]: ClickFaceStr,
	[Attributes.DOTA_ATTRIBUTE_AGILITY]: ClickFaceAgi,
	[Attributes.DOTA_ATTRIBUTE_INTELLECT]: ClickFaceInt,
	[Attributes.DOTA_ATTRIBUTE_ALL]: ClickFaceAll,
};

let patreon_level = 2;

$("#face_selected").unit = "npc_dota_hero_wisp";

const intBG = [
	'url("s2r://panorama/images/compendium/international2017/scroll_texture_psd.vtex")',
	'url("s2r://panorama/images/compendium/international2017/scroll_left_texture_psd.vtex");',
];

const agiBG = [
	'url("s2r://panorama/images/compendium/international2018/scroll_texture_psd.vtex")',
	'url("s2r://panorama/images/compendium/international2018/scroll_left_texture_psd.vtex");',
];

const strBG = [
	'url("s2r://panorama/images/compendium/newbloom_scroll_texture_psd.vtex")',
	'url("s2r://panorama/images/compendium/newbloom_scroll_left_texture_psd.vtex");',
];

const allBG = [
	'url("s2r://panorama/images/compendium/international2019/compendium/invites_backer_revealed_psd.vtex")',
	'url("s2r://panorama/images/compendium/international2019/compendium/invites_backer_revealed_psd.vtex");',
];

const locked_heroes = [];

let hero_names = [];

let current_selection;

function OpenPatreon() {
	$.DispatchEvent("ExternalBrowserGoToURL", "https://www.patreon.com/dota2unofficial");
}

function SetDisplayHero(hero_name) {
	GameEvents.SendCustomGameEventToAllClients("unfade_face", { hero: current_selection });
	let hero = hero_name.slice(14);

	if (hero == "legion_commander") {
		hero = "legioncommander";
	} else if (hero == "witch_doctor") {
		hero = "witchdoctor";
	} else if (hero == "templar_assassin") {
		hero = "templarassassin";
	} else if (hero == "phantom_assassin") {
		hero = "phantomassassin";
	} else if (hero == "ogre_magi") {
		hero = "OgreMagi";
	} else if (hero == "juggernaut") {
		Game.EmitSound("juggernaut_jug_spawn_03");
	} else if (hero == "dragon_knight") {
		hero = "DragonKnight";
	} else if (hero == "void_spirit") {
		hero = "VoidSpirit";
	}

	Game.EmitSound(`Hero_${hero}.Pick`);
	current_selection = hero_name;
	GameEvents.SendCustomGameEventToAllClients("fade_face", { hero: current_selection });

	GameEvents.SendCustomGameEventToAllClients("broadcast_pick", { hero: current_selection, pid: LOCAL_PLAYER_ID });
}

function _SetButtonsStyles(src, all) {
	button.style["background-image"] = src[0];
	buttonL.style["background-image"] = src[1];
	buttonR.style["background-image"] = src[1];

	if (all) {
		buttonL.style["background-size"] = "cover";
		buttonR.style["background-size"] = "cover";
	} else {
		buttonL.style["background-size"] = "contain";
		buttonR.style["background-size"] = "contain";
	}
}

function ClickFaceInt(hero_name) {
	if (locked_heroes.includes(hero_name)) return;

	_SetButtonsStyles(intBG);
	SetDisplayHero(hero_name);
}

function ClickFaceAgi(hero_name) {
	if (locked_heroes.includes(hero_name)) return;

	_SetButtonsStyles(agiBG);
	SetDisplayHero(hero_name);
}

function ClickFaceStr(hero_name) {
	if (locked_heroes.includes(hero_name)) return;

	_SetButtonsStyles(strBG);
	SetDisplayHero(hero_name);
}

function ClickFaceAll(hero_name) {
	if (locked_heroes.includes(hero_name)) return;

	_SetButtonsStyles(allBG, true);
	SetDisplayHero(hero_name);
}

function LockFace() {
	$("#grid_container").style["width"] = "0%";
	GameEvents.SendCustomGameEventToServer("HeroSelection:hero_picked", { hero: current_selection });
	PickHero(current_selection)

	GameEvents.SendCustomGameEventToAllClients("HeroSelection:hero_locked", {
		hero: current_selection,
		pid: LOCAL_PLAYER_ID,
	});
	$.Schedule(1, function () {
		GameEvents.SendCustomGameEventToAllClients("HeroSelection:hero_locked", {
			hero: current_selection,
			pid: LOCAL_PLAYER_ID,
		});
	});
	
}

function PickHero(heroname) {
	let grid = FindDotaHudElement("GridCategories")	
	let cards = grid.FindChildrenWithClassTraverse("HeroCard")
	for (let i = 0; i < cards.length; i++) {
		let heropanel = cards[i].GetChild(0).GetChild(0);
		if (heroname.includes(heropanel.heroname)) {
			$.DispatchEvent('DOTAHeroGridCardActivated', cards[i]);
			bSuccess = true
			break;
		}
	}

	let lock_hero = FindDotaHudElement("LockInButton");
	if (lock_hero) {
		$.DispatchEvent('DOTAPickInspectedHero', lock_hero);
	}
	
	$.Schedule(0.5, () => {
		if (Players.GetSelectedHeroID(Players.GetLocalPlayer()) == 0 || Players.GetPlayerSelectedHero(Players.GetLocalPlayer()) == "") {
			$.Schedule(0.1, () => {
				PickHero(heroname);
			})
		}
	})

	/*
	$.Schedule(1, () => {
		PickFacet(2)
	})*/	
}

function PickFacet(facet_id) {
	let a = FindDotaHudElement("StrategyScreen").FindChildrenWithClassTraverse("SelectedHeroFacets")[0].FindChildTraverse("FacetList")
	//let a = FindDotaHudElement("StrategyScreen").FindChildrenWithClassTraverse("SelectedHeroFacets")[0].FindChildTraverse("FacetList")
	let x = a.GetChild(0);
 

	$.DispatchEvent("DOTAHeroFacetPickerFacetSelected", Players.GetSelectedHeroID(Players.GetLocalPlayer()), facet_id) 
	$.DispatchEvent("DOTAHeroFacetPickerFacetSelectedInternal", a, facet_id);
	//$.DispatchEvent("DOTAHeroFacetPickerFacetButtonClicked", a, facet_id);
}

//PickFacet(2)

function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function LockFaceRandom(event) {
	if (event != undefined && event.forced_hero != undefined) {
		SetDisplayHero(event.forced_hero);
		LockFace();
		return;
	}

	const supporter_heroes = CustomNetTables.GetTableValue("game", "supporter_heroes") || {}
	const hero_list = hero_names.slice().filter((hero_name) => !supporter_heroes[hero_name] || supporter_heroes[hero_name] <= patreon_level)
	
	const rand = getRandomInt(0, hero_list.length - 1);

	SetDisplayHero(hero_list[rand]);

	LockFace();
}

/* Visual timer update */
function OnTimeUpdate(data) {
	if ($("#TimerTxtTop") == null) return;
	$("#TimerTxtTop").text = data.time;
	GameEvents.SendCustomGameEventToAllClients("broadcast_pick", { hero: current_selection, pid: LOCAL_PLAYER_ID });

	if (data.time <= 10) {
		Game.EmitSound("General.CastFail_AbilityInCooldown");
	} else {
		Game.EmitSound("BUTTON_MOUSE_OVER ");
	}
}

function OnStrategyTimeStarted() {
	$.Schedule(0.1, () => {
		let InitFacetID = 1;
		
		let a = FindDotaHudElement("StrategyScreen").FindChildrenWithClassTraverse("SelectedHeroFacets")[0].FindChildTraverse("FacetList");
		if (a){
			for (let i = 1; i <= a.GetChildCount(); i++) {
				if (a.GetChild(i - 1) && a.GetChild(i - 1).BHasClass("Selected")) InitFacetID = i
			}
		}

		let facet_selector = $("#HeroFacetDropdown");

		if (facet_selector) {
			let facet_selector = $("#HeroFacetDropdown");
			facet_selector.Init(Players.GetSelectedHeroID(Players.GetLocalPlayer()), InitFacetID);
			facet_selector.RemoveClass("FacetSelector"); 

			facet_selector.AddClass("Player" + Players.GetLocalPlayer());

			$.Schedule(1/30, CheckFacets);
		}
	})
}

function CheckFacets() {
	let context_menu = FindDotaHudElement("ContextMenuBody");

	if (!context_menu) {$.Schedule(1/30, CheckFacets); return}
	let facet_menu = context_menu.FindChildTraverse("FacetList");

	if (!facet_menu) {$.Schedule(1/30, CheckFacets); return}
	let facets = facet_menu.FindChildrenWithClassTraverse("FacetContainer");

	if (!facets) {$.Schedule(1/30, CheckFacets); return}

	for (let i = 0; i < facet_menu.GetChildCount(); i++) {
		facet_menu.GetChild(i).SetPanelEvent("onmousedown", () => {
			PickFacet(i+1)
		});

	}

	{$.Schedule(1/30, CheckFacets); return}
}

function UpdatePlayerName(data) {
	const player_id = data.id + 1;
	let name = data.name;

	if (name == undefined || name == "") name = Players.GetPlayerName(player_id - 1);

	if ($(`#name${player_id}_text`) != null) {
		$(`#name${player_id}_text`).text = name;
	}
}

function DisableFace(data) {
	const hero = data.hero;
	const player_id = data.pid;
	// $("#" + hero).style["box-shadow"] = "inset #FF0D0D 0px 0px 120px 0px";
	if ($("#" + hero) == null) return;
	$("#" + hero).style["wash-color"] = "rgba(247, 27, 38, 0.99)";
	ShowReadyParticle(player_id);

	for (const delay of [1, 3, 5, 10, 15, 25]) {
		$.Schedule(delay, () => ShowReadyParticle(player_id));
	}

	locked_heroes.push(hero);
}

function ShowReadyParticle(id) {
	$.DispatchEvent("DOTAGlobalSceneFireEntityInput", "scene", "p" + String(id + 1) + "_ready", "Start", 0);
}

function FadeFace(data) {
	$("#" + data.hero).style["brightness"] = "0.5";
}

function UnfadeFace(data) {
	$("#" + data.hero).style["brightness"] = "1";
}

function DisplayAllyHero(data) {
	const hero = data.hero;
	const player_id = data.pid;
	const chosen_str = `p${player_id + 1}_${hero}`;

	for (const hero_name of hero_names) {
		const ent_str = `p${player_id + 1}_${hero_name}`;
		const action = chosen_str == ent_str ? "Enable" : "Disable";

		$.DispatchEvent("DOTAGlobalSceneFireEntityInput", "scene", ent_str, action, 0);
	}
}

function BroadcastChatInput() {
	$("#ChatMessagesContainer").ScrollToBottom();
	const input = $("#ChatBox").text;
	if (!input || /^\s*$/.test(input) || input == "") {
		$("#ChatBox").text = "";
		return;
	}

	const color = Players.GetPlayerColor(Players.GetLocalPlayer());
	const name = Players.GetPlayerName(Players.GetLocalPlayer()).substring(0, 10);

	GameEvents.SendCustomGameEventToAllClients("broadcast_chat_input", { text: input, pcolor: color, pname: name });
	$("#ChatBox").text = "";
}

function OnChatSubmit(data) {
	const input = data.text;
	$("#ChatMessagesContainer").ScrollToBottom();

	const chat_message = $.CreatePanel("Label", $("#ChatMessagesContainer"), "");
	chat_message.AddClass("ChatMessagesContent");
	chat_message.text = data.pname + ": " + input;
	chat_message.style["color"] = toColor(data.pcolor);

	$("#ChatMessagesContainer").ScrollToBottom();
}

function toColor(num) {
	num >>>= 0;
	var b = num & 0xff,
		g = (num & 0xff00) >>> 8,
		r = (num & 0xff0000) >>> 16,
		a = ((num & 0xff000000) >>> 24) / 255;
	return "rgba(" + [r, g, b, a].join(",") + ")";
}

function OnHeroListReceived(event) {
	HEROES_GRID.RemoveAndDeleteChildren();

	const supporter_heroes = CustomNetTables.GetTableValue("game", "supporter_heroes") || {}

	hero_names = [];
	for (const [attribute, heroes] of Object.entries(event)) {
		let transformed_heroes = Object.values(heroes).sort();
		hero_names.push(...transformed_heroes);

		let attribute_panel = $.CreatePanel("Panel", HEROES_GRID, attribute);
		attribute_panel.AddClass("attribute_container")

		for (const hero_name of transformed_heroes) {
			const new_panel = $.CreatePanel("DOTAHeroMovie", attribute_panel, hero_name);
			new_panel.heroname = hero_name;
			new_panel.hero_name = hero_name;
			new_panel.SetHasClass(ATTRIBUTES_MAP[attribute], true);
			new_panel.SetPanelEvent("onactivate", () => {
				ATTRIBUTES_CALLBACK_MAP[attribute](hero_name);
			});

			const hero_available = !supporter_heroes[hero_name] || supporter_heroes[hero_name] <= patreon_level
			SetHeroAvailability(new_panel, hero_available, supporter_heroes[hero_name] || 0)
		}
	}
	current_selection = hero_names[LOCAL_PLAYER_ID];
	SetDisplayHero(current_selection);
}

function OnPickedHeroesReceived(event) {
	if (Game.GameStateIs(DOTA_GameState.DOTA_GAMERULES_STATE_STRATEGY_TIME)) OnStrategyTimeStarted();
	if (event[Players.GetLocalPlayer()] != undefined) SetDisplayHero(event[Players.GetLocalPlayer()]);
}

function OnSupporterLevelChanged() {
	const supporter_heroes = CustomNetTables.GetTableValue("game", "supporter_heroes") || {}

	for (const attribute_container of HEROES_GRID.Children()) {
		for (const hero_panel of attribute_container.Children()) {
			const hero_available = !supporter_heroes[hero_panel.hero_name] || supporter_heroes[hero_panel.hero_name] <= patreon_level
			SetHeroAvailability(hero_panel, hero_available, supporter_heroes[hero_panel.hero_name] || 0)
		}
	}
}

function SetHeroAvailability(panel, available, sup_level) {
	panel.enabled = available

	if (!available) {
		const tooltip_text = `hero_not_available_${sup_level + 1}`
		panel.SetPanelEvent("onmouseover", () => $.DispatchEvent("UIShowTextTooltip", panel, tooltip_text))
		panel.SetPanelEvent("onmouseout", () => $.DispatchEvent("UIHideTextTooltip", panel))
	}
	else {
		panel.ClearPanelEvent("onmouseover")
		panel.ClearPanelEvent("onmouseout")
		$.DispatchEvent("UIHideTextTooltip", panel)
	}
}

(() => {
	GameEvents.Subscribe("picking_time_update", OnTimeUpdate);
	GameEvents.Subscribe("strategy_started", OnStrategyTimeStarted);
	GameEvents.Subscribe("player_name_init", UpdatePlayerName); 
	GameEvents.Subscribe("force_random", LockFaceRandom); 
	

	GameEvents.Subscribe("HeroSelection:hero_locked", DisableFace);
	GameEvents.Subscribe("fade_face", FadeFace);
	GameEvents.Subscribe("unfade_face", UnfadeFace);

	GameEvents.Subscribe("broadcast_pick", DisplayAllyHero);
	GameEvents.Subscribe("broadcast_chat_input", OnChatSubmit);

	GameEvents.SendCustomGameEventToServer("HeroSelection:hero_list_request", {});
	GameEvents.Subscribe("HeroSelection:hero_list_response", OnHeroListReceived);
	GameEvents.Subscribe("HeroSelection:picked_heroes", OnPickedHeroesReceived);

	GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_TEAMS, false);
	GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_GAME_NAME, false);
	GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_CLOCK, false);

	const pre_game_container = FindDotaHudElement("PreGame");
	const hero_selection = pre_game_container.FindChild("MainContents");
	const bottom_panels = pre_game_container.FindChild("BottomPanelsContainer");
	const hero_selection_bg = pre_game_container.FindChild("PregameBGStatic");
	const hero_selection_bg_2 = pre_game_container.FindChild("PregameBG");
	const hero_selection_bg_3 = pre_game_container.FindChild("PregameBackgroundImage");

	if (hero_selection) hero_selection.visible = false;
	if (bottom_panels) bottom_panels.visible = false;
	if (hero_selection_bg) hero_selection_bg.visible = false;
	if (hero_selection_bg_2) hero_selection_bg.visible = false;
	if (hero_selection_bg_3) hero_selection_bg.visible = false;

	test();
})();

function test() {
	let a = FindDotaHudElement("MenuButtons");

	if (a != undefined) {
		$.Msg(a.style.zIndex = "3");
	}
}

//Testing()
function Testing() {
    let a = FindDotaHudElement("HeroPickScreen");
    
	if (a == undefined) {
        $.Schedule(0.1, Testing);
        return;
    }

    a.visible = false;

	let b = FindDotaHudElement("StrategyScreen");
	b.visible = false;
}
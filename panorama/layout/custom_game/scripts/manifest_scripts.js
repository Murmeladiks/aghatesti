// Turn off some default UI
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_BAR, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_TIMEOFDAY, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_FLYOUT_SCOREBOARD, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_COURIER, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_PROTECT, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_QUICK_STATS, false );
//GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_PREGAME_STRATEGYUI, false );		



const FindDotaHudElement = (id) => dotaHud.FindChildTraverse(id);
const dotaHud = (() => {
	let panel = $.GetContextPanel();
	while (panel) {
		if (panel.id === "DotaHud") return panel;
		panel = panel.GetParent();
	}
})();

Game.CreateCustomKeyBind("KP_9", DOTAKeybindCommand_t.DOTA_KEYBIND_CHAT_GLOBAL);



/*test("sniper");

function test(heroname) {
	let grid = FindDotaHudElement("GridCategories")	
	let cards = grid.FindChildrenWithClassTraverse("HeroCard")
	for (let i = 0; i < cards.length; i++) {
		let heropanel = cards[i].GetChild(0).GetChild(0);
		if (heropanel.heroname.includes(heroname)) {
			$.DispatchEvent('DOTAHeroGridCardActivated', cards[i]);
			break;
		}
	}

	let lock_hero = FindDotaHudElement("LockInButton");
	if (lock_hero) {
		$.DispatchEvent('DOTAPickInspectedHero', lock_hero);
	}
	tee(1)	
	//sniper.enabled = true;
	//$.DispatchEvent('DOTAHeroGridCardActivated', cards[1])
}

function tee(facet_id) {
	let a = FindDotaHudElement("StrategyScreen").FindChildrenWithClassTraverse("SelectedHeroFacets")[0].FindChildTraverse("FacetList")
	let x = a.GetChild(0);

	$.DispatchEvent("DOTAHeroFacetPickerFacetSelected", a, facet_id) 
	$.DispatchEvent("DOTAHeroFacetPickerFacetSelectedInternal", a, facet_id);
}*/
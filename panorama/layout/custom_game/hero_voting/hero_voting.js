function VoteForHero() {
	if (HC_HUD.VOTE_BUTTON.BHasClass("Blocked")) return;
	HC_HUD.VOTE_BUTTON.SetHasClass("Blocked", true);
	$.Schedule(5, () => {
		HC_HUD.VOTE_BUTTON.SetHasClass("Blocked", false);
	});
	if (current_vote_panel) current_vote_panel.SetHasClass("ChoosedHero", false);
	if (current_selected_panel) {
		current_vote_panel = current_selected_panel;
		current_vote_panel.SetHasClass("ChoosedHero", true);
	}

	GameEvents.SendCustomGameEventToServer("hero_voting:vote", { hero_name: HC_HUD.PREVIEW_UNIT.heroname });
}

const HC_HUD = {
	ROOT: $.GetContextPanel(),
	VOTING_PANEL: $("#HeroVoting_Root"),
	MOVIE_ROOT: $("#HeroCardMovieRoot"),
	MOVIE_UNIT: $("#HeroCardMovie"),
	MOVIE_NAME: $("#HeroMovieName"),
	PREVIEW_UNIT: $("#HeroCardMovie_Preview"),
	PREVIEW_NAME: $("#HeroMovieName_Preview"),
	SEARCH: $("#SearchHero"),
	VOTE_BUTTON: $("#VoteButton"),
};
function CloseHeroVoting() {
	HC_HUD.VOTING_PANEL.SetHasClass("show", false);
}

let heroes_panels = [];
let current_vote_panel;
let current_selected_panel;
function HeroFilter() {
	const s_text = HC_HUD.SEARCH.text.toLowerCase();
	HC_HUD.ROOT.SetHasClass("Search", s_text != "");
	for (var i = 0; i < heroes_panels.length; i++) {
		const panel = heroes_panels[i];
		panel.SetHasClass("NoFilter", panel.hero_name.search(s_text) < 0);
	}
}
function CreateHeroList(data) {
	let b_has_voted_hero = false;
	Object.entries(data.heroes).forEach(([stat_name, hero_list]) => {
		hero_list = Object.values(hero_list);
		const root = $(`#HeroVoting_${stat_name}_Root`).GetChild(2);
		root.RemoveAndDeleteChildren();

		hero_list.forEach((hero_name) => {
			const panel = $.CreatePanel("Panel", root, `HeroVoting_${hero_name}`);
			panel.BLoadLayoutSnippet("HeroButton");
			const localized_hero_name = $.Localize("#" + hero_name);
			panel.hero_name = localized_hero_name.toLowerCase();
			heroes_panels.push(panel);
			const hero_icon = panel.FindChildTraverse("HeroImage");
			hero_icon.heroname = hero_name;

			const onacticate_func = () => {
				HC_HUD.PREVIEW_UNIT.heroname = hero_name;
				HC_HUD.PREVIEW_NAME.text = localized_hero_name.toUpperCase();
				HC_HUD.ROOT.SetHasClass("BHasSelectedHero", true);
				current_selected_panel = panel;
			};
			if (data.voted_hero != undefined && data.voted_hero == hero_name) {
				onacticate_func();
				panel.SetHasClass("ChoosedHero", true);
				current_vote_panel = panel;
				b_has_voted_hero = true;
			}

			panel.SetPanelEvent("onactivate", onacticate_func);

			panel.SetPanelEvent("onmouseover", () => {
				const pos = panel.GetPositionWithinWindow();
				HC_HUD.MOVIE_ROOT.style.position = `${pos.x - 50}px ${pos.y - 60}px 0px`;
				HC_HUD.MOVIE_ROOT.visible = true;
				HC_HUD.MOVIE_UNIT.heroname = hero_name;
				HC_HUD.MOVIE_NAME.text = localized_hero_name.toUpperCase();
			});
			panel.SetPanelEvent("onmouseout", () => {
				HC_HUD.MOVIE_ROOT.visible = false;
			});
		});
	});
	if (!b_has_voted_hero) {
		CloseMenus();
		HC_HUD.VOTING_PANEL.SetHasClass("show", true);
	}
}

(function () {
	HC_HUD.ROOT.SetHasClass("BHasSelectedHero", false);
	GameEvents.Subscribe("hero_voting:create_hero_list", CreateHeroList);
	GameEvents.SendCustomGameEventToServer("hero_voting:get_init_data", {});
})();

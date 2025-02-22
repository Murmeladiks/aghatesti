const perk_list = {
	mp_regen: true,
	hp_regen: true,
	move_speed: true,
	agi_per_level: true,
	str_per_level: true,
	int_per_level: true,
	all_stats_per_level: true,
	health: true,
	attack_range: true,
	cast_range: true,
	cooldown_reduction: true,
	attack_damage: true,
	attack_speed: true,
	evasion: true,
	armor: true,
	magic_resist: true,
	damage_resist: true,
	lifesteal: true,
	spell_lifesteal: true,
	spell_amp: true,
	status_resist: true,
	heal_amp: true,
};

const HUD_HEADERS_ROOT = $("#PerksColumnsHeaders_Root");
const perks_menu_root = $.GetContextPanel();
let patreon_level = 2;

function TogglePerksMenu() {
	perks_menu_root.ToggleClass("Show");
}

function ShowPerksMenu() {
	perks_menu_root.SetHasClass("Show", true);
}

function HidePerksMenu() {
	perks_menu_root.SetHasClass("Show", false);
}

function SelectPerk(perk) {
	HidePerksMenu();
	GameEvents.SendCustomGameEventToServer("player_perk_selected", { perk: perk });
}

function UpdatePerks() {
	for (let tier = 1; tier <= 3; tier++) {
		$("#PerksColumn" + tier).RemoveAndDeleteChildren();
		HUD_HEADERS_ROOT.GetChild(tier - 1).SetHasClass("OpenTier", tier <= patreon_level + 1);
	}

	for (let key in perk_list) {
		for (let tier = 1; tier <= 3; tier++) {
			const b_correct_supp_level = tier == patreon_level + 1;

			const perk_panel = $.CreatePanel("Panel", $("#PerksColumn" + tier), "");
			perk_panel.BLoadLayoutSnippet("Perk");

			const perk_icon = perk_panel.FindChildTraverse("PerkIcon");
			perk_icon.SetImage("file://{resources}/images/custom_game/perks/" + key + ".png");

			const perk_label = perk_panel.FindChildTraverse("PerkLabel");
			perk_label.text = $.Localize("#perk_" + key);

			if (b_correct_supp_level) {
				perk_icon.SetPanelEvent("onactivate", () => {
					SelectPerk(key);
				});
			}

			perk_icon.AddClass(b_correct_supp_level ? "ActivePerkIcon" : "PerkIconNotAvailable");
			perk_icon.SetPanelEvent("onmouseover", () => {
				$.DispatchEvent(
					"DOTAShowTextTooltip",
					perk_icon,
					$.Localize(b_correct_supp_level ? `#perk_tier_${tier}_${key}` : `#perk_not_available_${tier}`),
				);
			});

			perk_icon.SetPanelEvent("onmouseout", () => {
				$.DispatchEvent("DOTAHideTextTooltip", perk_icon);
			});
		}
	}
}
function OpenShop(supp_name) {
	GameEvents.SendEventClientSide("battlepass_inventory:open_specific_collection", {
		category: "Treasures",
		boostGlow: true,
		specific_supp_name: supp_name,
	});
}

(function () {
	GameEvents.Subscribe("show_perk_selection", ShowPerksMenu);

	GameUI.TogglePerksMenu = TogglePerksMenu;

	UpdatePerks();
})();

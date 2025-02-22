"use strict";

const CONTEXT_PANEL = $.GetContextPanel();
const AghanimRewardsHUD = CONTEXT_PANEL.FindChildInLayoutFile("AghanimRewardsHUD");
const AghanimRewardsMinimized = CONTEXT_PANEL.FindChildInLayoutFile("AghanimRewardsMinimized");
const RewardsContainer = CONTEXT_PANEL.FindChildInLayoutFile("RewardsContainer");
const AghanimScoreboardInfo = CONTEXT_PANEL.FindChildInLayoutFile("AghanimScoreboardInfo");

const REROLL_BUTTON = $("#RerollButton");
const REROLL_PRICE = $("#RerollPrice");

const REROLL_COMMON = 0;
const REROLL_LEGENDARY = 1;

const REROLL_COST = [150, 500]

let current_selection_schedule;
let g_szCurrentlyDisplayedDepth = 0;

let current_fragments = 0;

function ShowAghanimRewardsHUD(bShow, bMinimized) {
	let nOpenHandle = 0;
	if (bShow && !bMinimized) {
		nOpenHandle = Game.EmitSound("RewardScreenOpen");
	}

	AghanimRewardsHUD.SetHasClass("Hidden", !bShow);
	AghanimRewardsHUD.SetHasClass("Minimized", bMinimized);

	AghanimRewardsMinimized.SetHasClass("Hidden", !bShow);
	AghanimRewardsMinimized.SetHasClass("Minimized", bMinimized);
}

function GetLocalHeroName() {
	let localPlayerId = Game.GetLocalPlayerID();
	return Players.GetPlayerSelectedHero(localPlayerId);
}

function OnRewardClicked(nRewardIndex, eRewardType, nRoomDepth) {
	let data = {};
	data["room_depth"] = nRoomDepth;
	data["reward_index"] = nRewardIndex;
	GameEvents.SendCustomGameEventToServer("reward_choice", data);
}

function OnRerollPressed() {
	if (REROLL_BUTTON.BHasClass("Locked")) {$.Msg("locked"); return;}
	if (lastDrawID !== displayedDrawID) return; // Can reroll only last room reward
	REROLL_BUTTON.SetHasClass("Locked", true);

	GameEvents.SendCustomGameEventToServer("reward_reroll", { drawID: lastDrawID });
}

function OnRewardOptions(table_name, key, data) {
	if (!AghanimRewardsHUD.BHasClass("Hidden") && !AghanimRewardsHUD.BHasClass("Minimized")) {
		CheckForRewardsHUD(false);
	} else {
		$.Schedule(1.5, function () {
			CheckForRewardsHUD(false);
		});
	}
}

CustomNetTables.SubscribeNetTableListener("reward_options", OnRewardOptions);

function OnRewardChoicesRefreshed(table_name, key, data) {
	let szPlayerID = Game.GetLocalPlayerID().toString();
	let RoomChoice = data[szPlayerID];
	if (RoomChoice == null || RoomChoice.reward_type == null) return;

	// close the UI if we've made a reward choice for the current room
	if (!AghanimRewardsHUD.BHasClass("Hidden")) {
		Game.EmitSound("RewardChosen." + RoomChoice.reward_type);

		// If we're depth 1, and a new player, show info about where to find upgrades
		if (key == 1) {
			ShowScoreboardInfoIfNewPlayer(Game.GetLocalPlayerID());
		}
	}

	// Hide it, but only if we haven't already gone to another depth
	// which can happen during test_encounter
	if (key == g_szCurrentlyDisplayedDepth) {
		ShowAghanimRewardsHUD(false, false);
	} else {
		CheckForRewardsHUD(true);
	}
}

CustomNetTables.SubscribeNetTableListener("reward_choices", OnRewardChoicesRefreshed);

function GetName(reward, rewardPanel) {
	let szName;
	if (
		reward["reward_type"] === "REWARD_TYPE_ABILITY_UPGRADE" ||
		reward["reward_type"] === "REWARD_TYPE_ITEM" ||
		reward["reward_type"] === "REWARD_TYPE_TEMP_BUFF" ||
		reward["reward_type"] === "REWARD_TYPE_AURA" ||
		reward["reward_type"] === "REWARD_TYPE_MINOR_ABILITY_UPGRADE" ||
		reward["reward_type"] === "REWARD_TYPE_MINOR_STATS_UPGRADE"
	) {
		szName = "DOTA_Tooltip_ability_" + reward["ability_name"];
	}

	if (reward["reward_type"] === "REWARD_TYPE_GOLD") {
		szName = "DOTA_HUD_Reward_Gold";
	}

	if (reward["reward_type"] === "REWARD_TYPE_EXTRA_LIVES") {
		szName = "DOTA_HUD_Reward_ExtraLives";
	}

	return $.Localize("#" + szName, rewardPanel);
}

function GetDescription(reward, rewardPanel) {
	if (
		reward["reward_type"] === "REWARD_TYPE_ABILITY_UPGRADE" ||
		reward["reward_type"] === "REWARD_TYPE_ITEM" ||
		reward["reward_type"] === "REWARD_TYPE_TEMP_BUFF" ||
		reward["reward_type"] === "REWARD_TYPE_AURA"
	)
		return GameUI.ReplaceDOTAAbilitySpecialValues(
			reward["ability_name"],
			$.Localize("#DOTA_Tooltip_ability_" + reward["ability_name"] + "_Description", rewardPanel),
		);

	if (
		reward["reward_type"] === "REWARD_TYPE_MINOR_ABILITY_UPGRADE" ||
		reward["reward_type"] === "REWARD_TYPE_MINOR_STATS_UPGRADE"
	)
		return $.Localize("#" + reward["description"], rewardPanel);

	if (reward["reward_type"] === "REWARD_TYPE_GOLD") return $.Localize("#DOTA_HUD_Reward_Gold_desc", rewardPanel);

	if (reward["reward_type"] === "REWARD_TYPE_EXTRA_LIVES")
		return $.Localize("#DOTA_HUD_Reward_ExtraLives_desc", rewardPanel); 

	return "FIX ME";
}

function ShowScoreboardInfoIfNewPlayer(nPlayerID) {
	let NewPlayers = CustomNetTables.GetTableValue("game_global", "new_players");
	if (NewPlayers == null) return;

	Object.keys(NewPlayers).some(function (key) {
		if (nPlayerID == NewPlayers[key]) {
			AghanimScoreboardInfo.AddClass("Visible");
			AghanimScoreboardInfo.RemoveClass("Visible");
			return true;
		}
		return false;
	});
}

let lastDrawID;
let displayedDrawID;
function CheckForRewardsHUD(bForce) {
	let szPlayerID = Game.GetLocalPlayerID().toString();

	let CurrentRoom = CustomNetTables.GetTableValue("reward_options", "current_depth");

	let szCurrentDepth = CurrentRoom ? CurrentRoom["1"] : null;

	let RewardOptions = CustomNetTables.GetTableValue("reward_options", szCurrentDepth);
	let RewardChoices = CustomNetTables.GetTableValue("reward_choices", szCurrentDepth);

	let RoomRewards = RewardOptions ? RewardOptions[szPlayerID] : null;
	let RoomChoice = RewardChoices ? RewardChoices[szPlayerID] : null;

	// ignore if we don't yet have a reward option for the current room, or if we've already made a choice
	if (!RoomRewards || RoomChoice != null) {
		return;
	}

	const isNewRewards = lastDrawID != RoomRewards.drawID;
	lastDrawID = RoomRewards["drawID"];
	displayedDrawID = lastDrawID;
	delete RoomRewards["drawID"];

	// Ignore if we have already displayed this depth
	if (g_szCurrentlyDisplayedDepth == szCurrentDepth && !bForce && !isNewRewards) {
		return;
	}
	``;

	g_szCurrentlyDisplayedDepth = szCurrentDepth;
	``;

	// Figure out if they didn't choose the last room's reward, show that instead
	for (let i = Number(szCurrentDepth) - 1; i >= 1; i--) {
		let prevRewardChoices = CustomNetTables.GetTableValue("reward_choices", i.toString());
		let prevPlayerChoice = prevRewardChoices ? prevRewardChoices[szPlayerID] : null;
		if (prevPlayerChoice != null) break;

		let prevRewardOptions = CustomNetTables.GetTableValue("reward_options", i.toString());
		let prevRoomRewards = prevRewardOptions ? prevRewardOptions[szPlayerID] : null;
		if (prevRoomRewards == null) continue;

		szCurrentDepth = i.toString();
		RewardOptions = prevRewardOptions;
		RoomRewards = prevRoomRewards;

		displayedDrawID = RoomRewards.drawID;
	}

	// Hide reroll button for old rooms rewards
	REROLL_BUTTON.SetHasClass("Visible", displayedDrawID == lastDrawID)

	let nBattlePoints = 0;
	if (RewardOptions["battle_points"] != null) {
		nBattlePoints = RewardOptions["battle_points"][szPlayerID] ? RewardOptions["battle_points"][szPlayerID] : 0;
	}
	let nArcaneFragments = 0;
	if (RewardOptions["arcane_fragments"] != null) {
		nArcaneFragments = RewardOptions["arcane_fragments"][szPlayerID]
			? RewardOptions["arcane_fragments"][szPlayerID]
			: 0;
	}
	let nXP = RewardOptions["xp"] ? RewardOptions["xp"] : 0;
	let nGold = RewardOptions["gold"] ? RewardOptions["gold"] : 0;

	AghanimRewardsHUD.SetHasClass("StartingRoom", szCurrentDepth == 1);
	AghanimRewardsHUD.SetHasClass("NoCurrencyReward", nBattlePoints == 0 && nArcaneFragments == 0);
	AghanimRewardsHUD.SetDialogVariableInt("battle_points", nBattlePoints);
	AghanimRewardsHUD.SetDialogVariableInt("arcane_fragments", nArcaneFragments);
	AghanimRewardsHUD.SetDialogVariableInt("xp", nXP);
	AghanimRewardsHUD.SetDialogVariableInt("gold", nGold);

	SetRewardHUDRarity(RewardOptions["rarity"] ? RewardOptions["rarity"] : "");

	UpdateRerollButton()

	RewardsContainer.RemoveAndDeleteChildren();

	for (let ii = 1; ii < Object.keys(RoomRewards).length + 1; ++ii) {
		let RoomReward = RoomRewards[ii.toString()];
		let rewardPanel = $.CreatePanel("RadioButton", RewardsContainer, "");
		//$.Msg("creating panel "+rewardPanel);
		rewardPanel.BLoadLayoutSnippet("RewardOptionSnippet_" + RoomReward["reward_type"]);
		rewardPanel.AddClass("RewardOptionContainer");
		rewardPanel.AddClass("RewardOptionType_" + RoomReward["reward_type"]);
		rewardPanel.AddClass("RewardOptionTier_" + RoomReward["reward_tier"]);
		rewardPanel.AddClass("RewardOptionRarity_" + RoomReward["rarity"]);

		let RewardAbilityImage = rewardPanel.FindChildTraverse("RewardAbilityImage");
		if (RewardAbilityImage) {
			if (RoomReward["reward_type"] == "REWARD_TYPE_MINOR_STATS_UPGRADE") {
				RewardAbilityImage.SwitchClass("minor_stat_upgrade", RoomReward["description"]);
			} else {
				if (RoomReward["ability_image"] != undefined) {
					RewardAbilityImage.SetImage("file://{images}/spellicons/" + RoomReward["ability_image"] + "_png.vtex");
				} else {
					RewardAbilityImage.abilityname = RoomReward["ability_name"];
				}
			}
		}

		let RewardItemImage = rewardPanel.FindChildTraverse("RewardItemImage");
		if (RewardItemImage) {
			RewardItemImage.itemname = RoomReward["ability_name"];
		}

		if (RoomReward["quantity"]) {
			rewardPanel.SetDialogVariableInt("quantity", RoomReward["quantity"]);
		}

		if (
			RoomReward["reward_type"] == "REWARD_TYPE_MINOR_ABILITY_UPGRADE" ||
			RoomReward["reward_type"] == "REWARD_TYPE_MINOR_STATS_UPGRADE"
		) {
			rewardPanel.SetDialogVariable( "ability_name", GetName( RoomReward, rewardPanel ) );
            Object.keys( RoomReward ).forEach( key =>
            {
                if ( key.startsWith( "value" ) ) 
                {
                    var value = RoomReward[key];
                    if ( Number.isFinite( value ) )
					//$.Msg(key)
                    {
                        rewardPanel.SetDialogVariable( key , Math.floor( value ) == value ? Math.floor( value ) : value.toFixed( 1 ) );
                    }
                }
            } );

			/*rewardPanel.SetDialogVariable("ability_name", GetName(RoomReward, rewardPanel));
			let flValue = RoomReward["value"];
			rewardPanel.SetDialogVariable(
				"value",
				Math.floor(flValue) == flValue ? Math.floor(flValue) : flValue.toFixed(1),
			);*/
		}
		//       if (RoomReward["reward_type"] == "REWARD_TYPE_MINOR_STATS_UPGRADE")
		//       {
		//           rewardPanel.SetDialogVariable( "ability_name", GetName( RoomReward, rewardPanel ) );
		//           var flValue = RoomReward[ "value" ];
		//           rewardPanel.SetDialogVariable( "value", Math.floor(flValue) == flValue ? Math.floor(flValue) : flValue.toFixed(1) );
		//       }
		rewardPanel.SetDialogVariable("tier", $.Localize("#DOTA_HUD_" + RoomReward["reward_tier"] + "_Desc"));

		rewardPanel.SetDialogVariable("reward_name", GetName(RoomReward, rewardPanel));
		rewardPanel.SetDialogVariable("reward_description", GetDescription(RoomReward, rewardPanel));

		rewardPanel
			.FindChildTraverse("ConfirmButton")
			.SetPanelEvent("onactivate", RewardSelected(ii, RoomReward["reward_type"], szCurrentDepth, 1));
	}

	ShowAghanimRewardsHUD(true, false);
}

function RewardSelected(reward_index, reward_type, room_depth, callback_src) {
	return () => {
		OnRewardClicked(reward_index, reward_type, room_depth);
	};
}

function SetRewardHUDRarity(szRarity) {
	AghanimRewardsHUD.SetDialogVariable("header_rarity", $.Localize("#DOTA_HUD_Reward_Rarity_" + szRarity));

	AghanimRewardsHUD.SetHasClass("CommonRoomRarity", szRarity == "common" || szRarity == "");
	AghanimRewardsHUD.SetHasClass("EliteRoomRarity", szRarity == "elite");
	AghanimRewardsHUD.SetHasClass("LegendaryRoomRarity", szRarity == "epic");
	AghanimRewardsHUD.SetHasClass("StartingRoomRarity", szRarity == "starting");
}

function UpdateRerollButton() {
	REROLL_BUTTON.SetHasClass("Visible", lastDrawID == displayedDrawID)
	REROLL_BUTTON.SetHasClass("Locked", false);

	const rewardRarity = AghanimRewardsHUD.BHasClass("LegendaryRoomRarity") ? REROLL_LEGENDARY : REROLL_COMMON;
	const rewardCost = Game.IsInToolsMode() ? 0 : REROLL_COST[rewardRarity];

	if (rewardCost == undefined) rewardCost = 500;

	REROLL_BUTTON.enabled = current_fragments >= rewardCost;
	if (REROLL_BUTTON.BHasHoverStyle()) ShowRerollsTooltip();

	if (rewardCost > 0) 
		REROLL_PRICE.SetDialogVariable("current_cost", rewardCost);
	else 
		REROLL_PRICE.SetDialogVariableLocString("current_cost", "#reroll_free");
}

function OnFragmentsUpdated(event) {
	current_fragments = event.coins
	UpdateRerollButton()
}

function ShowRerollsTooltip() {
	if (!REROLL_BUTTON.enabled) {
		$.DispatchEvent("DOTAShowTextTooltip", REROLL_BUTTON, "#not_enough_coins")
	}
}

$.Schedule(1.0, function () {
	CheckForRewardsHUD(false);
});

(() => {
	REROLL_PRICE.SetDialogVariableInt("current_cost", 500);

	GameEvents.Subscribe("reward_reroll:result", (data) => {
		Object.entries(data).forEach((entry) => {
			REROLL_COST[Number( entry[0] )] = entry[1]
		})
		UpdateRerollButton()
	});

	GameEvents.SendCustomGameEventToServer("reward_reroll:request_current_price", {});
})();

function OverrideDotaNeutralItemsShop() {
	const player_info = Game.GetPlayerInfo(Game.GetLocalPlayerID());
	if (player_info == undefined || player_info.player_selected_hero == "") {
		$.Schedule(0.5, OverrideDotaNeutralItemsShop);
		return;
	}

	var shop_grid_1 = $.GetContextPanel().GetParent().GetParent().GetParent().FindChildTraverse("GridNeutralsCategory");

	if (shop_grid_1) {
		shop_grid_1.style.overflow = "squish scroll";
		const items_lines = shop_grid_1.FindChildrenWithClassTraverse("TeamNeutralItemsTier");
		items_lines.forEach((line) => {
			const list = line.GetChild(1);
			list.style.flowChildren = "right-wrap";
			list.style.visibility = "collapse";
		});

		DisplayNeutralItemsRows();
	}

	$.Schedule(1/5, OverrideDotaNeutralItemsShop)
}

/*------------------------------------------------------------------------------------------*/

function DisplayNeutralItemsRows() {
	let shop_grid_1 = $.GetContextPanel().GetParent().GetParent().GetParent().FindChildTraverse("GridNeutralsCategory");
	const individual_items = shop_grid_1.FindChildTraverse("TeamNeutralItems").FindChildrenWithClassTraverse("TeamNeutralItem");

	if (individual_items.length < 1) {
		return;
	}

	individual_items.forEach((item) => {
		item.style.visibility = "visible";
	});
}

/*------------------------------------------------------------------------------------------*/

(function () {
	OverrideDotaNeutralItemsShop();
})();
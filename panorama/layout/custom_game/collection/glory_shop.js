const GLORY_OFFERS = {

};
const gloryOffersRoot = $("#GloryOffersRoot");
const gloryShop = $("#GloryShopRoot");
function CloseGloryShop() {
	gloryShop.SetHasClass("show", false);
}
function OpenGloryShop() {
	gloryShop.SetHasClass("show", true);
}
function BuyGlory() {}
(function () {
	gloryOffersRoot.RemoveAndDeleteChildren();
	const isNoFortuneShop = MAP_NAME == "dota" || MAP_NAME == "dota_tournament";
	let currency_name = "glory";
	if (MAP_NAME == "main") currency_name = "fragment";

	Object.entries(GLORY_OFFERS).forEach(([value, data]) => {
		const offerPanel = $.CreatePanel("Panel", gloryOffersRoot, "");
		offerPanel.BLoadLayoutSnippet("GloryOffer");
		offerPanel.FindChildTraverse("GloryOfferHeaderText_Glory").text = ParseBigNumber(value);
		offerPanel.FindChildTraverse("GloryOfferHeaderText_Fortune").text = data.fortune;
		offerPanel.FindChildTraverse("GloryOfferPrice").SetDialogVariable("price", GetLocalPrice(data.price));
		offerPanel.FindChildTraverse("GloryOfferPrice").SetDialogVariable("paySymbol", $.Localize("#paySymbol"));
		offerPanel.FindChildTraverse("Popular").visible = data.popular != undefined;
		offerPanel.FindChildTraverse("GloryDiscount").text = data.bonus
			? $.Localize("#glory_offer_bonus").replace("##pct##", data.bonus)
			: "";
		const image = `file://{images}/custom_game/collection/glory_shop/${currency_name}_bundle_${value}${
			isNoFortuneShop ? "_no_fortune.png" : ".png"
		}`;

		offerPanel.FindChildTraverse("GloryOfferData").style.backgroundImage = "url('" + image + "')";
		const bundleName = "purchase_glory_bundle_" + value;
		offerPanel.FindChildTraverse("GloryOfferButton").SetPanelEvent("onactivate", function () {
			_CreatePurchaseAccess(
				bundleName,
				image,
				bundleName,
				bundleName + "_description",
				Math.round(data.price * 100) / 100,
			);
		});
	});
})();

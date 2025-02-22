const NON_BREAKING_SPACE = "\u00A0";
const ROOT = $.GetContextPanel();

const max_chat_width = 750;
const image_size = 23;
const margin_between_images = 3;

function CreateCustomMessage(data) {
	const _space_repeat = Math.floor(19 / (Math.ceil(ROOT.actualuiscale_x * 10) / 10));
	let text = NON_BREAKING_SPACE.repeat(_space_repeat);
	const chatLinesPanel = FindDotaHudElement("ChatLinesPanel");
	const message = $.CreatePanel("Label", chatLinesPanel, "", {
		class: "ChatLine",
		html: "true",
		selectionpos: "auto",
		hittest: "false",
		hittestchildren: "false",
	});
	message.style.flowChildren = "right";
	message.style.color = "#faeac9";
	message.style.opacity = 1;
	$.Schedule(6, () => {
		message.style.opacity = null;
	});

	let hero = -1;

	if (data.PlayerID > -1) {
		const playerInfo = Game.GetPlayerInfo(data.PlayerID);
		const playerColor = GetHEXPlayerColor(data.PlayerID);
		text += data.isTeam ? `[${$.Localize("#DOTA_ChatCommand_GameAllies_Name")}] ` : NON_BREAKING_SPACE;
		text += `<font color='${playerColor}'>${playerInfo.player_name}</font>: `;

		$.CreatePanel("Panel", message, "", { class: "HeroBadge", selectionpos: "auto" });

		hero = playerInfo.player_selected_hero_entity_index;

		const heroIcon = $.CreatePanel("Image", message, "", { class: "HeroIcon", selectionpos: "auto" });
		heroIcon.SetImage(GetPortraitImage(data.PlayerID, playerInfo.player_selected_hero));
	} else {
		text += data.isTeam ? `[${$.Localize("#DOTA_ChatCommand_GameAllies_Name")}] ` : NON_BREAKING_SPACE;
	}

	//Proper localization for talents
	if (data.abilities && data.abilities[0]) {
		const ability = Entities.GetAbilityByName(hero, data.abilities[0]);
		message.SetDialogVariable("value", Abilities.GetSpecialValueFor(ability, "value"));
	}

	text += data.textData.replace(/%%\d*(.+?)%%/g, (_, token) => $.Localize("#" + token, message));

	message.text = text;

	let d_messages = [];
	message.text.split(" ").forEach((t) => {
		const d_message = $.CreatePanel("Label", ROOT, "", {
			class: "DummyChatLine",
			html: "true",
			hittest: "false",
		});
		d_message.text = t + " ";
		d_messages.push(d_message);
	});

	$.Schedule(0.03, () => {
		if (data.abilities != undefined) {
			let current_width = 0;
			let full_lines = 0;

			d_messages.forEach((mess) => {
				const mess_width = mess.contentwidth / mess.actualuiscale_y;
				if (current_width + mess_width + image_size <= max_chat_width) current_width += mess_width;
				else {
					current_width = mess_width;
					full_lines++;
				}
				mess.DeleteAsync(0);
			});
			const abilities_parent = $.CreatePanel("Panel", message, "", {
				class: "AbilitiesRoot",
				hittest: "false",
			});

			const default_margin = 76;
			abilities_parent.style.flowChildren = "right-wrap";
			abilities_parent.style.marginTop = `${(full_lines * 20) / ROOT.actualuiscale_x}px`;
			abilities_parent.style.marginLeft = `-${default_margin}px`;
			abilities_parent.style.paddingLeft = `-${margin_between_images}px`;
			abilities_parent.style.width = `${max_chat_width}px`;

			Object.values(data.abilities).forEach((abilityName, index) => {
				const abilityIcon = $.CreatePanel("DOTAAbilityImage", abilities_parent, "", {
					hittestchildren: "false",
					scaling: "stretch",
				});
				abilityIcon.abilityname = abilityName;
				abilityIcon.style.width = `${image_size}px`;
				abilityIcon.style.height = `${image_size}px`;

				if (index == 0) {
					abilityIcon.style.marginLeft = `${current_width + margin_between_images}px`;
				} else if (index > 0) abilityIcon.style.marginLeft = `${margin_between_images}px`;
			});
		}
	});
}

(function () {
	ROOT.RemoveAndDeleteChildren();
	GameEvents.Subscribe("custom_chat_message", CreateCustomMessage);
})();

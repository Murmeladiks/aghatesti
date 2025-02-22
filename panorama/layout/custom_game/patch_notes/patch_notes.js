function CreatePatchNotes(data) {
	const patchBox = $("#PatchNotesLines");
	patchBox.RemoveAndDeleteChildren();
	Object.values(data).forEach((patchDataValue) => {
		if (!patchDataValue.date || !patchDataValue.data) return;
		const patchData = $.CreatePanel("Panel", patchBox, "");
		patchData.BLoadLayoutSnippet("PatchData");

		patchData.FindChild("PatchDate").text = `━━${$.Localize("#patch_date_format")
			.replace("##day##", patchDataValue.date.substr(8, 2))
			.replace("##month##", $.Localize("#UI_month_" + (parseInt(patchDataValue.date.substr(5, 2)) - 1)))
			.replace("##year##", patchDataValue.date.substr(0, 4))}━━`;

		const patchLines = patchData.FindChild("PatchLines");
		const lines = patchDataValue.data.split("\n");

		lines.forEach((line) => {
			const patchLine = $.CreatePanel("Panel", patchLines, "");
			patchLine.BLoadLayoutSnippet("PatchLine");
			line = line[0].toUpperCase() + line.substring(1);
			patchLine.FindChild("PatchText").text = line.replace(/^ ?- ?/, "");
		});
	});
}

(function () {
	GameEvents.SendCustomGameEventToServer("setlanguage", { language: $.Language() });
	GameEvents.SendCustomGameEventToServer("patch_notes:get_patch_notes", {});
	GameEvents.Subscribe("patch_notes:create_patch_notes", CreatePatchNotes);
})();

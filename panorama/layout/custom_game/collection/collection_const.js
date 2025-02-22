const ITEMS_RARITY = {
	[1]: {
		sound: "Loot_Drop_Stinger_Uncommon",
		name: "common",
		color: "#a7b2ce",
	},
	[2]: {
		sound: "Loot_Drop_Stinger_Rare",
		name: "uncommon",
		color: "#5a92cd",
	},
	[3]: {
		sound: "Loot_Drop_Stinger_Mythical",
		name: "rare",
		color: "#4867f1",
	},
	[4]: {
		sound: "ui.treasure_01",
		name: "mythical",
		color: "#834af5",
	},
	[5]: {
		sound: "ui.treasure_02",
		name: "legendary",
		color: "#d033e2",
	},
	[6]: {
		sound: "ui.treasure_03",
		name: "immortal",
		color: "#cc9e35",
	},
	[7]: {
		sound: "collection.drop_arcana",
		name: "arcana",
		color: "#a3d857",
	},
	[99]: {
		sound: "Loot_Drop_Stinger_Uncommon",
		name: "unique",
		color: "#d80f00",
	},
};
const SOUND_DUPLICATE_ITEM = "collection.duplicate_item";

const ITEMS_TYPES = [
	"Masteries",
	"Treasures",
	"Auras",
	"HeroSkins",
	"Pets",
	"KillEffects",
	"Barrages",
	"CosmeticAbilities",
	"DuelEffects",
	"BetEffects",
	"Effigies",
	"SpellEffects",
	"Items",
	"ChatWheels",
	"Interfaces",
	"Sprays",
	"Specials",
];

const PERMANENT_SHOW_TYPES = ["Masteries", "Treasures"];

const EQUIPPED = 0;
const EQUIP = 1;
const OPEN_TREASURE = 2;
const ITEM_OWNED = 3;

const ITEMS_EQUIP_STATE = {
	[0]: "equipped",
	[1]: "equip",
	[2]: "open_treasure",
	[3]: "item_owned",
};

const PLAYER_BOOST_STATE = {
	[0]: "no_boost",
	[1]: "base_booster",
	[2]: "golden_booster",
};

const TOOLTIPS_WITH_VALUES = { DOTAU_MMR: "mmr_min", Coins: "cost", Money: "cost" };

const SOURCES_WEIGHT = ["SupporterState_2", "SupporterState_1", "Money", "Other", "Coins", "DOTAU_MMR", "Treasure"];
const TREASURES_WEIGHT = [
	"treasure_starter",
	"treasure_collection_1",
	"treasure_emotes_basic",
	"treasure_emotes_deluxe",
	"treasure_hallowed_shimmer",
	"treasure_winter",
];

const SORT_FUNCTIONS = {
	rarity_up: function (a, b) {
		let result = 0;
		if (a.rarity < b.rarity) {
			result = 1;
		} else {
			if (a.rarity != b.rarity) {
				result = -1;
			}
		}
		return result;
	},
	rarity_down: function (a, b) {
		let result = 0;
		if (a.rarity > b.rarity) {
			result = 1;
		} else {
			if (a.rarity != b.rarity) {
				result = -1;
			}
		}
		return result;
	},
	default: function (a, b) {
		let result = 0;
		if (a.default < b.default) {
			result = 1;
		} else {
			if (a.default != b.default) {
				result = -1;
			}
		}
		return result;
	},
};

const TIMES_MULTIPLAYER = {
	sec: 86400,
	min: 1440,
	hour: 24,
	day: 1,
};

const ITEMS_IN_WHEEL_INIT = 10;

const ITEMS_BUY_COINS_SOUNDS = {
	true: "Item.PickUpRingShop",
	false: "ui.contract_fail",
};
const ITEM_CHANGE_EQUIP_STATE_COOLDOWN = 0.5;
const MAP_NAME = Game.GetMapInfo().map_display_name;


// Chat Wheel
let active_lines = {
    0: ["", "", ""],
    1: ["", "", ""],
    2: ["", "", ""],
    3: ["", "", ""],
    4: ["", "", ""],
    5: ["", "", ""],
    6: ["", "", ""],
    7: ["", "", ""],
    8: ["", "", ""],
    9: ["", "", ""],
}
let unlocked_lines = [
    "sticker_6_58380135_voice",
    "sticker_6_101627486_voice"
]
let VOICE_LINES = {};
let CATEGORIES = {
	"#DOTA_talent_voice_season_11_en": ["talent_11_665124_voice_1","talent_11_665124_voice_2","talent_11_690740_voice_1","talent_11_9332911_voice_1","talent_11_9332911_voice_2","talent_11_70090192_voice_1","talent_11_70090192_voice_2","talent_11_86762037_voice_1","talent_11_86762037_voice_2","talent_11_87264171_voice_1","talent_11_87264171_voice_2","talent_11_89511038_voice_1","talent_11_89511038_voice_2","talent_11_196628643_voice_1","talent_11_196628643_voice_2","talent_11_47434686_voice_1","talent_11_47434686_voice_2","talent_11_242846025_voice_1","talent_11_242846025_voice_2","talent_11_690740_voice_2","talent_11_68243195_voice_1","talent_11_68243195_voice_2","talent_11_228457326_voice_1","talent_11_228457326_voice_2","talent_11_181866849_voice_1","talent_11_181866849_voice_2","talent_11_95145869_voice_1","talent_11_95145869_voice_2","talent_11_87177591_voice_1","talent_11_87177591_voice_2","talent_11_86918872_voice_1","talent_11_86918872_voice_2","talent_11_78601976_voice_1","talent_11_78601976_voice_2","talent_11_37899842_voice_1","talent_11_37899842_voice_2","talent_11_4281729_voice_1","talent_11_4281729_voice_2","talent_11_2744346_voice_1","talent_11_2744346_voice_2","talent_11_256125365_voice_1","talent_11_256125365_voice_2","talent_11_58380135_voice_1","talent_11_58380135_voice_2","talent_11_193673646_voice_1","talent_11_193673646_voice_2","talent_11_5448108_voice_1","talent_11_5448108_voice_2","talent_11_32995405_voice_1","talent_11_32995405_voice_2","talent_11_87024653_voice_1","talent_11_87024653_voice_2","talent_11_112035603_voice_1","talent_11_112035603_voice_2","talent_11_136780564_voice_1","talent_11_136780564_voice_2","talent_11_270293472_voice_1","talent_11_270293472_voice_2","talent_11_110155287_voice_1","talent_11_110155287_voice_2","talent_11_169025618_voice_1","talent_11_41475731_voice_1","talent_11_41475731_voice_2","talent_11_68186278_voice_1","talent_11_68186278_voice_2","talent_11_104324194_voice_1","talent_11_104324194_voice_2","talent_11_37147003_voice_1","talent_11_37147003_voice_2","talent_11_56708688_voice_1","talent_11_56708688_voice_2","talent_11_49036093_voice_1","talent_11_49036093_voice_2","talent_11_169025618_voice_2"],
	"#DOTA_talent_voice_season_11_ru": ["talent_11_104433897_voice_1","talent_11_104433897_voice_2","talent_11_899273569_voice_1","talent_11_159020918_voice_1","talent_11_159020918_voice_2","talent_11_87283048_voice_1","talent_11_87283048_voice_2","talent_11_83038675_voice_1","talent_11_83038675_voice_2","talent_11_77415789_voice_1","talent_11_77415789_voice_2","talent_11_171568230_voice_1","talent_11_171568230_voice_2","talent_11_113740361_voice_1","talent_11_113740361_voice_2","talent_11_107644273_voice_1","talent_11_107644273_voice_2","talent_11_92423451_voice_1","talent_11_92423451_voice_2","talent_11_57578110_voice_1","talent_11_57578110_voice_2","talent_11_26751577_voice_1","talent_11_26751577_voice_2","talent_11_55666790_voice_1","talent_11_55666790_voice_2","talent_11_80542879_voice_1","talent_11_80542879_voice_2","talent_11_94049589_voice_1","talent_11_94049589_voice_2","talent_11_100250283_voice_1","talent_11_100250283_voice_2","talent_11_100309892_voice_1","talent_11_100309892_voice_2","talent_11_166312089_voice_1","talent_11_166312089_voice_2","talent_11_203351055_voice_1","talent_11_203351055_voice_2","talent_11_206742513_voice_1","talent_11_206742513_voice_2","talent_11_899273569_voice_2","talent_11_404150207_voice_1","talent_11_404150207_voice_2","talent_11_164199202_voice_1","talent_11_164199202_voice_2"],
	"#DOTA_talent_voice_season_11_zh": ["talent_11_89045027_voice_1","talent_11_89045027_voice_2","talent_11_89149892_voice_1","talent_11_89149892_voice_2","talent_11_125210835_voice_1","talent_11_125210835_voice_2","talent_11_96877519_voice_1","talent_11_96877519_voice_2","talent_11_124168390_voice_1","talent_11_124168390_voice_2","talent_11_286580656_voice_1","talent_11_286580656_voice_2","talent_11_182379128_voice_1","talent_11_182379128_voice_2","talent_11_150961567_voice_1","talent_11_150961567_voice_2","talent_11_139186922_voice_1","talent_11_139186922_voice_2","talent_11_174422691_voice_1","talent_11_174422691_voice_2","talent_11_92607797_voice_1","talent_11_92607797_voice_2","talent_11_98887913_voice_1","talent_11_98887913_voice_2","talent_11_100883708_voice_1","talent_11_100883708_voice_2","talent_11_103386764_voice_1","talent_11_103386764_voice_2","talent_11_108414982_voice_1","talent_11_108414982_voice_2","talent_11_111114687_voice_1","talent_11_111114687_voice_2","talent_11_123697330_voice_1","talent_11_123697330_voice_2","talent_11_136356404_voice_1","talent_11_136356404_voice_2","talent_11_140888552_voice_1","talent_11_140888552_voice_2","talent_11_183378746_voice_1","talent_11_183378746_voice_2"],
	"#DOTA_talent_voice_season_11_es": ["talent_11_123127736_voice_1","talent_11_123127736_voice_2","talent_11_123156879_voice_1","talent_11_123156879_voice_2","talent_11_187871574_voice_1","talent_11_187871574_voice_2","talent_11_1150916450_voice_1","talent_11_1150916450_voice_2","talent_11_1012061568_voice_1","talent_11_1012061568_voice_2","talent_11_314468507_voice_1","talent_11_314468507_voice_2","talent_11_302568414_voice_1","talent_11_302568414_voice_2","talent_11_198163645_voice_1","talent_11_198163645_voice_2","talent_11_156331087_voice_1","talent_11_156331087_voice_2","talent_11_125455301_voice_1","talent_11_125455301_voice_2","talent_11_117089283_voice_1","talent_11_117089283_voice_2","talent_11_116326606_voice_1","talent_11_116326606_voice_2","talent_11_112151448_voice_1","talent_11_112151448_voice_2","talent_11_104196230_voice_1","talent_11_104196230_voice_2","talent_11_101054160_voice_1","talent_11_128947109_voice_1","talent_11_128947109_voice_2","talent_11_74378317_voice_1","talent_11_74378317_voice_2","talent_11_40936819_voice_1","talent_11_40936819_voice_2","talent_11_59690707_voice_1","talent_11_59690707_voice_2","talent_11_94923783_voice_1","talent_11_94923783_voice_2","talent_11_121604932_voice_1","talent_11_121604932_voice_2","talent_11_133167741_voice_1","talent_11_133167741_voice_2","talent_11_163662059_voice_1","talent_11_163662059_voice_2","talent_11_86804163_voice_1","talent_11_86804163_voice_2","talent_11_123044675_voice_1","talent_11_123044675_voice_2","talent_11_22793772_voice_1","talent_11_22793772_voice_2","talent_11_112823881_voice_1","talent_11_112823881_voice_2","talent_11_101054160_voice_2","talent_11_185001854_voice_1","talent_11_185001854_voice_2"],
	"#dota_chatwheel_header_international2023_caster_en": ["TI12_Caster_English_1", "TI12_Caster_English_2", "TI12_Caster_English_3", "TI12_Caster_English_4", "TI12_Caster_English_5"],
	"#dota_chatwheel_header_international2023_caster_ru": ["TI12_Caster_Russian_1", "TI12_Caster_Russian_2", "TI12_Caster_Russian_3", "TI12_Caster_Russian_4", "TI12_Caster_Russian_5"],
	"#dota_chatwheel_header_international2023_caster_cn": ["TI12_Caster_Chinese_1", "TI12_Caster_Chinese_2", "TI12_Caster_Chinese_3", "TI12_Caster_Chinese_4", "TI12_Caster_Chinese_5"],
	"#dota_chatwheel_header_international2023_caster_sp": ["TI12_Caster_Spanish_1", "TI12_Caster_Spanish_2", "TI12_Caster_Spanish_3", "TI12_Caster_Spanish_4", "TI12_Caster_Spanish_5"],
	"#dota_chatwheel_header_international2023_caster_pt": ["TI12_Caster_Portuguese_1", "TI12_Caster_Portuguese_2", "TI12_Caster_Portuguese_3", "TI12_Caster_Portuguese_4", "TI12_Caster_Portuguese_5"],
    "#DOTA_talent_voice_season_10_en": ["talent_10_89511038_voice_1", "talent_10_89511038_voice_2", "talent_10_86918872_voice_1", "talent_10_86918872_voice_2", "talent_10_87264171_voice_1", "talent_10_1013411_voice_1", "talent_10_1013411_voice_2", "talent_10_169025618_voice_1", "talent_10_87177591_voice_1", "talent_10_87177591_voice_2", "talent_10_26231701_voice_1", "talent_10_26231701_voice_2", "talent_10_665124_voice_1", "talent_10_665124_voice_2", "talent_10_136780564_voice_1", "talent_10_41475731_voice_1", "talent_10_41475731_voice_2", "talent_10_270293472_voice_1", "talent_10_270293472_voice_2", "talent_10_87024653_voice_1", "talent_10_37899842_voice_1", "talent_10_181866849_voice_1", "talent_10_181866849_voice_2", "talent_10_37147003_voice_1", "talent_10_37147003_voice_2", "talent_10_242846025_voice_1", "talent_10_242846025_voice_2", "talent_10_9332911_voice_1", "talent_10_9332911_voice_2", "talent_10_97577101_voice_1", "talent_10_97577101_voice_2", "talent_10_95145869_voice_1", "talent_10_95145869_voice_2", "talent_10_86725175_voice_1", "talent_10_196628643_voice_1", "talent_10_196628643_voice_2", "talent_10_256125365_voice_1", "talent_10_256125365_voice_2", "talent_10_2744346_voice_1", "talent_10_2744346_voice_2", "talent_10_5448108_voice_1", "talent_10_5448108_voice_2", "talent_10_690740_voice_1", "talent_10_4281729_voice_1", "talent_10_4281729_voice_2", "talent_10_47434686_voice_1", "talent_10_47434686_voice_2", "talent_10_70090192_voice_1", "talent_10_70090192_voice_2", "talent_10_193673646_voice_1", "talent_10_193673646_voice_2", "talent_10_112035603_voice_1", "talent_10_112035603_voice_2", "talent_10_110155287_voice_1", "talent_10_110155287_voice_2", "talent_10_86762037_voice_1", "talent_10_68186278_voice_1", "talent_10_68186278_voice_2", "talent_10_104324194_voice_1", "talent_10_104324194_voice_2", "talent_10_78601976_voice_1", "talent_10_78601976_voice_2", "talent_10_1482324_voice_1", "talent_10_32995405_voice_1", "talent_10_32995405_voice_2", "talent_10_58380135_voice_1", "talent_10_20796460_voice_1", "talent_10_20796460_voice_2", "talent_10_125154850_voice_1", "talent_10_125154850_voice_2", "talent_10_2918679_voice_1", "talent_10_2918679_voice_2", "talent_10_55300424_voice_1", "talent_10_55300424_voice_2", "talent_10_87264171_voice_2", "talent_10_169025618_voice_2", "talent_10_136780564_voice_2", "talent_10_87024653_voice_2", "talent_10_37899842_voice_2", "talent_10_86725175_voice_2", "talent_10_58380135_voice_2", "talent_10_86762037_voice_2", "talent_10_1482324_voice_2"],
    "#DOTA_talent_voice_season_10_ru": ["talent_10_899273569_voice_1","talent_10_899273569_voice_2","talent_10_87283048_voice_1","talent_10_217472313_voice_1","talent_10_100250283_voice_1","talent_10_100250283_voice_2","talent_10_83038675_voice_1","talent_10_83038675_voice_2","talent_10_77415789_voice_1","talent_10_77415789_voice_2","talent_10_113372833_voice_1","talent_10_57578110_voice_1","talent_10_57578110_voice_2","talent_10_47701962_voice_1","talent_10_241732595_voice_1","talent_10_241732595_voice_2","talent_10_159020918_voice_1","talent_10_159020918_voice_2","talent_10_80542879_voice_1","talent_10_80542879_voice_2","talent_10_76271205_voice_1","talent_10_76271205_voice_2","talent_10_178638015_voice_1","talent_10_178638015_voice_2","talent_10_123787524_voice_1","talent_10_123787524_voice_2","talent_10_87075584_voice_1","talent_10_87075584_voice_2","talent_10_144752057_voice_1","talent_10_104433897_voice_1","talent_10_206742513_voice_1","talent_10_206742513_voice_2","talent_10_90324740_voice_1","talent_10_90324740_voice_2","talent_10_350747327_voice_1","talent_10_166312089_voice_1","talent_10_166312089_voice_2","talent_10_369603517_voice_1","talent_10_369603517_voice_2","talent_10_96196828_voice_1","talent_10_96196828_voice_2","talent_10_26751577_voice_1","talent_10_92423451_voice_1","talent_10_92423451_voice_2","talent_10_404150207_voice_1","talent_10_404150207_voice_2","talent_10_87283048_voice_2","talent_10_217472313_voice_2","talent_10_113372833_voice_2","talent_10_47701962_voice_2","talent_10_144752057_voice_2","talent_10_104433897_voice_2","talent_10_350747327_voice_2"],
    "#DOTA_talent_voice_season_10_zh": ["talent_10_86750861_voice_1","talent_10_86750861_voice_2","talent_10_103386764_voice_1","talent_10_103386764_voice_2","talent_10_123697330_voice_1","talent_10_123697330_voice_2","talent_10_286580656_voice_1","talent_10_286580656_voice_2","talent_10_92607797_voice_1","talent_10_92607797_voice_2","talent_10_96877519_voice_1","talent_10_136356404_voice_1","talent_10_136356404_voice_2","talent_10_182379128_voice_1","talent_10_140888552_voice_1","talent_10_140888552_voice_2","talent_10_124168390_voice_1","talent_10_124168390_voice_2","talent_10_139186922_voice_1","talent_10_139186922_voice_2","talent_10_89045027_voice_1","talent_10_89045027_voice_2","talent_10_246523528_voice_1","talent_10_246523528_voice_2","talent_10_111189717_voice_1","talent_10_111189717_voice_2","talent_10_103039499_voice_1","talent_10_103039499_voice_2","talent_10_89149892_voice_1","talent_10_89149892_voice_2","talent_10_125210835_voice_1","talent_10_125210835_voice_2","talent_10_188850333_voice_1","talent_10_188850333_voice_2","talent_10_96877519_voice_2","talent_10_182379128_voice_2","talent_10_113705693_voice_1"],
    "#DOTA_talent_voice_season_10_es": ["talent_10_123127736_voice_1","talent_10_123127736_voice_2","talent_10_1222248677_voice_1","talent_10_1222248677_voice_2","talent_10_123156879_voice_1","talent_10_123156879_voice_2","talent_10_198163645_voice_1","talent_10_198163645_voice_2","talent_10_125455301_voice_1","talent_10_59690707_voice_1","talent_10_59690707_voice_2","talent_10_314468507_voice_1","talent_10_314468507_voice_2","talent_10_121604932_voice_1","talent_10_121604932_voice_2","talent_10_128947109_voice_1","talent_10_116326606_voice_1","talent_10_116326606_voice_2","talent_10_40936819_voice_1","talent_10_40936819_voice_2","talent_10_74378317_voice_1","talent_10_74378317_voice_2","talent_10_49036093_voice_1","talent_10_49036093_voice_2","talent_10_104196230_voice_1","talent_10_99431452_voice_1","talent_10_99431452_voice_2","talent_10_97629760_voice_1","talent_10_97629760_voice_2","talent_10_49310752_voice_1","talent_10_49310752_voice_2","talent_10_322364182_voice_1","talent_10_322364182_voice_2","talent_10_123044675_voice_1","talent_10_123044675_voice_2","talent_10_94923783_voice_1","talent_10_94923783_voice_2","talent_10_112151448_voice_1","talent_10_112151448_voice_2","talent_10_102556298_voice_1","talent_10_122501532_voice_1","talent_10_122501532_voice_2","talent_10_1112008831_voice_1","talent_10_187871574_voice_1","talent_10_343774159_voice_1","talent_10_86753880_voice_1","talent_10_86753880_voice_2","talent_10_128947109_voice_2","talent_10_1084067414_voice_1","talent_10_1084067414_voice_2","talent_10_104196230_voice_2","talent_10_102556298_voice_2","talent_10_1112008831_voice_2","talent_10_187871574_voice_2","talent_10_22793772_voice_1","talent_10_343774159_voice_2","talent_10_176565294_voice_1","talent_10_176565294_voice_2","talent_10_22793772_voice_2"],
    "#DOTA_stickers_voice_lines_season_6_en":["sticker_6_58380135_voice","sticker_6_20796460_voice","sticker_6_196628643_voice","sticker_6_95145869_voice","sticker_6_5448108_voice","sticker_6_37899842_voice","sticker_6_87264171_voice","sticker_6_110155287_voice","sticker_6_193673646_voice","sticker_6_87024653_voice","sticker_6_89511038_voice","sticker_6_1482324_voice","sticker_6_256125365_voice","sticker_6_9332911_voice","sticker_6_97577101_voice","sticker_6_37147003_voice","sticker_6_68186278_voice","sticker_6_690740_voice","sticker_6_47434686_voice","sticker_6_4281729_voice","sticker_6_270293472_voice","sticker_6_70090192_voice","sticker_6_2744346_voice","sticker_6_55300424_voice","sticker_6_104324194_voice","sticker_6_78601976_voice","sticker_6_1013411_voice","sticker_6_87177591_voice","sticker_6_54535035_voice","sticker_6_41475731_voice","sticker_6_181866849_voice","sticker_6_68243195_voice","sticker_6_665124_voice","sticker_6_2237798_voice","sticker_6_242846025_voice","sticker_6_136780564_voice","sticker_6_32995405_voice","sticker_6_112035603_voice","sticker_6_47123324_voice","sticker_6_26231701_voice","sticker_6_24014028_voice","sticker_6_6922000_voice","sticker_6_169025618_voice","sticker_6_76995948_voice","sticker_6_2918679_voice","sticker_6_228457326_voice"],
    "#DOTA_stickers_voice_lines_season_6_ru":["sticker_6_100250283_voice","sticker_6_80542879_voice","sticker_6_107644273_voice","sticker_6_48739453_voice","sticker_6_155564702_voice","sticker_6_26751577_voice","sticker_6_115407110_voice","sticker_6_166312089_voice","sticker_6_89137399_voice","sticker_6_91287278_voice","sticker_6_77415789_voice","sticker_6_104433897_voice","sticker_6_36547811_voice","sticker_6_182993582_voice","sticker_6_130801103_voice","sticker_6_87565571_voice","sticker_6_113568927_voice","sticker_6_89625472_voice","sticker_6_47701962_voice","sticker_6_31375795_voice","sticker_6_34322358_voice","sticker_6_55666790_voice","sticker_6_87075584_voice","sticker_6_93704000_voice","sticker_6_95216436_voice","sticker_6_115396647_voice","sticker_6_350747327_voice","sticker_6_143544063_voice","sticker_6_363871826_voice","sticker_6_87201671_voice","sticker_6_96196828_voice","sticker_6_113372833_voice","sticker_6_187770406_voice","sticker_6_123645735_voice","sticker_6_87283048_voice","sticker_6_196482746_voice","sticker_6_118074923_voice","sticker_6_57578110_voice","sticker_6_493502022_voice","sticker_6_77783966_voice","sticker_6_427403986_voice","sticker_6_375405213_voice","sticker_6_100028335_voice","sticker_6_123787524_voice","sticker_6_117833458_voice","sticker_6_83038675_voice","sticker_6_86930446_voice","sticker_6_87748419_voice","sticker_6_93552791_voice"],
    "#DOTA_stickers_voice_lines_season_6_zh":["sticker_6_174422691_voice","sticker_6_139186922_voice","sticker_6_89149892_voice","sticker_6_188850333_voice","sticker_6_123697330_voice","sticker_6_111189717_voice","sticker_6_103386764_voice","sticker_6_136356404_voice","sticker_6_89045027_voice","sticker_6_286580656_voice","sticker_6_149486894_voice","sticker_6_86750861_voice","sticker_6_92607797_voice","sticker_6_113705693_voice","sticker_6_125210835_voice","sticker_6_96877519_voice","sticker_6_88508515_voice","sticker_6_89157606_voice","sticker_6_89371588_voice","sticker_6_90137663_voice","sticker_6_90881881_voice","sticker_6_90892194_voice","sticker_6_100883708_voice","sticker_6_101678979_voice","sticker_6_109081055_voice","sticker_6_140460818_voice","sticker_6_140888552_voice","sticker_6_136168803_voice","sticker_6_90892734_voice","sticker_6_182379128_voice","sticker_6_108382060_voice","sticker_6_90045009_voice","sticker_6_136177710_voice","sticker_6_86034556_voice"],
    "#DOTA_stickers_voice_lines_season_6_es":["sticker_6_49036093_voice","sticker_6_40936819_voice","sticker_6_112151448_voice","sticker_6_59690707_voice","sticker_6_74378317_voice","sticker_6_116326606_voice","sticker_6_101054160_voice","sticker_6_121604932_voice","sticker_6_125455301_voice","sticker_6_104196230_voice","sticker_6_88756322_voice","sticker_6_123156879_voice","sticker_6_1222248677_voice","sticker_6_198163645_voice","sticker_6_35445648_voice","sticker_6_95804890_voice","sticker_6_123127736_voice","sticker_6_314468507_voice","sticker_6_22793772_voice","sticker_6_112823881_voice","sticker_6_123044675_voice","sticker_6_128947109_voice","sticker_6_1112008831_voice","sticker_6_344853869_voice","sticker_6_156331087_voice","sticker_6_302568414_voice","sticker_6_49809477_voice","sticker_6_322364182_voice","sticker_6_207916561_voice","sticker_6_86753880_voice","sticker_6_160782997_voice"],
    "#DOTA_stickers_voice_lines_season_6_pt":["sticker_6_34438121_voice","sticker_6_162794248_voice","sticker_6_101627486_voice","sticker_6_86782924_voice","sticker_6_170730181_voice","sticker_6_44603256_voice","sticker_6_1217329080_voice","sticker_6_128115676_voice","sticker_6_103578570_voice","sticker_6_98011900_voice","sticker_6_135653527_voice","sticker_6_89981994_voice","sticker_6_97072681_voice","sticker_6_1014985549_voice","sticker_6_110605738_voice","sticker_6_179308177_voice","sticker_6_100028469_voice","sticker_6_357110272_voice","sticker_6_113660693_voice","sticker_6_101920249_voice","sticker_6_164269110_voice","sticker_6_182188150_voice","sticker_6_108142709_voice","sticker_6_103263722_voice","sticker_6_363855410_voice","sticker_6_899017898_voice","sticker_6_122651724_voice","sticker_6_201687094_voice","sticker_6_101062921_voice","sticker_6_110764123_voice","sticker_6_81306398_voice"],
    "#dota_chatwheel_header_ti2021_caster_voice_lines":["jenkins_voice","aui_2000_voice","Avo_voice","BSJ_voice","Cap_voice","Dakota_voice","Ephey_voice","Fogged_voice","Frankie_voice","Gareth_voice","godz_voice","hotbid_voice","Kyle_voice","Lacoste_voice","Lizzard_voice","Lyrical_voice","Moxxi_voice","ODPixel_voice","Pimpmuckl/JJ_voice","PPD_voice","Purge_voice","PyrionFlax_voice","Sheever_voice","Siractionslacks_voice","skrff_voice","sumichu_voice","SUNSfan_voice","syndereN_voice","TeaGuvnor_voice","Trent_voice","tsunami_voice","Weppas_voice","4ce_voice","4liver_voice","9pasha_voice","Adekvat_voice","ARS-ART_voice","ArtStyle_voice","b0rbe1_voice","Bafik_voice","Belony_voice","CrystalMay_voice","Dendi_voice","DkPhobos_voice","Eiritel_voice","Goblak_voice","GodHunt_voice","Inmateoo_voice","JotM_voice","Lex_voice","LighTofHeaveN_voice","Lil_voice","Maelstorm_voice","NotInMyHouse_voice","Olsior_voice","Resolut1on_voice","Sh4dowehhh_voice","Solo_voice","v1lat_voice","XBOCT_voice","78_voice","ams_voice","blink_voice","cc_voice","dove_voice","freeagain_voice","inflame_voice","lavenderaa_voice","m4_voice","mashall_voice","mrrr_voice","pepper_voice","sansheng_voice","sdn_voice","wind_voice","yammers_voice","yuno_voice"],
}
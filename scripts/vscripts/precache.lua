g_ItemPrecache =
{
	"item_tombstone",
	"item_bag_of_gold",
	"item_health_potion",
	"item_mana_potion",
	"item_life_rune",
	"item_battle_points",
	"item_arcane_fragments",
	"item_javelin",
	"item_monkey_king_bar",
}

g_UnitPrecache =
{
	-- YOU THERE!!!! YES, YOU!!!!!!!
	-- Don't put your precaches in here. Units will already be precached by dota spawners
	-- Put your other precache in Precache methods in your encounters, ai, or abilities
	-- whether they are in script or C++ code.
	-- Doing so means quicker load time and less total memory used

	-- Assets in Aghanim path
	"npc_treasure_chest",
	"npc_dota_explosive_barrel",
	"aghsfort_ascension_level_picker_1",
	"aghsfort_ascension_level_picker_2",
	"aghsfort_ascension_level_picker_3",
	"aghsfort_ascension_level_picker_4",
	"npc_dota_announcer_aghanim",
	"npc_dota_story_crystal",

	-- Assets in Dota path
}

g_ModelPrecache =
{
	-- YOU THERE!!!! YES, YOU!!!!!!!
	-- Don't put your precaches in here. Units will already be precached by dota spawners
	-- Put your other precache in Precache methods in your encounters, ai, or abilities
	-- whether they are in script or C++ code.
	-- Doing so means quicker load time and less total memory used
	"models/gameplay/breakingcrate_dest.vmdl", -- item_bag_of_gold
	--"models/gameplay/attrib_tome_str.vmdl", -- item_book_of_strength
	--"models/gameplay/attrib_tome_agi.vmdl", -- item_book_of_agility
	--"models/gameplay/attrib_tome_int.vmdl", -- item_book_of_intelligence

	-- Assets in Dota path
	"models/props_gameplay/treasure_chest_gold.vmdl", -- Bunch of gold from treasure
	"models/props_gameplay/treasure_chest001.vmdl", -- Netural item chests
	"models/props_gameplay/gold_bag.vmdl", -- item_bag_of_gold
	"models/ui/exclamation/questionmark.vmdl", -- hidden challenges
	"models/items/bristleback/fisherman_with_evil_eye_back/fisherman_with_evil_eye_back.vmdl",
	"models/items/bristleback/fisherman_with_evil_eye_arms/fisherman_with_evil_eye_arms.vmdl",
	"models/items/bristleback/fisherman_with_evil_eye_head/fisherman_with_evil_eye_head.vmdl", 
	"models/items/bristleback/fisherman_with_evil_eye_neck/fisherman_with_evil_eye_neck.vmdl", 
	"models/items/bristleback/fisherman_with_evil_eye_weapon/fisherman_with_evil_eye_weapon.vmdl", 

	"models/items/courier/billy_bounceback/billy_bounceback.vmdl",
	-- Trap pets
	"models/items/wraith_king/arcana/wk_arcana_skeleton.vmdl",
	"models/items/courier/calabaxa_courier/calabaxa_courier.vmdl",
	"models/items/furion/treant/hallowed_horde/hallowed_horde.vmdl",
	"models/items/courier/courier_fall20/courier_fall20.vmdl",
	"models/items/courier/little_fraid_the_courier_of_simons_retribution/little_fraid_the_courier_of_simons_retribution.vmdl",
	"models/items/courier/krobeling/krobeling.vmdl",
	"models/items/courier/krobeling_gold/krobeling_gold.vmdl",
	"models/items/broodmother/spiderling/lycosidae_spiderling/lycosidae_spiderling.vmdl",
	"models/items/courier/pumpkin_courier/pumpkin_courier.vmdl",
	"models/items/wraith_king/wk_ti8_creep/wk_ti8_creep.vmdl",
	"models/items/wraith_king/wk_ti8_creep/wk_ti8_creep_crimson.vmdl",
	"models/courier/baby_rosh/babyroshan_ti9.vmdl",
	"models/items/broodmother/spiderling/the_glacial_creeper_creepling/the_glacial_creeper_creepling.vmdl",
	"models/items/courier/snowl/snowl.vmdl",
	"models/items/courier/scuttling_scotty_penguin/scuttling_scotty_penguin.vmdl",
	"models/items/courier/frostivus2018_courier_serac_the_seal/frostivus2018_courier_serac_the_seal.vmdl",
	"models/items/courier/duskie/duskie.vmdl",
	"models/items/courier/throe/throe.vmdl",
	"models/items/courier/bearzky_v2/bearzky_v2.vmdl",
	"models/items/courier/basim/basim_flying.vmdl",
	"models/items/courier/wabbit_the_mighty_courier_of_heroes/wabbit_the_mighty_courier_of_heroes.vmdl",
	"models/items/courier/wabbit_the_mighty_courier_of_heroes/wabbit_the_mighty_courier_of_heroes_flying.vmdl",
	"models/pets/icewrack_wolf/icewrack_wolf.vmdl",
	"models/courier/baby_rosh/babyroshan_elemental.vmdl",
	"models/items/courier/mighty_chicken/mighty_chicken.vmdl",
	"models/items/courier/itsy/itsy.vmdl",
	"models/courier/seekling/seekling.vmdl",
	"models/courier/huntling/huntling.vmdl",
	"models/courier/venoling/venoling.vmdl",
	"models/items/furion/treant/shroomling_treant/shroomling_treant.vmdl",
	"models/courier/baby_winter_wyvern/baby_winter_wyvern.vmdl",
	"models/courier/donkey_ti7/donkey_ti7.vmdl",
	"models/heroes/invoker_kid/invoker_kid_trainer_dragon.vmdl",
	"models/pets/armadillo/armadillo.vmdl",
	"models/items/courier/devourling/devourling.vmdl",
	"models/courier/baby_rosh/babyroshan.vmdl",
	"models/courier/octopus/octopus.vmdl",
	"models/courier/doom_demihero_courier/doom_demihero_courier.vmdl",
	"models/items/furion/treant/defender_of_the_jungle_lakad_coconut/defender_of_the_jungle_lakad_coconut.vmdl",
	"models/items/courier/butch_pudge_dog/butch_pudge_dog.vmdl",
	"models/items/enigma/eidolon/ti9_cache_enigma_lord_of_luminaries_eidolons/ti9_cache_enigma_lord_of_luminaries_eidolons.vmdl",
	"models/items/courier/faceless_rex/faceless_rex.vmdl",
	"models/items/courier/snaggletooth_red_panda/snaggletooth_red_panda_flying.vmdl",
	"models/courier/doom_demihero_courier/doom_demihero_courier.vmdl",
	"models/courier/baby_rosh/babyroshan_ti10.vmdl",
	"models/items/broodmother/spiderling/ti9_cache_brood_mother_of_thousands_spiderling/ti9_cache_brood_mother_of_thousands_spiderling.vmdl",
	"models/items/courier/tory_the_sky_guardian/tory_the_sky_guardian.vmdl",
	"models/courier/minipudge/minipudge.vmdl",
	"models/courier/smeevil_mammoth/smeevil_mammoth.vmdl",
	"models/items/courier/pangolier_squire/pangolier_squire.vmdl",
	"models/courier/skippy_parrot/skippy_parrot_flying_rowboat.vmdl",
	"models/items/broodmother/spiderling/witchs_grasp_spiderling/witchs_grasp_spiderling.vmdl",
	"models/items/lycan/ultimate/blood_moon_hunter_shapeshift_form/blood_moon_hunter_shapeshift_form.vmdl",
	"models/items/courier/lilnova/lilnova.vmdl",
	"models/items/courier/amaterasu/amaterasu.vmdl",
	"models/heroes/aghanim/aghanim_model.vmdl",
	"models/items/mirana/ti8_wyvernmount/ti8_wyvernmount.vmdl",
	"models/courier/baby_rosh/babyroshan_elemental.vmdl",
	"models/courier/greevil/gold_greevil.vmdl",
	"models/courier/beetlejaws/mesh/beetlejaws.vmdl",
	"models/courier/flopjaw/flopjaw.vmdl",
	"models/courier/baby_rosh/babyroshan_ti10_dire.vmdl",
	"models/courier/baby_winter_wyvern/baby_winter_wyvern.vmdl",
	"models/items/wards/frostivus2018_ward_floes_tower_ward/frostivus2018_ward_floes_tower_ward.vmdl",
	"models/creeps/ice_biome/penguin/penguin.vmdl",
}

g_ParticlePrecache =
{
	-- YOU THERE!!!! YES, YOU!!!!!!!
	-- Don't put your precaches in here. Units will already be precached by dota spawners
	-- Put your other precache in Precache methods in your encounters, ai, or abilities
	-- whether they are in script or C++ code.
	-- Doing so means quicker load time and less total memory unsed

	-- Assets in Aghanim path
	"particles/dark_moon/darkmoon_last_hit_effect.vpcf", -- Last hit effect
	"particles/dark_moon/darkmoon_creep_warning.vpcf", -- used in many places to warn about an attack
	"particles/forest/crate_destruction.vpcf", -- crate
	"particles/forest/vase_destruction.vpcf", -- vase

	-- Blessings
	"particles/blessings/death_detonation/death_detonation_remote_mines_detonate.vpcf",

	-- Assets in Dota path
	"particles/units/heroes/hero_visage/visage_summon_familiars.vpcf", -- dark portal fx
	"particles/units/heroes/heroes_underlord/abyssal_underlord_darkrift_target.vpcf", -- dark portal fx
	"particles/units/heroes/heroes_underlord/abbysal_underlord_darkrift_ambient.vpcf", -- dark portal fx
	"particles/units/heroes/hero_dazzle/dazzle_shadow_wave.vpcf", -- fx for test_encounter concommand
	"particles/units/heroes/hero_zuus/zuus_lightning_bolt.vpcf", -- fx for battle royale
	"particles/units/heroes/hero_omniknight/omniknight_guardian_angel_halo_buff.vpcf", -- Used by modifier_omninight_guardian_angel, for player respawn
	"particles/units/heroes/hero_omniknight/omniknight_guardian_angel_wings_buff.vpcf", -- Used by modifier_omninight_guardian_angel, for player respawn
	"particles/status_fx/status_effect_guardian_angel.vpcf", -- Used by modifier_omninight_guardian_angel, for player respawn
	"particles/units/heroes/hero_omniknight/omniknight_guardian_angel_omni.vpcf", -- Used by modifier_omninight_guardian_angel, for player respawn
	"particles/units/heroes/hero_omniknight/omniknight_guardian_angel_ally.vpcf", -- Used by modifier_omninight_guardian_angel, for player respawn
	"particles/units/heroes/hero_ogre_magi/ogre_magi_bloodlust_buff.vpcf", -- used by modifier_enrage
	"particles/items5_fx/neutral_treasurebox.vpcf", -- neutral item drop
	"particles/items5_fx/neutral_treasurebox_lvl0.vpcf", -- neutral item drop
	"particles/items5_fx/neutral_treasurebox_lvl1.vpcf", -- neutral item drop
	"particles/items5_fx/neutral_treasurebox_lvl2.vpcf", -- neutral item drop
	"particles/items5_fx/neutral_treasurebox_lvl3.vpcf", -- neutral item drop
	"particles/items5_fx/neutral_treasurebox_lvl4.vpcf", -- neutral item drop
	"particles/neutral_fx/neutral_item_drop_lvl0.vpcf", -- neutral item drop
	"particles/neutral_fx/neutral_item_drop_lvl1.vpcf", -- neutral item drop
	"particles/neutral_fx/neutral_item_drop_lvl2.vpcf", -- neutral item drop
	"particles/neutral_fx/neutral_item_drop_lvl3.vpcf", -- neutral item drop
	"particles/neutral_fx/neutral_item_drop_lvl4.vpcf", -- neutral item drop
	"particles/neutral_fx/neutral_item_drop_lvl5.vpcf", -- neutral item drop
	"particles/units/heroes/hero_invoker/invoker_sun_strike_team.vpcf", -- treasure chest surprise
	"particles/units/heroes/hero_invoker/invoker_sun_strike.vpcf",
	"particles/creature_true_sight.vpcf", -- modifier_detect_invisible
	"particles/msg_fx/msg_bp.vpcf",
	"particles/generic_gameplay/battle_point_splash.vpcf",
}

g_SoundPrecache =
{
	-- Assets in Aghanim path
	"soundevents/game_sounds_aghanim.vsndevts",
	"soundevents/game_sounds_dungeon.vsndevts",
	"soundevents/game_sounds_aghanim_creatures.vsndevts",
	"soundevents/game_sounds_dungeon_enemies.vsndevts",
	"soundevents/game_sounds_pudge_miniboss.vsndevts",

	-- Assets in Dota path
	"soundevents/voscripts/game_sounds_vo_meepo.vsndevts",

	"soundevents/voscripts/game_sounds_vo_announcer_dlc_bastion.vsndevts",	

	"soundevents/voscripts/game_sounds_vo_mars.vsndevts",
	"soundevents/voscripts/game_sounds_vo_snapfire.vsndevts",
	"soundevents/voscripts/game_sounds_vo_viper.vsndevts",
	"soundevents/voscripts/game_sounds_vo_juggernaut.vsndevts",
	"soundevents/voscripts/game_sounds_vo_hoodwink.vsndevts",

	"soundevents/voscripts/game_sounds_vo_bristleback.vsndevts",
	"soundevents/game_sounds_heroes/game_sounds_abyssal_underlord.vsndevts", -- dark portal sounds

	"soundevents/pathfinder_heroes.vsndevts",
}

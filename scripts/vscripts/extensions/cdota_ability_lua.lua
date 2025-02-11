if C_DOTA_Ability_Lua then CDOTA_Ability_Lua = C_DOTA_Ability_Lua end

------------------------------------------------------------------------

function CDOTA_Ability_Lua:GetAbilityTextureNameFromParticle(sParticleName)
    local sBase = self.BaseClass.GetAbilityTextureName(self)

	return (AbilityTexturesFromParticles[sBase] and AbilityTexturesFromParticles[sBase][ParticleManager:GetParticleReplacement(sParticleName, self:GetCaster())]) or sBase
end

AbilityTexturesFromParticles = {
    ["witch_doctor_paralyzing_cask"] = {
        ["particles/econ/items/witch_doctor/wd_monkey/witchdoctor_cask_monkey.vpcf"] = "witch_doctor/bonkers_the_mad/witch_doctor_paralyzing_cask",
        ["particles/econ/items/witch_doctor/wd_ti8_immortal_bonkers/wd_ti8_immortal_bonkers_cask.vpcf"] = "witch_doctor/ti8_bonkers_of_awaleb/witch_doctor_paralyzing_cask_immortal",
    },
    ["witch_doctor_voodoo_restoration"] = {
        ["particles/econ/items/witch_doctor/wd_ti10_immortal_weapon/wd_ti10_immortal_voodoo.vpcf"] = "witch_doctor/ti10_immortal_weapon/witch_doctor_voodoo_restoration_immortal_ti10",
        ["particles/econ/items/witch_doctor/wd_ti10_immortal_weapon_gold/wd_ti10_immortal_voodoo_gold.vpcf"] = "witch_doctor/ti10_immortal_weapon/witch_doctor_voodoo_restoration_immortal_ti10_gold",
        ["particles/econ/items/witch_doctor/wd_ti10_immortal_weapon/wd_ti10_immortal_voodoo_crimson.vpcf"] = "witch_doctor/ti10_immortal_weapon/witch_doctor_crimson_voodoo_restoration_immortal_ti10",
    },
    ["witch_doctor_maledict"] = {
        ["particles/econ/items/witch_doctor/wd_ti8_immortal_head/wd_ti8_immortal_maledict.vpcf"] = "witch_doctor/ti8_immortal_head/witch_doctor_maledict_immortal",
    },
    ["witch_doctor_death_ward"] = {
        ["particles/econ/items/witch_doctor/witch_doctor_ribbitar/witch_doctor_ribbitar_ward_attack.vpcf"] = "witch_doctor/ribbitar_icon/witch_doctor_death_ward",
    },
    ["nevermore_shadowraze1"] = {
        ["particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_shadowraze.vpcf"] = "nevermore_shadowraze1_demon",
    },
    ["nevermore_shadowraze2"] = {
        ["particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_shadowraze.vpcf"] = "nevermore_shadowraze2_demon",
    },
    ["nevermore_shadowraze3"] = {
        ["particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_shadowraze.vpcf"] = "nevermore_shadowraze3_demon",
    },
    ["nevermore_necromastery"] = {
        ["particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_necro_souls.vpcf"] = "nevermore_necromastery_demon",
    },
    ["nevermore_dark_lord"] = {
        ["particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_death.vpcf"] = "nevermore_dark_lord_demon",
    },
    ["nevermore_requiem"] = {
        ["particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_requiemofsouls.vpcf"] = "nevermore_requiem_demon",
    },
    ["dazzle_shadow_wave"] = {
        ["particles/econ/items/dazzle/dazzle_ti9/dazzle_shadow_wave_ti9.vpcf"] = "dazzle/ti9_immortal_head/dazzle_shadow_wave_immortal",
    },
}
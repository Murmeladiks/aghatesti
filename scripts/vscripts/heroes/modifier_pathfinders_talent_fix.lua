modifier_pathfinders_talent_fix = class({})

function modifier_pathfinders_talent_fix:IsHidden()
	return true
end

function modifier_pathfinders_talent_fix:IsPermanent()
	return true
end

function modifier_pathfinders_talent_fix:IsPurgable()
	return false
end

function modifier_pathfinders_talent_fix:RemoveOnDeath()
	return false
end

function modifier_pathfinders_talent_fix:OnCreated()
	if IsServer() then
		ListenToGameEvent( "dota_player_learned_ability", Dynamic_Wrap( modifier_pathfinders_talent_fix, "OnPlayerLearnedAbility" ), self )
	end
end

local TALENT_FIX_OP_ADD = 1
local TALENT_FIX_OP_MUL = 2
local TALENT_FIX_OP_SUB = 3

local talents_to_fix = {
	special_bonus_unique_slark_6 = {
		ability_name = "aghsfort_slark_dark_pact",
		special_value_name = "cooldown",
		operator = TALENT_FIX_OP_ADD
	},
	special_bonus_unique_magnus_7 = {
		ability_name = "aghsfort_magnataur_skewer",
		special_value_name = "cooldown",
		operator = TALENT_FIX_OP_ADD
	},
	special_bonus_unique_templar_assassin_8 = {
		ability_name = "aghsfort_templar_assassin_psi_blades",
		special_value_name = "bonus_attack_range",
		operator = TALENT_FIX_OP_ADD
	},
	special_bonus_unique_tusk_3 = {
		ability_name = "aghsfort_tusk_tag_team",
		special_value_name = "bonus_damage",
		operator = TALENT_FIX_OP_ADD
	},
	special_bonus_unique_queen_of_pain_2 = {
		ability_name = "aghsfort_queenofpain_scream_of_pain",
		special_value_name = "damage",
		operator = TALENT_FIX_OP_ADD
	},
	special_bonus_unique_viper_3 = {
		ability_name = "aghsfort_viper_nethertoxin",
		special_value_name = "max_damage",
		operator = TALENT_FIX_OP_ADD
	}
}

function modifier_pathfinders_talent_fix:OnPlayerLearnedAbility( event )
	if self ~= nil and self:GetParent() and event.PlayerID == self:GetParent():GetPlayerOwnerID() then
		local talent_name = event.abilityname

		if talents_to_fix[talent_name] then
			local parent = self:GetParent()
			local talent_table = talents_to_fix[talent_name]

			local upgrade_table = {}
			upgrade_table.ability_name = talent_table.ability_name
			upgrade_table.special_value_name = talent_table.special_value_name
			upgrade_table.value = parent:FindTalentValue(talent_name)

			if talent_table.operator == TALENT_FIX_OP_ADD then
				upgrade_table.operator = MINOR_ABILITY_UPGRADE_OP_ADD
			elseif talent_table.operator == TALENT_FIX_OP_MUL then
				upgrade_table.operator = MINOR_ABILITY_UPGRADE_OP_MUL
			elseif talent_table.operator == TALENT_FIX_OP_SUB then
				upgrade_table.operator = MINOR_ABILITY_UPGRADE_OP_ADD
				upgrade_table.value = -upgrade_table.value
			end

			--DeepPrintTable(upgrade_table)

			CAghanim:AddMinorAbilityUpgrade(parent, upgrade_table)
		end
	end
end


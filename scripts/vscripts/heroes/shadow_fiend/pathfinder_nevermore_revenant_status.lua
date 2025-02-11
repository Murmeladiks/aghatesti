modifier_pathfinder_revenant_status = class ({})


function modifier_pathfinder_revenant_status:GetPriority()
	return MODIFIER_PRIORITY_SUPER_ULTRA + 90001
end

function modifier_pathfinder_revenant_status:GetStatusEffectName()
	return "particles/econ/items/effigies/status_fx_effigies/status_effect_effigy_gold_dire.vpcf" 
end

function modifier_pathfinder_revenant_status:IsHidden()
	return true
end

-- function modifier_pathfinder_revenant_status:RemoveOnDeath()
-- 	return false
-- end

function modifier_pathfinder_revenant_status:DeclareFunctions()
	local funcs = {MODIFIER_EVENT_ON_TAKEDAMAGE_KILLCREDIT,					}
	return funcs
end

function modifier_pathfinder_revenant_status:CheckState() 
  local state = {
    [MODIFIER_STATE_UNSELECTABLE] = true,    
    [MODIFIER_STATE_NO_HEALTH_BAR] = true,
  }

  if self:GetParent():GetTeamNumber() == DOTA_TEAM_GOODGUYS then
	  return state
  end
end


function modifier_pathfinder_revenant_status:OnTakeDamageKillCredit( params )
	if IsServer() then				
		if params.inflictor and params.attacker and params.attacker:GetUnitName() == "npc_dota_hero_nevermore" and params.attacker:HasAbility("pathfinder_nevermore_special_necromastery_revenant") and params.target == self:GetParent() and params.damage >= params.target:GetHealth() then 			

			local name = params.target:GetUnitName()

			if name == "npc_dota_creature_wave_blaster" then
				name = "npc_dota_creature_baby_ogre_tank"
			elseif name == "npc_dota_undead_woods_skeleton_king" then
				name = "npc_dota_creature_bandit_captain"
			elseif name == "npc_dota_creature_spectre" then
				name = "npc_dota_creature_rock_golem_a"
			end

			local revenant = CreateUnitByName( name, params.target:GetAbsOrigin(), true, params.attacker, params.attacker, DOTA_TEAM_GOODGUYS )
			revenant:AddNewModifier(params.attacker, params.inflictor, "modifier_pathfinder_revenant_status", {})
			revenant:AddNewModifier(params.attacker, params.inflictor, "modifier_kill", {duration = 160})			
			self:Destroy()
        end 
    end 
end


function Spawn( entityKeyValues )
	if not IsServer() then
		return
	end

	if thisEntity == nil then
		return
	end

	thisEntity.hHellfireBlast = thisEntity:FindAbilityByName( "undead_woods_skeleton_king_hellfire_blast" )
	--thisEntity.hVampiricAura = thisEntity:FindAbilityByName( "aghsfort_skeleton_king_vampiric_aura" )
	thisEntity.hVampiricAura = thisEntity:FindAbilityByName( "pf_skeleton_king_vampiric_aura" )
	thisEntity.bInitialSkeletons = false

	thisEntity:SetContextThink( "SkeletonKingThink", SkeletonKingThink, 1.0 )
end

--------------------------------------------------------------------------------

function SkeletonKingThink()
	if not IsServer() then
		return
	end

	if thisEntity == nil or thisEntity:IsNull() or ( not thisEntity:IsAlive() ) then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 0.1
	end

	local hEnemies = FindUnitsInRadius( thisEntity:GetTeamNumber(), thisEntity:GetOrigin(), nil, 700, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_CLOSEST, false )
	if #hEnemies == 0 then
		return 1
	end

	if thisEntity.hHellfireBlast and thisEntity.hHellfireBlast:IsFullyCastable() and #GetEnemyHeroesInRange( thisEntity, 9000 ) > 0 then
		local enemy = GetEnemyHeroInRangeForHellfireblast(thisEntity, 9000)
		if enemy and IsPrioritizedHellFireBlastCaster(enemy) then return CastHellFireBlast( enemy ) end
	end

	if thisEntity.hVampiricAura then
		local skeletons = FindUnitsInRadius(thisEntity:GetTeamNumber(), thisEntity:GetAbsOrigin(), nil, 5000, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, FIND_ANY_ORDER, false)		
		local hBuff = thisEntity:FindModifierByName( "modifier_pf_skeleton_king_vampiric_aura" )
		if hBuff ~= nil then
			local nMaxSkeletons = thisEntity.hVampiricAura:GetSpecialValueFor( "max_skeleton_charges" )
			if thisEntity.bInitialSkeletons == false then
				hBuff:SetStackCount( nMaxSkeletons ) 
				thisEntity.bInitialSkeletons = true
				if #skeletons < 40 then
					return CastVampiricAura()
				end
			end

			if #skeletons < 40 and thisEntity.hVampiricAura:IsFullyCastable() then
				return CastVampiricAura()
			end
		end	
	end

	return 0.5
end


--------------------------------------------------------------------------------

function CastHellFireBlast( hTarget )
	local stun_cooldown = #GetEnemyHeroesInRange( thisEntity, 9000 ) > 1 and 4 or 16
	if hTarget.bHellfireBlastMarker ~= nil and hTarget.bHellfireBlastMarker ~= thisEntity then return 1 end
	
	hTarget.bHellfireBlastMarker = thisEntity
	Timers:CreateTimer(stun_cooldown, function() hTarget.bHellfireBlastMarker = nil end)

	ExecuteOrderFromTable({
		UnitIndex = thisEntity:entindex(),
		OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
		TargetIndex = hTarget:entindex(),
		AbilityIndex = thisEntity.hHellfireBlast:entindex(),
		Queue = false,
	})

	return 1
end

--------------------------------------------------------------------------------

function CastVampiricAura( )
	ExecuteOrderFromTable({
		UnitIndex = thisEntity:entindex(),
		OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
		AbilityIndex = thisEntity.hVampiricAura:entindex(),
		Queue = false,
	})

	return 1
end

--------------------------------------------------------------------------------

function IsPrioritizedHellFireBlastCaster(target)
	local casters = {}
	local allies = FindUnitsInRadius(thisEntity:GetTeamNumber(), thisEntity:GetAbsOrigin(), nil, 4000, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, FIND_ANY_ORDER, false)
	for _, ally in pairs(allies) do
		local active_ability = ally:GetCurrentActiveAbility()
		if active_ability and active_ability:GetName() == "undead_woods_skeleton_king_hellfire_blast" and active_ability:GetCursorTarget() == target then
			table.insert(casters, ally)
		end
	end

	if #casters < 1 then return true end
	local closest = GetClosestCasterToTarget(casters, target:GetAbsOrigin())

	return closest == thisEntity 
end

--------------------------------------------------------------------------------

function GetClosestCasterToTarget(casters, targetPos)
	local closest_distance = (casters[1]:GetAbsOrigin() - targetPos):Length2D()
	local closest_caster = casters[1]

	for _, caster in pairs(casters) do
		local distance = (caster:GetAbsOrigin() - targetPos):Length2D()
		if distance < closest_distance then
			closest_distance = distance
			closest_caster = caster
		end
	end

	return closest_caster
end
  
  
modifier_ogre_magi_bloodlust_lua = class({})

--------------------------------------------------------------------------------

function modifier_ogre_magi_bloodlust_lua:IsHidden() 	return true end
function modifier_ogre_magi_bloodlust_lua:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_ogre_magi_bloodlust_lua:OnCreated( kv )
	if not IsServer() then return end
	self:StartIntervalThink(1)
end

--------------------------------------------------------------------------------

function modifier_ogre_magi_bloodlust_lua:OnIntervalThink()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	if not hAbility:GetAutoCastState() or not hAbility:IsFullyCastable() or hCaster:IsSilenced() or hCaster:IsOutOfGame() or hCaster:IsHexed() or hCaster:IsStunned() then
		return
	end

	if hCaster:GetCurrentActiveAbility() ~= nil or hCaster:IsChanneling() then return end

	local radius = hAbility:GetEffectiveCastRange(hCaster:GetOrigin(), hCaster)

	-- find allied hero in radius
	local allies = FindUnitsInRadius(
		hCaster:GetTeamNumber(),	-- int, your team number
		hCaster:GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_FRIENDLY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,ally in pairs(allies) do
		-- check if ally doesn't have buff yet
		if not ally:HasModifier( "modifier_ogre_magi_bloodlust_lua_buff" ) then
			-- cast ability
			hCaster:CastAbilityOnTarget( ally, hAbility, hCaster:GetPlayerOwnerID() )
			break
		end
	end
end
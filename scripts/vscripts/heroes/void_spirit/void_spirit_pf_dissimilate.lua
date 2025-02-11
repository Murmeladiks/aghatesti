LinkLuaModifier("modifier_void_spirit_pf_dissimilate_phase", 		"heroes/void_spirit/void_spirit_pf_dissimilate", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_dissimilate_invis", 		"heroes/void_spirit/void_spirit_pf_dissimilate", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_dissimilate_lure", 		"heroes/void_spirit/void_spirit_pf_dissimilate", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_void_spirit_pf_dissimilate_lure_burn",	"heroes/void_spirit/void_spirit_pf_dissimilate", LUA_MODIFIER_MOTION_NONE)


--------------------------------------------------------------------------------

if void_spirit_pf_dissimilate == nil then
	void_spirit_pf_dissimilate = class({})
end

--------------------------------------------------------------------------------

function void_spirit_pf_dissimilate:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_void_spirit.vsndevts", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/dissimilate/void_spirit_dissimilate.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/dissimilate/void_spirit_dissimilate_dmg.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_void_spirit/dissimilate/void_spirit_dissimilate_exit.vpcf", context)
end

--------------------------------------------------------------------------------

function void_spirit_pf_dissimilate:OnSpellStart()
	local hCaster = self:GetCaster()

	hCaster:Stop()

	hCaster:AddNewModifier(hCaster, self, "modifier_void_spirit_pf_dissimilate_phase", {duration = self:GetSpecialValueFor("phase_duration")})
	hCaster:AddNewModifier(hCaster, self, "modifier_void_spirit_pf_dissimilate_invis", {duration = self:GetSpecialValueFor("phase_duration")})
	
	hCaster:EmitSound("Hero_VoidSpirit.Dissimilate.Cast")
end

--------------------------------------------------------------------------------

if modifier_void_spirit_pf_dissimilate_phase == nil then
	modifier_void_spirit_pf_dissimilate_phase = class({})
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:IsPurgable() return false end
function modifier_void_spirit_pf_dissimilate_phase:IsHidden()	return true end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:OnCreated(params)
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nPortals = hAbility:GetSpecialValueFor("portals_per_ring")
	self.nAngle = hAbility:GetSpecialValueFor("angle_per_ring_portal")
	self.nRadius = hAbility:GetSpecialValueFor("damage_radius")
	self.nDistance = hAbility:GetSpecialValueFor("first_ring_distance_offset")
	self.nDestinationRadius = hAbility:GetSpecialValueFor("destination_fx_radius")
	self.nStunDuration = hAbility:GetSpecialValueFor("stun_duration")
	self.nFacetRemnants = hAbility:GetSpecialValueFor("aether_remnant_count")
	self.nFacetDuration = hAbility:GetSpecialValueFor("artifice_duration_override_tooltip")
	self.nFacetStrength = hAbility:GetSpecialValueFor("artifice_pct_effectiveness_tooltip")
	self.nFacetOffset = hAbility:GetSpecialValueFor("artifice_extra_offset")
	self.bHasOuterRing = hAbility:GetSpecialValueFor("has_outer_ring") == 1

	self.vOrigin = hCaster:GetOrigin()
	self.vCenter = hCaster:GetOrigin()
	self.vDirection = hCaster:GetForwardVector()
	self.tTranslocatedAllies = {}

	self.nSelectedPortalID = 1
	self.tPoints = {}
	self.tVoidPoints = {}
	self.tEffects = {}

	table.insert(self.tPoints, self.vOrigin)
	table.insert(self.tEffects, self:CreatePortalFX(self.vOrigin, true))

	if hCaster:HasShard("aghsfort_special_void_spirit_dissimilate_translocate") then
		local nPhaseDuration = hAbility:GetSpecialValueFor("phase_duration")
		local hAllies = FindUnitsInRadius(hCaster:GetTeamNumber(), self.vOrigin, nil, hCaster:FindTalentValue("aghsfort_special_void_spirit_dissimilate_translocate", "value"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

		for _, hAlly in pairs(hAllies) do
			if hAlly ~= hCaster then
				table.insert(self.tTranslocatedAllies, hAlly)
				hAlly:AddNewModifier(hCaster, hAbility, "modifier_void_spirit_pf_dissimilate_invis", {duration = nPhaseDuration})
			end
		end
	end

	for i = 1, self.nPortals do
		local vCurrentDirection = RotatePosition(Vector(0, 0, 0), QAngle(0, self.nAngle * i, 0), self.vDirection)
		local vPortalPos = GetGroundPosition(self.vOrigin + vCurrentDirection * self.nDistance, nil)

		table.insert(self.tPoints, vPortalPos)
		table.insert(self.tVoidPoints, vPortalPos)
		table.insert(self.tEffects, self:CreatePortalFX(vPortalPos, false))
	end

	if self.bHasOuterRing then
		for i = 1, self.nPortals do
			local vCurrentDirection = RotatePosition(Vector(0, 0, 0), QAngle(0, self.nAngle * i, 0), self.vDirection)
			local vPortalPos = GetGroundPosition(self.vOrigin + vCurrentDirection * self.nDistance * 2, nil)
	
			table.insert(self.tPoints, vPortalPos)
			table.insert(self.tEffects, self:CreatePortalFX(vPortalPos, false))
		end
	end

	self.nDamage = hAbility:GetSpecialValueFor("damage")
	self.nTranslocateDamage = hAbility:GetSpecialValueFor("damage") * hCaster:FindTalentValue("aghsfort_special_void_spirit_dissimilate_translocate", "value2") / 100

	self.tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = self.nDamage,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = self,
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:OnDestroy()
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()
	local vPoint = self.tPoints[self.nSelectedPortalID]
	local hAstralStep = hParent:FindAbilityByName("void_spirit_pf_astral_step")
	local bAstralStep = hAstralStep and hAstralStep:IsTrained() and hParent:HasShard("special_bonus_unique_void_spirit_dissimilate_expanse")
	local hResononantPulse = hParent:FindAbilityByName("void_spirit_pf_resonant_pulse")

	FindClearSpaceForUnit(hParent, vPoint, true)

	if hParent:HasShard("aghsfort_special_void_spirit_dissimilate_translocate") and hResononantPulse and hResononantPulse:IsTrained() then
		hParent:AddNewModifier(hParent, hResononantPulse, "modifier_void_spirit_pf_resonant_pulse", {duration = hResononantPulse:GetSpecialValueFor("buff_duration"), shard = 1})
	end

	for _, hAlly in pairs(self.tTranslocatedAllies) do
		FindClearSpaceForUnit(hAlly, vPoint, true)

		if hResononantPulse and hResononantPulse:IsTrained() then
			hAlly:AddNewModifier(hParent, hResononantPulse, "modifier_void_spirit_pf_resonant_pulse", {duration = hResononantPulse:GetSpecialValueFor("buff_duration"), shard = 1})
		end
	end

	local hEnemies = FindUnitsInRadius(hParent:GetTeamNumber(), vPoint, nil, self.nRadius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	for _, hEnemy in pairs(hEnemies) do
		self.tDamageTable.damage = self.nDamage
		self.tDamageTable.victim = hEnemy
		ApplyDamage(self.tDamageTable)

		if self.nStunDuration > 0 then
			hEnemy:AddNewModifier(hParent, hAbility, "modifier_stunned", {duration = self.nStunDuration})
		end

		for i = #self.tTranslocatedAllies, 1, -1 do
			self.tDamageTable.damage = self.nTranslocateDamage
			ApplyDamage(self.tDamageTable)
		end

		if bAstralStep then
			hEnemy:AddNewModifier(hParent, hAstralStep, "modifier_void_spirit_pf_astral_step_debuff", {duration = hAstralStep:GetSpecialValueFor("pop_damage_delay")})
		end
	end

	local nDamageFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/dissimilate/void_spirit_dissimilate_dmg.vpcf", PATTACH_WORLDORIGIN, hParent)
	ParticleManager:SetParticleControl(nDamageFX, 0, vPoint)
	ParticleManager:SetParticleControl(nDamageFX, 1, Vector(self.nDestinationRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nDamageFX)

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/dissimilate/void_spirit_dissimilate_exit.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	)

	hParent:EmitSound("Hero_VoidSpirit.Dissimilate.TeleportIn")

	if #hEnemies > 0 then
		hParent:EmitSound("Hero_VoidSpirit.Dissimilate.Stun")
	end

	if self.nFacetRemnants > 0 and vPoint ~= self.vCenter then
		self:CallOfTheVoid(vPoint)
	end

	if hParent:HasShard("special_bonus_unique_void_spirit_dissimilate_remnants") then
		self:TriadEcho()
	end

	if hParent:HasShard("aghsfort_special_void_spirit_dissimilate_lure") then
		CreateModifierThinker(hParent, hAbility, "modifier_void_spirit_pf_dissimilate_lure", {duration = hParent:FindTalentValue("aghsfort_special_void_spirit_dissimilate_lure", "value")}, vPoint, hParent:GetTeamNumber(), false)
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:CallOfTheVoid(vPoint)
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	local hAetherAbility = hCaster:FindAbilityByName("void_spirit_pf_aether_remnant")

	if not hAetherAbility or not hAetherAbility:IsTrained() then return end

	for _, vPos in pairs(self:GetFarthestPortal(vPoint)) do
		local vCenterDir = (vPos - self.vCenter)
		vCenterDir.z = 0
		vCenterDir = vCenterDir:Normalized()

		local vPosOffset = vPos + vCenterDir * self.nFacetOffset
		local vEndPos = vPosOffset - vCenterDir * hAetherAbility:GetSpecialValueFor("remnant_watch_distance")

		hAetherAbility:CreateRemnant(vPosOffset, vEndPos.x, vEndPos.y, self.nFacetDuration, self.nFacetStrength)
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:TriadEcho(vPoint)
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	local hAetherAbility = hCaster:FindAbilityByName("void_spirit_pf_aether_remnant")
	local nLength = hAetherAbility:GetSpecialValueFor("remnant_watch_distance")
	local nDuration = hAetherAbility:GetSpecialValueFor("duration")
	local vOrigin = hCaster:GetOrigin()
	local vPos = vOrigin + hCaster:GetForwardVector() * hCaster:FindTalentValue("special_bonus_unique_void_spirit_dissimilate_remnants", "value3")

	local nDirection = (vOrigin - vPos)
	nDirection.z = 0
	nDirection = nDirection:Normalized()

	local vEndPos = vPos + nDirection * nLength

	hAetherAbility:CreateRemnant(vPos, vEndPos.x, vEndPos.y, 4, 100)


	local vNewPos = RotatePosition(vOrigin, QAngle(0, 50, 0), vPos)
	nDirection = (vOrigin - vNewPos)
	nDirection.z = 0
	nDirection = nDirection:Normalized()

	nDirection = RotatePosition(Vector(0, 0, 0), QAngle(0, -75, 0), nDirection)
	local vNewEndPos = vNewPos + nDirection * nLength

	hAetherAbility:CreateRemnant(vNewPos, vNewEndPos.x, vNewEndPos.y, 4, 100)


	vNewPos = RotatePosition(vOrigin, QAngle(0, -50, 0), vPos)
	nDirection = (vOrigin - vNewPos)
	nDirection.z = 0
	nDirection = nDirection:Normalized()

	nDirection = RotatePosition(Vector(0, 0, 0), QAngle(0, 75, 0), nDirection)
	vNewEndPos = vNewPos + nDirection * nLength

	hAetherAbility:CreateRemnant(vNewPos, vNewEndPos.x, vNewEndPos.y, 4, 100)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:GetFarthestPortal(vOrigin)
    local tDistances = {}

    for _, vPoint in ipairs(self.tVoidPoints) do
		local nDistance = (vPoint - vOrigin):Length2D()

		table.insert(tDistances, {vOrigin = vPoint, nDistance = nDistance})
    end

    table.sort(tDistances, function(a, b) return a.nDistance > b.nDistance end)

    return {tDistances[1].vOrigin, tDistances[2].vOrigin, tDistances[3].vOrigin}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ORDER,
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:OnOrder(event)
	if event.unit ~= self:GetParent() then return end
	local nOrderType = event.order_type

	if nOrderType == DOTA_UNIT_ORDER_MOVE_TO_POSITION then
		self:SetValidTarget(event.new_pos)
	elseif nOrderType == DOTA_UNIT_ORDER_MOVE_TO_TARGET or nOrderType == DOTA_UNIT_ORDER_ATTACK_TARGET then
		self:SetValidTarget(event.target:GetOrigin())
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:CreatePortalFX(vPos, bSelected)
	local hCaster = self:GetCaster()

	local nPortalFX = ParticleManager:CreateParticleForTeam( "particles/units/heroes/hero_void_spirit/dissimilate/void_spirit_dissimilate.vpcf", PATTACH_WORLDORIGIN, hCaster, hCaster:GetTeamNumber())
	ParticleManager:SetParticleControl(nPortalFX, 0, vPos)
	ParticleManager:SetParticleControl(nPortalFX, 1, Vector(self.nRadius + 25, 0, 1))

	if bSelected then
		ParticleManager:SetParticleControl( nPortalFX, 2, Vector( 1, 0, 0 ) )
	end

	self:AddParticle(nPortalFX, false, false, -1, false, false)

	EmitSoundOnLocationWithCaster(vPos, "Hero_VoidSpirit.Dissimilate.Portals", hCaster)

	return nPortalFX
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:SetValidTarget(vLocation)
	local max_dist = (vLocation - self.tPoints[1]):Length2D()
	local max_point = 1

	for i, point in ipairs(self.tPoints) do
		local dist = (vLocation - point):Length2D()

		if dist < max_dist then
			max_dist = dist
			max_point = i
		end
	end

	local nPreviousID = self.nSelectedPortalID
	self.nSelectedPortalID = max_point

	self:ChangeEffects(nPreviousID, self.nSelectedPortalID)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_phase:ChangeEffects( old, new )
	ParticleManager:SetParticleControl(self.tEffects[old], 2, Vector( 0, 0, 0))
	ParticleManager:SetParticleControl(self.tEffects[new], 2, Vector( 1, 0, 0))
end

--------------------------------------------------------------------------------

if modifier_void_spirit_pf_dissimilate_invis == nil then
	modifier_void_spirit_pf_dissimilate_invis = class({})
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:OnCreated()
	if IsClient() then return end
	self:GetParent():AddNoDraw()

	self.nInvisDuration = self:GetAbility():GetSpecialValueFor("invisibility_duration")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	hParent:RemoveNoDraw()

	if self.nInvisDuration > 0 then
		hParent:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_invisible", {duration = self.nInvisDuration})
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
		MODIFIER_PROPERTY_DISABLE_AUTOATTACK,
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:GetModifierInvisibilityLevel()
	return 1
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:GetDisableAutoAttack()
	return 1
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_invis:CheckState()
	return {
		[MODIFIER_STATE_ROOTED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_MUTED] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_OUT_OF_GAME] = true,
		[MODIFIER_STATE_INVISIBLE] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true
	}
end

--------------------------------------------------------------------------------

if modifier_void_spirit_pf_dissimilate_lure == nil then
	modifier_void_spirit_pf_dissimilate_lure = class({})
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure:IsPurgable() 			return false end
function modifier_void_spirit_pf_dissimilate_lure:IsAura() 				return true end
function modifier_void_spirit_pf_dissimilate_lure:GetAuraRadius()		return self.nRadius end
function modifier_void_spirit_pf_dissimilate_lure:GetModifierAura() 	return "modifier_void_spirit_pf_dissimilate_lure_burn" end
function modifier_void_spirit_pf_dissimilate_lure:GetAuraSearchTeam()	return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_void_spirit_pf_dissimilate_lure:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure:OnCreated()
	self.nRadius = self:GetAbility():GetSpecialValueFor("damage_radius")

	if IsClient() then return end
	
	local nLureFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/dissimilate_lure.vpcf", PATTACH_ABSORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(nLureFX, 4, Vector(self.nRadius, self.nRadius, self.nRadius))
	ParticleManager:ReleaseParticleIndex(nLureFX)
	self:GetParent():EmitSound("Hero_VoidSpirit.AstralTrail.Loop")
	self:StartIntervalThink(0.25)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure:OnDestroy()
	if IsClient() then return end
	self:GetParent():StopSound("Hero_VoidSpirit.AstralTrail.Loop")
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure:OnIntervalThink()
	local nLureFX = ParticleManager:CreateParticle("particles/units/heroes/hero_void_spirit/dissimilate_lure.vpcf", PATTACH_ABSORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(nLureFX, 4, Vector(self.nRadius, self.nRadius, self.nRadius))
	ParticleManager:ReleaseParticleIndex(nLureFX)
end

--------------------------------------------------------------------------------

if modifier_void_spirit_pf_dissimilate_lure_burn == nil then
	modifier_void_spirit_pf_dissimilate_lure_burn = class({})
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure_burn:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nSpellDamageAmp = hCaster:FindTalentValue("aghsfort_special_void_spirit_dissimilate_lure", "value2")
	self.nInterval = hCaster:FindTalentValue("aghsfort_special_void_spirit_dissimilate_lure", "value3")
	self.nDamage = hAbility:GetSpecialValueFor("damage") * hCaster:FindTalentValue("aghsfort_special_void_spirit_dissimilate_lure", "value4") / 100

	if IsClient() then return end
	self.tDamageTable = {
		attacker = hCaster,
		victim = self:GetParent(),
		damage = self.nDamage,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self:StartIntervalThink(self.nInterval)
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure_burn:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, self:GetParent(), self.tDamageTable.damage, self:GetCaster():GetPlayerOwner())
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure_burn:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
		MODIFIER_PROPERTY_TOOLTIP,
	}
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure_burn:GetModifierIncomingDamage_Percentage(event)
	if event.damage_category == DOTA_DAMAGE_CATEGORY_SPELL then
		return self.nSpellDamageAmp
	end
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure_burn:OnTooltip()
	return self.nSpellDamageAmp
end

--------------------------------------------------------------------------------

function modifier_void_spirit_pf_dissimilate_lure_burn:GetEffectName()
	return "particles/units/heroes/hero_void_spirit/dissimilate_lure_burn.vpcf"
end
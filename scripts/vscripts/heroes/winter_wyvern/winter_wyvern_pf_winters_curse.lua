LinkLuaModifier("modifier_winter_wyvern_pf_winters_curse",			"heroes/winter_wyvern/winter_wyvern_pf_winters_curse", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_winter_wyvern_pf_winters_curse_aura", 	"heroes/winter_wyvern/winter_wyvern_pf_winters_curse", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

winter_wyvern_pf_winters_curse = class({})

--------------------------------------------------------------------------------

function winter_wyvern_pf_winters_curse:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse_buff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse_ground.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse_overhead.vpcf", context)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_winters_curse:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_winters_curse:OnSpellStart()
	self:Curse(self:GetCursorTarget(), self:GetSpecialValueFor("duration"))
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_winters_curse:Curse(hTarget, nDuration)
	local hCaster = self:GetCaster()

	if hTarget:TriggerSpellAbsorb(self) then return end

	hTarget:Purge(true, false, false, false, false)
	hTarget:AddNewModifier(hCaster, self, "modifier_winter_wyvern_pf_winters_curse_aura", {duration = nDuration * (1 - hTarget:GetStatusResistance())})

	hCaster:EmitSound("Hero_Winter_Wyvern.WintersCurse.Cast")
	hTarget:EmitSound("Hero_Winter_Wyvern.WintersCurse.Target")
end

--------------------------------------------------------------------------------

modifier_winter_wyvern_pf_winters_curse_aura = class({})

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:IsAura()				return true end
function modifier_winter_wyvern_pf_winters_curse_aura:GetAuraSearchTeam() 	return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_winter_wyvern_pf_winters_curse_aura:GetAuraSearchType() 	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP end
function modifier_winter_wyvern_pf_winters_curse_aura:GetModifierAura() 	return "modifier_winter_wyvern_pf_winters_curse" end
function modifier_winter_wyvern_pf_winters_curse_aura:GetAuraRadius() 		return self.nRadius end
function modifier_winter_wyvern_pf_winters_curse_aura:IsPurgable() 			return false end
function modifier_winter_wyvern_pf_winters_curse_aura:GetAuraDuration()		return -1 end
function modifier_winter_wyvern_pf_winters_curse_aura:GetAuraEntityReject(hEntity)
	return hEntity == self:GetParent()
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:OnCreated()
	if IsClient() then return end
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.nRadius = hAbility:GetSpecialValueFor("radius")	
	self.nEarlyBreakout = hAbility:GetSpecialValueFor("early_out_timer")
	self.nDamageAmp = 0

	if self:GetCaster():HasShard("aghsfort_special_winter_wyvern_winters_curse_damage_amp") then
		self.nDamageAmp = self:GetCaster():FindTalentValue("aghsfort_special_winter_wyvern_winters_curse_damage_amp", "value")
	end

	local nCurseFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(nCurseFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControl(nCurseFX, 2, Vector(self.nRadius, self.nRadius, self.nRadius))
	self:AddParticle(nCurseFX, false, false, -1, false, false)

	local nGroundFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse_ground.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(nGroundFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControl(nGroundFX, 2, Vector(self.nRadius, 0, 0))
	self:AddParticle(nGroundFX, false, false, -1, false, false)

	local nOverheadFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse_overhead.vpcf", PATTACH_OVERHEAD_FOLLOW, hParent)
	ParticleManager:SetParticleControlEnt(nOverheadFX, 1, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, hParent:GetOrigin(), true)
	self:AddParticle(nOverheadFX, false, false, -1, false, true)
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
		MODIFIER_PROPERTY_INCOMING_DAMAGE_CONSTANT,
		MODIFIER_EVENT_ON_TAKEDAMAGE_KILLCREDIT,
		MODIFIER_EVENT_ON_DEATH
	}
end

--------------------------------------------------------------------------------
-- This is trash and doesnt even work every time
function modifier_winter_wyvern_pf_winters_curse_aura:GetModifierIncomingDamageConstant(event)
	if IsClient() then return 0 end
	local hTarget = event.target

	if hTarget:GetHealth() > event.damage + 2 then return 0 end

	hTarget:Kill(self:GetAbility(), self:GetCaster())

	return -event.damage
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:CheckState()
	local bNoCC = self:GetParent().bAbsoluteNoCC and true or false

	return {
		[MODIFIER_STATE_STUNNED] = not bNoCC,
		[MODIFIER_STATE_FROZEN] = not bNoCC,
		[MODIFIER_STATE_INVISIBLE] = false,
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:GetModifierIncomingDamage_Percentage(event)
	if IsClient() then return end
	local hAttacker = event.attacker

	if hAttacker:GetTeam() ~= self:GetParent():GetTeam() then
		return 0
	end

	return self.nDamageAmp
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:OnDeath(event)
	if IsClient() then return end
	if event.unit ~= self:GetParent() then return end

	local hUnit = self:GetParent()
	local hCaster = self:GetCaster()
	local nRemaining = self:GetRemainingTime()

	if hCaster:HasShard("aghsfort_special_winter_wyvern_winters_curse_transfer") then
		self:TransferCurse(hUnit:GetOrigin(), nRemaining)
	end

	if hCaster:HasShard("aghsfort_special_winter_wyvern_winters_curse_heal_on_death") then
		self:HealOnDeath(hUnit:GetMaxHealth())
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:TransferCurse(vLoc, nRemainingTime)
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLoc, nil, hAbility:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, FIND_CLOSEST, false)

	for _, hEnemy in pairs(hEnemies) do
		hAbility:Curse(hEnemy, nRemainingTime)
		break
	end

	self:Destroy()
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:HealOnDeath(nMaxHealth)
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()
	local nHealValue = math.floor(nMaxHealth * hCaster:FindTalentValue("aghsfort_special_winter_wyvern_winters_curse_heal_on_death", "value") / 100)

	for nPlayerID = 0, AGHANIM_PLAYERS-1 do
		local hPlayerHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
		if hPlayerHero and hPlayerHero:IsAlive() then
			hPlayerHero:HealWithParams(nHealValue, hAbility, false, true, hCaster, false)
			SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hPlayerHero, nHealValue, hCaster)
		end
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse_aura:GetPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_winter_wyvern_pf_winters_curse = class({})

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:IsPurgable()	return false end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:OnCreated()
	local hAbility = self:GetAbility()
	local hParent = self:GetParent()

	self.tNoForceAttack = {
		["npc_dota_creature_baby_ogre_tank"] = true,
		["npc_dota_creature_ogre_tank_boss"] = true,
		["npc_dota_creature_ogre_tank"] = true,
		["npc_dota_creature_temple_guardian"] = true,
	}


	self.nAttackSpeed = hAbility:GetSpecialValueFor("bonus_attack_speed")
	self.nDamageReduction = -hAbility:GetSpecialValueFor("damage_reduction")
	
	if IsClient() then return end

	self.hOwner = self:GetAuraOwner()

	if not self.tNoForceAttack[hParent:GetUnitName()] then
		hParent:SetForceAttackTargetAlly(self.hOwner)
	end

	self:StartIntervalThink(FrameTime())
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:OnRefresh()
	if self.hOwner == self:GetAuraOwner() then return end

	local hParent = self:GetParent()
	self.hOwner = self:GetAuraOwner()

	if not hParent or hParent:IsNull() then return end

	if not self.tNoForceAttack[hParent:GetUnitName()] then
		if not hParent or hParent:IsNull() then return end
		hParent:SetForceAttackTargetAlly(self.hOwner)
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:OnDestroy()
	if IsClient() then return end
	local hParent = self:GetParent()

	self:StartIntervalThink(-1)

	if not self.tNoForceAttack[hParent:GetUnitName()] then
		hParent:SetForceAttackTargetAlly(nil)
		hParent:SetIdleAcquire(true)
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:OnIntervalThink()
	if not self.hOwner or self.hOwner:IsNull() or not self.hOwner:HasModifier("modifier_winter_wyvern_pf_winters_curse_aura") then
		self:Destroy()
		return
	end

	local hParent = self:GetParent()

	if not self.tNoForceAttack[hParent:GetUnitName()] and hParent:GetForceAttackTarget() ~= self.hOwner then
		hParent:SetForceAttackTargetAlly(self.hOwner)
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:CheckState()
	return {
		[MODIFIER_STATE_TAUNTED] = true,
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeed
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:GetModifierIncomingDamage_Percentage(event)
	if IsClient() then return end
	local hAttacker = event.attacker

	if hAttacker == self:GetCaster() or self:GetParent():IsBoss() or self:GetParent():IsConsideredHero() then
		return 0
	end

	return self.nDamageReduction
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:GetEffectName()
	return "particles/units/heroes/hero_winter_wyvern/wyvern_winters_curse_buff.vpcf"
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_winters_curse:GetPriority()
	return MODIFIER_PRIORITY_HIGH
end
LinkLuaModifier("modifier_sniper_pf_shrapnel",			"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_shrapnel_thinker",	"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_shrapnel_slow",		"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_shrapnel_buff",		"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_shrapnel_speed",	"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_shrapnel_miss",		"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)


LinkLuaModifier("modifier_sniper_pf_shrapnel_thinker_shard",	"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_shrapnel_slow_shard",		"heroes/sniper/sniper_pf_shrapnel", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

sniper_pf_shrapnel = class({})

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shrapnel.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shrapnel_launch.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shrapnel_explosion.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_shrapnel_haste.vpcf", context)
end

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:GetIntrinsicModifierName()
	return "modifier_sniper_pf_shrapnel"
end

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:OnAbilityUpgrade(hUpgradeAbility)
	if hUpgradeAbility and hUpgradeAbility:GetName() == "special_bonus_unique_sniper_2" and not self.bTalentUpgraded then
		self.bTalentUpgraded = true
		self:RefreshCharges()
	end
end

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPos = self:GetCursorPosition()

	self:CreateShrapnel(vPos)

	hCaster:EmitSound("Hero_Sniper.ShrapnelShoot")

	local nLaunchFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_shrapnel_launch.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	ParticleManager:SetParticleControlEnt(nLaunchFX, 0, hCaster, PATTACH_POINT_FOLLOW, "attach_attack1", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControl(nLaunchFX, 1, Vector(vPos.x, vPos.y, vPos.z + 2000))
	ParticleManager:ReleaseParticleIndex(nLaunchFX)
end

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:CreateShrapnel(vPosition)
	local hCaster = self:GetCaster()

	CreateModifierThinker(
		hCaster, 
		self, 
		"modifier_sniper_pf_shrapnel_thinker", 
		{duration = self:GetSpecialValueFor("duration") + self:GetSpecialValueFor("damage_delay")}, 
		vPosition, 
		hCaster:GetTeam(), 
		false
	)
end

--------------------------------------------------------------------------------

function sniper_pf_shrapnel:CreateShardShrapnel(vPosition)
	local hCaster = self:GetCaster()

	CreateModifierThinker(
		hCaster, 
		self, 
		"modifier_sniper_pf_shrapnel_thinker_shard", 
		{duration = self:GetSpecialValueFor("duration") * 0.5}, 
		vPosition, 
		hCaster:GetTeam(), 
		false
	)
end

-------------------------------------------

modifier_sniper_pf_shrapnel_thinker = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker:IsHidden() 			return true end
function modifier_sniper_pf_shrapnel_thinker:IsPurgable() 			return false end
function modifier_sniper_pf_shrapnel_thinker:IsAura()				return self.bActivated end
function modifier_sniper_pf_shrapnel_thinker:GetAuraRadius()		return self.nRadius end
function modifier_sniper_pf_shrapnel_thinker:GetAuraSearchTeam()	return self.nTargetTeam end
function modifier_sniper_pf_shrapnel_thinker:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_sniper_pf_shrapnel_thinker:GetModifierAura()		return self.sAuraModifier end
function modifier_sniper_pf_shrapnel_thinker:GetAuraDuration()		return FrameTime() end

function modifier_sniper_pf_shrapnel_thinker:GetAuraEntityReject(hEntity)
	if not self.bFilter then return false end
	local nTeam = hEntity:GetTeamNumber()
	local hCaster = self:GetCaster()

	self.sAuraModifier = nTeam == hCaster:GetTeamNumber() and "modifier_sniper_pf_shrapnel_speed" or "modifier_sniper_pf_shrapnel_slow"

	if nTeam == hCaster:GetTeam() then
		return hEntity ~= hCaster
	end

	return false
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker:OnCreated(kv)
	if IsClient() then return end
	self:SetupAura()

	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	
	self.nRadius = hAbility:GetSpecialValueFor("radius")
	self.vDirection = (hParent:GetOrigin() - hCaster:GetOrigin()):Normalized()

	hParent:EmitSound("Hero_Sniper.ShrapnelShatter")

	self:StartIntervalThink(hAbility:GetSpecialValueFor("damage_delay"))
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker:SetupAura()
	self.nTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	self.sAuraModifier = "modifier_sniper_pf_shrapnel_slow"

	if self:GetCaster():HasShard("aghsfort_special_sniper_shrapnel_move_speed") then
		self.bFilter = true
		self.nTargetTeam = DOTA_UNIT_TARGET_TEAM_BOTH
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker:OnDestroy()
	if IsClient() then return end
	self:GetParent():StopSound("Hero_Sniper.ShrapnelShatter")
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker:OnIntervalThink()
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()

	self.bActivated = true
	AddFOWViewer(hCaster:GetTeam(), hParent:GetOrigin(), self.nRadius, self:GetRemainingTime(), false)

	local nShrapnelFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_shrapnel.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nShrapnelFX, 0, hParent:GetOrigin())
	ParticleManager:SetParticleControl(nShrapnelFX, 1, Vector(self.nRadius, 0, 0))
	ParticleManager:SetParticleControlForward(nShrapnelFX, 2, self.vDirection)
	self:AddParticle(nShrapnelFX, false, false, -1, false, false)

	self:StartIntervalThink(-1)
end

-------------------------------------------

modifier_sniper_pf_shrapnel_slow = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nMoveSlow = hAbility:GetSpecialValueFor("slow_movement_speed")
	
	if IsClient() then return end

	if hCaster:HasShard("aghsfort_special_sniper_shrapnel_move_speed") then
		self:GetParent():AddNewModifier(hCaster, hAbility, "modifier_sniper_pf_shrapnel_miss", {})
	end

	self.tDamageTable = {
		attacker = hCaster,
		victim = self:GetParent(),
		damage = hAbility:GetSpecialValueFor("shrapnel_damage") * hAbility:GetSpecialValueFor("damage_interval"),
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self.nDamageTaken = 0

	self:StartIntervalThink(hAbility:GetSpecialValueFor("damage_interval"))
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow:OnDestroy()
	if IsClient() then return end
	if self:GetParent():HasModifier("modifier_sniper_pf_shrapnel_miss") then
		self:GetParent():RemoveModifierByName("modifier_sniper_pf_shrapnel_miss")
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
	self.nDamageTaken = self.nDamageTaken + self.tDamageTable.damage
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

-------------------------------------------

modifier_sniper_pf_shrapnel = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel:IsPurgable() 		return false end
function modifier_sniper_pf_shrapnel:IsHidden()			return true end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel:OnCreated()
	if IsClient() then return end
	self:StartIntervalThink(1)
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel:OnIntervalThink()
	if self:GetCaster():HasShard("aghsfort_special_sniper_shrapnel_bombs") or self:GetCaster():HasShard("aghsfort_special_sniper_shrapnel_attack_speed") then
		self.bActivated = true
		self:StartIntervalThink(-1)
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel:DeclareFunctions()
	return {MODIFIER_EVENT_ON_DEATH}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel:OnDeath(event)
	if IsClient() or not self.bActivated then return end

	if not event.unit:HasModifier("modifier_sniper_pf_shrapnel_slow") then return end

	local hCaster = self:GetCaster()
	local hUnit = event.unit

	if hCaster:HasShard("aghsfort_special_sniper_shrapnel_bombs") then
		self:ShrapnelBomb(hUnit:GetAbsOrigin(), hUnit:FindModifierByName("modifier_sniper_pf_shrapnel_slow").nDamageTaken)
	end

	if hCaster:HasShard("aghsfort_special_sniper_shrapnel_attack_speed") then
		hCaster:AddNewModifier(hCaster, self:GetAbility(), "modifier_sniper_pf_shrapnel_buff", {duration = hCaster:FindTalentValue("aghsfort_special_sniper_shrapnel_attack_speed", "value2")})
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel:ShrapnelBomb(vLocation, nDamage)
	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	local nRadius = hCaster:FindTalentValue("aghsfort_special_sniper_shrapnel_bombs", "value")
	local nDamagePct = hCaster:FindTalentValue("aghsfort_special_sniper_shrapnel_bombs", "value2")
	local nDuration = hCaster:FindTalentValue("aghsfort_special_sniper_shrapnel_bombs", "value3")

	local hEnemies = FindUnitsInRadius(hCaster:GetTeamNumber(), vLocation, nil, hAbility:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

	local tDamageTable = {
		attacker = hCaster,
		victim = nil,
		damage = nDamage * nDamagePct / 100,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = hAbility
	}

	for _, hEnemy in pairs(hEnemies) do
		tDamageTable.victim = hEnemy
		ApplyDamage(tDamageTable)
	end

	EmitSoundOnLocationWithCaster(vLocation, "Sniper.ShrapnelBombs.Detonate", hCaster)

	local nExplosionFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_shrapnel_explosion.vpcf", PATTACH_WORLDORIGIN, nil)
	ParticleManager:SetParticleControl(nExplosionFX, 0, vLocation + Vector(0, 0, 128))
	ParticleManager:SetParticleControl(nExplosionFX, 1, Vector(nRadius, 0, 0))
	ParticleManager:ReleaseParticleIndex(nExplosionFX)
end

-------------------------------------------

modifier_sniper_pf_shrapnel_buff = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_buff:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_buff:OnCreated()
	self.nAttackSpeedPerStack = self:GetCaster():FindTalentValue("aghsfort_special_sniper_shrapnel_attack_speed", "value")
	if IsClient() then return end
	self:SetStackCount(1)
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_buff:OnRefresh()
	if IsClient() then return end
	self:IncrementStackCount()

	Timers:CreateTimer(self:GetRemainingTime(), function()
		if self and not self:IsNull() then
			self:DecrementStackCount()
		end
	end)
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_buff:DeclareFunctions()
	return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_buff:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeedPerStack * self:GetStackCount()
end

-------------------------------------------

modifier_sniper_pf_shrapnel_speed = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_speed:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_speed:OnCreated()
	self.nMoveSpeed = -self:GetAbility():GetSpecialValueFor("slow_movement_speed")
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_speed:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_speed:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_speed:GetEffectName()
	return "particles/units/heroes/hero_sniper/sniper_shrapnel_haste.vpcf"
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_speed:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

-------------------------------------------

modifier_sniper_pf_shrapnel_miss = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_miss:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_miss:OnCreated()
	self.nMissChance = -self:GetAbility():GetSpecialValueFor("slow_movement_speed")
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_miss:DeclareFunctions()
	return {MODIFIER_PROPERTY_MISS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_miss:GetModifierMiss_Percentage()
	return self.nMissChance
end

-------------------------------------------

modifier_sniper_pf_shrapnel_thinker_shard = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker_shard:IsHidden() 			return true end
function modifier_sniper_pf_shrapnel_thinker_shard:IsPurgable() 		return false end
function modifier_sniper_pf_shrapnel_thinker_shard:IsAura()				return true end
function modifier_sniper_pf_shrapnel_thinker_shard:GetAuraRadius()		return self.nRadius end
function modifier_sniper_pf_shrapnel_thinker_shard:GetAuraSearchTeam()	return self.nTargetTeam end
function modifier_sniper_pf_shrapnel_thinker_shard:GetAuraSearchType()	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_sniper_pf_shrapnel_thinker_shard:GetModifierAura()	return self.sAuraModifier end

function modifier_sniper_pf_shrapnel_thinker_shard:GetAuraEntityReject(hEntity)
	if not self.bFilter then return false end
	local nTeam = hEntity:GetTeamNumber()
	local hCaster = self:GetCaster()

	self.sAuraModifier = nTeam == hCaster:GetTeamNumber() and "modifier_sniper_pf_shrapnel_speed" or "modifier_sniper_pf_shrapnel_slow_shard"

	if nTeam == hCaster:GetTeam() then
		return hEntity ~= hCaster
	end

	return false
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker_shard:OnCreated(kv)
	if IsClient() then return end
	self:SetupAura()

	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()
	local hParent = self:GetParent()
	
	self.nRadius = hAbility:GetSpecialValueFor("radius") * 0.5
	self.vDirection = (hParent:GetOrigin() - hCaster:GetOrigin()):Normalized()

	hParent:EmitSound("Hero_Sniper.ShrapnelShatterInstant")

	AddFOWViewer(hCaster:GetTeam(), hParent:GetOrigin(), self.nRadius, self:GetRemainingTime(), false)

	local nShrapnelFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_shrapnel.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nShrapnelFX, 0, hParent:GetOrigin())
	ParticleManager:SetParticleControl(nShrapnelFX, 1, Vector(self.nRadius, 0, 0))
	ParticleManager:SetParticleControlForward(nShrapnelFX, 2, self.vDirection)
	self:AddParticle(nShrapnelFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker_shard:SetupAura()
	self.nTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	self.sAuraModifier = "modifier_sniper_pf_shrapnel_slow_shard"

	if self:GetCaster():HasShard("aghsfort_special_sniper_shrapnel_move_speed") then
		self.bFilter = true
		self.nTargetTeam = DOTA_UNIT_TARGET_TEAM_BOTH
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_thinker_shard:OnDestroy()
	if IsClient() then return end
	self:GetParent():StopSound("Hero_Sniper.ShrapnelShatterInstant")
end

-------------------------------------------

modifier_sniper_pf_shrapnel_slow_shard = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow_shard:IsPurgable() 	return false end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow_shard:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nMoveSlow = hAbility:GetSpecialValueFor("slow_movement_speed") * 0.5
	
	if IsClient() then return end

	if hCaster:HasShard("aghsfort_special_sniper_shrapnel_move_speed") then
		self:GetParent():AddNewModifier(hCaster, hAbility, "modifier_sniper_pf_shrapnel_miss", {})
	end

	self.tDamageTable = {
		attacker = hCaster,
		victim = self:GetParent(),
		damage = hAbility:GetSpecialValueFor("shrapnel_damage") * 0.5,
		damage_type = hAbility:GetAbilityDamageType(),
		ability = hAbility
	}

	self.nDamageTaken = 0

	self:StartIntervalThink(1)
	self:OnIntervalThink()
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow_shard:OnDestroy()
	if IsClient() then return end
	if self:GetParent():HasModifier("modifier_sniper_pf_shrapnel_miss") then
		self:GetParent():RemoveModifierByName("modifier_sniper_pf_shrapnel_miss")
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow_shard:OnIntervalThink()
	ApplyDamage(self.tDamageTable)
	self.nDamageTaken = self.nDamageTaken + self.tDamageTable.damage
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow_shard:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_shrapnel_slow_shard:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end
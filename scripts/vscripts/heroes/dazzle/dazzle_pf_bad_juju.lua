LinkLuaModifier("modifier_dazzle_pf_bad_juju", 				"heroes/dazzle/dazzle_pf_bad_juju", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_dazzle_pf_bad_juju_manacost", 	"heroes/dazzle/dazzle_pf_bad_juju", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_dazzle_pf_bad_juju_purple_rain", 	"heroes/dazzle/dazzle_pf_bad_juju", LUA_MODIFIER_MOTION_NONE)

-----------------------------------------------------------------------------------

if dazzle_pf_bad_juju == nil then
	dazzle_pf_bad_juju = class({})
end

-----------------------------------------------------------------------------------

function dazzle_pf_bad_juju:GetIntrinsicModifierName()
	return "modifier_dazzle_pf_bad_juju"
end

-----------------------------------------------------------------------------------

function dazzle_pf_bad_juju:Precache(context)
	PrecacheResource("particle", "particles/units/heroes/hero_nevermore/nevermore_shadowraze.vpcf", context)
	PrecacheResource("particle", "particles/purple_rain.vpcf", context)
end

-----------------------------------------------------------------------------------

function dazzle_pf_bad_juju:GetHealthCost(iLevel)
	return self.BaseClass.GetHealthCost(self, iLevel) * math.pow(1 + self:GetSpecialValueFor("mana_cost_increase_pct") / 100, self:GetCaster():GetModifierStackCount("modifier_dazzle_pf_bad_juju_manacost", self:GetCaster()))
end

-----------------------------------------------------------------------------------

function dazzle_pf_bad_juju:OnSpellStart()
	local hCaster = self:GetCaster()
	local nCooldownReduction = self:GetSpecialValueFor("cooldown_reduction")
	local nCostIncreaseDuration = self:GetSpecialValueFor("mana_cost_increase_duration")

	for i = 0, DOTA_MAX_ABILITIES - 1 do
		local hAbility = hCaster:GetAbilityByIndex( i )
		if hAbility and hAbility ~= self and not hAbility:IsCosmetic( nil ) and not hAbility:IsAttributeBonus() and hAbility:GetAssociatedPrimaryAbilities() == nil and not hAbility:IsHidden() and hAbility:IsActivated() and not hAbility:IsCooldownReady() then
			local nCooldown = math.max(0, hAbility:GetCooldownTimeRemaining() - nCooldownReduction)
			hAbility:EndCooldown()
			hAbility:StartCooldown(nCooldown)
		end
	end

	hCaster:AddNewModifier(hCaster, self, "modifier_dazzle_pf_bad_juju_manacost", {duration = nCostIncreaseDuration})
	hCaster:EmitSound("Hero_Dazzle.BadJuJu.Cast")

	local hWeave = hCaster:FindAbilityByName("dazzle_pf_innate_weave")
	if hWeave then hWeave:ApplyWeave(hCaster) end
end

-----------------------------------------------------------------------------------

if modifier_dazzle_pf_bad_juju_manacost == nil then
	modifier_dazzle_pf_bad_juju_manacost = class({})
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju_manacost:IsPurgable() return false end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju_manacost:OnCreated(params)
	if IsClient() then return end
	
	self:SetStackCount(1)

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self:DecrementStackCount()
		end
	end)
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju_manacost:OnRefresh(params)
	if IsClient() then return end

	self:IncrementStackCount()

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self:DecrementStackCount()
		end
	end)
end

-----------------------------------------------------------------------------------

if modifier_dazzle_pf_bad_juju == nil then
	modifier_dazzle_pf_bad_juju = class({})
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju:IsHidden() 	return true end
function modifier_dazzle_pf_bad_juju:IsPurgable()	return false end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju:OnCreated()
	if IsClient() then return end
	if self:GetParent():IsIllusion() then self:Destroy() end
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ABILITY_FULLY_CAST}
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju:OnAbilityFullyCast(event)
	if IsClient() or event.unit ~= self:GetParent() or event.ability:IsItem() or self:GetParent():PassivesDisabled() then return end

	local hCaster = self:GetCaster()
	local hAbility = self:GetAbility()

	if hCaster:HasShard("pf_bad_juju_attacks") then
		local nAttackCount = hCaster:FindTalentValue("pf_bad_juju_attacks", "targets")
		local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hCaster:GetOrigin(), nil, hCaster:Script_GetAttackRange() + 125, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_NOT_ATTACK_IMMUNE, 0, false)

		for _, hEnemy in pairs(hEnemies) do
			hCaster:PerformAttack(hEnemy, false, true, true, false, true, false, false)
			nAttackCount = nAttackCount - 1

			if nAttackCount <= 0 then break end
		end
	end

	if hCaster:HasShard("pf_bad_juju_heal") then
		local nRadius = hCaster:FindTalentValue("pf_bad_juju_heal", "radius")
		local nDuration = hCaster:FindTalentValue("pf_bad_juju_heal", "duration")
		local hAllies = FindUnitsInRadius(hCaster:GetTeam(), hCaster:GetOrigin(), nil, nRadius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS, 0, false)

		for _, hAlly in pairs(hAllies) do
			hAlly:AddNewModifier(hCaster, hAbility, "modifier_dazzle_pf_bad_juju_purple_rain", {duration = nDuration})
		end
	end

	if hCaster:HasShard("pf_bad_juju_raze") then
		self:IncrementStackCount()
		
		local hEnemies = FindUnitsInRadius(hCaster:GetTeam(), hCaster:GetOrigin(), nil, hCaster:FindTalentValue("pf_bad_juju_raze", "radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

		if self:GetStackCount() >= hCaster:FindTalentValue("pf_bad_juju_raze", "max_stack") then
			if #hEnemies > 0 then
				local sParticleName = "particles/units/heroes/hero_nevermore/nevermore_shadowraze.vpcf"
				local tDamageTable = {
					attacker = hCaster,
					victim = nil,
					damage = hCaster:GetIntellect(false)  * hCaster:FindTalentValue("pf_bad_juju_raze", "int_damage") / 100,
					damage_type = DAMAGE_TYPE_PHYSICAL,
					ability = hAbility
				}

				for _, hEnemy in pairs(hEnemies) do
					tDamageTable.victim = hEnemy
					ApplyDamage(tDamageTable)

					local nRazeFX = ParticleManager:CreateParticle(sParticleName, PATTACH_CUSTOMORIGIN, hCaster)
					ParticleManager:SetParticleControl(nRazeFX, 0, hEnemy:GetAbsOrigin())
					ParticleManager:SetParticleControl(nRazeFX, 60, Vector(255, 40, 255))
					ParticleManager:SetParticleControl(nRazeFX, 61, Vector(1, 0, 0))
					ParticleManager:ReleaseParticleIndex(nRazeFX)

					hEnemy:EmitSound("Hero_Dazzle.Shadowraze")
				end

				self:SetStackCount(0)
			else
				self:DecrementStackCount()
			end
		end
	end
end

-----------------------------------------------------------------------------------

modifier_dazzle_pf_bad_juju_purple_rain = class({})

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju_purple_rain:OnCreated()
    if IsClient() then return end
	local hParent = self:GetParent()
	local hCaster = self:GetCaster()

	self.nHealPct = hCaster:FindTalentValue("pf_bad_juju_heal", "heal_percent") / 100

    local nRainFX = ParticleManager:CreateParticle("particles/purple_rain.vpcf", PATTACH_OVERHEAD_FOLLOW, hParent)
	ParticleManager:SetParticleControlEnt(nRainFX, 1, hParent, PATTACH_OVERHEAD_FOLLOW, nil, Vector(0, 0, 0), true)
    ParticleManager:SetParticleControlEnt(nRainFX, 2, hParent, PATTACH_OVERHEAD_FOLLOW, nil, Vector(0, 0, 0), true)
    ParticleManager:SetParticleControl(nRainFX, 60, Vector(190, 1, 190))
    ParticleManager:SetParticleControl(nRainFX, 61, Vector(1, 0, 0))
	self:AddParticle(nRainFX, false, false, -1, false, true)

    self:StartIntervalThink(1)
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_bad_juju_purple_rain:OnIntervalThink()
	local hParent = self:GetParent()

	hParent:HealWithParams(hParent:GetMaxHealth() * self.nHealPct, self:GetAbility(), false, true, self:GetCaster(), false)
	hParent:GiveMana(hParent:GetMaxMana() * self.nHealPct)
end
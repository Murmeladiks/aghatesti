LinkLuaModifier("modifier_sniper_pf_take_aim",				"heroes/sniper/sniper_pf_take_aim", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_take_aim_bonus",		"heroes/sniper/sniper_pf_take_aim", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_pf_take_aim_rapid_fire",	"heroes/sniper/sniper_pf_take_aim", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

sniper_pf_take_aim = class({})

--------------------------------------------------------------------------------

function sniper_pf_take_aim:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_sniper/sniper_take_aim_haste.vpcf", context)
end

--------------------------------------------------------------------------------

function sniper_pf_take_aim:OnSpellStart()
	local hCaster = self:GetCaster()

	hCaster:AddNewModifier(hCaster, self, "modifier_sniper_pf_take_aim_bonus", {duration = self:GetSpecialValueFor("duration")})

	hCaster:EmitSound("Hero_Sniper.TakeAim.Cast")
end

--------------------------------------------------------------------------------

modifier_sniper_pf_take_aim_bonus = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:OnCreated()
	local hAbility = self:GetAbility()
	local hCaster = self:GetCaster()

	self.nBonusAttackRange = hAbility:GetSpecialValueFor("active_attack_range_bonus")
	self.nMoveSlow = hAbility:GetSpecialValueFor("slow")
	self.nArmor = hAbility:GetSpecialValueFor("bonus_armor")
	self.bNoReveal = hAbility:GetSpecialValueFor("no_reveal") == 1 and true or false

	if hCaster:HasShard("aghsfort_special_sniper_take_aim_shrapnel") then
		local hInnate = hCaster:FindAbilityByName("sniper_keen_scope")
		self.nBonusAttackRange = self.nBonusAttackRange + hInnate:GetSpecialValueFor("bonus_range")
	end

	if IsClient() then return end
	local hCaster = self:GetCaster()

	if hCaster:HasShard("special_bonus_unique_aghsfort_special_sniper_take_aim_self_purge") then
		local nSurgeFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sniper/sniper_take_aim_haste.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
		self:AddParticle(nSurgeFX, false, false, -1, false, false)

		ParticleManager:ReleaseParticleIndex(
			ParticleManager:CreateParticle("particles/generic_gameplay/generic_purge.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
		)

		hCaster:Purge(false, true, false, false, false)
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:OnDestroy()
	if IsClient() then return end
	if self:GetParent():HasModifier("modifier_sniper_pf_take_aim_rapid_fire") then
		self:GetParent():RemoveModifierByName("modifier_sniper_pf_take_aim_rapid_fire")
	end
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:CheckState()
	return {
		[MODIFIER_STATE_ATTACKS_DONT_REVEAL] = self.bNoReveal,
		[MODIFIER_STATE_LOW_ATTACK_PRIORITY] = self.bNoReveal,
	}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:GetModifierMoveSpeedBonus_Percentage()
	return self.nMoveSlow
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:GetModifierAttackRangeBonus()
	return self.nBonusAttackRange
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:GetModifierPhysicalArmorBonus()
	return self.nArmor
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_bonus:OnAttackLanded(event)
	if IsClient() or event.attacker ~= self:GetParent() then return end
	local hAttacker = event.attacker

	if hAttacker:HasShard("aghsfort_special_sniper_take_aim_rapid_fire") then
		hAttacker:AddNewModifier(hAttacker, self:GetAbility(), "modifier_sniper_pf_take_aim_rapid_fire", {})
	end

	if not hAttacker:HasShard("aghsfort_special_sniper_take_aim_shrapnel") then return end
	
	local hShrapnel = hAttacker:FindAbilityByName("sniper_pf_shrapnel")

	if not hShrapnel or not hShrapnel:IsTrained() then return end

	hShrapnel:CreateShardShrapnel(event.target:GetOrigin())
end

--------------------------------------------------------------------------------

modifier_sniper_pf_take_aim_rapid_fire = class({})

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_rapid_fire:OnCreated()
	self.nAttackSpeed = self:GetCaster():FindTalentValue("aghsfort_special_sniper_take_aim_rapid_fire", "attack_speed")
	if IsClient() then return end
	self:SetStackCount(1)
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_rapid_fire:OnRefresh()
	if IsClient() then return end
	self:IncrementStackCount()
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_rapid_fire:DeclareFunctions()
	return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

--------------------------------------------------------------------------------

function modifier_sniper_pf_take_aim_rapid_fire:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeed * self:GetStackCount()
end
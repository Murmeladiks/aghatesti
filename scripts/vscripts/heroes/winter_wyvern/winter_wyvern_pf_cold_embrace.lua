LinkLuaModifier("modifier_winter_wyvern_pf_cold_embrace", 						"heroes/winter_wyvern/winter_wyvern_pf_cold_embrace", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_winter_wyvern_pf_cold_embrace_magic_damage_block", 	"heroes/winter_wyvern/winter_wyvern_pf_cold_embrace", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

winter_wyvern_pf_cold_embrace = class({})

--------------------------------------------------------------------------------

function winter_wyvern_pf_cold_embrace:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/wyvern_cold_embrace_buff.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_winter_wyvern/winter_wyvern_diamondize.vpcf", context)
	PrecacheResource("particle", "particles/status_fx/status_effect_wyvern_cold_embrace.vpcf", context)
end

--------------------------------------------------------------------------------

function winter_wyvern_pf_cold_embrace:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget =  self:GetCursorTarget()

	hTarget:AddNewModifier(hCaster, self, "modifier_winter_wyvern_pf_cold_embrace", {duration = self:GetSpecialValueFor("duration")})

	hCaster:EmitSound("Hero_Winter_Wyvern.ColdEmbrace.Cast")
	hTarget:EmitSound("Hero_Winter_Wyvern.ColdEmbrace")

	if hCaster:HasShard("aghsfort_special_winter_wyvern_cold_embrace_magic_damage_block") then
		hTarget:AddNewModifier(hCaster, self, "modifier_winter_wyvern_pf_cold_embrace_magic_damage_block", {duration = self:GetSpecialValueFor("duration")})
	end
end

--------------------------------------------------------------------------------

modifier_winter_wyvern_pf_cold_embrace = class({})

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:OnCreated()
	local hAbility = self:GetAbility()

	self.nBaseHeal = hAbility:GetSpecialValueFor("heal_additive")
	self.nPctHeal = hAbility:GetSpecialValueFor("heal_percentage")

	if IsClient() then return end
	local hParent = self:GetParent()

	local nEmbraceFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_cold_embrace_buff.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
	ParticleManager:SetParticleControlEnt(nEmbraceFX, 0, hParent, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nEmbraceFX, 1, hParent, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	ParticleManager:SetParticleControlEnt(nEmbraceFX, 2, hParent, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	self:AddParticle(nEmbraceFX, false, false, -1, false, false)

	if self:GetCaster():GetHeroFacetID() == 1 then
		self.nManaPerTick = (self.nBaseHeal + self.nPctHeal / 100 * self:GetParent():GetMaxHealth() ) * 0.2
		local hInnate = self:GetCaster():FindAbilityByName("winter_wyvern_essence_of_the_blueheart")
		if hInnate then
			self.nManaPerTick = self.nManaPerTick * hInnate:GetSpecialValueFor("restore_pct") / 100
			Timers:CreateTimer(function()
				if self and not self:IsNull() and self:GetParent() and not self:GetParent():IsNull() and self:GetParent():IsAlive() then
					self:GetParent():GiveMana(self.nManaPerTick)
					return 0.2
				end
			end)
		end
	end

	if not self:GetCaster():HasShard("aghsfort_special_winter_wyvern_cold_embrace_blast_on_end") then return end
	self:StartIntervalThink(1)
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:OnIntervalThink()
	local hSplinterBlast = self:GetCaster():FindAbilityByName("winter_wyvern_pf_splinter_blast")

	if not hSplinterBlast or not hSplinterBlast:IsTrained() then return end

	hSplinterBlast:Splinter(self:GetParent(), self:GetCaster():FindTalentValue("aghsfort_special_winter_wyvern_cold_embrace_blast_on_end", "damage_mult"))
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:CheckState()
	return {
		[MODIFIER_STATE_STUNNED] = not self:GetCaster():HasShard("aghsfort_special_winter_wyvern_cold_embrace_magic_damage_block"),
		[MODIFIER_STATE_FROZEN] = not self:GetCaster():HasShard("aghsfort_special_winter_wyvern_cold_embrace_magic_damage_block"),
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:OnAttackLanded(event)
	if IsClient() then return end
	local hAttacker = event.attacker
	local hTarget = event.target
	local hCaster = self:GetCaster()
	
	if hTarget ~= self:GetParent() or not hCaster:HasShard("special_bonus_unique_winter_wyvern_cold_embrace_charges") then return end
	
	local hArcticBurn = hCaster:FindAbilityByName("winter_wyvern_pf_arctic_burn")

	if hArcticBurn and hArcticBurn:IsTrained() then
		hAttacker:AddNewModifier(hCaster, hArcticBurn, "winter_wyvern_pf_arctic_burn_slow", {duration = hArcticBurn:GetSpecialValueFor("damage_duration") * (1 - hAttacker:GetStatusResistance())})
	end
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:GetModifierConstantHealthRegen()
	return self.nBaseHeal
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:GetModifierHealthRegenPercentage()
	return self.nPctHeal
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:GetAbsoluteNoDamagePhysical()
	return 1
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:GetStatusEffectName()
	return "particles/status_fx/status_effect_wyvern_cold_embrace.vpcf"
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace:StatusEffectPriority()
	return MODIFIER_PRIORITY_HIGH
end

--------------------------------------------------------------------------------

modifier_winter_wyvern_pf_cold_embrace_magic_damage_block = class({})

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:IsPurgable() return false end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:OnCreated()
	if IsClient() then return end
	local hParent = self:GetParent()

	self.nMoveSpeed = self:GetCaster():FindTalentValue("aghsfort_special_winter_wyvern_cold_embrace_magic_damage_block", "max_movement_speed")

	local nImmunityFX = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/winter_wyvern_diamondize.vpcf", PATTACH_ABSORIGIN_FOLLOW, hParent)
	ParticleManager:SetParticleControlEnt(nImmunityFX, 2, hParent, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
	self:AddParticle(nImmunityFX, false, false, -1, false, false)
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE_MAX,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:CheckState()
	return {
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_DEBUFF_IMMUNE] = true
	}
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:GetModifierMoveSpeed_AbsoluteMax()
	return self.nMoveSpeed
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:GetModifierMagicalResistanceDirectModification()
	return 100
end

--------------------------------------------------------------------------------

function modifier_winter_wyvern_pf_cold_embrace_magic_damage_block:GetPriority()
	return MODIFIER_PRIORITY_ULTRA
end
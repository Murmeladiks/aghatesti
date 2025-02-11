LinkLuaModifier("modifier_medusa_mana_shield_lua", 			"heroes/medusa/medusa_mana_shield/modifier_medusa_mana_shield_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_magic_shield", 			"heroes/medusa/medusa_mana_shield/modifier_medusa_magic_shield", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_form", 				"heroes/medusa/medusa_mana_shield/modifier_medusa_stone_form", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_form_cd", 			"heroes/medusa/medusa_mana_shield/modifier_medusa_stone_form", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_stone_form_grace", 		"heroes/medusa/medusa_mana_shield/modifier_medusa_stone_form", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_medusa_pf_manashield_attack_buff", 	"heroes/medusa/medusa_mana_shield/medusa_mana_shield_lua", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

medusa_mana_shield_lua = class({})

--------------------------------------------------------------------------------

function medusa_mana_shield_lua:Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_medusa.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_obsidian_destroyer.vsndevts", context)
	PrecacheResource("particle", "particles/heroes/medusa/medusa_magic_shield.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield.vpcf", context)
	PrecacheResource("particle", "particles/items_fx/ethereal_blade_glow_target.vpcf", context)
	PrecacheResource("particle", "particles/econ/items/antimage/antimage_weapon_basher_ti5/antimage_manavoid_ti_5.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_medusa/medusa_mana_shield_buff.vpcf", context)
end

--------------------------------------------------------------------------------

function medusa_mana_shield_lua:GetIntrinsicModifierName()
	return "modifier_medusa_mana_shield_lua"
end

--------------------------------------------------------------------------------

function medusa_mana_shield_lua:GetBehavior()
	if self:GetCaster():HasModifier("modifier_medusa_pf_manashield_attack_buff") then return DOTA_ABILITY_BEHAVIOR_NO_TARGET end
	if self:GetSpecialValueFor("aspd_increase_buff_duration") > 0 then
		return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_TOGGLE
	else
		return self.BaseClass.GetBehavior(self)
	end
end

--------------------------------------------------------------------------------

function medusa_mana_shield_lua:GetCooldown(iLevel)
	return self:GetSpecialValueFor("attack_buff_cooldown")
end

--------------------------------------------------------------------------------

function medusa_mana_shield_lua:OnSpellStart()
	self:ToggleAbility()
end

--------------------------------------------------------------------------------

function medusa_mana_shield_lua:OnToggle()
	local hCaster = self:GetCaster()

	if self:GetToggleState() == false then
		if hCaster:HasModifier("modifier_medusa_pf_manashield_attack_buff") then
			hCaster:FindModifierByName("modifier_medusa_pf_manashield_attack_buff"):StartIntervalThink(-1)
		end
		self:UseResources(false, false, false, true)
		return
	end

	hCaster:RemoveModifierByName("modifier_medusa_pf_manashield_attack_buff")
	hCaster:AddNewModifier(hCaster, self, "modifier_medusa_pf_manashield_attack_buff", {duration = self:GetSpecialValueFor("aspd_increase_buff_duration")})
	hCaster:EmitSound("Hero_Medusa.ManaShield.On")

	self:EndCooldown()
	self:StartCooldown(self:GetSpecialValueFor("min_duration"))
end

--------------------------------------------------------------------------------

medusa_end_stone_form_lua = class({})

--------------------------------------------------------------------------------

function medusa_end_stone_form_lua:Spawn()
	if not IsServer() then return end
	Timers:CreateTimer(0.1, function() self:SetLevel(1) end)
end

--------------------------------------------------------------------------------

function medusa_end_stone_form_lua:OnSpellStart()
	self:GetCaster():RemoveModifierByName("modifier_medusa_stone_form")
end

--------------------------------------------------------------------------------

modifier_medusa_pf_manashield_attack_buff = class({})

--------------------------------------------------------------------------------

function modifier_medusa_pf_manashield_attack_buff:OnCreated()
	local hAbility = self:GetAbility()

	self.nAttackSpeedPct = hAbility:GetSpecialValueFor("aspd_increase_rate_pct") / 100
	self.nManaCostPct = hAbility:GetSpecialValueFor("aspd_increase_mana_cost_pct")
	self.nMaxAttackSpeedTime = hAbility:GetSpecialValueFor("aspd_increase_max_aspd_time")

	if IsClient() then return end
	local hCaster = self:GetCaster()
	self.nTickTime = 1 / ((hCaster:GetDisplayAttackSpeed() - hCaster:GetBaseAgility()) * self.nAttackSpeedPct)

	self.nManaDrain = self.nManaCostPct * self.nTickTime / 100

	self:StartIntervalThink(self.nTickTime)
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_manashield_attack_buff:OnDestroy()
	if IsClient() then return end
	self:GetCaster():EmitSound("Hero_Medusa.ManaShield.On")
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_manashield_attack_buff:OnIntervalThink()
	local hParent = self:GetParent()

	if self:GetElapsedTime() > self.nMaxAttackSpeedTime or hParent:GetMana() < 1 then
		self:StartIntervalThink(-1)

		self:GetAbility():ToggleAbility()
		self:GetAbility():UseResources(false, false, false, true)
	end	

	self:IncrementStackCount()
	hParent:SpendMana(self.nManaDrain * hParent:GetMaxMana(), self:GetAbility())
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_manashield_attack_buff:DeclareFunctions()
	return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_manashield_attack_buff:GetModifierAttackSpeedBonus_Constant()
	return self:GetStackCount()
end

--------------------------------------------------------------------------------

function modifier_medusa_pf_manashield_attack_buff:GetEffectName()
	return "particles/units/heroes/hero_medusa/medusa_mana_shield_buff.vpcf"
end

--[[
Minor Shards:
- +5% damage absorption
- +0.2 damage absorbed per mana spent

+ Stone Form: 
	When falling below 10% health or mana, Medusa petrifies herself. 
	While in this stone form, she is invulnerable, regenerates 5% health/mana per second, and launches mystic snakes at nearby enemies every second. 
	Lasts for up to 6 seconds, and can be ended prematurely. 
	25s cooldown.
	-> when the effect is activated, Mana shield is replaced with the sub-ability End Stone Form
	-> Medusa is invulnerable and unable to act while petrified, but can still cast Stone Gaze and End Stone Form
	-> The effect activation should be signaled with the golden immortal mana void particle, and nearby enemies in a 500 radius should be briefly knocked back
	-> Medusa gains 100% damage reduction and is untargetable by enemies for 0.75s after her stone form ended

+ Mana Dome: 
	Medusa can cast Mana Shield upon the ground to create a Mana Dome, 
	which applies Mana Shield's damage absorption to allies in a 500 radius, 
	expending Medusa's mana when damage is taken by allies within.  
	Medusa herself gain +30% damage absorption inside the dome, and +20% mana regen for each friendly hero inside it. 
	Only one dome can exist at a time.
	-> the mana dome should use a more transparent and blue version of Faceless Void arcana chronosphere particle effect

+ Mana Shield Shard #3 [Mana Reflow]: 
	While having less than 17% mana, Stone Gaze recharges 200% faster. 
	Medusa also periodically gain a shield that negate magical damage and disarms nearby foes on expire.
	-> the shield should use Antimage spell shield particle effect
	-> the shield appears every 2 seconds, lasting 1 seconds. This mean there should be a 1s interval where medusa is vulnerable.
	-> every time the shield disappear, it should cause an Overload particle effect centered on Medusa with a 250 radius. 
		This disarm enemies in the radius for 0.6s seconds, and deals a flat 160 damage
	-> the shield prevent magic damage, but does not grant spell immunity. Medusa can still be stunned and disabled. 
	-> equipping Stonework Pendant disables this effect
	 
]]

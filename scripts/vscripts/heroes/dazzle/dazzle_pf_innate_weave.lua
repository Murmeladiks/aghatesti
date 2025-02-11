LinkLuaModifier("modifier_dazzle_pf_innate_weave", 					"heroes/dazzle/dazzle_pf_innate_weave", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_dazzle_pf_innate_weave_armor_counter", 	"heroes/dazzle/dazzle_pf_innate_weave", LUA_MODIFIER_MOTION_NONE)

-----------------------------------------------------------------------------------

if dazzle_pf_innate_weave == nil then
	dazzle_pf_innate_weave = class({})
end

--------------------------------------------------------------------------------

function dazzle_pf_innate_weave:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_armor_friend.vpcf", context)
	PrecacheResource("particle", "particles/units/heroes/hero_dazzle/dazzle_armor_enemy.vpcf", context)
end

-----------------------------------------------------------------------------------

function dazzle_pf_innate_weave:ApplyWeave(hTarget)
	hTarget:AddNewModifier(self:GetCaster(), self, "modifier_dazzle_pf_innate_weave_armor_counter", {duration = self:GetSpecialValueFor("duration")})
	hTarget:EmitSound("Hero_Dazzle.BadJuJu.Target")
end

-----------------------------------------------------------------------------------

if modifier_dazzle_pf_innate_weave_armor_counter == nil then
	modifier_dazzle_pf_innate_weave_armor_counter = class({})
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_innate_weave_armor_counter:OnCreated()
	local hParent = self:GetParent()

	self.nArmor = self:GetAbility():GetSpecialValueFor("armor_change")

	local bIsEnemy = hParent:GetTeamNumber() ~= self:GetCaster():GetTeamNumber()

	if bIsEnemy then
		self.nArmor = -self.nArmor
	end

	if IsClient() then
		local sParticleName = bIsEnemy and "particles/units/heroes/hero_dazzle/dazzle_armor_enemy.vpcf" or "particles/units/heroes/hero_dazzle/dazzle_armor_friend.vpcf"
		local nArmorChangeFX = ParticleManager:CreateParticle(sParticleName, PATTACH_OVERHEAD_FOLLOW, hParent)
		ParticleManager:SetParticleControlEnt(nArmorChangeFX, 1, hParent, PATTACH_ABSORIGIN_FOLLOW, nil, Vector(0, 0, 0), true)
		self:AddParticle(nArmorChangeFX, false, false, -1, false, true)
		return 
	end

	self:SetStackCount(1)

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self:DecrementStackCount()
		end
	end)
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_innate_weave_armor_counter:OnRefresh()
	if IsClient() then return end

	self:IncrementStackCount()

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self:DecrementStackCount()
		end
	end)
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_innate_weave_armor_counter:DeclareFunctions()
	return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS}
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_innate_weave_armor_counter:GetModifierPhysicalArmorBonus()
	return self.nArmor * self:GetStackCount()
end

-----------------------------------------------------------------------------------

function modifier_dazzle_pf_innate_weave_armor_counter:ShouldUseOverheadOffset()
	return true
end
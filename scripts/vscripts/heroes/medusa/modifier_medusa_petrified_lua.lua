modifier_medusa_petrified_lua = class({})

function modifier_medusa_petrified_lua:IsPurgable() return false end
function modifier_medusa_petrified_lua:IsHidden() return true end
function modifier_medusa_petrified_lua:DestroyOnExpire() return false end

function modifier_medusa_petrified_lua:OnCreated(kv)
	self.physical_bonus = kv.physical_bonus or 0
	self.parent = self:GetParent()

	-- store petrify applications cooldowns
	self.applications = {}

	if IsServer() then
		self.parent:EmitSound("Hero_Medusa.StoneGaze.Stun")
	end
end

function modifier_medusa_petrified_lua:FromSource(source, duration)
	if not duration then --[[print("[Petrification] NO DURATION PASSED!!!!!")]] return end
	-- already petrified by that source, declined
	local entindex = source:GetEntityIndex()
	if self.applications[entindex] then return end

	if duration < self:GetRemainingTime() then return end

	self:SetDuration(duration, true)
	self:PlayStonedParticle()
	self.applications[entindex] = true
	self.current_source = source
	self.latest_applied_duration = duration

	-- apply status fx
	-- i couldn't do that with ParticleManager, so making child modifier to do that
	local status_fx_modifier = self.parent:FindModifierByName("modifier_medusa_petrified_status_lua")
	if not status_fx_modifier then 
		status_fx_modifier = self.parent:AddNewModifier(self:GetCaster(), self.ability, "modifier_medusa_petrified_status_lua", {
			duration = duration
		}) 
	else
		status_fx_modifier:SetDuration(duration, true)
	end
	
	-- petrify has 10 seconds cooldown on targets with CC protection, 1 second on others
	local delay = (self.parent:HasModifier("modifier_absolute_no_cc") or self.parent:IsBoss() or self.parent:IsConsideredHero()) and 10 or 1

	-- adding duration since said cooldown applies on expire from certain source
	Timers:CreateTimer(duration + delay, function()
		if not self or self:IsNull() then return end
		self.applications[entindex] = nil
	end)
end

function modifier_medusa_petrified_lua:RemoveSource(source)
	-- remove petrification effect if it's currently affecting the unit (top-level petrification)
	if self.current_source ~= source then return end
	
	self:SetDuration(0, true)

	local status_fx_modifier = self.parent:FindModifierByName("modifier_medusa_petrified_status_lua")
	if status_fx_modifier then status_fx_modifier:Destroy() end
end

function modifier_medusa_petrified_lua:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
	}
end

function modifier_medusa_petrified_lua:GetModifierIncomingDamage_Percentage( params )
	if params.damage_type == DAMAGE_TYPE_PHYSICAL and self:GetRemainingTime() > 0 then
		return self.physical_bonus
	end
end

function modifier_medusa_petrified_lua:CheckState()
	local applied = self:GetRemainingTime() > 0
	if not applied then return {} end
	return {
		[MODIFIER_STATE_STUNNED] = applied,
		[MODIFIER_STATE_FROZEN] = applied,
	}
end

function modifier_medusa_petrified_lua:PlayStonedParticle()
	local effect_cast = ParticleManager:CreateParticle(
		"particles/units/heroes/hero_medusa/medusa_stone_gaze_debuff_stoned.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.parent
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast, 1, self:GetCaster(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector( 0,0,0 ), true
	)
	ParticleManager:ReleaseParticleIndex(effect_cast)
end


function modifier_medusa_petrified_lua:GetPriority() return 200000 end


modifier_medusa_petrified_status_lua = class({})

function modifier_medusa_petrified_status_lua:IsPurgable() return false end
function modifier_medusa_petrified_status_lua:GetTexture() return "medusa_stone_gaze" end

function modifier_medusa_petrified_status_lua:GetStatusEffectName()
	return "particles/status_fx/status_effect_medusa_stone_gaze.vpcf"
end

function modifier_medusa_petrified_status_lua:StatusEffectPriority()
	return MODIFIER_PRIORITY_ULTRA
end

LinkLuaModifier( "modifier_aghsfort_phoenix_supernova", 			"abilities/creatures/aghsfort_phoenix_supernova", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_aghsfort_phoenix_supernova_animation", 	"abilities/creatures/aghsfort_phoenix_supernova", LUA_MODIFIER_MOTION_VERTICAL )

--------------------------------------------------------------------------

if aghsfort_phoenix_supernova == nil then aghsfort_phoenix_supernova = class({}) end

--------------------------------------------------------------------------

function aghsfort_phoenix_supernova:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	
	local egg = CreateUnitByName("npc_dota_phoenix_sun", caster:GetAbsOrigin(), false, nil, nil, caster:GetTeam())

	egg:AddNewModifier(caster, self, "modifier_phoenix_sun", {duration = self:GetDuration()})

	caster:AddNewModifier(caster, self, "modifier_aghsfort_phoenix_supernova", {duration = self:GetDuration()}).egg = egg
	target:AddNewModifier(caster, self, "modifier_aghsfort_phoenix_supernova", {duration = self:GetDuration()}).egg = egg
	egg:StartGesture(ACT_DOTA_IDLE)

	Timers:CreateTimer(FrameTime(), function() 
		if egg:GetSequence() == "bindPose" then
			egg:SetHealthBarOffsetOverride(300)	
			egg:AddNewModifier(caster, self, "modifier_aghsfort_phoenix_supernova_animation", {duration = self:GetDuration()})
		end
	end)
end

--------------------------------------------------------------------------

if modifier_aghsfort_phoenix_supernova == nil then modifier_aghsfort_phoenix_supernova = class({}) end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova:IsPurgable() 	return false end
function modifier_aghsfort_phoenix_supernova:IsHidden() 	return true end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova:OnCreated()
	if not IsServer() then return end
	self:GetParent():AddNoDraw()
	self:StartIntervalThink(FrameTime())
	self.health = self:GetParent():GetHealth()
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova:OnDestroy()
	if not IsServer() then return end
	self:GetParent():RemoveNoDraw()

	if self:GetElapsedTime() > self:GetDuration() - FrameTime() * 2 then
		if self:GetParent() ~= self:GetCaster() then
			--self:GetParent():Kill(self:GetAbility(), self:GetCaster())
			self:GetParent():Kill(self:GetAbility(), nil)
		else
			local health = self.health
			local parent = self:GetParent()
			Timers:CreateTimer(FrameTime(), function()
				parent:SetHealth(self.health)
			end)
		end
	else
		self:GetCaster():Kill(self:GetAbility(), nil)
	end
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova:OnIntervalThink()
	if not self.egg or self.egg:IsNull() or not self.egg:IsAlive() then
		self:Destroy()
	end
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_MUTED] = true,
		[MODIFIER_STATE_ROOTED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_STUNNED] = true,
		[MODIFIER_STATE_PASSIVES_DISABLED] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_OUT_OF_GAME] = true,
	}
end

--------------------------------------------------------------------------

if modifier_aghsfort_phoenix_supernova_animation == nil then modifier_aghsfort_phoenix_supernova_animation = class({}) end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova_animation:IsHidden() 	return true end
function modifier_aghsfort_phoenix_supernova_animation:IsPurgable() return false end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova_animation:DeclareFunctions()
	return {MODIFIER_PROPERTY_VISUAL_Z_DELTA}
end

--------------------------------------------------------------------------

function modifier_aghsfort_phoenix_supernova_animation:GetVisualZDelta()
	return 300
end
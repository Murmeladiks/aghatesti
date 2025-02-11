modifier_medusa_stone_form = class({})

function modifier_medusa_stone_form:IsPurgable() return true end

function modifier_medusa_stone_form:GetStatusEffectName()
	return "particles/status_fx/status_effect_medusa_stone_gaze.vpcf"
end

function modifier_medusa_stone_form:StatusEffectPriority()
	return MODIFIER_PRIORITY_ULTRA
end

function modifier_medusa_stone_form:OnCreated()
	self.parent = self:GetParent()
	self.ability = self:GetAbility()

	self.health_regen = self.ability:GetSpecialValueFor("bonus_regen")
	self.mana_regen = self.ability:GetSpecialValueFor("bonus_regen")

	self.snake_ability = self.parent:FindAbilityByName("medusa_mystic_snake_lua")
	self.snake_search_radius = self.snake_ability:GetCastRange(Vector(0, 0, 0), self.parent)

	if not IsServer() then return end

	local origin = self.parent:GetAbsOrigin()
	local proc_knockback_radius = self.ability:GetSpecialValueFor("proc_knockback_radius")
	
	-- proc particle
	local p_id = ParticleManager:CreateParticle(
		"particles/econ/items/antimage/antimage_weapon_basher_ti5/antimage_manavoid_ti_5.vpcf", PATTACH_ABSORIGIN, self.parent
	)
	ParticleManager:SetParticleControl(p_id, 0, origin)
	ParticleManager:SetParticleControl(p_id, 1, Vector(proc_knockback_radius, proc_knockback_radius, proc_knockback_radius))
	ParticleManager:ReleaseParticleIndex(p_id)

	self.parent:EmitSound("Hero_ObsidianDestroyer.SanityEclipse.Cast")

	-- aoe knockback effect
	local enemies = FindUnitsInRadius(
		self.parent:GetTeamNumber(), origin, nil, proc_knockback_radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false
	)
	for _, enemy in pairs(enemies) do
		if enemy and not enemy:IsNull() and enemy:IsAlive() then
			enemy:RemoveModifierByName("modifier_knockback")
			enemy:AddNewModifier(self.parent, self.ability, "modifier_knockback", {
				knockback_duration = 0.35,
				duration = 0.35,
				knockback_distance = proc_knockback_radius / 2,
				knockback_height = 70,
				center_x = origin.x,
				center_y = origin.y,
				center_z = origin.z,
			})
		end
	end

	local snake_interval = self.ability:GetSpecialValueFor("snake_interval")
	self:StartIntervalThink(snake_interval)
	self.parent:SwapAbilities("medusa_mana_shield_lua", "medusa_end_stone_form_lua", false, true)
end

function modifier_medusa_stone_form:OnDestroy()
	if not IsServer() then return end

	self.parent:SwapAbilities("medusa_mana_shield_lua", "medusa_end_stone_form_lua", true, false)
	
	self.parent:AddNewModifier(self.parent, self.ability, "modifier_medusa_stone_form_grace", {
		duration = self.ability:GetSpecialValueFor("stone_form_grace_duration")
	})
end

function modifier_medusa_stone_form:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_ROOTED] = true,
		[MODIFIER_STATE_FROZEN] = true,
		[MODIFIER_STATE_CANNOT_TARGET_ENEMIES] = true,
	}
end

function modifier_medusa_stone_form:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE, -- GetModifierHealthRegenPercentage
		MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE, -- GetModifierTotalPercentageManaRegen
	}
end	

function modifier_medusa_stone_form:GetModifierHealthRegenPercentage()
	return self.health_regen
end

function modifier_medusa_stone_form:GetModifierTotalPercentageManaRegen()
	return self.mana_regen
end

function modifier_medusa_stone_form:OnIntervalThink()
	if not IsServer() then return end

	local units = FindUnitsInRadius(
		self.parent:GetTeamNumber(),
		self.parent:GetAbsOrigin(),
		nil,
		self.snake_search_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		0,
		FIND_CLOSEST,
		false
	)
	if #units == 0 then return end

	self.snake_ability:FireSnake(units[1], nil, self.parent)
end



modifier_medusa_stone_form_cd = class({})

function modifier_medusa_stone_form_cd:IsPurgable() return false end
function modifier_medusa_stone_form_cd:RemoveOnDeath() return false end



modifier_medusa_stone_form_grace = class({})

function modifier_medusa_stone_form_grace:IsHidden() return true end
function modifier_medusa_stone_form_grace:IsPurgable() return false end


function modifier_medusa_stone_form_grace:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
	}
end

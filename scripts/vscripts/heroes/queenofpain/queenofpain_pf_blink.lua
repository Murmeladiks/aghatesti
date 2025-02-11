LinkLuaModifier("modifier_queenofpain_pf_blink_attack_speed", "heroes/queenofpain/queenofpain_pf_blink", LUA_MODIFIER_MOTION_NONE)

queenofpain_pf_blink = class({})

--------------------------------------------------------------------------------

function queenofpain_pf_blink:Precache( context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_blink_start.vpcf", context )
	PrecacheResource("particle", "particles/units/heroes/hero_queenofpain/queen_blink_end.vpcf", context )
end

--------------------------------------------------------------------------------

function queenofpain_pf_blink:GetCastRange(vLocation, hTarget)
	return IsClient() and self:GetSpecialValueFor("blink_range") or 10000
end

--------------------------------------------------------------------------------

function queenofpain_pf_blink:OnSpellStart()
	local hCaster = self:GetCaster()
	local vPos = self:GetCursorPosition()
	local vOrigin = hCaster:GetOrigin()
	local nDistance = (vOrigin - vPos):Length2D()
	local nRange = self:GetSpecialValueFor("blink_range")


	if (vPos - vOrigin):Length2D() > nRange + hCaster:GetCastRangeBonus() then
		local nDistance = (nRange + hCaster:GetCastRangeBonus())
	
		vPos = vOrigin + (vPos - vOrigin):Normalized() * nDistance
	end

	local nStartFX = ParticleManager:CreateParticle("particles/units/heroes/hero_queenofpain/queen_blink_start.vpcf", PATTACH_ABSORIGIN, hCaster)
	ParticleManager:SetParticleControl(nStartFX, 0, vOrigin)
	ParticleManager:SetParticleControl(nStartFX, 1, vPos)
	ParticleManager:ReleaseParticleIndex(nStartFX)
	
	EmitSoundOnLocationWithCaster(vOrigin, "Hero_QueenOfPain.Blink_out", hCaster)

	if nDistance < self:GetSpecialValueFor("min_blink_range") then
		local vDirection = (vPos - vOrigin):Normalized()
		vPos = vOrigin + vDirection * self:GetSpecialValueFor("min_blink_range")
	end
	
	FindClearSpaceForUnit(hCaster, vPos, true)
	ProjectileManager:ProjectileDodge(hCaster)
	
	hCaster:EmitSound("Hero_QueenOfPain.Blink_in")

	ParticleManager:ReleaseParticleIndex(
		ParticleManager:CreateParticle("particles/units/heroes/hero_queenofpain/queen_blink_end.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster)
	)

	if hCaster:HasShard("aghsfort_special_queenofpain_blink_generates_scream") then
		local hScream = hCaster:FindAbilityByName("queenofpain_pf_scream_of_pain")

		if not hScream or not hScream:IsTrained() then return end
	
		hScream:SendScreams(hCaster)
	end

	if hCaster:HasShard("aghsfort_special_queenofpain_blink_attack_speed") then
		hCaster:AddNewModifier(hCaster, self, "modifier_queenofpain_pf_blink_attack_speed", {duration = hCaster:FindTalentValue("aghsfort_special_queenofpain_blink_attack_speed", "duration")})
	end

	if hCaster:HasShard("aghsfort_special_queenofpain_blink_shadow_strike") then
		self:BlinkStrike(vOrigin, vPos)		
	end
end

--------------------------------------------------------------------------------

function queenofpain_pf_blink:BlinkStrike(vOrigin, vPos)
	local hCaster = self:GetCaster()
	local hShadowStrike = hCaster:FindAbilityByName("queenofpain_pf_shadow_strike")

	if not hShadowStrike or not hShadowStrike:IsTrained() then return end

	local nWidth = hCaster:FindTalentValue("aghsfort_special_queenofpain_blink_shadow_strike", "effect_radius")
	local nSpeed = hCaster:FindTalentValue("aghsfort_special_queenofpain_blink_shadow_strike", "travel_speed")

	local hEnemies =  FindUnitsInLine(hCaster:GetTeamNumber(), vOrigin, vPos, nil, nWidth, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NO_INVIS)

	for _, hEnemy in pairs(hEnemies) do
		hShadowStrike:ShadowStrike(hCaster, hEnemy, 0, {}, nSpeed)
	end
end

--------------------------------------------------------------------------------

modifier_queenofpain_pf_blink_attack_speed = class({})

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_blink_attack_speed:OnCreated( kv )
	local hShard = self:GetCaster():FindAbilityByName("aghsfort_special_queenofpain_blink_attack_speed")

	self.nAttackSpeed = hShard:GetSpecialValueFor("bonus_attack_speed")

	if IsClient() then return end
	self:SetStackCount(1)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_blink_attack_speed:OnRefresh()
	if IsClient() then return end
	self:IncrementStackCount()

	Timers:CreateTimer(self:GetDuration(), function()
		if self and not self:IsNull() then
			self:DecrementStackCount()
		end
	end)
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_blink_attack_speed:DeclareFunctions()
	return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end

--------------------------------------------------------------------------------

function modifier_queenofpain_pf_blink_attack_speed:GetModifierAttackSpeedBonus_Constant()
	return self.nAttackSpeed * self:GetStackCount()
end
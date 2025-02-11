if C_DOTA_BaseNPC then CDOTA_BaseNPC = C_DOTA_BaseNPC end

------------------------------------------------------------------------

if not CDOTA_BaseNPC.OldForceKill then
    CDOTA_BaseNPC.OldForceKill = CDOTA_BaseNPC.ForceKill
end

------------------------------------------------------------------------

function CDOTA_BaseNPC:ForceKill(bReincarnate)
	if self and self.entindex then
    	FireGameEvent("entity_killed", {entindex_killed = self:entindex()})
	end

	self:OldForceKill(bReincarnate)
end

-- Talent handling
function CDOTA_BaseNPC:HasTalent(talent_name)
	if not self or self:IsNull() then return end

	local talent = self:FindAbilityByName(talent_name)
	if talent and talent:GetLevel() > 0 then return true end
end

function CDOTA_BaseNPC:FindTalentValue(talent_name, key)
	if self:HasTalent(talent_name) then
		local value_name = key or "value"
		return self:FindAbilityByName(talent_name):GetSpecialValueFor(value_name)
	end
	return 0
end

function CDOTA_BaseNPC:HasShard(talentName)
	local legendary_shard = self:FindAbilityByName(talentName)
    if legendary_shard and not legendary_shard:IsNull() and legendary_shard:GetLevel() > 0 then
        return true
    end
    return false
end


function CDOTA_BaseNPC:GetTrueStatusResistance()
	local nResistance = 0
	local nStackingResistance = 0

	for _, modifier in ipairs(self:FindAllModifiers()) do
		if modifier.GetModifierStatusResistanceStacking then
			nStackingResistance = nStackingResistance + (modifier:GetModifierStatusResistanceStacking() or 0)
		end
		if modifier.GetModifierStatusResistance and modifier:GetModifierStatusResistance() and modifier:GetModifierStatusResistance() > nResistance then
			nResistance = modifier:GetModifierStatusResistance()
		end
	end

	return 1 - math.max(0.10, (1 - nResistance/100)) * math.max(0.10, (1 - nStackingResistance/100))
end
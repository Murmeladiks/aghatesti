item_small_scepter_fragment = class({})

--------------------------------------------------------------------------------

function item_small_scepter_fragment:Precache( hContext )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_alchemist.vsndevts", hContext )
	--PrecacheResource( "soundfile", "soundevents/game_sounds.vsndevts", context )
end 

--------------------------------------------------------------------------------

function item_small_scepter_fragment:OnSpellStart()
	if self:GetCaster() ~= nil and self:GetCaster():IsRealHero() then
		local szHeroName = self:GetCaster():GetUnitName()
		local UpgradeTable = MINOR_ABILITY_UPGRADES[ szHeroName ]

		for _, upgrade in pairs(UpgradeTable) do
			local szUpgradeName = upgrade["description"]
			if MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName] and MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName] then
				if self:GetCaster():GetHeroFacetID() == MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName]["RequiredFacetID"] then
					DeepPrintTable(UpgradeTable[_])
					local nID = upgrade["id"]
					UpgradeTable[_] = MINOR_ABILITY_UPGRADES_FACET_REPLACEMENTS[szHeroName][szUpgradeName]["ReplacedMinor"]
					UpgradeTable[_]["id"] = nID
				end
			end
		end

		if UpgradeTable then
			local szUpgradeName = string.sub( self:GetAbilityName(), 6, string.len( self:GetAbilityName() ) )
			local Upgrade = nil
			for _,CurUpgrade in pairs( UpgradeTable ) do
				if CurUpgrade[ "description" ] == szUpgradeName then
					Upgrade = CurUpgrade
					break
				end
			end
			
			if Upgrade then
				-- local gameEvent = {}
				-- gameEvent[ "string_replace_token" ] = Upgrade [ "description" ]
				-- gameEvent[ "ability_name" ] = Upgrade[ "ability_name" ]	
				-- gameEvent[ "value" ] = tonumber( Upgrade[ "value" ] )
				-- gameEvent[ "player_id" ] = self:GetCaster():GetPlayerID()
				-- gameEvent[ "teamnumber" ] = -1
				-- gameEvent[ "message" ] = "#DOTA_HUD_REWARD_TYPE_MINOR_ABILITY_UPGRADE_Toast"

				-- FireGameEvent( "dota_combat_event_message", gameEvent )

				CAghanim:AddMinorAbilityUpgrade( self:GetCaster(), Upgrade )
				--EmitSoundOn( "Item.MoonShard.Consume", self:GetCaster() )
				self:GetCaster():EmitSoundParams("soundboard.looking_spicy", 0.2,0.8,0)
			end
		
		end		
	end

	self:SpendCharge(FrameTime())
end


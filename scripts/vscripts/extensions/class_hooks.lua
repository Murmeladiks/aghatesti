function HookClass(class)
    for k, v in pairs(class) do
        if type(v) == "function" then
            if k ~= "IsNull" then
                class[k] = function (self, ...)
                    if self and not self:IsNull() then
                        return v(self, ...)
                    else
                        return nil
                    end
                end
            else
                class[k] = function (self, ...)
                    if self then
                        return v(self, ...)
                    else
                        return nil
                    end
                end
            end
        end
    end
end


if not bClassesHooked then
    bClassesHooked = true
    HookClass(CEntityInstance)
    HookClass(CBaseEntity)
    HookClass(CDOTABaseAbility)
    HookClass(CDOTA_BaseNPC)
    HookClass(CDOTA_Item)
    HookClass(CDOTA_Buff)
    --2nd update
    HookClass(CBasePlayerController)
    HookClass(CDOTA_Item_Lua)
    HookClass(CDOTA_Item_BagOfGold)
    HookClass(CDOTA_BaseNPC_Building)
    HookClass(CDOTA_BaseNPC_Creature)
    HookClass(CDOTA_BaseNPC_Hero)
    HookClass(CDOTA_Buff)
    HookClass(CDOTA_Modifier_Lua)
    HookClass(CDOTA_Modifier_Lua_Horizontal_Motion)
    HookClass(CDOTA_Modifier_Lua_Vertical_Motion)
    HookClass(CDOTA_Modifier_Lua_Motion_Both)
    HookClass(CDOTA_Ability_Lua)
    HookClass(CDOTAPlayerController)
    HookClass(CEntities)
end
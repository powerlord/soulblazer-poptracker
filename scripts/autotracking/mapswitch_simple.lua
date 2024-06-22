
function SwitchMaps( segment )
  -- check if we're in the game.
  if not isInGame() then
    return false
  end

  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_LOCATION_TRACKING then

    if Tracker:ProviderCountForCode( "automapswitch" ) > 0 then
      local mapId = ReadU8( segment, 0x7e1c6a )

      if mapId >= 0 then
        --print(string.format("Map ID is %#04x", mapId))

        if mapId >= 0x78 then
          Tracker:UiHint("ActivateTab", "World of Evil")
        elseif mapId >= 0x64 and mapId < 0x78 then
          Tracker:UiHint("ActivateTab", "Magridd Castle")
        elseif mapId >= 0x50 and mapId < 0x64 then
          Tracker:UiHint("ActivateTab", "Dr. Leo's Lab")
        elseif mapId >= 0x3c and mapId < 0x50 then
          Tracker:UiHint("ActivateTab", "Mountain of Souls")
        elseif mapId >= 0x28 and mapId < 0x3c then
          Tracker:UiHint("ActivateTab", "Seabed Sanctuary")
        elseif mapId >= 0x14 and mapId < 0x28 then
          Tracker:UiHint("ActivateTab", "Woods of Greenwood")
        elseif mapId >= 0x00 and mapId < 0x0f then
          Tracker:UiHint("ActivateTab", "Grass Valley")
        end
      end
    end
  end

end


ScriptHost:AddMemoryWatch( "Soul Blazer Current Map ID", 0x7e1c6a, 1, SwitchMaps )

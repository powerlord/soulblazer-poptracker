function updateArchipelagoMiscRewardsFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() then
    return false
  end

  if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    return
  end

  InvalidateReadCaches()

  updateLocationFromBit( segment, "@Tool Shop/Tool Shop Owner" , 0x7e1b13, 0x01 ) -- 0x00
  updateLocationFromBit( segment, "@Cliff Overlooking Tulip/Left-most cliff" , 0x7e1b13, 0x02 ) -- 0x01
  updateLocationFromBit( segment, "@Right Goat's Pen/Southeast Corner" , 0x7e1b13, 0x04 ) -- 0x02
  updateLocationFromBit( segment, "@Tool Shop/Tool Shop Owner's Son", 0x7e1b13, 0x08) -- 0x03
  updateLocationFromBit( segment, "@Sleepy Tulip/Push Left", 0x7e1b13, 0x10 ) -- 0x04
  updateLocationFromBit( segment, "@Hideout Tile/Lower-right most outlook", 0x7e1b13, 0x20 ) -- 0x05
  updateLocationFromBit( segment, "@Chief's House/Chief", 0x7e1b13, 0x40 ) -- 0x06
  updateLocationFromBit( segment, "@Trial Room/Magician" , 0x7e1b13, 0x80 ) -- 0x07
  updateLocationFromBit( segment, "@Hideout Crystal/Nice view at least...", 0x7e1b14, 0x01 ) -- 0x08
  updateLocationFromBit( segment, "@Chest Cave/Crystal", 0x7e1b14, 0x02 ) -- 0x09
  updateLocationFromBit( segment, "@Underground Castle West/Crystal", 0x7e1b14, 0x04)

  updateLocationFromBit( segment, "@Flying Bird/Sneak carefully...", 0x7e1b14, 0x08 ) -- 0x0B
  updateLocationFromBit( segment, "@Master Crystal/All 8 Emblems...", 0x7e1b14, 0x10 ) -- 0x0C
  updateLocationFromBit( segment, "@Woodstin Trio/Always right", 0x7e1b14, 0x20 ) -- 0x0D
  updateLocationFromBit( segment, "@Greenwood's Guardian/Guardian's item", 0x7e1b14, 0x40 ) -- 0x0E
  updateLocationFromBit( segment, "@Hole to Turbo's Remains/RIP Turbo", 0x7e1b14, 0x80 ) -- 0x0F
  updateLocationFromBit( segment, "@Monmo's Gift/Ribbon exchanged for...", 0x7e1b15, 0x01 ) -- 0x10
  updateLocationFromBit( segment, "@Right Squirrel Tree/Hungry Squirrel", 0x7e1b15, 0x02 ) -- 0x11
  updateLocationFromBit( segment, "@Right Squirrel Tree/Hungry Squirrel's Roommate", 0x7e1b15, 0x04 ) -- 0x12
  updateLocationFromBit( segment, "@Water Shrine/B2 Side-Room Secret Tile", 0x7e1b15, 0x08 ) -- 0x13
  updateLocationFromBit( segment, "@Fire Shrine/B2 Heated Path Crystal", 0x7e1b15, 0x10 ) -- 0x14
  updateLocationFromBit( segment, "@Light Shrine/Lostside Marsh: Crystal Near Light Shrine", 0x7e1b15, 0x20 ) -- 0x15
  updateLocationFromBit( segment, "@Water Shrine/B1 Moving Spike Trap Crystal", 0x7e1b15, 0x40 ) -- 0x16
  updateLocationFromBit( segment, "@Fire Shrine/1F Metal Enemies Crystal", 0x7e1b15, 0x80 ) -- 0x17

  updateLocationFromBit( segment, "@Mermaid in Northeast House/Lonely Mermaid", 0x7e1b19, 0x08 ) -- 0x33
  updateLocationFromBit( segment, "@Main Mermaid/Thanks for the house", 0x7e1b19, 0x10 ) -- 0x34
  updateLocationFromBit( segment, "@Mermaid in Common House Hidden Room/How'd you find me?", 0x7e1b19, 0x20 ) -- 0x35
  updateLocationFromBit( segment, "@Mermaid Queen/To the next act!", 0x7e1b19, 0x40 ) -- 0x36
  updateLocationFromBit( segment, "@Mermaid with Gift/Mermaid with Gift", 0x7e1b19, 0x80 ) -- 0x37
  updateLocationFromBit( segment, "@Lue the Dolphin/Prison Break!", 0x7e1b1a, 0x01 ) -- 0x38
  updateLocationFromBit( segment, "@Rockbird/North-Western Island Jewel Fairy", 0x7e1b1a, 0x02 ) -- 0x39
  updateLocationFromBit( segment, "@Blester/Seabed North, Jewel Fairy South of the Current", 0x7e1b1a, 0x04 ) -- 0x3A
  updateLocationFromBit( segment, "@Durean/Jewel Fairy Near Durean", 0x7e1b1a, 0x08 ) -- 0x3B

  
end

ScriptHost:AddMemoryWatch( "Soul Blazer Archipelago Misc Rewards", 0x7e1b13, 8, updateArchipelagoMiscRewardsFromMemorySegment )

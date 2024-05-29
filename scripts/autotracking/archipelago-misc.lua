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
  updateLocationFromBit( segment, "@Underground Castle West/Crystal on Ledge", 0x7e1b14, 0x04 ) -- 0x0A

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
  updateLocationFromBit( segment, "@Rockbird/North-Western Island Crystal", 0x7e1b1a, 0x02 ) -- 0x39
  updateLocationFromBit( segment, "@Blester/Seabed North-East, Crystal South of the Current", 0x7e1b1a, 0x04 ) -- 0x3A
  updateLocationFromBit( segment, "@Durean/Crystal Near Durean", 0x7e1b1a, 0x08 ) -- 0x3B

  updateLocationFromBit( segment, "@Mountain King/DANCING GRANDMAS!", 0x7e1b16, 0x01 ) -- 0x18
  updateLocationFromBit( segment, "@Boy with Gift/Hope this helps!", 0x7e1b16, 0x02 ) -- 0x19
  updateLocationFromBit( segment, "@Nome the Snail/Free the snail!", 0x7e1b16, 0x04 ) -- 0x1A
  updateLocationFromBit( segment, "@Secret Snail/Fake Northern Wall", 0x7e1b16, 0x08 ) -- 0x1B
  updateLocationFromBit( segment, "@Lune/Dream Tile", 0x7e1b16, 0x10 ) -- 0x1C
  updateLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/Cave, Entrance Shortcut Crystal", 0x7e1b16, 0x20 ) -- 0x1D
  updateLocationFromBit( segment, "@Lune/Passage, Center of the River Crystal", 0x7e1b16, 0x40 ) -- 0x1E

  updateLocationFromBit( segment, "@Chest of Drawers/Push the Drawers", 0x7e1b16, 0x80 ) -- 0x1F
  updateLocationFromBit( segment, "@Chest of Drawers/Open the Drawers", 0x7e1b17, 0x01 ) -- 0x20
  updateLocationFromBit( segment, "@Dancing Plant/Dance, plant, dance!", 0x7e1b17, 0x02 ) -- 0x21
  updateLocationFromBit( segment, "@Sleepy Cat/Where's the fish...ZZZZZZ", 0x7e1b17, 0x04 ) -- 0x22
  updateLocationFromBit( segment, "@Dancing Plant (2nd Floor)/Dance, plant, dance!", 0x7e1b17, 0x08 ) -- 0x23
  updateLocationFromBit( segment, "@Attic/Chest of Drawers", 0x7e1b17, 0x10 ) -- 0x24
  updateLocationFromBit( segment, "@Attic/Marie the Doll", 0x7e1b17, 0x20 ) -- 0x25
  updateLocationFromBit( segment, "@Mouse's Reward/Mouse in Hallway", 0x7e1b17, 0x40 ) -- 0x26
  updateLocationFromBit( segment, "@Factory/B2 South-West Crystal", 0x7e1b17, 0x80 ) -- 0x27
  updateLocationFromBit( segment, "@Left Model Town/North-East Crystal", 0x7e1b18, 0x01 ) -- 0x28
  updateLocationFromBit( segment, "@Power Plant/Crystal", 0x7e1b18, 0x02 ) -- 0x29

  updateLocationFromBit( segment, "@Sleepy Soldier/Wake up please", 0x7e1b18, 0x04 ) -- 0x2A
  updateLocationFromBit( segment, "@The Queen/RIP the Queen (post Leo's Death)", 0x7e1b18, 0x08 ) -- 0x2B
  updateLocationFromBit( segment, "@The Queen/Meet the Queen (never major)", 0x7e1b18, 0x10 ) -- 0x2C
  updateLocationFromBit( segment, "@Concert Hall/Nice music. Go to where the soldier stood.", 0x7e1b18, 0x20 ) -- 0x2D
  updateLocationFromBit( segment, "@Maid at the Bar/Recharging", 0x7e1b18, 0x40 ) -- 0x2E
  updateLocationFromBit( segment, "@Item on the Grounds/Please be a good one", 0x7e1b18, 0x80 ) -- 0x2F
  updateLocationFromBit( segment, "@King Magridd/Long live...", 0x7e1b19, 0x01 ) -- 0x30
  updateToggleItemFromBit( segment, "ripleo", 0x7e1b19, 0x02 ) -- 0x31
  updateLocationFromBit( segment, "@Magridd Dungeon/B1 Skeleton next to North-East Chest", 0x7e1b19, 0x04 ) -- 0x32

end

ScriptHost:AddMemoryWatch( "Soul Blazer Archipelago Misc Rewards", 0x7e1b13, 8, updateArchipelagoMiscRewardsFromMemorySegment )

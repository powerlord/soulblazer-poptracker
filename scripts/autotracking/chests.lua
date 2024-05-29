function UpdateChestsFromMemorySegment( segment )
    -- check if we're in the game.
  if not isInGame() then
    return false
  end

  InvalidateReadCaches()

  updateLocationFromBit( segment, "@Trial Room/Trial Room Chest", 0x7e1a7e, 0x01) -- 0x00
  updateLocationFromBit( segment, "@Underground Castle West/Triangle Torch Chest", 0x7e1a7e, 0x02 ) -- 0x01
  updateLocationFromBit( segment, "@Underground Castle West/Triangle Pillar Chest", 0x7e1a7e, 0x04 ) -- 0x02
  updateLocationFromBit( segment, "@Underground Castle West/North-East Island Chest", 0x7e1a7e, 0x08 ) -- 0x03
  updateLocationFromBit( segment, "@Underground Castle East/Dream Gate Chest", 0x7e1a7e, 0x10 ) -- 0x04
  updateLocationFromMultipleBits( segment, "@Chest Cave/Chests", {[0x7e1a7e] = {0x20, 0x40}} ) -- 0x05 and 0x06
  updateLocationFromBit( segment, "@Leo's Painting/Room 2 Chest", 0x7e1a7f, 0x02 ) -- 0x09
  updateLocationFromBit( segment, "@Leo's Painting/Room 2 Metal Enemies Chest", 0x7e1a7f, 0x04 ) -- 0x0A

  updateLocationFromBit( segment, "@Water Shrine/1F Chest Near Exit", 0x7e1a7f, 0x08 ) -- 0x0B
  updateLocationFromBit( segment, "@Sleepy Stump Chest/I believe I can fly...", 0x7e1a7f, 0x10 ) -- 0x0C
  updateLocationFromBit( segment, "@Mole Outside/Guide them home", 0x7e1a7f, 0x20 ) -- 0x0D
  updateLocationFromBit( segment, "@Water Shrine/B1 Behind the Waterfall Chest", 0x7e1a7f, 0x40 ) -- 0x0E
  updateLocationFromBit( segment, "@Water Shrine/B1 Moving Spike Trap Chest", 0x7e1a7f, 0x80 ) -- 0x0F
  updateLocationFromBit( segment, "@Water Shrine/B2 South-West Chest", 0x7e1a80, 0x01 ) -- 0x10
  updateLocationFromBit( segment, "@Water Shrine/B2 South-East Chest", 0x7e1a80, 0x02 ) -- 0x11
  updateLocationFromBit( segment, "@Fire Shrine/1F Second Bridge from the Left", 0x7e1a80, 0x04 ) -- 0x12
  updateLocationFromBit( segment, "@Fire Shrine/B1 Metal Enemies", 0x7e1a80, 0x08 ) -- 0x13
  updateLocationFromBit( segment, "@Fire Shrine/B1 Near the Stairs", 0x7e1a80, 0x10 ) -- 0x14
  updateLocationFromBit( segment, "@Fire Shrine/B2 Triple Scorpion Chest", 0x7e1a80, 0x20 ) -- 0x15
  updateLocationFromBit( segment, "@Fire Shrine/B2 Chest Near Exit", 0x7e1a80, 0x40 ) -- 0x16
  updateLocationFromBit( segment, "@Light Shrine/1st Floor Spirit Enemies Chest", 0x7e1a86, 0x04 ) -- 0x42

  updateLocationFromBit( segment, "@Secret Chest/Secret Chest", 0x7e1a80, 0x80 ) -- 0x17
  updateLocationFromBit( segment, "@Southwest Dolphin/Ride the nose", 0x7e1a81, 0x01 ) -- 0x18
  updateLocationFromMultipleBits( segment, "@Ghost Ship/Secret Cove", {[0x7e1a81] = {0x02, 0x04, 0x08, 0x10}} ) -- 0x19, 0x1A, 0x1B, 0x1C
  updateLocationFromBit( segment, "@Front of Southerta/Tree Maze Chest", 0x7e1a81, 0x20 ) -- 0x1D
  updateLocationFromBit( segment, "@Rockbird/East Lakes Upper Chest", 0x7e1a81, 0x40 ) -- 0x1E
  updateLocationFromBit( segment, "@Rockbird/East Lakes Lower Chest", 0x7e1a81, 0x80 ) -- 0x1F
  updateLocationFromBit( segment, "@Durean/East, Lava River Chest", 0x7e1a82, 0x01 ) -- 0x20
  updateLocationFromBit( segment, "@Durean/East Island Chest", 0x7e1a82, 0x02 ) -- 0x21
  updateLocationFromBit( segment, "@Ghost Ship/Ghost Ship Chest", 0x7e1a82, 0x04 ) -- 0x22
  updateLocationFromBit( segment, "@Ghost Ship/Seabed North-West, South-East Cove", 0x7e1a82, 0x08 ) -- 0x23

  updateLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/South, Down the Slide", 0x7e1a82, 0x10 ) -- 0x24
  updateLocationFromMultipleBits( segment, "@Laynole Mountain (without Mushroom Shoes)/North, Buried Treasure", {[0x7e1a82] = {0x20, 0x40, 0x80}, [0x7e1a83] = {0x01}} ) -- 0x25, 0x26, 0x27, 0x28
  updateLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Laynole, North Invisible Bridge", 0x7e1a83, 0x02 ) -- 0x29
  updateLocationFromBit( segment, "@Lune/Laynole, Past the Invisible Bridge", 0x7e1a83, 0x04 ) -- 0x2A
  updateLocationFromBit( segment, "@Lune/Laynole, Past the Second Invisible Bridge", 0x7e1a86, 0x02 ) -- 0x41

  updateLocationFromBit( segment, "@Free Chest/No strings attached", 0x7e1a85, 0x80 ) -- 0x3F
  updateLocationFromBit( segment, "@Power Plant/Chest Near Start", 0x7e1a83, 0x08 ) -- 0x2B
  updateLocationFromBit( segment, "@Left Model Town/House Maze Chest", 0x7e1a83, 0x10 ) -- 0x2C
  updateLocationFromMultipleBits( segment, "@Left Model Town/North Hidden Enemies Chests", {[0x7e1a83] = {0x20, 0x40}} )
  --updateLocationFromBit( segment, "@Left Model Town/North-West Chest", 0x7e1a83, 0x20 ) -- 0x2D
  --updateLocationFromBit( segment, "@Left Model Town/North-East Chest", 0x7e1a83, 0x40 ) -- 0x2E
  updateLocationFromMultipleBits( segment, "@Right Model Town/Center, Chests hidden among the houses", {[0x7e1a83] = {0x80}, [0x7e1a84] = {0x01}} ) -- 0x2F, 0x30
  --updateLocationFromBit( segment, "@Right Model Town/North Chest", 0x7e1a83, 0x80 ) -- 0x2F
  --updateLocationFromBit( segment, "@Right Model Town/South Chest", 0x7e1a84, 0x01 ) -- 0x30

  updateLocationFromBit( segment, "@Magridd Dungeon/B1 West Chest", 0x7e1a84, 0x02 ) --0x31
  updateLocationFromBit( segment, "@Magridd Dungeon/B1 North-East Corner Chest", 0x7e1a86, 0x01 ) --0x40
  updateLocationFromBit( segment, "@Magridd Dungeon/B2 Hidden Chest in North Room South-West Corner", 0x7e1a84, 0x04 ) --0x32
  updateLocationFromBit( segment, "@Magridd Dungeon/B2 Hidden Chest North-East of B3 stairs", 0x7e1a84, 0x08 ) --0x33
  updateLocationFromBit( segment, "@Magridd Dungeon/B2 Hidden Chest at Fake Dead End", 0x7e1a86, 0x08 ) --0x43
  updateLocationFromBit( segment, "@Magridd Dungeon/B3 Hidden Chest, North-West Corner", 0x7e1a84, 0x10 ) --0x34
  updateLocationFromMultipleBits( segment, "@Right Tower/2F East Chests", {[0x7e1a85] = {0x20, 0x40}} ) -- 0x3D, 0x3E
  --updateLocationFromBit( segment, "@Right Tower/2F Left Chest", 0x7e1a85, 0x20 ) --0x3D
  --updateLocationFromBit( segment, "@Right Tower/2F Right Chest", 0x7e1a85, 0x40 ) --0x3E
  updateLocationFromMultipleBits( segment, "@Right Tower/3F South-West Chests" , {[0x7e1a84] = {0x20, 0x40}} ) -- 0x35, 0x36
  --updateLocationFromBit( segment, "@Right Tower/3F North-West Chest", 0x7e1a84, 0x20 ) --0x35
  --updateLocationFromBit( segment, "@Right Tower/3F South-East Chest", 0x7e1a84, 0x40 ) --0x36

  updateLocationFromBit( segment, "@World of Evil/South, South-East Chest/Clear the South-East Lair first", 0x7e1a84, 0x80 ) --0x37
  updateLocationFromBit( segment, "@World of Evil/South, South-West Chest/Clear the South-West Lair first", 0x7e1a85, 0x01 ) --0x38
  updateLocationFromBit( segment, "@World of Evil/West Warp Chest/Warp unlocked by a nearby lair", 0x7e1a85, 0x02 ) --0x39
  updateLocationFromBit( segment, "@World of Evil/Middle, Past the Exit/Dodge the spinning rectangles", 0x7e1a85, 0x04 ) --0x3A
  updateLocationFromBit( segment, "@World of Evil/Dazzling Space, Left of Entrance/This one is easy...", 0x7e1a85, 0x08 ) --0x3B
  updateLocationFromBit( segment, "@World of Evil/Dazzling Space, Through the Rectangles/This one is less easy", 0x7e1a85, 0x10 ) --0x3C


end

ScriptHost:AddMemoryWatch( "Soul Blazer Chests", 0x7e1a7e, 64, UpdateChestsFromMemorySegment )

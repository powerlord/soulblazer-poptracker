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
  updateLocationFromBit( segment, "@Southerta/Herb Chest", 0x7e1a81, 0x20 ) -- 0x1D
  updateLocationFromBit( segment, "@Rockbird/Herb Chest", 0x7e1a81, 0x40 ) -- 0x1E
  updateLocationFromBit( segment, "@Rockbird/60 Gem Chest", 0x7e1a81, 0x80 ) -- 0x1F
  updateLocationFromBit( segment, "@Durean/Critical Sword Chest", 0x7e1a82, 0x01 ) -- 0x20
  updateLocationFromBit( segment, "@Durean/Strange Bottle Chest", 0x7e1a82, 0x02 ) -- 0x21
  updateLocationFromBit( segment, "@Ghost Ship/Ghost Ship Chest", 0x7e1a82, 0x04 ) -- 0x22
  updateLocationFromBit( segment, "@Ghost Ship/Seabed Power Bracelet Chest", 0x7e1a82, 0x08 ) -- 0x23

end

ScriptHost:AddMemoryWatch( "Soul Blazer Chests", 0x7e1a7e, 64, UpdateChestsFromMemorySegment )

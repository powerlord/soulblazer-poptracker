function updateLairsFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() then
    return false
  end

  InvalidateReadCaches()

  updateLocationFromBit( segment, "@Underground Castle West/Lair East of Entrance", LairAddressLookup( 0x002 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle West/West Bridge Lair", LairAddressLookup( 0x006 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle West/Lair North of Triangle Torch Chest", LairAddressLookup( 0x007 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle West/North-East Lair", LairAddressLookup( 0x008 ), 0x80 )
  updateLocationFromBit( segment, "@Leo's Painting/Boss: Solid Arm", LairAddressLookup( 0x009 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle West/Plant Cage", LairAddressLookup( 0x00d ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle West/South-East Island Lair", LairAddressLookup( 0x00e ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle East/Entrance" , LairAddressLookup( 0x00f ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle East/Southern U" , LairAddressLookup( 0x010 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle East/Northern U" , LairAddressLookup( 0x011 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle East/Stone Garden" , LairAddressLookup( 0x012 ), 0x80 )
  updateLocationFromBit( segment, "@Leo's Painting/Room 2 North of Entrance" , LairAddressLookup( 0x013 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle East/4 Lair Gauntlet" , LairAddressLookup( 0x015 ), 0x80 )
  updateLocationFromMultipleBits( segment, "@Underground Castle East/Conveyor Dead End" , { [LairAddressLookup( 0x016 )] = {0x80}; [LairAddressLookup( 0x02a )] = {0x80} } )
  updateLocationFromBit( segment, "@Underground Castle East/Narrow Bridge" , LairAddressLookup( 0x018 ), 0x80 )
  updateLocationFromBit( segment, "@Underground Castle East/Near Jewel Fairy" , LairAddressLookup( 0x01a ), 0x80 )
  updateLocationFromBit( segment, "@Leo's Painting/Room 1 Exit" , LairAddressLookup( 0x01d ), 0x80 ) -- LONELY_GOAT
  updateLocationFromBit( segment, "@Leo's Painting/Room 3 North-East Birds" , LairAddressLookup( 0x022 ), 0x80 ) -- TULIP_PASS
  updateLocationFromBit( segment, "@Leo's Painting/Room 3 South-East Blocks" , LairAddressLookup( 0x023 ), 0x80 ) -- BOY_CABIN
  updateLocationFromBit( segment, "@Leo's Painting/Room 4 Torch Guards" , LairAddressLookup( 0x025 ), 0x80 ) -- BOY_CAVE
  updateLocationFromBit( segment, "@Underground Castle East/Beyond Dream Gate" , LairAddressLookup( 0x028 ), 0x80 ) -- OLD_MAN
  updateLocationFromBit( segment, "@Underground Castle West/Above the Elevator" , LairAddressLookup( 0x029 ), 0x80 ) -- OLD_MAN2
  updateLocationFromBit( segment, "@Leo's Painting/Room 3 Metal Enemies" , LairAddressLookup( 0x02b ), 0x80 ) -- IVY_EMBLEM_A
  updateLocationFromBit( segment, "@Leo's Painting/Room 4 Metal Enemies" , LairAddressLookup( 0x02c ), 0x80 ) -- IVY_RECOVERY_SWORD
  updateLocationFromBit( segment, "@Leo's Painting/Room 1 Entrance" , LairAddressLookup( 0x02e ), 0x80 ) -- TULIP4
  updateLocationFromBit( segment, "@Leo's Painting/Room 3 Entrance" , LairAddressLookup( 0x02f ), 0x80 ) -- GOAT2

  updateLocationFromBit( segment, "@Light Shrine/Basement Spirit Lair", LairAddressLookup( 0x037 ), 0x80 ) -- BIRD_RED_HOT_MIRROR
  updateLocationFromBit( segment, "@Water Shrine/Lostside Marsh: Entrance", LairAddressLookup( 0x038 ), 0x80 ) -- BIRD
  updateLocationFromBit( segment, "@Water Shrine/Lostside Marsh: Island West of Water Shrine", LairAddressLookup( 0x03c ), 0x80 ) -- DOG
  updateLocationFromBit( segment, "@Fire Shrine/Lostside Marsh: North of Water Shrine", LairAddressLookup( 0x03d ), 0x80 ) -- DOG2
  updateLocationFromBit( segment, "@Light Shrine/Lostside Marsh: East of Fire Shrine", LairAddressLookup( 0x03f ), 0x80 ) -- DOG3
  updateLocationFromBit( segment, "@Light Shrine/Lostside Marsh: South-West of Light Shrine", LairAddressLookup( 0x040 ), 0x80 ) -- MOLE_SHIELD_BRACELET
  updateLocationFromBit( segment, "@Light Shrine/1F North Lair", LairAddressLookup( 0x041 ), 0x80 ) -- SQUIRREL_EMBLEM_C
  updateLocationFromBit( segment, "@Water Shrine/1F Center Island", LairAddressLookup( 0x043 ), 0x80 ) -- SQUIRREL_PSYCHO_SWORD
  updateLocationFromBit( segment, "@Water Shrine/B1 Pillars Near Waterfalls", LairAddressLookup( 0x046 ), 0x80 ) -- BIRD2
  updateLocationFromBit( segment, "@Water Shrine/B1 Moving Spike Trap Lair", LairAddressLookup( 0x049 ), 0x80 ) -- MOLE_SOUL_OF_LIGHT
  updateLocationFromBit( segment, "@Water Shrine/B2 to 1F Connector", LairAddressLookup( 0x04a ), 0x80 ) -- DEER
  updateLocationFromBit( segment, "@Water Shrine/B2 West Side-Room", LairAddressLookup( 0x04e ), 0x80 ) -- CROCODILE
  updateLocationFromBit( segment, "@Water Shrine/B2 North Hallway", LairAddressLookup( 0x04f ), 0x80 ) -- SQUIRREL
  updateLocationFromBit( segment, "@Light Shrine/Boss: Elemental Statues", LairAddressLookup( 0x050 ), 0x80 ) -- GREENWOODS_GUARDIAN
  updateLocationFromBit( segment, "@Water Shrine/B2 Statue Room", LairAddressLookup( 0x051 ), 0x80 ) -- MOLE
  updateLocationFromBit( segment, "@Fire Shrine/1F Eastmost Lair", LairAddressLookup( 0x056 ), 0x80 ) -- DOG4
  updateLocationFromBit( segment, "@Fire Shrine/B1 North-West Lair", LairAddressLookup( 0x058 ), 0x80 ) -- SQUIRREL_ICE_ARMOR
  updateLocationFromBit( segment, "@Fire Shrine/B1 Isolated Room", LairAddressLookup( 0x059 ), 0x80 ) -- SQUIRREL2
  updateLocationFromBit( segment, "@Fire Shrine/B1 South-East Lair", LairAddressLookup( 0x05a ), 0x80 ) -- DOG5
  updateLocationFromBit( segment, "@Fire Shrine/B1 South Lair", LairAddressLookup( 0x05b ), 0x80 ) -- CROCODILE2
  updateLocationFromBit( segment, "@Fire Shrine/B2 West of Stairs", LairAddressLookup( 0x05c ), 0x80 ) -- MOLE2
  updateLocationFromBit( segment, "@Fire Shrine/B2 Past First Heated Path", LairAddressLookup( 0x05d ), 0x80 ) -- SQUIRREL3
  updateLocationFromBit( segment, "@Fire Shrine/B2 Heated Circle", LairAddressLookup( 0x061 ), 0x80 ) -- BIRD_GREENWOOD_LEAF
  updateLocationFromBit( segment, "@Fire Shrine/B2 Snaking Path Center", LairAddressLookup( 0x062 ), 0x80 ) -- MOLE3
  updateLocationFromBit( segment, "@Fire Shrine/B2 Snaking Path Bridge", LairAddressLookup( 0x063 ), 0x80 ) -- DEER_MAGIC_BELL
  updateLocationFromBit( segment, "@Fire Shrine/B2 Metal Enemies", LairAddressLookup( 0x064 ), 0x80 ) -- BIRD3
  updateLocationFromBit( segment, "@Light Shrine/Basement East Lair", LairAddressLookup( 0x06f ), 0x80 ) -- CROCODILE3
  updateLocationFromBit( segment, "@Light Shrine/Basement Lair Near Portal", LairAddressLookup( 0x072), 0x80 ) -- MONMO

end

ScriptHost:AddMemoryWatch( "Soul Blazer Lairs", 0x7f0203, 512, updateLairsFromMemorySegment )

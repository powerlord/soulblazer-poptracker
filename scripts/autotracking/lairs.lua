-- The following two functions exist to reduce the amount of repeated code for lairs
local function updateLairLocationFromBit( segment, code, lair_id )
  local lair_address = LairAddressLookup( lair_id )
  updateLocationFromBit( segment, code, lair_address, 0x80 )
end

local function updateLairLocationFromMultipleBits( segment, code, lair_ids )
  local lair_addresses = {}
  for _, lair_id in ipairs( lair_ids ) do
    lair_addresses[LairAddressLookup( lair_id )] = {0x80}
  end
  updateLocationFromMultipleBits( segment, code, lair_addresses )
end

function updateLairsFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() then
    return false
  end

  InvalidateReadCaches()

  updateLairLocationFromBit( segment, "@Underground Castle West/Lair East of Entrance", 0x002 )
  updateLairLocationFromBit( segment, "@Underground Castle West/West Bridge Lair", 0x006 )
  updateLairLocationFromBit( segment, "@Underground Castle West/Lair North of Triangle Torch Chest", 0x007 )
  updateLairLocationFromBit( segment, "@Underground Castle West/North-East Lair", 0x008 )
  updateLairLocationFromBit( segment, "@Leo's Painting/Boss: Solid Arm", 0x009 )
  updateLairLocationFromBit( segment, "@Underground Castle West/Plant Cage", 0x00d )
  updateLairLocationFromBit( segment, "@Underground Castle West/South-East Island Lair", 0x00e )
  updateLairLocationFromBit( segment, "@Underground Castle East/Entrance" , 0x00f )
  updateLairLocationFromBit( segment, "@Underground Castle East/Southern U" , 0x010 )
  updateLairLocationFromBit( segment, "@Underground Castle East/Northern U" , 0x011 )
  updateLairLocationFromBit( segment, "@Underground Castle East/Stone Garden" , 0x012 )
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 2 North of Entrance" , 0x013 )
  updateLairLocationFromBit( segment, "@Underground Castle East/4 Lair Gauntlet" , 0x015 )
  updateLairLocationFromMultipleBits( segment, "@Underground Castle East/Conveyor Dead End" , {0x016, 0x02a} )
  updateLairLocationFromBit( segment, "@Underground Castle East/Narrow Bridge" , 0x018 )
  updateLairLocationFromBit( segment, "@Underground Castle East/Near Jewel Fairy" , 0x01a )
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 1 Exit" , 0x01d ) -- LONELY_GOAT
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 3 North-East Birds" , 0x022 ) -- TULIP_PASS
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 3 South-East Blocks" , 0x023 ) -- BOY_CABIN
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 4 Torch Guards" , 0x025 ) -- BOY_CAVE
  updateLairLocationFromBit( segment, "@Underground Castle East/Beyond Dream Gate" , 0x028 ) -- OLD_MAN
  updateLairLocationFromBit( segment, "@Underground Castle West/Above the Elevator" , 0x029 ) -- OLD_MAN2
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 3 Metal Enemies" , 0x02b ) -- IVY_EMBLEM_A
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 4 Metal Enemies" , 0x02c ) -- IVY_RECOVERY_SWORD
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 1 Entrance" , 0x02e ) -- TULIP4
  updateLairLocationFromBit( segment, "@Leo's Painting/Room 3 Entrance" , 0x02f ) -- GOAT2

  updateLairLocationFromBit( segment, "@Light Shrine/Basement Spirit Lair", 0x037 ) -- BIRD_RED_HOT_MIRROR
  updateLairLocationFromBit( segment, "@Water Shrine/Lostside Marsh: Entrance", 0x038 ) -- BIRD
  updateLairLocationFromBit( segment, "@Water Shrine/Lostside Marsh: Island West of Water Shrine", 0x03c ) -- DOG
  updateLairLocationFromBit( segment, "@Fire Shrine/Lostside Marsh: North of Water Shrine", 0x03d ) -- DOG2
  updateLairLocationFromBit( segment, "@Light Shrine/Lostside Marsh: East of Fire Shrine", 0x03f ) -- DOG3
  updateLairLocationFromBit( segment, "@Light Shrine/Lostside Marsh: South-West of Light Shrine", 0x040 ) -- MOLE_SHIELD_BRACELET
  updateLairLocationFromBit( segment, "@Light Shrine/1F North Lair", 0x041 ) -- SQUIRREL_EMBLEM_C
  updateLairLocationFromBit( segment, "@Water Shrine/1F Center Island", 0x043 ) -- SQUIRREL_PSYCHO_SWORD
  updateLairLocationFromBit( segment, "@Water Shrine/B1 Pillars Near Waterfalls", 0x046 ) -- BIRD2
  updateLairLocationFromBit( segment, "@Water Shrine/B1 Moving Spike Trap Lair", 0x049 ) -- MOLE_SOUL_OF_LIGHT
  updateLairLocationFromBit( segment, "@Water Shrine/B2 to 1F Connector", 0x04a ) -- DEER
  updateLairLocationFromBit( segment, "@Water Shrine/B2 West Side-Room", 0x04e ) -- CROCODILE
  updateLairLocationFromBit( segment, "@Water Shrine/B2 North Hallway", 0x04f ) -- SQUIRREL
  updateLairLocationFromBit( segment, "@Light Shrine/Boss: Elemental Statues", 0x050 ) -- GREENWOODS_GUARDIAN
  updateLairLocationFromBit( segment, "@Water Shrine/B2 Statue Room", 0x051 ) -- MOLE
  updateLairLocationFromBit( segment, "@Fire Shrine/1F Eastmost Lair", 0x056 ) -- DOG4
  updateLairLocationFromBit( segment, "@Fire Shrine/B1 North-West Lair", 0x058 ) -- SQUIRREL_ICE_ARMOR
  updateLairLocationFromBit( segment, "@Fire Shrine/B1 Isolated Room", 0x059 ) -- SQUIRREL2
  updateLairLocationFromBit( segment, "@Fire Shrine/B1 South-East Lair", 0x05a ) -- DOG5
  updateLairLocationFromBit( segment, "@Fire Shrine/B1 South Lair", 0x05b ) -- CROCODILE2
  updateLairLocationFromBit( segment, "@Fire Shrine/B2 West of Stairs", 0x05c ) -- MOLE2
  updateLairLocationFromBit( segment, "@Fire Shrine/B2 Past First Heated Path", 0x05d ) -- SQUIRREL3
  updateLairLocationFromBit( segment, "@Fire Shrine/B2 Heated Circle", 0x061 ) -- BIRD_GREENWOOD_LEAF
  updateLairLocationFromBit( segment, "@Fire Shrine/B2 Snaking Path Center", 0x062 ) -- MOLE3
  updateLairLocationFromBit( segment, "@Fire Shrine/B2 Snaking Path Bridge", 0x063 ) -- DEER_MAGIC_BELL
  updateLairLocationFromBit( segment, "@Fire Shrine/B2 Metal Enemies", 0x064 ) -- BIRD3
  updateLairLocationFromBit( segment, "@Light Shrine/Basement East Lair", 0x06f ) -- CROCODILE3
  updateLairLocationFromBit( segment, "@Light Shrine/Basement Lair Near Portal", 0x072) -- MONMO

  updateLairLocationFromBit( segment, "@Ghost Ship/Seabed North-West, Seaweed Maze East", 0x07c ) -- DOLPHIN
  updateLairLocationFromBit( segment, "@Blester/Seabed North-East, South of the Current", 0x083 ) -- ANGELFISH
  updateLairLocationFromBit( segment, "@Blester/Seabed North-East, West Nook", 0x084 ) -- MERMAID
  updateLairLocationFromBit( segment, "@Blester/Seabed North-East, Out in the Open", 0x086 ) -- ANGELFISH2
  updateLairLocationFromBit( segment, "@Durean/Western Penninsula", 0x08a ) -- MERMAID_PEARL
  updateLairLocationFromBit( segment, "@Durean/North, Lowest Level", 0x08b ) -- MERMAID2
  updateLairLocationFromBit( segment, "@Durean/North, Middle Level", 0x08c ) -- DOLPHIN_SAVES_LUE
  updateLairLocationFromBit( segment, "@Durean/North, Upper Level Lava Pool", 0x08d ) -- MERMAID_STATUE_BLESTER
  updateLairLocationFromBit( segment, "@Durean/Metal Gorillas", 0x08e ) -- MERMAID_RED_HOT_STICK
  updateLairLocationFromBit( segment, "@Durean/West of Entrance", 0x08f ) -- LUE
  updateLairLocationFromBit( segment, "@Durean/North, Middle Level Lava Pool", 0x092 ) -- MERMAID3
  updateLairLocationFromBit( segment, "@Durean/North-East Island", 0x095 ) -- MERMAID_NANA
  updateLairLocationFromBit( segment, "@Front of Southerta/Tree Island", 0x099 ) -- MERMAID4
  updateLairLocationFromBit( segment, "@Front of Southerta/North of Warp", 0x09b ) -- DOLPHIN2
  updateLairLocationFromBit( segment, "@Back of Southerta/One lonely lair...", 0x09d ) -- MERMAID_STATUE_ROCKBIRD
  updateLairLocationFromBit( segment, "@Front of Southerta/Wasn't there a lake here?", 0x0a1 ) -- MERMAID_BUBBLE_ARMOR
  updateLairLocationFromMultipleBits( segment, "@Front of Southerta/Ambushed!", {0x0a4, 0x0a5} )
  --updateLairLocationFromBit( segment, "@Front of Southerta/Ambushed! North", 0x0a4 ) -- MERMAID5
  --updateLairLocationFromBit( segment, "@Front of Southerta/Ambushed! South", 0x0a5 ) -- MERMAID6
  updateLairLocationFromBit( segment, "@Rockbird/West Center Lake", 0x0a7 ) -- MERMAID_TEARS
  updateLairLocationFromBit( segment, "@Rockbird/Center Lake North-East", 0x0ab ) -- MERMAID_STATUE_DUREAN
  updateLairLocationFromBit( segment, "@Ghost Ship/Seabed North-West, Seaweed Maze South-West", 0x0ad ) -- ANGELFISH3
  updateLairLocationFromBit( segment, "@Rockbird/Center Lake South-West", 0x0b1 ) -- ANGELFISH_SOUL_OF_SHIELD
  updateLairLocationFromBit( segment, "@Rockbird/South-West Lake", 0x0b5 ) -- MERMAID_MAGIC_FLARE
  updateLairLocationFromBit( segment, "@Ghost Ship/Boss: Floating Skull", 0x0b6 ) -- MERMAID_QUEEN
  updateLairLocationFromBit( segment, "@Blester/Metal Gorillas", 0x0b9 ) -- MERMAID_STATUE_GHOST_SHIP
  updateLairLocationFromBit( segment, "@Blester/Western Pillars", 0x0bb ) -- DOLPHIN_SECRET_CAVE
  updateLairLocationFromBit( segment, "@Blester/East of the Entrance", 0x0bd ) -- MERMAID7
  updateLairLocationFromBit( segment, "@Blester/Farther East", 0x0be ) -- ANGELFISH4
  updateLairLocationFromBit( segment, "@Blester/Eastern Pillars", 0x0c0 ) -- MERMAID8
  updateLairLocationFromBit( segment, "@Durean/Seabed, Cliff", 0x0c1 ) -- DOLPHIN_PEARL
  updateLairLocationFromBit( segment, "@Rockbird/Seabed, South-East Corner", 0x0c2 ) -- MERMAID9

  updateLairLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/South, Middle Level", 0x0c9 ) -- GRANDPA
  updateLairLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/South, Mountain Base", 0x0ca ) -- GIRL
  updateLairLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/South, Up on the Ledge", 0x0cb ) -- MUSHROOM
  updateLairLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/North, Top of the Slide", 0x0cc ) -- BOY
  updateLairLocationFromMultipleBits( segment, "@Laynole Mountain (without Mushroom Shoes)/North, Path through the Snow", {0x0d3, 0x0d4} )
  updateLairLocationFromBit( segment, "@Lune/Passage, Under the Waterfall", 0x0d6 ) -- NOME
  updateLairLocationFromBit( segment, "@Lune/Passage, Between Two Cliffs", 0x0d7 ) -- BOY2
  updateLairLocationFromBit( segment, "@Lune/South-East Corner", 0x0dd ) -- MUSHROOM_EMBLEM_F
  updateLairLocationFromBit( segment, "@Lune/Cloackwise Gauntlet", 0x0e1 ) -- DANCING_GRANDMA
  updateLairLocationFromBit( segment, "@Lune/Counter-Clockwise Gauntlet", 0x0e6 ) -- DANCING_GRANDMA2
  updateLairLocationFromBit( segment, "@Lune/Dream Lair", 0x0e8 ) -- SNAIL_EMBLEM_E
  updateLairLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/Cave, ICE PHYSICS!!!!", 0x0e9 ) -- BOY_MUSHROOM_SHOES
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Cave, Middle of the Ice", 0x0ea ) -- GRANDMA
  updateLairLocationFromBit( segment, "@Laynole Mountain (without Mushroom Shoes)/Cave, Entrance", 0x0eb ) -- GIRL2
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Ice Hill, North-East Corner", 0x0ee ) -- MUSHROOM2
  updateLairLocationFromMultipleBits( segment, "@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Center Alcove", {0x0ef, 0x0f0} )
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Middle Icy Slide", 0x0f2 ) -- GIRL2
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Across the Wall", 0x0f6 ) -- MUSHROOM3
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Ice Hill, South-West Corner", 0x0f7 ) -- SNAIL
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Laynole, Amongst the Ice Flowers", 0x0f8 ) -- GRANDPA3
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Laynole, EVEN MORE ICE PHYSICS!!!!!", 0x0fa ) -- SNAIL2
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Laynole, MORE ICE PHYSICS!!!!", 0x0fc ) -- GRANDPA4
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Laynole, South-West Corner", 0x0fe ) -- GRANDPA_LUNE
  updateLairLocationFromBit( segment, "@Laynole Mountain (with Mushroom Shoes)/Laynole, South Invisible Bridge", 0x0ff ) -- GRANDPA5
  updateLairLocationFromBit( segment, "@Lune/Boss: Poseidon", 0x103 ) -- MOUNTAIN_KING

  updateLairLocationFromBit( segment, "@Factory/B1 North-West Platform", 0x109 ) -- PLANT_HERB
  updateLairLocationFromBit( segment, "@Factory/B1 South-West Blocked Pipe", 0x10b ) -- PLANT
  updateLairLocationFromBit( segment, "@Factory/B1 North-West Triple Pipe Platform", 0x10c ) -- CHEST_OF_DRAWERS_MYSTIC_ARMOR
  updateLairLocationFromBit( segment, "@Factory/B1 Platform North of Big Pipe", 0x10d ) -- CAT
  updateLairLocationFromBit( segment, "@Factory/B1 North then East from the Entrance", 0x112 ) -- GREAT_DOOR_ZANTETSU_SWORD
  updateLairLocationFromBit( segment, "@Factory/B1 South-East Platform off Small Pipes", 0x114 ) -- CAT2
  updateLairLocationFromMultipleBits( segment, "@Factory/B1 South-East Small Pipe Gauntlet" , {0x11a, 0x11b} ) -- GREAT_DOOR, CAT3
  --updateLairLocationFromBit( segment, "@Factory/B1 Great Door", 0x11a ) -- GREAT_DOOR
  --updateLairLocationFromBit( segment, "@Factory/B1 Cat 3", 0x11b ) -- CAT3
  updateLairLocationFromBit( segment, "@Factory/B2 One Last Fire Pit...", 0x11e ) -- MODEL_TOWN1
  updateLairLocationFromBit( segment, "@Factory/B2 Inverted T Platform", 0x120 ) -- GREAT_DOOR_MODEL_TOWNS
  updateLairLocationFromBit( segment, "@Factory/B2 Past the Double Fire Pits", 0x122 ) -- STEPS_UPSTAIRS
  updateLairLocationFromBit( segment, "@Factory/B2 Second Flame Pit from the Left", 0x126 ) -- CAT_DOOR_KEY
  updateLairLocationFromBit( segment, "@Factory/B2 Inside the Big Pipe", 0x129 ) -- MOUSE
  updateLairLocationFromBit( segment, "@Power Plant/Boss: Tin Doll", 0x12f ) -- MARIE
  updateLairLocationFromBit( segment, "@Power Plant/South-East Gauntlet", 0x136 ) -- DOLL
  updateLairLocationFromBit( segment, "@Left Model Town/Western Outskirts", 0x137 ) -- CHEST_OF_DRAWERS
  updateLairLocationFromBit( segment, "@Left Model Town/West, Small Field", 0x139 ) -- PLANT2
  updateLairLocationFromBit( segment, "@Left Model Town/West, House on the Middle Hill", 0x13b ) -- MOUSE2
  updateLairLocationFromBit( segment, "@Left Model Town/West, House on the Left Hill", 0x13c ) -- MOUSE_SPARK_BOMB
  updateLairLocationFromBit( segment, "@Left Model Town/South-West near the River", 0x13e ) -- MOUSE3
  updateLairLocationFromBit( segment, "@Left Model Town/Center, West of River", 0x142 ) -- GREAT_DOOR_SOUL_OF_DETECTION
  updateLairLocationFromBit( segment, "@Left Model Town/House Maze Lair", 0x145 ) -- MODEL_TOWN2
  updateLairLocationFromMultipleBits( segment, "@Left Model Town/East, Hidden Enemies Lairs", {0x14a, 0x14b} ) -- MOUSE4, STEPS_MARIE
  --updateLairLocationFromBit( segment, "@Left Model Town/Mouse 4", 0x14a ) -- MOUSE4
  --updateLairLocationFromBit( segment, "@Left Model Town/Steps Marie", 0x14b ) -- STEPS_MARIE
  updateLairLocationFromBit( segment, "@Right Model Town/Shrinking Houses", 0x14c ) -- CHEST_OF_DRAWERS2
  updateLairLocationFromBit( segment, "@Right Model Town/North-West Purple Pools", 0x14d ) -- PLANT_ACTINIDIA_LEAVES
  updateLairLocationFromBit( segment, "@Right Model Town/South-West Fenced Lair", 0x152 ) -- MOUSE5
  updateLairLocationFromBit( segment, "@Right Model Town/North-East Tree-lined Path", 0x153 ) -- CAT4
  updateLairLocationFromBit( segment, "@Right Model Town/South-East Hidden Enemies", 0x155 ) -- STAIRS_POWER_PLANT

  updateLairLocationFromBit( segment, "@Magridd Dungeon/B1 North-West Corner", 0x159 ) -- SOLDIER
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B1 Lower Level Center", 0x15a ) -- SOLDIER2
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B2 Snake Crossing", 0x15f ) -- SOLDIER3
  updateLairLocationFromMultipleBits( segment, "@Magridd Dungeon/B2 Spirit Crossing", { 0x161, 0x162 } ) -- SOLDIER_ELEMENTAL_MAIL, SOLDIER4
  --updateLairLocationFromBit( segment, "@Magridd Dungeon/B2 Soldier Elemental Mail", 0x161 ) -- SOLDIER_ELEMENTAL_MAIL
  --updateLairLocationFromBit( segment, "@Magridd Dungeon/B2 Soldier 4", 0x162 ) -- SOLDIER4
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B2 Remove the Left Column North", 0x166 ) -- SOLDIER5
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B2 Remove the Left Column South", 0x167 ) -- SINGER_CONCERT_HALL
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B2 Remove the Right Column", 0x168 ) -- SOLDIER6
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B3 Dodge the 3 Spears", 0x16b ) -- MAID
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B3 Center, Right Lair", 0x16d ) -- SOLDIER_LEFT_TOWER
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B3 Center, Double Spears", 0x16e ) -- SOLDIER_DOK
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B3 East, Weren't there spikes here?", 0x170 ) -- SOLDIER_PLATINUM_CARD
  updateLairLocationFromBit( segment, "@Magridd Dungeon/B3 South-East, Spikes From Nowhere", 0x172 ) -- SINGER
  updateLairLocationFromBit( segment, "@Left Tower/1F North-East Corner", 0x179 ) -- SOLDIER_SOUL_OF_REALITY
  updateLairLocationFromBit( segment, "@Left Tower/2F North-West Room", 0x17e ) -- MAID2
  updateLairLocationFromBit( segment, "@Left Tower/2F South-East Room", 0x17f ) -- QUEEN_MAGRIDD
  updateLairLocationFromBit( segment, "@Left Tower/3F Cells, North-West", 0x181 ) -- SOLDIER_WITH_LEO
  updateLairLocationFromBit( segment, "@Left Tower/3F Cells, North-East", 0x182 ) -- SOLDIER_RIGHT_TOWER
  updateLairLocationFromBit( segment, "@Left Tower/3F Cells, South-West", 0x183 ) -- DR_LEO
  updateLairLocationFromBit( segment, "@Left Tower/3F South-East Corner", 0x185 ) -- SOLDIER7
  updateLairLocationFromBit( segment, "@Right Tower/1F North-West Corner", 0x186 ) -- SOLDIER9
  updateLairLocationFromBit( segment, "@Right Tower/1F South-East Corner", 0x187 ) -- MAID_HERB
  updateLairLocationFromBit( segment, "@Right Tower/1F Center Gauntlet", 0x18c ) -- SOLDIER_CASTLE
  updateLairLocationFromBit( segment, "@Right Tower/2F Hidden Lair in Center", 0x18d ) -- SOLDIER9
  updateLairLocationFromBit( segment, "@Right Tower/2F East, below Chests", 0x18f ) -- SOLDIER10
  updateLairLocationFromBit( segment, "@Right Tower/3F Between Fireball Shooters", 0x192 ) -- SOLDIER11
  updateLairLocationFromBit( segment, "@Right Tower/Boss: Demon Falcon", 0x195 ) -- KING_MAGRIDD

end

ScriptHost:AddMemoryWatch( "Soul Blazer Lairs", 0x7f0203, 512, updateLairsFromMemorySegment )

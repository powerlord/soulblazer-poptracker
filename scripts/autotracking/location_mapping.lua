-- use this file to map the AP location ids to your locations
-- to reference a location in Pop use @ in the beginning and then path to the section (more info: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#locations)
-- to reference an item use it's code
-- here are the SM locations as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/location_mapping.lua

-- Functions to turn Soul Blazer IDs into AP location IDs
AP_ID_OFFSET_NPC_REWARD = 500

local function apIdForChest(localId)
  return AP_BASE_ID + localId
end

local function apIdForNpcReward(localId)
  return AP_BASE_ID + AP_ID_OFFSET_NPC_REWARD + localId
end

local function apIdForLair(localId)
  return AP_BASE_ID + AP_ID_OFFSET_LAIR + localId
end

LOCATION_MAPPING = {
  [apIdForChest(0)] = {"@Trial Room/Trial Room Chest"}, -- 0x00
  [apIdForChest(1)] = {"@Chest Cave/Chests"}, -- 0x05
  [apIdForChest(2)] = {"@Chest Cave/Chests"}, -- 0x06
  [apIdForChest(3)] = {"@Underground Castle West/Triangle Torch Chest"}, -- 0x01
  [apIdForChest(4)] = {"@Underground Castle West/Triangle Pillar Chest"}, -- 0x02
  [apIdForChest(5)] = {"@Underground Castle West/North-East Island Chest"}, -- 0x03
  [apIdForChest(6)] = {"@Underground Castle East/South-West, Lisa's Chest"}, -- 0x04
  [apIdForChest(7)] = {"@Leo's Painting/Room 2 Chest"}, -- 0x09
  [apIdForChest(8)] = {"@Leo's Painting/Room 2 Metal Enemies Chest"}, -- 0x0A

  [apIdForChest(9)] = {"@Sleepy Stump Chest/In the garbage"}, -- 0x0C
  [apIdForChest(10)] = {"@Mole Outside/Guide them home"}, -- 0x0D
  [apIdForChest(11)] = {"@Water Shrine/1F Chest Near Exit"}, -- 0x0B
  [apIdForChest(12)] = {"@Water Shrine/B1 Behind the Waterfall Chest"}, -- 0x0E
  [apIdForChest(13)] = {"@Water Shrine/B1 Moving Spike Trap Chest"}, -- 0x0F
  [apIdForChest(14)] = {"@Water Shrine/B2 South-West Chest"}, -- 0x10
  [apIdForChest(15)] = {"@Water Shrine/B2 South-East Chest"}, -- 0x11
  [apIdForChest(16)] = {"@Fire Shrine/1F Second Bridge from the Left"}, -- 0x12
  [apIdForChest(17)] = {"@Fire Shrine/B1 Near the Stairs"}, -- 0x14
  [apIdForChest(18)] = {"@Fire Shrine/B1 Metal Enemies"}, -- 0x13
  [apIdForChest(19)] = {"@Fire Shrine/B2 Triple Scorpion Chest"}, -- 0x15
  [apIdForChest(20)] = {"@Fire Shrine/B2 Chest Near Exit"}, -- 0x16
  [apIdForChest(21)] = {"@Light Shrine/1st Floor Spirit Enemies Chest"}, -- 0x42

  [apIdForChest(22)] = {"@Secret Chest/Secret Chest"}, -- 0x17
  [apIdForChest(23)] = {"@Southwest Dolphin/Ride the nose"}, -- 0x18
  [apIdForChest(24)] = {"@Ghost Ship/Secret Cove"}, -- 0x19
  [apIdForChest(25)] = {"@Ghost Ship/Secret Cove"}, -- 0x1A
  [apIdForChest(26)] = {"@Ghost Ship/Secret Cove"}, -- 0x1B
  [apIdForChest(27)] = {"@Ghost Ship/Secret Cove"}, -- 0x1C
  [apIdForChest(28)] = {"@Front of Southerta/Tree Maze Chest"}, -- 0x1D
  [apIdForChest(29)] = {"@Rockbird/East Lakes Upper Chest"}, -- 0x1E
  [apIdForChest(30)] = {"@Rockbird/East Lakes Lower Chest"}, -- 0x1F
  [apIdForChest(31)] = {"@Durean/East, Lava River Chest"}, -- 0x20
  [apIdForChest(32)] = {"@Durean/East Island Chest"}, -- 0x21
  [apIdForChest(33)] = {"@Ghost Ship/Ghost Ship Chest"}, -- 0x22
  [apIdForChest(34)] = {"@Ghost Ship/Seabed North-West, South-East Cove"}, -- 0x23

  [apIdForChest(35)] = {"@Laynole Mountain (without Mushroom Shoes)/South, Down the Slide"}, -- 0x24
  [apIdForChest(36)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Buried Treasure"}, -- 0x25
  [apIdForChest(37)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Buried Treasure"}, -- 0x26
  [apIdForChest(38)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Buried Treasure"}, -- 0x27
  [apIdForChest(39)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Buried Treasure"}, -- 0x28
  [apIdForChest(40)] = {"@Laynole Mountain (with Mushroom Shoes)/Laynole, North Invisible Bridge"}, -- 0x29
  [apIdForChest(41)] = {"@Lune/Laynole, Past the Invisible Bridge"}, -- 0x2A
  [apIdForChest(42)] = {"@Lune/Laynole, Past the Second Invisible Bridge"}, -- 0x41

  [apIdForChest(43)] = {"@Free Chest/No strings attached"}, -- 0x3F
  [apIdForChest(44)] = {"@Power Plant/Chest Near Start"}, -- 0x2B
  [apIdForChest(45)] = {"@Left Model Town/House Maze Chest"}, -- 0x2C
  [apIdForChest(46)] = {"@Left Model Town/North Hidden Enemies Chests"}, -- 0x2D
  [apIdForChest(47)] = {"@Left Model Town/North Hidden Enemies Chests"}, -- 0x2E
  [apIdForChest(48)] = {"@Right Model Town/Center, Chests hidden among the houses"}, -- 0x2F
  [apIdForChest(49)] = {"@Right Model Town/Center, Chests hidden among the houses"}, -- 0x30

  [apIdForChest(50)] = {"@Magridd Dungeon/B1 West Chest"}, -- 0x31
  [apIdForChest(51)] = {"@Magridd Dungeon/B1 North-East Corner Chest"}, -- 0x40
  [apIdForChest(52)] = {"@Magridd Dungeon/B2 Hidden Chest in North Room South-West Corner"}, -- 0x32
  [apIdForChest(53)] = {"@Magridd Dungeon/B2 Hidden Chest North-East of B3 stairs"}, -- 0x33
  [apIdForChest(54)] = {"@Magridd Dungeon/B2 Hidden Chest at Fake Dead End"}, -- 0x43
  [apIdForChest(55)] = {"@Magridd Dungeon/B3 Hidden Chest, North-West Corner"}, -- 0x34
  [apIdForChest(56)] = {"@Right Tower/2F East Chests"}, -- 0x3D
  [apIdForChest(57)] = {"@Right Tower/2F East Chests"}, -- 0x3E
  [apIdForChest(58)] = {"@Right Tower/3F South-West Chests"}, -- 0x35
  [apIdForChest(59)] = {"@Right Tower/3F South-West Chests"}, -- 0x36

  [apIdForChest(60)] = {"@World of Evil/South, South-East Chest/Clear the South-East Lair first"}, --0x37
  [apIdForChest(61)] = {"@World of Evil/South, South-West Chest/Clear the South-West Lair first"}, --0x38
  [apIdForChest(62)] = {"@World of Evil/West Warp Chest/Warp unlocked by a nearby lair"}, --0x39
  [apIdForChest(63)] = {"@World of Evil/Middle, Past the Exit/Dodge the spinning rectangles"}, --0x3A
  [apIdForChest(64)] = {"@Dazzling Space/Dazzling Space, Through the Rectangles/This one is less easy"}, --0x3B
  [apIdForChest(65)] = {"@Dazzling Space/Dazzling Space, Left of Entrance/This one is easy..."}, --0x3C

  [apIdForNpcReward(0x00)] = {"@Tool Shop/Tool Shop Owner"}, -- 0x00
  [apIdForNpcReward(0x01)] = {"@Cliff Overlooking Tulip/Left-most cliff"}, -- 0x01
  [apIdForNpcReward(0x02)] = {"@Right Goat's Pen/Southeast Corner"}, -- 0x02
  [apIdForNpcReward(0x03)] = {"@Tool Shop/Tool Shop Owner's Son"}, -- 0x03
  [apIdForNpcReward(0x04)] = {"@Sleepy Tulip/Push Left"}, -- 0x04
  [apIdForNpcReward(0x05)] = {"@Hideout Tile/Lower-right most outlook"}, -- 0x05
  [apIdForNpcReward(0x06)] = {"@Chief's House/Chief"}, -- 0x06
  [apIdForNpcReward(0x07)] = {"@Trial Room/Magician Item"}, -- 0x07
  [apIdForNpcReward(0x08)] = {"@Hideout Crystal/Nice view at least..."}, -- 0x08
  [apIdForNpcReward(0x09)] = {"@Chest Cave/Crystal"}, -- 0x09
  [apIdForNpcReward(0x0A)] = {"@Underground Castle West/Crystal on Ledge"}, -- 0x0A

  [apIdForNpcReward(0x0B)] = {"@Flying Bird/Sneak carefully..."}, -- 0x0B
  [apIdForNpcReward(0x0C)] = {"@Master Crystal/All 8 Emblems..."}, -- 0x0C
  [apIdForNpcReward(0x0D)] = {"@Woodstin Trio/Always right"}, -- 0x0D
  [apIdForNpcReward(0x0E)] = {"@Greenwood's Guardian/Guardian's item"}, -- 0x0E
  [apIdForNpcReward(0x0F)] = {"@Hole to Turbo's Remains/RIP Turbo"}, -- 0x0F
  [apIdForNpcReward(0x10)] = {"@Monmo's Gift/Ribbon exchanged for..."}, -- 0x10
  [apIdForNpcReward(0x11)] = {"@Right Squirrel Tree/Hungry Squirrel"}, -- 0x11
  [apIdForNpcReward(0x12)] = {"@Right Squirrel Tree/Hungry Squirrel's Roommate"}, -- 0x12
  [apIdForNpcReward(0x13)] = {"@Water Shrine/B2 Side-Room Secret Tile"}, -- 0x13
  [apIdForNpcReward(0x14)] = {"@Fire Shrine/B2 Heated Path Crystal"}, -- 0x14
  [apIdForNpcReward(0x15)] = {"@Light Shrine/Lostside Marsh: Crystal Near Light Shrine"}, -- 0x15
  [apIdForNpcReward(0x16)] = {"@Water Shrine/B1 Moving Spike Trap Crystal"}, -- 0x16
  [apIdForNpcReward(0x17)] = {"@Fire Shrine/1F Metal Enemies Crystal"}, -- 0x17

  [apIdForNpcReward(0x18)] = {"@Mountain King/DANCING GRANDMAS!"}, -- 0x18
  [apIdForNpcReward(0x19)] = {"@Boy with Gift/Hope this helps!"}, -- 0x19
  [apIdForNpcReward(0x1A)] = {"@Nome the Snail/Free the snail!"}, -- 0x1A
  [apIdForNpcReward(0x1B)] = {"@Secret Snail/Fake Northern Wall"}, -- 0x1B
  [apIdForNpcReward(0x1C)] = {"@Lune/Dream Tile"}, -- 0x1C
  [apIdForNpcReward(0x1D)] = {"@Laynole Mountain (without Mushroom Shoes)/Cave, Entrance Shortcut Crystal"}, -- 0x1D
  [apIdForNpcReward(0x1E)] = {"@Lune/Passage, Center of the River Crystal"}, -- 0x1E

  [apIdForNpcReward(0x1F)] = {"@Chest of Drawers/Push the Drawers"}, -- 0x1F
  [apIdForNpcReward(0x20)] = {"@Chest of Drawers/Open the Drawers"}, -- 0x20
  [apIdForNpcReward(0x21)] = {"@Dancing Plant/Dance, plant, dance!"}, -- 0x21
  [apIdForNpcReward(0x22)] = {"@Sleepy Cat/Where's the fish...ZZZZZZ"}, -- 0x22
  [apIdForNpcReward(0x23)] = {"@Dancing Plant (2nd Floor)/Dance, plant, dance!"}, -- 0x23
  [apIdForNpcReward(0x24)] = {"@Attic/Chest of Drawers"}, -- 0x24
  [apIdForNpcReward(0x25)] = {"@Attic/Marie the Doll"}, -- 0x25
  [apIdForNpcReward(0x26)] = {"@Mouse's Reward/Mouse in Hallway"}, -- 0x26
  [apIdForNpcReward(0x27)] = {"@Factory/B2 South-West Crystal"}, -- 0x27
  [apIdForNpcReward(0x28)] = {"@Left Model Town/North-East Crystal"}, -- 0x28
  [apIdForNpcReward(0x29)] = {"@Power Plant/Crystal"}, -- 0x29

  [apIdForNpcReward(0x2A)] = {"@Sleepy Soldier/Wake up please"}, -- 0x2A
  [apIdForNpcReward(0x2B)] = {"@The Queen/RIP the Queen (post Leo's Death)"}, -- 0x2B
  [apIdForNpcReward(0x2C)] = {"@The Queen/Meet the Queen (never major)"}, -- 0x2C
  [apIdForNpcReward(0x2D)] = {"@Concert Hall/Nice music. Go to where the soldier stood."}, -- 0x2D
  [apIdForNpcReward(0x2E)] = {"@Maid at the Bar/Recharging"}, -- 0x2E
  [apIdForNpcReward(0x2F)] = {"@Item on the Grounds/Please be a good one"}, -- 0x2F
  [apIdForNpcReward(0x30)] = {"@King Magridd/Long live..."}, -- 0x30
  [apIdForNpcReward(0x31)] = {"ripleo"}, -- 0x31
  [apIdForNpcReward(0x32)] = {"@Magridd Dungeon/B1 Skeleton next to North-East Chest"}, -- 0x32

  [apIdForNpcReward(0x33)] = {"@Mermaid in Northeast House/Lonely Mermaid"}, -- 0x33
  [apIdForNpcReward(0x34)] = {"@Main Mermaid/Thanks for the house"}, -- 0x34
  [apIdForNpcReward(0x35)] = {"@Mermaid in Common House Hidden Room/How'd you find me?"}, -- 0x35
  [apIdForNpcReward(0x36)] = {"@Mermaid Queen/To the next act!"}, -- 0x36
  [apIdForNpcReward(0x37)] = {"@Mermaid with Gift/Mermaid with Gift"}, -- 0x37
  [apIdForNpcReward(0x38)] = {"@Seabed Prison/Lue's Prison Break!"}, -- 0x38
  [apIdForNpcReward(0x39)] = {"@Rockbird/North-Western Island Crystal"}, -- 0x39
  [apIdForNpcReward(0x3A)] = {"@Blester/Seabed North-East, Crystal South of the Current"}, -- 0x3A
  [apIdForNpcReward(0x3B)] = {"@Durean/Crystal Near Durean"}, -- 0x3B

  [apIdForNpcReward(0x3C)] = {"soulmagicianitem"}, -- 0x3C
  [apIdForNpcReward(0x3D)] = {"soullightitem"}, -- 0x3D
  [apIdForNpcReward(0x3E)] = {"soulshielditem"}, -- 0x3E
  [apIdForNpcReward(0x3F)] = {"souldetectionitem"}, -- 0x3F
  [apIdForNpcReward(0x40)] = {"soulrealityitem"}, -- 0x40

  [apIdForLair(2)] = {"@Underground Castle West/Lair East of Entrance"}, -- OLD_WOMAN
  [apIdForLair(6)] = {"@Underground Castle West/West Bridge Lair"}, --TOOL_SHOP_OWNER
  [apIdForLair(7)] = {"@Underground Castle West/Lair North of Triangle Torch Chest"}, -- TULIP
  [apIdForLair(8)] = {"@Underground Castle West/North-East Lair"}, -- BRIDGE_GUARD
  [apIdForLair(9)] = {"@Leo's Painting/Boss: Solid Arm"}, --VILLAGE_CHIEF
  [apIdForLair(13)] = {"@Underground Castle West/Plant Cage"}, --IVY_CHEST_ROOM
  [apIdForLair(14)] = {"@Underground Castle West/South-East Island Lair"}, -- WATER_MILL
  [apIdForLair(15)] = {"@Underground Castle East/Entrance"}, -- GOAT_HERB
  [apIdForLair(16)] = {"@Underground Castle East/Southern U"}, -- LISA
  [apIdForLair(17)] = {"@Underground Castle East/Northern U"}, -- TULIP2
  [apIdForLair(18)] = {"@Underground Castle East/Stone Garden"}, -- ARCHITECT
  [apIdForLair(19)] = {"@Leo's Painting/Room 2 North of Entrance"}, -- IVY
  [apIdForLair(21)] = {"@Underground Castle East/4 Lair Gauntlet"}, -- GOAT
  [apIdForLair(22)] = {"@Underground Castle East/Conveyor Dead End"}, -- TEDDY
  [apIdForLair(24)] = {"@Underground Castle East/Narrow Bridge"}, -- TULIP3
  [apIdForLair(26)] = {"@Underground Castle East/Near Jewel Fairy"}, -- LEOS_HOUSE
  [apIdForLair(29)] = {"@Leo's Painting/Room 1 Exit"}, -- LONELY_GOAT
  [apIdForLair(34)] = {"@Leo's Painting/Room 3 North-East Birds"}, -- TULIP_PASS
  [apIdForLair(35)] = {"@Leo's Painting/Room 3 South-East Blocks"}, -- BOY_CABIN
  [apIdForLair(37)] = {"@Leo's Painting/Room 4 Torch Guards"}, -- BOY_CAVE
  [apIdForLair(40)] = {"@Underground Castle East/South-West, Lisa's Lair"}, -- OLD_MAN
  [apIdForLair(41)] = {"@Underground Castle East/Above the Elevator"}, -- OLD_MAN2
  [apIdForLair(42)] = {"@Underground Castle East/Conveyor Dead End"}, -- IVY2
  [apIdForLair(43)] = {"@Leo's Painting/Room 3 Metal Enemies"}, -- IVY_EMBLEM_A
  [apIdForLair(44)] = {"@Leo's Painting/Room 4 Metal Enemies"}, -- IVY_RECOVERY_SWORD
  [apIdForLair(46)] = {"@Leo's Painting/Room 1 Entrance"}, -- TULIP4
  [apIdForLair(47)] = {"@Leo's Painting/Room 3 Entrance"}, -- GOAT2

  [apIdForLair(55)] = {"@Light Shrine/Basement Spirit Lair"}, -- BIRD_RED_HOT_MIRROR
  [apIdForLair(56)] = {"@Water Shrine/Lostside Marsh: Entrance"}, -- BIRD
  [apIdForLair(60)] = {"@Water Shrine/Lostside Marsh: Island West of Water Shrine"}, -- DOG
  [apIdForLair(61)] = {"@Fire Shrine/Lostside Marsh: North of Water Shrine"}, -- DOG2
  [apIdForLair(63)] = {"@Light Shrine/Lostside Marsh: East of Fire Shrine"}, -- DOG3
  [apIdForLair(64)] = {"@Light Shrine/Lostside Marsh: South-West of Light Shrine"}, -- MOLE_SHIELD_BRACELET
  [apIdForLair(65)] = {"@Light Shrine/1F North Lair"}, -- SQUIRREL_EMBLEM_C
  [apIdForLair(67)] = {"@Water Shrine/1F Center Island"}, -- SQUIRREL_PSYCHO_SWORD
  [apIdForLair(70)] = {"@Water Shrine/B1 Pillars Near Waterfalls"}, -- BIRD2
  [apIdForLair(73)] = {"@Water Shrine/B1 Moving Spike Trap Lair"}, -- MOLE_SOUL_OF_LIGHT
  [apIdForLair(74)] = {"@Water Shrine/B2 to 1F Connector"}, -- DEER
  [apIdForLair(78)] = {"@Water Shrine/B2 West Side-Room"}, -- CROCODILE
  [apIdForLair(79)] = {"@Water Shrine/B2 North Hallway"}, -- SQUIRREL
  [apIdForLair(80)] = {"@Light Shrine/Boss: Elemental Statues"}, -- GREENWOODS_GUARDIAN
  [apIdForLair(81)] = {"@Water Shrine/B2 Statue Room"}, -- MOLE
  [apIdForLair(86)] = {"@Fire Shrine/1F Eastmost Lair"}, -- DOG4
  [apIdForLair(88)] = {"@Fire Shrine/B1 North-West Lair"}, -- SQUIRREL_ICE_ARMOR
  [apIdForLair(89)] = {"@Fire Shrine/B1 Isolated Room"}, -- SQUIRREL2
  [apIdForLair(90)] = {"@Fire Shrine/B1 South-East Lair"}, -- DOG5
  [apIdForLair(91)] = {"@Fire Shrine/B1 South Lair"}, -- CROCODILE2
  [apIdForLair(92)] = {"@Fire Shrine/B2 West of Stairs"}, -- MOLE2
  [apIdForLair(93)] = {"@Fire Shrine/B2 Past First Heated Path"}, -- SQUIRREL3
  [apIdForLair(97)] = {"@Fire Shrine/B2 Heated Circle"}, -- BIRD_GREENWOOD_LEAF
  [apIdForLair(98)] = {"@Fire Shrine/B2 Snaking Path Center"}, -- MOLE3
  [apIdForLair(99)] = {"@Fire Shrine/B2 Snaking Path Bridge"}, -- DEER_MAGIC_BELL
  [apIdForLair(100)] = {"@Fire Shrine/B2 Metal Enemies"}, -- BIRD3
  [apIdForLair(111)] = {"@Light Shrine/Basement East Lair"}, -- CROCODILE3
  [apIdForLair(114)] = {"@Light Shrine/Basement Lair Near Portal"}, -- MONMO

  [apIdForLair(124)] = {"@Ghost Ship/Seabed North-West, Seaweed Maze East"}, -- DOLPHIN
  [apIdForLair(131)] = {"@Blester/Seabed North-East, South of the Current"}, -- ANGELFISH
  [apIdForLair(132)] = {"@Blester/Seabed North-East, West Nook"}, -- MERMAID
  [apIdForLair(134)] = {"@Blester/Seabed North-East, Out in the Open"}, -- ANGELFISH2
  [apIdForLair(138)] = {"@Durean/Western Penninsula"}, -- MERMAID_PEARL
  [apIdForLair(139)] = {"@Durean/North, Lowest Level"}, -- MERMAID2
  [apIdForLair(140)] = {"@Durean/North, Middle Level"}, -- DOLPHIN_SAVES_LUE
  [apIdForLair(141)] = {"@Durean/North, Upper Level Lava Pool"}, -- MERMAID_STATUE_BLESTER
  [apIdForLair(142)] = {"@Durean/Metal Gorillas"}, -- MERMAID_RED_HOT_STICK
  [apIdForLair(143)] = {"@Durean/West of Entrance"}, -- LUE
  [apIdForLair(146)] = {"@Durean/North, Middle Level Lava Pool"}, -- MERMAID3
  [apIdForLair(149)] = {"@Durean/North-East Island"}, -- MERMAID_NANA
  [apIdForLair(153)] = {"@Front of Southerta/Tree Island"}, -- MERMAID4
  [apIdForLair(155)] = {"@Front of Southerta/North of Warp"}, -- DOLPHIN2
  [apIdForLair(157)] = {"@Back of Southerta/One lonely lair..."}, -- MERMAID_STATUE_ROCKBIRD
  [apIdForLair(161)] = {"@Front of Southerta/Wasn't there a lake here?"}, -- MERMAID_BUBBLE_ARMOR
  [apIdForLair(164)] = {"@Front of Southerta/Ambushed!"}, -- MERMAID5
  [apIdForLair(165)] = {"@Front of Southerta/Ambushed!"}, -- MERMAID6
  [apIdForLair(167)] = {"@Rockbird/West Center Lake"}, -- MERMAID_TEARS
  [apIdForLair(171)] = {"@Rockbird/Center Lake North-East"}, -- MERMAID_STATUE_DUREAN
  [apIdForLair(173)] = {"@Ghost Ship/Seabed North-West, Seaweed Maze South-West"}, -- ANGELFISH3
  [apIdForLair(177)] = {"@Rockbird/Center Lake South-West"}, -- ANGELFISH_SOUL_OF_SHIELD
  [apIdForLair(181)] = {"@Rockbird/South-West Lake"}, -- MERMAID_MAGIC_FLARE
  [apIdForLair(182)] = {"@Ghost Ship/Boss: Floating Skull"}, -- MERMAID_QUEEN
  [apIdForLair(185)] = {"@Blester/Metal Gorillas"}, -- MERMAID_STATUE_GHOST_SHIP
  [apIdForLair(187)] = {"@Blester/Western Pillars"}, -- DOLPHIN_SECRET_CAVE
  [apIdForLair(189)] = {"@Blester/East of the Entrance"}, -- MERMAID7
  [apIdForLair(190)] = {"@Blester/Farther East"}, -- ANGELFISH4
  [apIdForLair(192)] = {"@Blester/Eastern Pillars"}, -- MERMAID8
  [apIdForLair(193)] = {"@Durean/Seabed, Cliff"}, -- DOLPHIN_PEARL
  [apIdForLair(194)] = {"@Rockbird/Seabed, South-East Corner"}, -- MERMAID9

  [apIdForLair(201)] = {"@Laynole Mountain (without Mushroom Shoes)/South, Middle Level"}, -- GRANDPA
  [apIdForLair(202)] = {"@Laynole Mountain (without Mushroom Shoes)/South, Mountain Base"}, -- GIRL
  [apIdForLair(203)] = {"@Laynole Mountain (without Mushroom Shoes)/South, Up on the Ledge"}, -- MUSHROOM
  [apIdForLair(204)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Top of the Slide"}, -- BOY
  [apIdForLair(211)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Path through the Snow"}, -- GRANDPA2
  [apIdForLair(212)] = {"@Laynole Mountain (without Mushroom Shoes)/North, Path through the Snow"}, -- SNAIL_JOCKEY
  [apIdForLair(214)] = {"@Lune/Passage, Under the Waterfall"}, -- NOME
  [apIdForLair(215)] = {"@Lune/Passage, Between Two Cliffs"}, -- BOY2
  [apIdForLair(221)] = {"@Lune/South-East Corner"}, -- MUSHROOM_EMBLEM_F
  [apIdForLair(225)] = {"@Lune/Cloackwise Gauntlet"}, -- DANCING_GRANDMA
  [apIdForLair(230)] = {"@Lune/Counter-Clockwise Gauntlet"}, -- DANCING_GRANDMA2
  [apIdForLair(232)] = {"@Lune/Dream Lair"}, -- SNAIL_EMBLEM_E
  [apIdForLair(233)] = {"@Laynole Mountain (without Mushroom Shoes)/Cave, ICE PHYSICS!!!!"}, -- BOY_MUSHROOM_SHOES
  [apIdForLair(234)] = {"@Laynole Mountain (with Mushroom Shoes)/Cave, Middle of the Ice"}, -- GRANDMA
  [apIdForLair(235)] = {"@Laynole Mountain (without Mushroom Shoes)/Cave, Entrance"}, -- GIRL2
  [apIdForLair(238)] = {"@Laynole Mountain (with Mushroom Shoes)/Ice Hill, North-East Corner"}, -- MUSHROOM2
  [apIdForLair(239)] = {"@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Center Alcove"}, -- SNAIL_RACER
  [apIdForLair(240)] = {"@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Center Alcove"}, -- SNAIL_RACER2
  [apIdForLair(242)] = {"@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Middle Icy Slide"}, -- GIRL3
  [apIdForLair(246)] = {"@Laynole Mountain (with Mushroom Shoes)/Ice Hill, Across the Wall"}, -- MUSHROOM3
  [apIdForLair(247)] = {"@Laynole Mountain (with Mushroom Shoes)/Ice Hill, South-West Corner"}, -- SNAIL
  [apIdForLair(248)] = {"@Laynole Mountain (with Mushroom Shoes)/Laynole, Amongst the Ice Flowers"}, -- GRANDPA3
  [apIdForLair(250)] = {"@Laynole Mountain (with Mushroom Shoes)/Laynole, EVEN MORE ICE PHYSICS!!!!!"}, -- SNAIL2
  [apIdForLair(252)] = {"@Laynole Mountain (with Mushroom Shoes)/Laynole, MORE ICE PHYSICS!!!!"}, -- GRANDPA4
  [apIdForLair(254)] = {"@Laynole Mountain (with Mushroom Shoes)/Laynole, South-West Corner"}, -- GRANDPA_LUNE
  [apIdForLair(255)] = {"@Laynole Mountain (with Mushroom Shoes)/Laynole, South Invisible Bridge"}, -- GRANDPA5
  [apIdForLair(259)] = {"@Lune/Boss: Poseidon"}, -- MOUNTAIN_KING

  [apIdForLair(265)] = {"@Factory/B1 North-West Platform"}, -- PLANT_HERB
  [apIdForLair(267)] = {"@Factory/B1 South-West Blocked Pipe"}, -- PLANT
  [apIdForLair(268)] = {"@Factory/B1 North-West Triple Pipe Platform"}, -- CHEST_OF_DRAWERS_MYSTIC_ARMOR
  [apIdForLair(269)] = {"@Factory/B1 Platform North of Big Pipe"}, -- CAT
  [apIdForLair(274)] = {"@Factory/B1 North then East from the Entrance"}, -- GREAT_DOOR_ZANTETSU_SWORD
  [apIdForLair(276)] = {"@Factory/B1 South-East Platform off Small Pipes"}, -- CAT2
  [apIdForLair(282)] = {"@Factory/B1 South-East Small Pipe Gauntlet"}, -- GREAT_DOOR
  [apIdForLair(283)] = {"@Factory/B1 South-East Small Pipe Gauntlet"}, -- CAT3
  [apIdForLair(286)] = {"@Factory/B2 One Last Fire Pit..."}, -- MODEL_TOWN1
  [apIdForLair(288)] = {"@Factory/B2 Inverted T Platform"}, -- GREAT_DOOR_MODEL_TOWNS
  [apIdForLair(290)] = {"@Factory/B2 Past the Double Fire Pits"},-- STEPS_UPSTAIRS
  [apIdForLair(294)] = {"@Factory/B2 Second Flame Pit from the Left"}, -- CAT_DOOR_KEY
  [apIdForLair(297)] = {"@Factory/B2 Inside the Big Pipe"}, -- MOUSE
  [apIdForLair(303)] = {"@Power Plant/Boss: Tin Doll"}, -- MARIE
  [apIdForLair(310)] = {"@Power Plant/South-East Gauntlet"}, -- DOLL
  [apIdForLair(311)] = {"@Left Model Town/Western Outskirts"}, -- CHEST_OF_DRAWERS
  [apIdForLair(313)] = {"@Left Model Town/West, Small Field"}, -- PLANT2
  [apIdForLair(315)] = {"@Left Model Town/West, House on the Middle Hill"}, -- MOUSE2
  [apIdForLair(316)] = {"@Left Model Town/West, House on the Left Hill"}, -- MOUSE_SPARK_BOMB
  [apIdForLair(318)] = {"@Left Model Town/South-West near the River"}, -- MOUSE3
  [apIdForLair(322)] = {"@Left Model Town/Center, West of River"}, -- GREAT_DOOR_SOUL_OF_DETECTION
  [apIdForLair(325)] = {"@Left Model Town/House Maze Lair"}, -- MODEL_TOWN2
  [apIdForLair(330)] = {"@Left Model Town/East, Hidden Enemies Lairs"}, -- MOUSE4
  [apIdForLair(331)] = {"@Left Model Town/East, Hidden Enemies Lairs"}, -- STEPS_MARIE
  [apIdForLair(332)] = {"@Right Model Town/Shrinking Houses"}, -- CHEST_OF_DRAWERS2
  [apIdForLair(333)] = {"@Right Model Town/North-West Purple Pools"}, -- PLANT_ACTINIDIA_LEAVES
  [apIdForLair(338)] = {"@Right Model Town/South-West Fenced Lair"}, -- MOUSE5
  [apIdForLair(339)] = {"@Right Model Town/North-East Tree-lined Path"}, -- CAT4
  [apIdForLair(341)] = {"@Right Model Town/South-East Hidden Enemies"}, -- STAIRS_POWER_PLANT

  [apIdForLair(345)] = {"@Magridd Dungeon/B1 North-West Corner"}, -- SOLDIER
  [apIdForLair(346)] = {"@Magridd Dungeon/B1 Lower Level Center"}, -- SOLDIER2
  [apIdForLair(351)] = {"@Magridd Dungeon/B2 Snake Crossing"}, -- SOLDIER3
  [apIdForLair(353)] = {"@Magridd Dungeon/B2 Spirit Crossing"}, -- SOLDIER_ELEMENTAL_MAIL
  [apIdForLair(354)] = {"@Magridd Dungeon/B2 Spirit Crossing"}, -- SOLDIER4
  [apIdForLair(358)] = {"@Magridd Dungeon/B2 Remove the Left Column North"}, -- SOLDIER5
  [apIdForLair(359)] = {"@Magridd Dungeon/B2 Remove the Left Column South"}, -- SINGER_CONCERT_HALL
  [apIdForLair(360)] = {"@Magridd Dungeon/B2 Remove the Right Column"}, -- SOLDIER6
  [apIdForLair(363)] = {"@Magridd Dungeon/B3 Dodge the 3 Spears"}, -- MAID
  [apIdForLair(365)] = {"@Magridd Dungeon/B3 Center, Right Lair"}, -- SOLDIER_LEFT_TOWER
  [apIdForLair(366)] = {"@Magridd Dungeon/B3 Center, Double Spears"}, -- SOLDIER_DOK
  [apIdForLair(368)] = {"@Magridd Dungeon/B3 East, Weren't there spikes here?"}, -- SOLDIER_PLATINUM_CARD
  [apIdForLair(370)] = {"@Magridd Dungeon/B3 South-East, Spikes From Nowhere"}, -- SINGER
  [apIdForLair(377)] = {"@Left Tower/1F North-East Corner"}, -- SOLDIER_SOUL_OF_REALITY
  [apIdForLair(382)] = {"@Left Tower/2F North-West Room"}, -- MAID2
  [apIdForLair(383)] = {"@Left Tower/2F South-East Room"}, -- QUEEN_MAGRIDD
  [apIdForLair(385)] = {"@Left Tower/3F Cells, North-West"}, -- SOLDIER_WITH_LEO
  [apIdForLair(386)] = {"@Left Tower/3F Cells, North-East"}, -- SOLDIER_RIGHT_TOWER
  [apIdForLair(387)] = {"@Left Tower/3F Cells, South-West"}, -- DR_LEO
  [apIdForLair(389)] = {"@Left Tower/3F South-East Corner"}, -- SOLDIER7
  [apIdForLair(390)] = {"@Right Tower/1F North-West Corner"}, -- SOLDIER9
  [apIdForLair(391)] = {"@Right Tower/1F South-East Corner"}, -- MAID_HERB
  [apIdForLair(396)] = {"@Right Tower/1F Center Gauntlet"}, -- SOLDIER_CASTLE
  [apIdForLair(397)] = {"@Right Tower/2F Hidden Lair in Center"}, -- SOLDIER9
  [apIdForLair(399)] = {"@Right Tower/2F East, below Chests"}, -- SOLDIER10
  [apIdForLair(402)] = {"@Right Tower/3F Between Fireball Shooters"}, -- SOLDIER11
  [apIdForLair(405)] = {"@Right Tower/Boss: Demon Falcon"}, -- KING_MAGRIDD

}

-- [00001] = {"@Example Parent/Example Location 1/Example Section 1"},
-- [00002] = {"toggle"},    

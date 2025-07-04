-- Constants for AutoTracker:GetConnectionState
CONNECTIONSTATE_UNAVAILABLE = -1
CONNECTIONSTATE_DISABLED = 0
CONNECTIONSTATE_DISCONNECTED = 1
CONNECTIONSTATE_NOTREADY = 2
CONNECTIONSTATE_ACTIVE = 3

function autotracker_started()
  -- Run this when activated.
end

-- Used to calculate AP IDs in item_mapping and location_mapping
AP_BASE_ID = 374518970000
AP_ID_OFFSET_LAIR = 1000

U8_READ_CACHE = 0
U8_READ_CACHE_ADDRESS = 0

LAIR_WRAM_OFFSET = 0x7f0203

function isValidTarget( target )
  return ( target and ( not target.Owner.ModifiedByUser ) )
end

function isInGame()
  return true -- Need to eventually fix this.
end

function InvalidateReadCaches()
  U8_READ_CACHE_ADDRESS = 0
end

function ReadU8(segment, address)
  if U8_READ_CACHE_ADDRESS ~= address then
    U8_READ_CACHE = segment:ReadUInt8( address )
    U8_READ_CACHE_ADDRESS = address
  end

  return U8_READ_CACHE
end

function updateToggleItemFromBit( segment, code, address, offset )
  local item = Tracker:FindObjectForCode( code )

  if isValidTarget( item ) then
    local value = ReadU8( segment, address )
    if ( value & offset ) > 0 then
      item.Active = true
    else
      item.Active = false
    end
  end
end

function updateToggleItemFromByte( segment, code, address )
  local item = Tracker:FindObjectForCode( code )

  if isValidTarget( item ) then
    local value = ReadU8( segment, address )
    -- local hasItem = ( value - 0x80 ) > 0
    if value > 0 then
      item.Active = true
    else
      item.Active = false
    end
  end
end

function updateLocationFromBit( segment, code, address, offset )
  local location = Tracker:FindObjectForCode( code )

  if isValidTarget( location ) then
    local value = ReadU8( segment, address )
    if ( value & offset ) > 0 then
      location.AvailableChestCount = 0
    else
      location.AvailableChestCount = location.ChestCount
    end
  end
end

-- This is used for multiple checks that are the same location section
-- address_offsets example syntax: {[0x7e1234] = {0x01, 0x02}, [0x7e1235] = {0x02}}
function updateLocationFromMultipleBits( segment, code, address_offsets )
  local location = Tracker:FindObjectForCode( code )

  if isValidTarget( location ) then
    local count = 0

    for address, offsets in pairs( address_offsets ) do
      local value = ReadU8( segment, address )

      for i, offset in ipairs( offsets ) do
        if ( value & offset ) == 0 then
          count = count + 1
        end
      end
    end

    location.AvailableChestCount = count
  end
end

function updateItemsFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() or AutoTracker:GetConnectionState("AP") == CONNECTIONSTATE_ACTIVE then
    return false
  end

  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    updateToggleItemFromByte( segment, "lifesword", 0x7e1b1e )
    updateToggleItemFromByte( segment, "psychosword", 0x7e1b1f )
    updateToggleItemFromByte( segment, "criticalsword", 0x7e1b20 )
    updateToggleItemFromByte( segment, "luckyblade", 0x7e1b21 )
    updateToggleItemFromByte( segment, "zantetsu", 0x7e1b22 )
    updateToggleItemFromByte( segment, "spirit", 0x7e1b23 )
    updateToggleItemFromByte( segment, "recoverysword", 0x7e1b24 )
    updateToggleItemFromByte( segment, "soulblade", 0x7e1b25 )

    updateToggleItemFromByte( segment, "ironarmor", 0x7e1b26 )
    updateToggleItemFromByte( segment, "icearmor", 0x7e1b27 )
    updateToggleItemFromByte( segment, "bubblearmor", 0x7e1b28 )
    updateToggleItemFromByte( segment, "magicarmor", 0x7e1b29 )
    updateToggleItemFromByte( segment, "mysticarmor", 0x7e1b2a )
    updateToggleItemFromByte( segment, "lightarmor", 0x7e1b2b )
    updateToggleItemFromByte( segment, "elementalmail", 0x7e1b2c )
    updateToggleItemFromByte( segment, "soularmor", 0x7e1b2d )

    updateToggleItemFromByte( segment, "flameball", 0x7e1b2e )
    updateToggleItemFromByte( segment, "lightarrow", 0x7e1b2f )
    updateToggleItemFromByte( segment, "magicflare", 0x7e1b30 )
    updateToggleItemFromByte( segment, "rotator", 0x7e1b31 )
    updateToggleItemFromByte( segment, "sparkbomb", 0x7e1b32 )
    updateToggleItemFromByte( segment, "flamepillar", 0x7e1b33 )
    updateToggleItemFromByte( segment, "tornado", 0x7e1b34 )
    updateToggleItemFromByte( segment, "phoenix", 0x7e1b35 )

    updateToggleItemFromByte( segment, "goatfood", 0x7e1b36 )
    updateToggleItemFromByte( segment, "harpstring", 0x7e1b37 )
    updateToggleItemFromByte( segment, "pass", 0x7e1b38 )
    updateToggleItemFromByte( segment, "dreamrod", 0x7e1b39 )
    updateToggleItemFromByte( segment, "leobrush", 0x7e1b3a )
    updateToggleItemFromByte( segment, "greenleaves", 0x7e1b3b )
    updateToggleItemFromByte( segment, "moleribbon", 0x7e1b3c )
    updateToggleItemFromByte( segment, "bigpearl", 0x7e1b3d )
    updateToggleItemFromByte( segment, "mermaidtears", 0x7e1b3e )
    updateToggleItemFromByte( segment, "mushroomshoes", 0x7e1b3f )

    updateToggleItemFromByte( segment, "mobilekey", 0x7e1b40 )
    updateToggleItemFromByte( segment, "thunderring", 0x7e1b41 )
    updateToggleItemFromByte( segment, "seeds", 0x7e1b42 )
    updateToggleItemFromByte( segment, "actleaves", 0x7e1b43 )
    updateToggleItemFromByte( segment, "doorkey", 0x7e1b44 )
    updateToggleItemFromByte( segment, "platinumcard", 0x7e1b45 )
    updateToggleItemFromByte( segment, "vipcard", 0x7e1b46 )
    updateToggleItemFromByte( segment, "emblema", 0x7e1b47 )
    updateToggleItemFromByte( segment, "emblemb", 0x7e1b48 )
    updateToggleItemFromByte( segment, "emblemc", 0x7e1b49 )

    updateToggleItemFromByte( segment, "emblemd", 0x7e1b4a )
    updateToggleItemFromByte( segment, "embleme", 0x7e1b4b )
    updateToggleItemFromByte( segment, "emblemf", 0x7e1b4c )
    updateToggleItemFromByte( segment, "emblemg", 0x7e1b4d )
    updateToggleItemFromByte( segment, "emblemh", 0x7e1b4e )
    updateToggleItemFromByte( segment, "redhotmirror", 0x7e1b4f )
    updateToggleItemFromByte( segment, "redhotball", 0x7e1b50 )
    updateToggleItemFromByte( segment, "redhotrod", 0x7e1b51 )
    updateToggleItemFromByte( segment, "powerbracelet", 0x7e1b52 )
    updateToggleItemFromByte( segment, "shieldbracelet", 0x7e1b53 )

    updateToggleItemFromByte( segment, "superbracelet", 0x7e1b54 )
    updateToggleItemFromByte( segment, "medicalherb", 0x7e1b55 )
    updateToggleItemFromByte( segment, "strangebottle", 0x7e1b56 )
    updateToggleItemFromByte( segment, "brownstone", 0x7e1b57 )
    updateToggleItemFromByte( segment, "greenstone", 0x7e1b58 )
    updateToggleItemFromByte( segment, "bluestone", 0x7e1b59 )
    updateToggleItemFromByte( segment, "silverstone", 0x7e1b5a )
    updateToggleItemFromByte( segment, "purplestone", 0x7e1b5b )
    updateToggleItemFromByte( segment, "blackstone", 0x7e1b5c )
    updateToggleItemFromByte( segment, "magicbell", 0x7e1b5d )
  end
end

function updateStoneHoldersFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() or AutoTracker:GetConnectionState("AP") == CONNECTIONSTATE_ACTIVE then
    return false
  end

  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    updateToggleItemFromBit( segment, "chief", 0x7e1a79, 0x01 )
    updateToggleItemFromBit( segment, "guardian", 0x7e1a79, 0x02 )
    updateToggleItemFromBit( segment, "mermaid", 0x7e1a79, 0x04 )
    updateToggleItemFromBit( segment, "nome", 0x7e1a79, 0x08 )
    updateToggleItemFromBit( segment, "marie", 0x7e1a79, 0x10 )
    updateToggleItemFromBit( segment, "king", 0x7e1a79, 0x20 )
  end

  -- Not strictly an item, but falls in this memory block
  if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    updateToggleItemFromBit( segment, "w7stones", 0x7e1a7d, 0x10 )
  end
end

function updateSoulsFromSkyFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() or AutoTracker:GetConnectionState("AP") == CONNECTIONSTATE_ACTIVE then
    return false
  end

  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    updateToggleItemFromBit( segment, "soulmagician", 0x7e1b82, 0x01 )
    updateToggleItemFromBit( segment, "soullight", 0x7e1b82, 0x02 )
    updateToggleItemFromBit( segment, "soulshield", 0x7e1b82, 0x04 )
    updateToggleItemFromBit( segment, "souldetection", 0x7e1b82, 0x08 )
    updateToggleItemFromBit( segment, "soulreality", 0x7e1b82, 0x10 )
  end
end

function updateReleasedSoulsFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() or AutoTracker:GetConnectionState("AP") == CONNECTIONSTATE_ACTIVE then
    return false
  end

  InvalidateReadCaches()

  -- Maybe turn this into location/lair tracking?
  if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    updateToggleItemFromBit( segment, "w1architect", 0x7e1ae0, 0x04 )
    updateToggleItemFromBit( segment, "w1boyguardinghideout", 0x7e1ae2, 0x20 )
    updateToggleItemFromBit( segment, "w1bridgeguard", 0x7e1adf, 0x01 )
    updateToggleItemFromBit( segment, "w1goatpen", 0x7e1adf, 0x80 )
    updateToggleItemFromBit( segment, "w1ivyemblema", 0x7e1ae3, 0x08 )
    updateToggleItemFromBit( segment, "w1ivyhideoutcrystal", 0x7e1ae3, 0x10 )
    updateToggleItemFromBit( segment, "w1ivysoutheast", 0x7e1ae0, 0x08 )
    updateToggleItemFromBit( segment, "w1ivytwochests", 0x7e1adf, 0x20 )
    updateToggleItemFromBit( segment, "w1leoshouse", 0x7e1ae1, 0x04 )
    updateToggleItemFromBit( segment, "w1lisa", 0x7e1ae0, 0x01 )
    updateToggleItemFromBit( segment, "w1sleepytulip", 0x7e1ae2, 0x04 )
    updateToggleItemFromBit( segment, "w1toolshopowner", 0x7e1ade, 0x40 )
    updateToggleItemFromBit( segment, "w1teddy", 0x7e1ae0, 0x40 )
    updateToggleItemFromBit( segment, "w1villagechief", 0x7e1adf, 0x02 )
    updateToggleItemFromBit( segment, "w1villagechiefhouse", 0x7e1ade, 0x04 )
    updateToggleItemFromBit( segment, "w1watermillkeeper", 0x7e1adf, 0x40 )

    updateToggleItemFromBit( segment, "dreamlisa", 0x7e1ae4, 0x04 )

    updateToggleItemFromBit( segment, "w2bird", 0x7e1ae4, 0x80 )
    updateToggleItemFromBit( segment, "w2crocodiledeer", 0x7e1aeb, 0x80 )
    updateToggleItemFromBit( segment, "w2crocodilegraveyard", 0x7e1ae9, 0x08 )
    updateToggleItemFromBit( segment, "w2crocodileisland", 0x7e1ae7, 0x40 )
    updateToggleItemFromBit( segment, "w2deer", 0x7e1aea, 0x08 )
    updateToggleItemFromBit( segment, "w2guardian", 0x7e1ae8, 0x01 )
    updateToggleItemFromBit( segment, "w2holesleepystump", 0x7e1ae8, 0x02 )
    updateToggleItemFromBit( segment, "w2moleoutside", 0x7e1aec, 0x04 )
    updateToggleItemFromBit( segment, "w2holeoutside", 0x7e1aea, 0x04 )
    updateToggleItemFromBit( segment, "w2molesoul", 0x7e1ae7, 0x02 )
    updateToggleItemFromBit( segment, "w2monmo", 0x7e1ae6, 0x01 )
    updateToggleItemFromBit( segment, "w2sleepybird", 0x7e1aea, 0x02 )
    updateToggleItemFromBit( segment, "w2squirrelhungry", 0x7e1ae6, 0x08 )
    updateToggleItemFromBit( segment, "w2squirrelroommate", 0x7e1ae6, 0x02 )
    updateToggleItemFromBit( segment, "w2squirrelsleepy", 0x7e1ae9, 0x01 )
    updateToggleItemFromBit( segment, "w2woodstindeer", 0x7e1ae7, 0x04 )
    updateToggleItemFromBit( segment, "w2woodstindog", 0x7e1ae5, 0x80 )
    updateToggleItemFromBit( segment, "w2woodstinsquirrel", 0x7e1ae9, 0x20 )

    updateToggleItemFromBit( segment, "dreambird", 0x7e1aec, 0x10 )
    updateToggleItemFromBit( segment, "dreamstump", 0x7e1aec, 0x20 )

    updateToggleItemFromBit( segment, "w3mermaiddanceleader", 0x7e1af1, 0x02 )
    updateToggleItemFromBit( segment, "w3dolphinnortheast", 0x7e1af1, 0x08 )
    updateToggleItemFromBit( segment, "w3dolphinprisonbreak", 0x7e1aef, 0x10 )
    updateToggleItemFromBit( segment, "w3dolphinsleepy", 0x7e1af5, 0x08 )
    updateToggleItemFromBit( segment, "w3dolphinwest", 0x7e1af6, 0x02 )
    updateToggleItemFromBit( segment, "w3lue", 0x7e1aef, 0x80 )
    updateToggleItemFromBit( segment, "w3mermaidgift", 0x7e1aef, 0x40 )
    updateToggleItemFromBit( segment, "w3mermaidhouse", 0x7e1af2, 0x02 )
    updateToggleItemFromBit( segment, "w3mermaidnortheast", 0x7e1aee, 0x10 )
    updateToggleItemFromBit( segment, "w3mermaidqueen", 0x7e1af4, 0x40 )
    updateToggleItemFromBit( segment, "w3mermaidwestguard", 0x7e1aef, 0x04 )
    updateToggleItemFromBit( segment, "w3mermaidwesthouse", 0x7e1af4, 0x20 )
    updateToggleItemFromBit( segment, "w3statuedurean", 0x7e1af3, 0x08 )
    updateToggleItemFromBit( segment, "w3statueblester", 0x7e1aef, 0x20 )
    updateToggleItemFromBit( segment, "w3statueghostship", 0x7e1af5, 0x02 )
    updateToggleItemFromBit( segment, "w3statuerockbird", 0x7e1af1, 0x20 )
    updateToggleItemFromBit( segment, "w3angelfishsoul", 0x7e1af4, 0x02 )

    updateToggleItemFromBit( segment, "dreamdolphin", 0x7e1aed, 0x02 )

    updateToggleItemFromBit( segment, "w4boygift", 0x7e1afb, 0x02 )
    updateToggleItemFromBit( segment, "w4boywest", 0x7e1af7, 0x10 )
    updateToggleItemFromBit( segment, "w4dancinggrandma1", 0x7e1afa, 0x40 )
    updateToggleItemFromBit( segment, "w4dancinggrandma2", 0x7e1afa, 0x02 )
    updateToggleItemFromBit( segment, "w4girl", 0x7e1afc, 0x04 )
    -- Reconfirm this one: could be anything. 0x7e1af8, 0x08 is BELOW NW room.
    updateToggleItemFromBit( segment, "w4grandpanorthwest", 0x7e1af8, 0x08 )
    updateToggleItemFromBit( segment, "w4grandpalake", 0x7e1afd, 0x10 )
    updateToggleItemFromBit( segment, "w4grandpalune", 0x7e1afd, 0x40 )
    updateToggleItemFromBit( segment, "w4grandpanome", 0x7e1afd, 0x80 )
    updateToggleItemFromBit( segment, "w4grandpasouthwest", 0x7e1afd, 0x01 )
    updateToggleItemFromBit( segment, "w4mountainking", 0x7e1afe, 0x08 )
    updateToggleItemFromBit( segment, "w4mushroomsouth", 0x7e1afb, 0x40 )
    updateToggleItemFromBit( segment, "w4nome", 0x7e1af8, 0x40 )
    updateToggleItemFromBit( segment, "w4sleepymushroom", 0x7e1af9, 0x20 )
    updateToggleItemFromBit( segment, "w4snail", 0x7e1afb, 0x01 )

    updateToggleItemFromBit( segment, "w5cat1", 0x7e1b00, 0x10 )
    updateToggleItemFromBit( segment, "w5cat2", 0x7e1aff, 0x20 )
    updateToggleItemFromBit( segment, "w5doorentry", 0x7e1b00, 0x04 )
    updateToggleItemFromBit( segment, "w5doormodel", 0x7e1b02, 0x01 )
    updateToggleItemFromBit( segment, "w5doorsoul", 0x7e1b06, 0x04 )
    updateToggleItemFromBit( segment, "w5doorsouthwest", 0x7e1b01, 0x04 )
    updateToggleItemFromBit( segment, "w5drawers1st", 0x7e1aff, 0x10 )
    updateToggleItemFromBit( segment, "w5drawersattic", 0x7e1b07, 0x10 )
    updateToggleItemFromBit( segment, "w5marie", 0x7e1b03, 0x80 )
    updateToggleItemFromBit( segment, "w5model1", 0x7e1b01, 0x40 )
    updateToggleItemFromBit( segment, "w5model2", 0x7e1b06, 0x20 )
    updateToggleItemFromBit( segment, "w5mouseinside", 0x7e1b05, 0x10 )
    updateToggleItemFromBit( segment, "w5mouseoutside", 0x7e1b03, 0x02 )
    updateToggleItemFromBit( segment, "w5plantmice", 0x7e1aff, 0x02 )
    updateToggleItemFromBit( segment, "w5plantmodel", 0x7e1b07, 0x20 )
    updateToggleItemFromBit( segment, "w5sleepycat", 0x7e1b02, 0x40 )
    updateToggleItemFromBit( segment, "w5steps2nd", 0x7e1b02, 0x04 )
    updateToggleItemFromBit( segment, "w5stepsattic", 0x7e1b07, 0x08 )
    updateToggleItemFromBit( segment, "w5stepsbasement", 0x7e1b08, 0x20 )

    updateToggleItemFromBit( segment, "w6king", 0x7e1b10, 0x20 )
    updateToggleItemFromBit( segment, "w6leo", 0x7e1b0e, 0x08 )
    updateToggleItemFromBit( segment, "w6maid", 0x7e1b0e, 0x80 )
    updateToggleItemFromBit( segment, "w6queen", 0x7e1b0d, 0x80 )
    updateToggleItemFromBit( segment, "w6singer", 0x7e1b0a, 0x80 )
    updateToggleItemFromBit( segment, "w6sleepysoldier", 0x7e1b0a, 0x02 )
    updateToggleItemFromBit( segment, "w6soldiercastle", 0x7e1b0f, 0x10 )
    updateToggleItemFromBit( segment, "w6soldiersoul", 0x7e1b0d, 0x02 )
    updateToggleItemFromBit( segment, "w6soldierdok", 0x7e1b0b, 0x40 )
    updateToggleItemFromBit( segment, "w6soldierleft", 0x7e1b0b, 0x20 )
    updateToggleItemFromBit( segment, "w6soldieroct", 0x7e1b0e, 0x02 )
    updateToggleItemFromBit( segment, "w6soldierright", 0x7e1b0e, 0x04 )
--    updateToggleItemFromBit( segment, "w6soldierconcert", 0x7e1b0b, 0x01 )
    updateToggleItemFromBit( segment, "w6soldierconcert", 0x7e1b0c, 0x01 )
  end
end

function ToggleSummonPhoenix( segment )
  local openDeathtoll = Tracker:FindObjectForCode("open_deathtoll")
  if openDeathtoll and openDeathtoll.Active then
    return
  end

  updateToggleItemFromBit( segment, "summonphoenix", 0x7e1a68, 0x01 )
end


function updateSpecificEventFlagsFromMemorySegment( segment )
  -- check if we're in the game.
  if not isInGame() or AutoTracker:GetConnectionState("AP") == CONNECTIONSTATE_ACTIVE then
    return false
  end

  -- Despite looking like items, these are only used for location tracking
  if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    return
  end

  InvalidateReadCaches()

  updateToggleItemFromBit( segment, "watermill", 0x7e1a62, 0x10 )
  updateToggleItemFromBit( segment, "ripleo", 0x7e1a66, 0x20 )
  ToggleSummonPhoenix( segment )
  --updateToggleItemFromBit( segment, "summonphoenix", 0x7e1a68, 0x01 )
end

-- From the Lua manual section 11.5 – Sets and Bags
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

LisaLockedSectionsSet = Set{"Grass Valley/West Grass Valley/Underground Castle East/South-West, Lisa's Chest",
 "Grass Valley/West Grass Valley/Underground Castle East/South-West, Lisa's Lair"}

WatermillLockedSectionsSet = Set{"Grass Valley/West Grass Valley/Underground Castle East/Above the Elevator",
 "Grass Valley/West Grass Valley/Underground Castle East/Entrance",
 "Grass Valley/West Grass Valley/Underground Castle East/Southern U",
 "Grass Valley/West Grass Valley/Underground Castle East/Northern U",
 "Grass Valley/West Grass Valley/Underground Castle East/Stone Garden",
 "Grass Valley/West Grass Valley/Underground Castle East/Conveyor Dead End",
 "Grass Valley/West Grass Valley/Underground Castle East/4 Lair Gauntlet",
 "Grass Valley/West Grass Valley/Underground Castle East/Narrow Bridge",
 "Grass Valley/West Grass Valley/Underground Castle East/Near Jewel Fairy",
 "Grass Valley/West Grass Valley/Underground Castle East/South-West, Lisa's Chest",
 "Grass Valley/West Grass Valley/Underground Castle East/South-West, Lisa's Lair"}

SleepyMushroomSectionsSet = Set{"Mountain of Lost Souls/Southeast Lake/Lune/Dream Lair",
"Mountain of Lost Souls/Southeast Lake/Lune/Dream Tile"}

RIPQueenSection = "Magridd Castle/The Queen/RIP the Queen (post Leo's Death)"
SleepyStumpChestSection = "Woods of Greenwood/Hole to Sleepy Stump/Sleepy Stump Chest/In the garbage"
MoleRemainsSection = "Woods of Greenwood/Hole to Turbo's Remains/RIP Turbo"
SecretCoveSection = "Seabed Sanctuary/Mermaid Common House/Underwater.../Ghost Ship/Secret Cove"

function AreAllSectionsChecked(sectionsSet)
  local allSectionsChecked = true
  for sectionName, _ in pairs(sectionsSet) do
    local section = Tracker:FindObjectForCode("@" .. sectionName)

    if section and section.AvailableChestCount > 0 then
      allSectionsChecked = false
      break;
    end
  end

  return allSectionsChecked
end

-- Returns true or false so we can check it on data storage change
function ActivateToggleItemIfAllSectionsChecked(itemCode, sectionsSet)
  local allSectionsChecked = AreAllSectionsChecked(sectionsSet)
  if allSectionsChecked then
    local item = Tracker:FindObjectForCode(itemCode)
    if item then
      item.Active = true
    end
  end

  return allSectionsChecked
end

-- Returns true or false so we can check it on data storage change
function ActivateToggleItemIfSectionChecked(itemCode, sectionName)
  local section = Tracker:FindObjectForCode("@" .. sectionName)
  local sectionChecked = (section and section.AvailableChestCount == 0)
  if sectionChecked then
    local item = Tracker:FindObjectForCode(itemCode)
    if item then
      item.Active = true
    end
  end

  return sectionChecked
end

function FixLisaEventFlag()
  return ActivateToggleItemIfAllSectionsChecked("dreamlisa", LisaLockedSectionsSet)
end

function FixWatermillEventFlag()
  return ActivateToggleItemIfAllSectionsChecked("watermill", WatermillLockedSectionsSet)
end

function FixDreamingMushroomFlag()
  return ActivateToggleItemIfAllSectionsChecked("dreammushroom", SleepyMushroomSectionsSet)
end

function ToggleItemIfSectionChecked(locationSection, sectionName, itemName)
  if locationSection.FullID == sectionName and locationSection.AvailableChestCount == 0 then
    local item = Tracker:FindObjectForCode(itemName)
    if item then
      item.Active = true
    end
  end
end

--This will need to change if we ever add full maps
function FixEventsCollectedSectionChanged(locationSection)
  if not locationSection then
    return
  end

  if LisaLockedSectionsSet[locationSection.FullID] then
    FixLisaEventFlag()
  end

  if WatermillLockedSectionsSet[locationSection.FullID] then
    FixWatermillEventFlag()
  end

  if SleepyMushroomSectionsSet[locationSection.FullID] then
    FixDreamingMushroomFlag()
  end

  ToggleItemIfSectionChecked(locationSection, RIPQueenSection, "ripleo")
  ToggleItemIfSectionChecked(locationSection, SleepyStumpChestSection, "dreamstump")
  ToggleItemIfSectionChecked(locationSection, MoleRemainsSection, "dreambird")
  ToggleItemIfSectionChecked(locationSection, SecretCoveSection, "dreamdolphin")

end

-- This should work because summonphoenix SNES checking is now turned off if open_deathtoll is on
function FixSummonPhoenix(code)
  local openDeathtoll = Tracker:FindObjectForCode("opendeathtoll")

  if openDeathtoll and openDeathtoll.Active then
    local summonPhoenix = Tracker:FindObjectForCode("summonphoenix")

    if summonPhoenix then
      summonPhoenix.Active = true
    end
  end
end

ScriptHost:AddMemoryWatch( "Soul Blazer Item Data", 0x7e1b1e, 64, updateItemsFromMemorySegment )
ScriptHost:AddMemoryWatch( "Soul Blazer Stone Holders", 0x7e1a79, 64, updateStoneHoldersFromMemorySegment )
ScriptHost:AddMemoryWatch( "Soul Blazer Souls from the Sky", 0x7e1b82, 64, updateSoulsFromSkyFromMemorySegment )
ScriptHost:AddMemoryWatch( "Soul Blazer Soul Reveals from Lairs", 0x7e1ade, 64, updateReleasedSoulsFromMemorySegment )
ScriptHost:AddMemoryWatch( "Soul Blazer Event Flags", 0x7e1a5e, 11, updateSpecificEventFlagsFromMemorySegment )

-- May change later
ScriptHost:AddOnLocationSectionChangedHandler("Fix Event Checks", FixEventsCollectedSectionChanged)
ScriptHost:AddWatchForCode("Fix Deathtoll Phoenix Check", "opendeathtoll", FixSummonPhoenix)
--ScriptHost:AddWatchForCode("Fix Phoenix Check", "summonphoenix", FixSummonPhoenix)

ScriptHost:LoadScript( "scripts/autotracking-custom.lua" )

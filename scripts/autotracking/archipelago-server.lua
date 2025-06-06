-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and location_mapping.lua to track items and locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}
    -- manually run snes interface functions after onClear in case we are already ingame
    if PopVersion < "0.20.1" or AutoTracker:GetConnectionState("SNES") == 3 then
        -- add snes interface functions here
    end

    SBOnClear()
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
        return
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
    -- track local items via snes interface
    if is_local then
        if LOCAL_ITEMS[v[1]] then
            LOCAL_ITEMS[v[1]] = LOCAL_ITEMS[v[1]] + 1
        else
            LOCAL_ITEMS[v[1]] = 1
        end
    else
        if GLOBAL_ITEMS[v[1]] then
            GLOBAL_ITEMS[v[1]] = GLOBAL_ITEMS[v[1]] + 1
        else
            GLOBAL_ITEMS[v[1]] = 1
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
        print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
    end
    if PopVersion < "0.20.1" or AutoTracker:GetConnectionState("SNES") == 3 then
        -- add snes interface functions here for local item tracking
    end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end
    if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
        return
    end
    local v = LOCATION_MAPPING[location_id]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
            item_player))
    end
    -- not implemented yet :(
end

-- called when a bounce message is received 
function onBounce(json)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onBounce: %s", dump_table(json)))
    end
    -- your code goes here
end

-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    Archipelago:AddLocationHandler("location handler", onLocation)
end
-- Archipelago:AddScoutHandler("scout handler", onScout)
-- Archipelago:AddBouncedHandler("bounce handler", onBounce)


-- SoulBlazer specific things
local sbDatastoreKeyLairs = nil
local sbDatastoreKeyEvents = nil
local SB_EVENT_FLAGS_START = 0x7e1a5e

-- [itemname] = lair id (in hex)
local SB_TRACKED_LAIRS = {["dreamlisa"] = 0x032, ["dreambird"] = 0x074, ["dreamstump"] = 0x075, ["dreamdolphin"] = 0x079, ["dreammushroom"] = 0x0e7}
-- [itemname] = {address, bit}
local SB_TRACKED_EVENTS = {["watermill"] = {0x7e1a62, 0x10}, ["ripleo"] = {0x7e1a66, 0x20}, ["summonphoenix"] = {0x7e1a68, 0x01},
    ["chief"] = {0x7e1a79, 0x01}, ["guardian"] = {0x7e1a79, 0x02}, ["mermaid"] = {0x7e1a79, 0x04}, ["nome"] = {0x7e1a79, 0x08},
    ["marie"] = {0x7e1a79, 0x10}, ["king"] = {0x7e1a79, 0x20}}
local SB_LAIR_OFFSET = 0x80

function SBOnClear()
    sbDatastoreKeyLairs = string.format("soulblazer_lair_state_%d_%d", Archipelago.TeamNumber, Archipelago.PlayerNumber)
    sbDatastoreKeyEvents = string.format("soulblazer_event_flags_%d_%d", Archipelago.TeamNumber, Archipelago.PlayerNumber)
    if SLOT_DATA ~= nil then
        SBProcessSlotData()
    end

    SBConfigureDataStorage()
end

function SBProcessSlotData()
    if SLOT_DATA["goal"] ~= nil then
        local goal = Tracker:FindObjectForCode("goal")
        if SLOT_DATA["goal"] == 1 then
            goal.Active = true
        else
            goal.Active = false
        end
    end

    if SLOT_DATA["stones_count"] ~= nil then
        local stone_count = Tracker:FindObjectForCode("requiredstonecount")
        stone_count.AcquiredCount = SLOT_DATA["stones_count"]
    end

    if SLOT_DATA["open_deathtoll"] ~= nil then
        local opendeathtoll = Tracker:FindObjectForCode("opendeathtoll")
        if SLOT_DATA["open_deathtoll"] == 1 then
            opendeathtoll.Active = true
        else
            opendeathtoll.Active = false
        end
    end

    if SLOT_DATA["act_progression"] ~= nil then
        local leader = nil
        if SLOT_DATA["act_progression"] == 1 then
            leader = Tracker:FindObjectForCode("chief")
            leader.Active = true

            leader = Tracker:FindObjectForCode("guardian")
            leader.Active = true

            leader = Tracker:FindObjectForCode("mermaid")
            leader.Active = true

            leader = Tracker:FindObjectForCode("nome")
            leader.Active = true

            leader = Tracker:FindObjectForCode("marie")
            leader.Active = true

            leader = Tracker:FindObjectForCode("king")
            leader.Active = true
        end
    end
end

function SBConfigureDataStorage()
    local keys = {sbDatastoreKeyLairs, sbDatastoreKeyEvents}

    Archipelago:AddSetReplyHandler("Soul Blazer DataStorage Changed", SBDataStorageChanged)
    Archipelago:AddRetrievedHandler("Soul Blazer DataStorage Retrieved", SBDataStorageRetrieved)
    Archipelago:SetNotify(keys)
    Archipelago:Get(keys)
end

function SBDataStorageChanged(key, value, old_value)
    if key == sbDatastoreKeyLairs then
        for dreamId,lairId in pairs(SB_TRACKED_LAIRS) do
            SBCheckStorageItem(dreamId, lairId + 1, SB_LAIR_OFFSET, value, old_value)
        end
    elseif key == sbDatastoreKeyEvents then
        for eventId,offsets in pairs(SB_TRACKED_EVENTS) do
            -- Convert address to byte number in the array
            local address = offsets[1] - SB_EVENT_FLAGS_START
            SBCheckStorageItem(eventId, address + 1, offsets[2], value, old_value)
        end
    end
end

function SBCheckStorageItem(code, address, offset, value, old_value)
    local realValue = value[address] & offset
    if old_value == nil then
        SBUpdateStorageItem(code, realValue)
    else
        local realOldValue = old_value[address] & offset
        if realValue ~= realOldValue then SBUpdateStorageItem(code, realValue) end
    end
end

-- This is the starting state for the item when we connect, so just run the storage changed callback but with a nil old_value
function SBDataStorageRetrieved(key, value)
    SBDataStorageChanged(key, value, nil)
end

function SBUpdateStorageItem(code, data)
    local storageItem = Tracker:FindObjectForCode(code)
    if isValidTarget(storageItem) then
        storageItem.Active = data
    end
end

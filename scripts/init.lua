-- Load settings early.
ScriptHost:LoadScript( "scripts/settings.lua" )

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Load the items
Tracker:AddItems( "items/equipment.json" )
Tracker:AddItems( "items/dreams.json" )
Tracker:AddItems( "items/emblems.json" )
Tracker:AddItems( "items/inventory.json" )
Tracker:AddItems( "items/souls.json" )
Tracker:AddItems( "items/stones.json" )
Tracker:AddItems( "items/events.json" )

-- Load variant-specific scripts/layouts
ScriptHost:LoadScript( "scripts/init-custom.lua" )

ScriptHost:LoadScript( "scripts/autotracking.lua" )

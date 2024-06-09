-- Load settings early.
ScriptHost:LoadScript( "scripts/settings.lua" )

-- Load the items
Tracker:AddItems( "items/equipment.json" )
Tracker:AddItems( "items/dreams.json" )
Tracker:AddItems( "items/emblems.json" )
Tracker:AddItems( "items/inventory.json" )
Tracker:AddItems( "items/souls.json" )
Tracker:AddItems( "items/stones.json" )

-- Load variant-specific scripts/layouts
ScriptHost:LoadScript( "scripts/init-custom.lua" )

if _VERSION == "Lua 5.3" then
  ScriptHost:LoadScript( "scripts/autotracking.lua" )
else
  print( "Auto-tracker is unsupported by your tracker version" )
end

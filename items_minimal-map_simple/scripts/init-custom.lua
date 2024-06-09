ScriptHost:LoadScript( "scripts/logic.lua" )

for j=1,7 do
  Tracker:AddItems( "items/labels/world" .. j .. ".json" )
  Tracker:AddLocations( "locations/world" .. j .. ".json" )
end

Tracker:AddMaps( "maps/maps.json" )

Tracker:AddLayouts( "layouts/tracker.json" )
Tracker:AddLayouts( "layouts/broadcast.json" )

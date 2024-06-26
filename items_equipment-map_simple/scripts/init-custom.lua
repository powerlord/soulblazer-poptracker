ScriptHost:LoadScript( "scripts/logic.lua" )

for j=1,7 do
  Tracker:AddItems( "items/labels/world" .. j .. ".json" )
  Tracker:AddLocations( "locations/world" .. j .. ".json" )
end

Tracker:AddItems( "items/randomizersettings.json" )

Tracker:AddMaps( "maps/maps.json" )

Tracker:AddLayouts( "layouts/tracker_equipment.json" )
Tracker:AddLayouts( "layouts/broadcast_equipment.json" )
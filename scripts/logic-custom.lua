--These functions can be overridden

function hasAllEmblems()
  -- TODO: Find a way to loop this.
  if Tracker:ProviderCountForCode( "emblema" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "emblemb" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "emblemc" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "emblemd" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "embleme" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "emblemf" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "emblemg" ) <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "emblemh" ) <= 0 then
    return 0
  end
  return 1
end

function canDefeatMetalMonsters()
  if Tracker:ProviderCountForCode( "zantetsu" ) > 0 then
    return 1
  end
  return Tracker:ProviderCountForCode( "soulblade" )
end

function canDefeatMetalGorillas()
  if canDefeatMetalMonsters() > 0 then
    return 1
  end
  return Tracker:ProviderCountForCode( "thunderring" )
end

function canDefeatSpiritMonsters()
  if Tracker:ProviderCountForCode( "spirit" ) > 0 then
    return 1
  end
  return Tracker:ProviderCountForCode( "soulblade" )
end

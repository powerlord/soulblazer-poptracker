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

function canEnterArea2()
  return Tracker:ProviderCountForCode( "chief" )
end

function canEnterArea3()
  if canEnterArea2() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "guardian" )
end

function canEnterArea4()
  if canEnterArea3() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "mermaid" )
end

function canEnterArea5()
  if canEnterArea4() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "nome" )
end

function canEnterArea6()
  if canEnterArea5() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "marie" )
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

-- This function isn't needed yet, but may be in the future
function CanUsePhoenix()

  if Tracker:ProviderCountForCode( "phoenix" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "soulblade" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "soularmor" ) <= 0 then
    return 0
  end

  return 1
end

function CanUseMagic()
  if Tracker:ProviderCountForCode( "soulmagician" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "flameball" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "lightarrow" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "magicflare" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "rotator" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "sparkbomb" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "flamepillar" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "tornado" ) > 0 then
    return 1
  end

  if CanUsePhoenix() > 0 then
    return 1
  end

  return 0

end

ScriptHost:LoadScript("scripts/logic-custom.lua")

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

function canEnterArea7()
  if canEnterArea6() <= 0 then
    return 0
  end
  if Tracker:ProviderCountForCode( "king" ) <= 0 then
    return 0
  end

  -- short circuit if we've used the stones already
  if Tracker:ProviderCountForCode( "w7stones" ) > 0 then
    return 1
  end

  if Tracker:ProviderCountForCode( "brownstone" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "greenstone" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "bluestone" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "silverstone" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "purplestone" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "blackstone" ) <= 0 then
    return 0
  end

  return 1
end

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

function canSummonDeathtoll()
  if canEnterArea7() <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "w4mountainking" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "w4dancinggrandma1" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "w4dancinggrandma2" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "w4grandpasouthwest" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "redhotball" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "redhotmirror" ) <= 0 then
    return 0
  end

  if Tracker:ProviderCountForCode( "redhotrod" ) <= 0 then
    return 0
  end

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
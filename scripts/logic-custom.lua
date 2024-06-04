--These functions can be overridden

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

  local grandmas = Tracker:FindObjectForCode("@Mountain King/DANCING GRANDMAS!")

  if grandmas.AvailableChestCount > 0 then
    if Tracker:ProviderCountForCode( "redhotball" ) <= 0 then
      return 0
    end
  
    if Tracker:ProviderCountForCode( "redhotmirror" ) <= 0 then
      return 0
    end
  
    if Tracker:ProviderCountForCode( "redhotrod" ) <= 0 then
      return 0
    end
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
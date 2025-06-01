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

  local stonecount = 0

  if Tracker:ProviderCountForCode( "brownstone" ) > 0 then
    stonecount = stonecount + 1
  end

  if Tracker:ProviderCountForCode( "greenstone" ) > 0 then
    stonecount = stonecount + 1
  end

  if Tracker:ProviderCountForCode( "bluestone" ) > 0 then
    stonecount = stonecount + 1
  end

  if Tracker:ProviderCountForCode( "silverstone" ) > 0 then
    stonecount = stonecount + 1
  end

  if Tracker:ProviderCountForCode( "purplestone" ) > 0 then
    stonecount = stonecount + 1
  end

  if Tracker:ProviderCountForCode( "blackstone" ) > 0 then
    stonecount = stonecount + 1
  end

  local requiredStoneCount = Tracker:ProviderCountForCode( "requiredstonecount" )
  if stonecount < requiredStoneCount then
    return 0
  end

  return 1
end

function canSummonDeathtoll()
  if canEnterArea7() <= 0 then
    return 0
  end

  -- Skip the dancing grandmas if we have open deathtoll
  if Tracker:ProviderCountForCode( "opendeathtoll" ) <= 0 then
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

    if Tracker:ProviderCountForCode( "summonphoenix" ) <= 0 then
      return 0
    end
  end

  if Tracker:ProviderCountForCode( "soulmagician" ) <= 0 then
    return 0
  end

  return CanUsePhoenix()
end
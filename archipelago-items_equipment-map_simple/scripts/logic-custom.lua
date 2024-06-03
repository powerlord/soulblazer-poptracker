function canEnterArea2()
  if Tracker:ProviderCountForCode( "openprogression" ) > 0 then
    return 1
  end

  return Tracker:ProviderCountForCode( "chief" )
end

function canEnterArea3()
  if Tracker:ProviderCountForCode( "openprogression" ) > 0 then
    return 1
  end

  if canEnterArea2() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "guardian" )
end

function canEnterArea4()
  if Tracker:ProviderCountForCode( "openprogression" ) > 0 then
    return 1
  end

  if canEnterArea3() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "mermaid" )
end

function canEnterArea5()
  if Tracker:ProviderCountForCode( "openprogression" ) > 0 then
    return 1
  end

  if canEnterArea4() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "nome" )
end

function canEnterArea6()
  if Tracker:ProviderCountForCode( "openprogression" ) > 0 then
    return 1
  end

  if canEnterArea5() <= 0 then
    return 0
  end
  return Tracker:ProviderCountForCode( "marie" )
end

function canEnterArea7()
  if Tracker:ProviderCountForCode( "openprogression" ) <= 0 then
    if canEnterArea6() <= 0 then
      return 0
    end
    if Tracker:ProviderCountForCode( "king" ) <= 0 then
      return 0
    end
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

  -- Skip the red hot items if we have open deathtoll
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
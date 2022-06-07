##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|   \__,_|_| |_|_|\_\\__, |
##|                         __/ |
##|  _____             _   |___/
##| |  __ \           | | (_)
##| | |__) |   _ _ __ | |_ _ _ __ ___   ___
##| |  _  / | | | '_ \| __| | '_ ` _ \ / _ \
##| | | \ \ |_| | | | | |_| | | | | | |  __/
##| |_|  \_\__,_|_| |_|\__|_|_| |_| |_|\___|

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

define(:walking_sleep) do |old_walk, beat, source|
  walk = rdist(0.005, 0)
  if (beat % 2) == 0
    slp = 0.25 + $swing_time
  else
    slp = 0.25 - $swing_time
  end
  total = slp + walk - old_walk
  sleep(total)
  return walk
end

define(:get_sustain) do |beat|
  if (beat % 2) == 0
    slp = 0.25 + $swing_time
  else
    slp = 0.25 - $swing_time
  end
  return slp * 0.85
end

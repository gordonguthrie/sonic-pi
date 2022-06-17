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

define(:rip_sleep) do |beat, rip, source|
  if (beat % 2) == 0
    slp = 0.25 + $swing_time
  else
    slp = 0.25 - $swing_time
  end
  total = slp/rip
  sleep(total)
end

define(:get_sustain) do |beat|
  if (beat % 2) == 0
    slp = 0.25 + $swing_time
  else
    slp = 0.25 - $swing_time
  end
  return slp * 0.85
end

define(:play_bass) do |note, baseamp, pan, no_beats, debug|
  if debug
    print("base note is ", note, "no of beats is", no_beats)
  end
  release = no_beats
  a1 = rdist(0.2, 0.8)
  a2 = rdist(0.2, 0.8)
  a3 = rdist(0.2, 0.8)
  r1 = rdist(0.2, 0.8)
  r2 = rdist(0.2, 0.8)
  r3 = rdist(0.2, 0.8)
  sustain = no_beats
  synth(:sine,   note: note + 12.1, amp: baseamp * 0.2 * a1, pan: pan, release: no_beats * r1)
  synth(:sine,   note: note + 12,   amp: baseamp * 0.2 * a2, pan: pan, release: no_beats * r2)
  synth(:sine,   note: note,        amp: baseamp * 0.5 * a3, pan: pan, release: no_beats * r1)
  synth(:dtri,   note: note - 12,   amp: baseamp * 0.2 * a1, pan: pan, release: no_beats * r2,   attack: 0.01)
  synth(:beep,   note: note - 11.9, amp: baseamp * 0.2 * a2, pan: pan, release: no_beats * r1)

end

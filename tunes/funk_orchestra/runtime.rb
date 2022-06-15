#  _____             _   _
# |  __ \           | | (_)
# | |__) |   _ _ __ | |_ _ _ __ ___   ___
# |  _  / | | | '_ \| __| | '_ ` _ \ / _ \
# | | \ \ |_| | | | | |_| | | | | | |  __/
# |_|  \_\__,_|_| |_|\__|_|_| |_| |_|\___|

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

define(:play_bass) do |note, pan, no_beats, isroot, debug|
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
  synth(:sine,   note: note + 12.1, amp: $BassAmp * 0.2 * a1, pan: pan, release: no_beats * r1)
  synth(:sine,   note: note + 12,   amp: $BassAmp * 0.2 * a2, pan: pan, release: no_beats * r2)
  synth(:sine,   note: note,        amp: $BassAmp * 0.5 * a3, pan: pan, release: no_beats * r1)
  synth(:dtri,   note: note - 12,   amp: $BassAmp * 0.2 * a1, pan: pan, release: no_beats * r2,   attack: 0.01)
  synth(:beep,   note: note - 11.9, amp: $BassAmp * 0.2 * a2, pan: pan, release: no_beats * r1)

  if isroot
    play(note, amp: $BassAmp * 1.0 * a2, pan: pan, release: release * r3)
  else
    play(note, amp: $BassAmp * 0.2 * a3, pan: pan, release: no_beats * r3)
  end
end

define(:swing_time) do
  swing_time = 0.00
  return swing_time
end

define(:get_sleep) do |beat|
  if (beat % 2) == 0
    slp = 0.5 + swing_time
  else
    slp = 0.5 - swing_time
  end

  return slp
end

define(:get_drum) do |kit, dub, hard|
  if !dub
    if !hard
      accent = kit[:ghosts].choose
    else
      accent = kit[:hards].choose
    end

  else
    accent = kit[:dubs].choose
  end

  return accent
end

define(:get_cymbal) do |kit, beat, debug|
  if debug
    print("kit is", kit)
    print("beat is", beat)
  end

  if beat == :ghost
    if (rand > 0.7)
      return kit[:ghosts].choose
    else
      return kit[:main]
    end

  elsif beat == :crash
    return kit[:crashs].choose
  elsif beat == :open
    return kit[:opens].choose
  else
    return kit[:main]
  end
end

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
  synth(:sine,   note: note + 12.1,   amp: 0.2 * a1,   pan: pan,   release: no_beats * r1)
  synth(:sine,   note: note + 12,   amp: 0.2 * a2,   pan: pan,   release: no_beats * r2)
  synth(:sine,   note: note,   amp: 0.5 * a3,   pan: pan,   release: no_beats * r1)
  synth(:dtri,   note: note - 12,   amp: 0.2 * a1,   pan: pan,   release: no_beats * r2,   attack: 0.01)
  synth(:beep,   note: note - 11.9,   amp: 0.2 * a2,   pan: pan,   release: no_beats * r1)

  if isroot
    play(note,     amp: 1 * a2,     pan: pan,     release: release * r3)
  else
    play(note,     amp: 0.2 * a3,     pan: pan,     release: no_beats * r3)
  end
end

define(:play_lead) do |note, pan, no_beats, debug|
  if debug
    print("lead note is ", note, "no of beats is", no_beats)
  end

  a = rdist(0.2, 0.8)
  r = rand
  release = no_beats * 0.3
  sustain = no_beats - release
  synth(:blade,   note: note + 12.1,   amp: 0.1 * a,   pan: pan,   release: no_beats)
  synth(:piano,   note: note + 11.9,   amp: 0.1 * a,   pan: pan,   release: no_beats)
  synth(:piano,   note: note,   amp: 0.7 * a,   pan: pan,   release: no_beats)
  synth(:piano,   note: note - 12,   amp: 0.2 * a,   pan: pan,   release: no_beats)
end

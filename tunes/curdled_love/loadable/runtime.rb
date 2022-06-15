define(:walking_sleep) do |old_walk, beat, source|
  walk = rdist(0.01, 0)
  slp = get_sleep(beat)
  sleep(slp + walk - old_walk)
  return walk
end

define(:get_sleep) do |beat|
  if (beat % 2) == 0
    slp = 0.5 + $swing_time
  else
    slp = 0.5 - $swing_time
  end

  return slp
end

define(:play_kicks) do |kicks, kickamp, bar, dub, hard, has_shaker, shakeramp, globalrandom1, globalrandom2|
  splash = get_drum(kicks, dub[bar], hard[bar])
  drum = ((globalrandom1 > 0.8) ? splash : kicks[:main])
  sinfreq = rdist(10, 70)
  glissf = rdist(0, 0.9)
  att = rdist(0, 0.01)
  a = ((rand < 0.8) ? $normal.call : $ghost.call)

  if globalrandom2 > 0.9
    s = $samplespath + drum
    sample(s,     amp: a * kickamp,     pan: 0.5)
  else
    use_synth(:sc_kick)
    play(    amp: a * kickamp,     pan: 0.5,     sinfreq: sinfreq,     glissf: glissf,     att: att)
  end

  if has_shaker
    if dub[bar]
      shak = $DubShakers.choose
      sample($samplespath + shak,       amp: shakeramp)
    else
      shak = $Shakers.choose
      sample($samplespath + shak,       amp: shakeramp)
    end
  end
end

define(:play_snare) do |snares, snareamp, bar, dub, hard, globalrandom1, globalrandom2|
  splash = get_drum(snares, dub[bar], hard[bar])
  drum = ((globalrandom1 > 0.5) ? splash : snares[:main])
  a = ((rand > 0.6) ? $ghost.call : $normal.call)

  if globalrandom2 > 0.9 || dub[bar] || hard[bar]
    s = $samplespath + drum
    sample(s,     amp: a * snareamp,     pan: 0.5)
  else
    use_synth(:sc_snare)
    play(    amp: a * snareamp* rdist(0.1, 0.5),     pan: 0.3)
  end
end

define(:in_dub) do |bar, dub, reverbfx, echofx|
  if dub[bar]
    control(reverbfx,     mix: 0.4,     room: 1.0)
    control(echofx,     mix: 0.3,     decay: 10)
  else
    control(reverbfx,     mix: 0.3,     room: 0.6)
    control(echofx,     mix: 0.2,     decay: 0.2)
  end
end

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

define(:play_bass) do |note, baseamp, pan, no_beats, isroot, debug|
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

  if isroot
    play(note, amp: baseamp * 1 * a2,   pan: pan, release: release * r3)
  else
    play(note, amp: baseamp * 0.2 * a3, pan: pan, release: no_beats * r3)
  end
end

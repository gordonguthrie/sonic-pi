samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
ghost = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }

define(:walking_sleep) do |old_walk, beat, source|
  walk = rdist(0.01, 0)
  slp = get_sleep(beat)
  sleep(slp + walk - old_walk)
  return walk
end

define(:play_kicks) do |kicks, bar, dub, hard, has_shaker, globalrandom1, globalrandom2|
  splash = get_drum(kicks, dub[bar], hard[bar])
  drum = ((globalrandom1 > 0.8) ? splash : kicks[:main])
  sinfreq = rdist(10, 70)
  glissf = rdist(0, 0.9)
  att = rdist(0, 0.01)
  a = ((rand < 0.8) ? normal.call : ghost.call)

  if globalrandom2 > 0.9
    s = samplespath + drum
    sample(s,     amp: a,     pan: 0.5)
  else
    use_synth(:sc_kick)
    play(    amp: a,     pan: 0.5,     sinfreq: sinfreq,     glissf: glissf,     att: att)
  end

  if has_shaker
    if dub[bar]
      shak = DubShakers.choose
      sample(samplespath + shak,       amp: 0.7)
    else
      shak = Shakers.choose
      sample(samplespath + shak,       amp: 0.7)
    end
  end
end

define(:play_snare) do |snares, bar, dub, hard, globalrandom1, globalrandom2|
  splash = get_drum(snares, dub[bar], hard[bar])
  drum = ((globalrandom1 > 0.5) ? splash : snares[:main])
  a = ((rand > 0.6) ? ghost.call : normal.call)

  if globalrandom2 > 0.9 || dub[bar] || hard[bar]
    s = samplespath + drum
    sample(s,     amp: a,     pan: 0.5)
  else
    use_synth(:sc_snare)
    play(    amp: a * rdist(0.1, 0.5),     pan: 0.3)
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

use_bpm 200
pattern = [7, 11, 13]
strongs = [2, 3, 5]

no_of_patterns = 10

no_of_repeats = 4

random = range(1, no_of_patterns)

patterns = []

define :get_sleeps do | number |
  sleeps = []
  n = 0
  number.times do
    sleep = rrand_i(1, 10)/10.0
    sleeps[n] = sleep
    n = n + 1
  end
  return sleeps
end

define :run_pattern do | pattern |
  n   = pattern[:seed]
  b   = pattern[:beats]
  s   = pattern[:sleeps]
  bar = pattern[:barlength]
  print("number", n)
  print("beats", b)
  print("sleeps", s)
  no_of_repeats.times do
    bar.times do
      beat = b.tick(:b)
      interval = s.tick(:s)
      if beat
        sample :bd_boom
      else
        sample :drum_cymbal_closed
      end
      sleep interval
    end
  end
end

no_of_patterns.times do
  r = random.tick
  use_random_seed r
  p = pattern.choose
  s = strongs.choose
  beats = spread(s, p)
  sleeps = get_sleeps(p)
  patterns[r - 1] = {seed: r, barlength: p, beats: beats, sleeps: sleeps}
end


no_of_patterns.times do
  p = patterns.tick(:patterns)
  sleep 1
  run_pattern(p)
end

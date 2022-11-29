use_bpm 90
pattern = [7, 11, 13]
strongs = [2, 3, 5]

no_of_patterns = 100

no_of_repeats = 4

japan = "~/Dev/sonic-pi/samples/Japanese/"

bassdrums = ["Hirado-A1.wav", "Hirado-A2.wav"] #, "Hirado-B1.wav", "Hirado-B2.wav", "Hirado-B3.wav"]

random = range(1, no_of_patterns)

patterns = []

define :get_sleeps do | number |
  sleeps = []
  n = 0
  number.times do
    ##| sleep = rand
    ##| sleep = 0.3
    sleep = [1.0/12, 1.0/10, 1.0/6, 1.0/5, 1.0/4, 1.0/3, 1.0/2].choose
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
        sample "~/Dev/sonic-pi/samples/Kicks_II/garage_kick.wav"
      else
        sample "~/Dev/sonic-pi/samples/Cymbals/TrashA-01.wav", amp: 0.6
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

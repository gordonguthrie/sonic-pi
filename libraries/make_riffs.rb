define(:make_riff) do |chord_size, kick, pause|
  len = kick.length
  i = 0
  pauseleft = 0
  beats = []
  durations = []

  len.times do
    k = kick[i]

    if k
      beats[i] = 1
      durations[i] = 2
      pauseleft = pause
    else
      if pauseleft < 1
        play = rand < 0.85 ? 1 : 0
        beats[i] = rrand_i(1, chord_size)

        if play == 1
          longdurs = knit(0.5, 1, 0.7, 2, 1, 3)
          shortdurs = knit(0.25, 3, 0.35, 2, 0.4, 2, 0.5, 1)

          if ((i % 2) == 0)
            d = longdurs.choose
          else
            d = shortdurs.choose
          end

          durations[i] = d
        else
          durations[i] = 0
        end

      else
        beats[i] = 0
        durations[i] = 0
      end

      pauseleft = pauseleft - 1
    end

    i += 1
  end

  return ({beats: beats, durations: durations})
end

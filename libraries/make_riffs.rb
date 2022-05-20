define(:make_riff) do |chord_size, kick|
  len = kick.length
  i = 0
  pause = 0
  beats = []
  durations = []

  len.times do
    k = kick[i]

    if k
      beats[i] = 1
      durations[i] = 2.3
      pause = 2
    else
      if pause < 1
        play = rand < 0.85 ? 1 : 0
        beats[i] = rrand_i(1, chord_size)

        if play == 1
          durs = knit(0.4, 2, 0.5, 3, 0.7, 1, 1, 1)
          d = durs.choose
          durations[i] = d
        else
          durations[i] = 0
        end

      else
        beats[i] = 0
        durations[i] = 0
      end

      pause = pause - 1
    end

    i += 1
  end

  return ({beats: beats, durations: durations})
end

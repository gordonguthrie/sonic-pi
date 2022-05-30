use_bpm $bpm

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    old_walk = 0

    live_loop(:hook,     sync: :metronome) do
      8.times do
        bar = $bars.look(:bars) - 1
        beat = $beats.look(:beats) - 1
        key = $keys[bar]

        if $hook[bar]
          if $hooks[beat] != 0
            drum = $Hook[$hooks[beat] - 1]
            sample($samplespath + drum)
          end
        end

        old_walk = walking_sleep(old_walk, beat, "beat3")

        if beat == 15
          $bars.tick(:bars)
        end

        $beats.tick(:beats)
      end
    end
  end
end

##|  _    _             _
##| | |  | |           | |
##| | |__| | ___   ___ | | __
##| |  __  |/ _ \ / _ \| |/ /
##| | |  | | (_) | (_) |   <
##| |_|  |_|\___/ \___/|_|\_\

print("HOOK RELOADED")

use_bpm $bpm

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    old_walk = 0

    live_loop(:hook,     sync: :metronome) do
      bars = $bars
      beats = $beats
      key = $key
      Hook = $hk[:hook]
      rhythm = $hk[:rhythm]
      playhook = $playhook
      8.times do
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1

        if playhook[bar]
          if rhythm[beat] != 0
            drum = Hook[rhythm[beat] - 1]
            sample($samplespath + drum)
          end
        end

        old_walk = walking_sleep(old_walk, beat, "hook")

        if beat == 15
          bars.tick(:bars)
        end

        beats.tick(:beats)
      end
    end
  end
end

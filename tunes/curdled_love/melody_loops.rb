##|   _____              _ _          _
##|  / ____|            | | |        | |
##| | |    _   _ _ __ __| | | ___  __| |
##| | |   | | | | '__/ _` | |/ _ \/ _` |
##| | |___| |_| | | | (_| | |  __/ (_| |
##|  \_____\__,_|_|  \__,_|_|\___|\__,_|
##|   _____ _
##|  / ____| |
##| | |    | |__   ___   ___  _ __
##| | |    | '_ \ / _ \ / _ \| '_ \
##| | |____| | | | (_) | (_) | | | |
##|  \_____|_| |_|\___/ \___/|_| |_|

print("CHOON RELOADED")

use_bpm $bpm

with_fx(:level, amp: 0.5) do
  old_walk = 0

  live_loop(:bass,   sync: :metronome) do
    bars      = $bars
    beats     = $beats
    key       = $key
    funk      = $funk
    bass      = funk[:bass]
    durations = funk[:durations]
    8.times do
      bar  = bars.look(:bars) - 1
      beat = beats.look(:beats) - 1
      Chord1 = (chord(key[:root], "13"))
      m = bass.look(:bass)
      d = durations.look(:durations)
      pan = rdist(0.1, 0.2)
      n = Chord1[m] - 36

      if m != 0
        dur = (d + rdist(0.05, 0)).abs

        if m = 1
          isroot = true
        else
          isroot = false
        end

        play_bass(n, $BassAmp, pan, dur, isroot, false)
      end

      old_walk = walking_sleep(old_walk, beat, "bass")

      if beat == 15
        bars.tick(:bars)
      end

      beats.tick(:beats)
      bass.tick(:bass)
      durations.tick(:durations)
    end
  end
end

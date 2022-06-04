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

        play_bass(n, pan, dur, isroot, false)
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

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.2) do |e|
    old_walk = 0
    live_loop(:lead, sync: :metronome) do
      bars  = $bars
      beats = $beats
      key   = $key
      funk  = $funk
      div   = $divisor
      amp   = $leadamp
      dub   = $playdub
      g1 = funk[:g1]
      g2 = funk[:g2]
      g3 = funk[:g3]
      g4 = funk[:g4]
      gr = funk[:gr]
      ampdist = amp/10.0
      8.times do
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        use_synth :surfbass
        if dub[bar] then
          div = 0.5
        end
        if g1[beat] != :r
          play note: g1[beat].to_i, amp: rdist(ampdist, amp), rel: gr[beat]/div + rdist(0.01, 0)
        end
        if g2[beat] != :r
          play note: g2[beat].to_i, amp: rdist(ampdist, amp), rel: gr[beat]/div + rdist(0.01, 0)
        end
        if g3[beat] != :r
          play note: g3[beat].to_i, amp: rdist(ampdist, amp), rel: gr[beat]/div + rdist(0.01, 0)
        end
        if g4[beat] != :r
          play note: g4[beat].to_i, amp: rdist(ampdist, amp), rel: gr[beat]/div + rdist(0.01, 0)
        end

        old_walk = walking_sleep(old_walk, beat, "lead")

        if beat == 15
          $bars.tick(:bars)
        end

        $beats.tick(:beats)
      end
    end
  end
end

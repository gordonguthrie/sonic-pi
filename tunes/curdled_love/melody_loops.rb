##|   _____ _
##|  / ____| |
##| | |    | |__   ___   ___  _ __
##| | |    | '_ \ / _ \ / _ \| '_ \
##| | |____| | | | (_) | (_) | | | |
##|  \_____|_| |_|\___/ \___/|_| |_|

use_bpm $bpm

with_fx(:level, amp: 0.5) do
  old_walk = 0

  live_loop(:bass,   sync: :metronome) do
    bars       = $bars
    beats      = $beats
    keys       = $keys
    mbass      = $mbass
    mdurations = $mdurations
    8.times do
      bar  = bars.look(:bars) - 1
      beat = beats.look(:beats) - 1
      key  = keys[bar]
      Chord1 = (chord(key[:root], "13"))
      m = mbass.look(:mbass)
      d = mdurations.look(:mdurations)
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
      mbass.tick(:mbass)
      mdurations.tick(:mdurations)
    end
  end
end

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.2) do |e|
    with_fx :compressor do | c |
      old_walk = 0

      live_loop(:lead, sync: :metronome) do
        g1 = $g1
        g2 = $g2
        g3 = $g3
        g4 = $g4
        gr = $gr
        print("gr is", gr)
        div = 8
        control c, amp: 0.001
        8.times do
          bar  = $bars.look(:bars) - 1
          beat = $beats.look(:beats) - 1
          key  = $keys[bar]
          use_synth :picker
          if g1[beat] != :r
            play note: g1[beat].to_i, amp: 0.02, rel: gr[beat]/div + rdist(0.05, 0)
          end
          if g2[beat] != :r
            play note: g2[beat].to_i, amp: 0.02, rel: gr[beat]/div + rdist(0.05, 0)
          end
          if g3[beat] != :r
            play note: g3[beat].to_i, amp: 0.02, rel: gr[beat]/div + rdist(0.05, 0)
          end
          if g4[beat] != :r
            play note: g4[beat].to_i, amp: 0.02, rel: gr[beat]/div + rdist(0.05, 0)
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
end

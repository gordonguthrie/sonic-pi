##|  _____
##| |  __ \
##| | |  | |_ __ _   _ _ __ ___  ___
##| | |  | | '__| | | | '_ ` _ \/ __|
##| | |__| | |  | |_| | | | | | \__ \
##| |_____/|_|   \__,_|_| |_| |_|___/

use_bpm $bpm

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:compressor) do
      old_walk = 0

      live_loop(:beat1,       sync: :metronome) do
        bars        = $bars
        beats       = $beats
        keys        = $keys
        randoms     = $randoms
        dub         = $dub
        hard        = $hard
        has_shaker  = $has_shaker
        rkick       = $rkick
        Kicks       = $Kicks
        rsnare      = $rsnare
        Snares      = $Snares
        hook        = $hook
        8.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          key = keys[bar]
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          in_dub(bar, dub, r, e)

          if !hook[bar]

            if rkick[beat]
              play_kicks(Kicks, bar, dub, hard, has_shaker, globalrandom1, globalrandom2)
            end

            if rsnare[beat]
              play_snare(Snares, bar, dub, hard, globalrandom1, globalrandom2)
            end
          end
          old_walk = walking_sleep(old_walk, beat, "beat1")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
    end
  end
end

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:compressor) do
      old_walk = 0

      live_loop(:beat2,       sync: :metronome) do
        bars        = $bars
        beats       = $beats
        keys        = $keys
        randoms     = $randoms
        dub         = $dub
        hard        = $hard
        rsnare      = $rsnare
        Snares      = $Snares
        hook        = $hook
        8.times do
          bar  = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          key  = keys[bar]
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          in_dub(bar, dub, r, e)
          if !hook[bar]

            if rsnare[beat]
              play_snare(Snares, bar, dub, hard, globalrandom1, globalrandom2)
            end
          end
          old_walk = walking_sleep(old_walk, beat, "beat2")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
    end
  end
end

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:compressor) do
      old_walk = 0

      live_loop(:beat3,       sync: :metronome) do
        bars        = $bars
        beats       = $beats
        keys        = $keys
        randoms     = $randoms
        dub         = $dub
        hard        = $hard
        has_shaker  = $has_shaker
        rkick       = $rkick
        Kicks       = $Kicks
        rcymbal     = $rcymbal
        Cymbals     = $Cymbals
        rsnare      = $rsnare
        Snares      = $Snares
        rsnareacc   = $rsnareacc
        hook        = $hook
        8.times do
          bar  = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          key  = keys[bar]
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          in_dub(bar, dub, r, e)
          if !hook[bar]

            if rkick[beat]
              play_kicks(Kicks, bar, dub, hard, has_shaker, globalrandom1, globalrandom2)
            end

            if (rcymbal[beat] != 0 && rcymbal[beat] != false)
              cymbal = rcymbal[beat] - 1
              cring = Cymbals[:cymbals].ring
              a = $normal.call * Cymbals[:amp]
              s = $samplespath + cring[cymbal]
              sample(s,           amp: a,           pan: rdist(0.03, 0.5))
            end

            if rsnare[beat]
              play_snare(Snares, bar, dub, hard, globalrandom1, globalrandom2)
            end

            if rsnareacc[beat]
              splash = get_drum(Snares, dub[bar], hard[bar])
              a = ((rand > 0.7) ? $ghost.call : $normal.call)
              s = $samplespath + splash
              sample(s,           amp: a * 0.5,           pan: -0.45)
            end
          end
          old_walk = walking_sleep(old_walk, beat, "beat3")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
    end
  end
end

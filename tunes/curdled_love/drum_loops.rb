##|   _____              _ _          _
##|  / ____|            | | |        | |
##| | |    _   _ _ __ __| | | ___  __| |
##| | |   | | | | '__/ _` | |/ _ \/ _` |
##| | |___| |_| | | | (_| | |  __/ (_| |
##|  \_____\__,_|_|  \__,_|_|\___|\__,_|
##|  _____
##| |  __ \
##| | |  | |_ __ _   _ _ __ ___  ___
##| | |  | | '__| | | | '_ ` _ \/ __|
##| | |__| | |  | |_| | | | | | \__ \
##| |_____/|_|   \__,_|_| |_| |_|___/

print("DRUMS RELOADED")

use_bpm $bpm

$KickAmp        = 1.0
$SnareAmp       = 0.8
$SnareSplashAmp = 0.5
$CymbalAmp      = 0.8
$BassAmp        = 1.0
$ShakerAmp      = 0.7
$HookAmp        = 0.5
$VoiceAmp       = 1.0

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:compressor) do
      old_walk = 0

      live_loop(:beat1,       sync: :metronome) do
        bars        = $bars
        beats       = $beats
        key         = $key
        randoms     = $randoms
        playdub     = $playdub
        playhard    = $playhard
        has_shaker  = $has_shaker
        rkick       = $rkick
        Kicks       = $Kicks
        rsnare      = $rsnare
        Snares      = $Snares
        playhook    = $playhook
        8.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          in_dub(bar, playdub, r, e)

          if !playhook[bar]

            if rkick[beat]
              play_kicks(Kicks, $KickAmp, bar, playdub, playhard, has_shaker, $ShakerAmp, globalrandom1, globalrandom2)
            end

            if rsnare[beat]
              play_snare(Snares, $SnareAmp, bar, playdub, playhard, globalrandom1, globalrandom2)
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
        key         = $key
        randoms     = $randoms
        playdub     = $playdub
        playhard    = $playhard
        rsnare      = $rsnare
        Snares      = $Snares
        playhook    = $playhook
        8.times do
          bar  = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          in_dub(bar, playdub, r, e)
          if !playhook[bar]

            if rsnare[beat]
              play_snare(Snares, $SnareAmp, bar, playdub, playhard, globalrandom1, globalrandom2)
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
        key         = $key
        randoms     = $randoms
        playdub     = $playdub
        playhard    = $playhard
        has_shaker  = $has_shaker
        rkick       = $rkick
        Kicks       = $Kicks
        rcymbal     = $rcymbal
        Cymbals     = $Cymbals
        rsnare      = $rsnare
        Snares      = $Snares
        rsnareacc   = $rsnareacc
        playhook    = $playhook
        8.times do
          bar  = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          in_dub(bar, playdub, r, e)
          if !playhook[bar]

            if rkick[beat]
              play_kicks(Kicks, $KickAmp, bar, playdub, playhard, has_shaker, $ShakerAmp, globalrandom1, globalrandom2)
            end

            if (rcymbal[beat] != 0 && rcymbal[beat] != false)
              cymbal = rcymbal[beat] - 1
              cring = Cymbals[:cymbals].ring
              a = $normal.call * Cymbals[:amp]
              s = $samplespath + cring[cymbal]
              sample(s, amp: a * $CymbalAmp , pan: rdist(0.03, 0.5))
            end

            if rsnare[beat]
              play_snare(Snares, $SnareAmp, bar, playdub, playhard, globalrandom1, globalrandom2)
            end

            if rsnareacc[beat]
              splash = get_drum(Snares, playdub[bar], playhard[bar])
              a = ((rand > 0.7) ? $ghost.call : $normal.call)
              s = $samplespath + splash
              sample(s, amp: a * $SnareSplashAmp, pan: -0.45)
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

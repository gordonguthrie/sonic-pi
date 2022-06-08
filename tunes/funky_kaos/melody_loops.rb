##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|   \__,_|_| |_|_|\_\\__, |
##|                         __/ |
##|  __  __      _         |___/
##| |  \/  |    | |         | |
##| | \  / | ___| | ___   __| |_   _
##| | |\/| |/ _ \ |/ _ \ / _` | | | |
##| | |  | |  __/ | (_) | (_| | |_| |
##| |_|  |_|\___|_|\___/ \__,_|\__, |
##|                             __/ |
##|                            |___/

with_fx :reverb, mix: 0.2 do | r |
  with_fx :echo, mix: 0.1 do | e |
    old_walk = 0
    live_loop :bass, sync: :metronome do
      use_bpm $bpm
      bass    = $bass
      bassamp = $bassamp
      beats   = $beats
      bars    = $bars
      dur = block_duration do
        $switch_count.times do
          beat = beats.look(:beats) - 1
          if bass[beat] != :r
            sustain = get_sustain(beat)
            amp = $normal.call * bassamp[beat] * 0.08
            play bass[beat], sustain: sustain, amp: amp
          end
          old_walk = walking_sleep(old_walk, beat, "drums")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
      ##| print("bass block takes", dur)
    end
  end
end

with_fx :reverb, mix: 0.2 do | r |
  with_fx :echo, mix: 0.1 do | e |
    with_fx :whammy, mix: 0.3 do | w |
      old_walk = 0
      live_loop :pad, sync: :metronome do
        use_bpm $bpm
        chords  = $chords
        chplay  = $chplay
        champ   = $champ
        beats   = $beats
        bars    = $bars
        dur = block_duration do
          $switch_count.times do
            beat = beats.look(:beats) - 1
            if chords[beat] != :r
              ch = chord_degree(chords[beat], $key + 36, $mode, [4,5,6,7,8,9].choose)
              if chplay[beat] == "d"
                newch = ch.reverse
              elsif chplay[beat] == "s"
                newch = ch.shuffle
              else
                newch = ch
              end
              a = champ[beat] * 0.1
              use_synth :kalimba
              play_pattern_timed(newch, [0.125, 1.25, 0.25, 0.5].choose, amp: a, attack: 0.001, decay: 0.02, sustain: 0.15, release: 0.15)
            end
            old_walk = walking_sleep(old_walk, beat, "drums")

            if beat == 15
              bars.tick(:bars)
            end

            beats.tick(:beats)
          end
        end
        ##| print("pad block takes", dur)
      end
    end
  end
end

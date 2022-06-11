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
      beats   = $beats
      bars    = $bars
      nbass   = bass[:nbass]
      bassamp = bass[:bassamp]
      dur = block_duration do
        $switch_count.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          if bass[beat] != :r
            sustain = get_sustain(beat)
            amp = $normal.call * bassamp[beat] * $BassAmp
            play nbass[beat], sustain: sustain, amp: amp
          end

          old_walk = walking_sleep(old_walk, beat, "bass")

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

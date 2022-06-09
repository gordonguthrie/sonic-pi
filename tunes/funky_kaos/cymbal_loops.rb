##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|   \__,_|_| |_|_|\_\\__, |
##|                         __/ |
##|   _____                |___/       _
##|  / ____|              | |         | |
##| | |    _   _ _ __ ___ | |__   __ _| |___
##| | |   | | | | '_ ` _ \| '_ \ / _` | / __|
##| | |___| |_| | | | | | | |_) | (_| | \__ \
##|  \_____\__, |_| |_| |_|_.__/ \__,_|_|___/
##|         __/ |
##|        |___/

with_fx :reverb, mix: 0.2 do | r |
  with_fx :echo, mix: 0.1 do | e |
    old_walk = 0
    live_loop :cymbals, sync: :metronome do
      use_bpm $bpm

      cymbal  = $cymbal
      beats   = $beats
      bars    = $bars
      $switch_count.times do
        bar = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        if !$hook[bar]
          if cymbal[beat] != 0
            c = $Cymbals[cymbal[beat] - 1]
            sample c, amp: $normal.call * 0.4, pan: 0.3
          end
        end
        old_walk = walking_sleep(old_walk, beat, "cymbals")

        if beat == 15
          bars.tick(:bars)
        end

        beats.tick(:beats)
      end
    end
  end
end

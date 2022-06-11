##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|   \__,_|_| |_|_|\_\\__, |
##|                         __/ |
##|  ______           _ _  |___/_
##| |  ____|         | (_)   | (_)
##| | |__  _   _  ___| |_  __| |_  __ _ _ __
##| |  __|| | | |/ __| | |/ _` | |/ _` | '_ \
##| | |___| |_| | (__| | | (_| | | (_| | | | |
##| |______\__,_|\___|_|_|\__,_|_|\__,_|_| |_|

with_fx :reverb, mix: 0.2 do | r |
  with_fx :echo, mix: 0.1 do | e |
    old_walk = 0
    count = 0
    live_loop :euclidian, sync: :metronome do
      use_bpm $bpm

      shaker     = $shaker
      euclidians = $euclidians
      punch      = $punch
      clap       = $clap
      beats      = $beats
      bars       = $bars
      Shaker     = $Shaker
      Punch      = $Punch
      Clap       = $Clap
      $switch_count.times do
        beat = beats.look(:beats) - 1
        bar  = bars.look(:bars) - 1
        if !$hook[bar]
          if shaker[bar] && (count % 8 == 1)
            sample $samplespath + Shaker, amp: rdist(.01, $ShakerAmp)
          end
          if euclidians[bar] && punch[beat]
            sample $samplespath + Punch, amp: rdist(0.01, $PunchAmp)
          end
          if euclidians[bar] && clap[beat]
            sample $samplespath + Clap, amp: rdist(0.1, $ClapAmp)
          end
        end

        old_walk = walking_sleep(old_walk, beat, "Euclidians")

        if beat == 15
          bars.tick(:bars)
        end

        count = count + 1
        beats.tick(:beats)
      end
    end
  end
end

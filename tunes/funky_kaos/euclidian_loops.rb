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

      shaker   = $shaker
      steelies = $steelies
      beats    = $beats
      bars     = $bars
      $switch_count.times do
        beat = beats.look(:beats) - 1
        bar  = bars.look(:bars) - 1
        if shaker[bar] && (count % 8 == 1)
          sample $samplespath + "Wierdos/vibra-crunchy-1.wav", amp: 0.2
        end
        if steelies[beat]
          sample $samplespath + "Wierdos/three-beep-stereo.wav", amp: 0.1
          ##| sample $samplespath + "Punches/mellow-stab.wav", amp: 0.3
          ##| sample $samplespath + "Springs/Amazing Stereo Spring.aif", amp: 0.3
        end

        old_walk = walking_sleep(old_walk, beat, "drums_2")

        if beat == 15
          bars.tick(:bars)
        end

        count = count + 1
        beats.tick(:beats)
      end
    end
  end
end

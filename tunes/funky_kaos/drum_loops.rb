##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|___\__,_|_| |_|_|\_\\__, |
##| |  __ \                 __/ |
##| | |  | |_ __ _   _ _ __|___/ ___
##| | |  | | '__| | | | '_ ` _ \/ __|
##| | |__| | |  | |_| | | | | | \__ \
##| |_____/|_|   \__,_|_| |_| |_|___/

kdrum = :bd_tek
sdrum = :drum_tom_lo_soft

with_fx :compressor do
  with_fx :reverb, mix: 0.2 do | r |
    with_fx :echo, mix: 0.1 do | e |
      old_walk = 0
      live_loop :drums_1, sync: :metronome do
        use_bpm $bpm

        kick    = $kick
        snare   = $snare
        beats   = $beats
        bars    = $bars
        $switch_count.times do
          beat = beats.look(:beats) - 1
          if kick[beat] then
            sinfreq = rdist(10, 70)
            glissf = rdist(0, 0.9)
            att = rdist(0, 0.01)
            a = $normal.call * 0.2
            use_synth(:sc_kick)
            play(amp: a, pan: 0.5, sinfreq: sinfreq, glissf: glissf,     att: att)
          end
          if snare[beat] then
            sample sdrum, amp: $normal.call * 0.4, pan: 0.8
          end

          old_walk = walking_sleep(old_walk, beat, "drums_ 1")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
    end
  end

  with_fx :reverb, mix: 0.2 do | r |
    with_fx :echo, mix: 0.1 do | e |
      old_walk = 0
      live_loop :drums_2, sync: :metronome do
        use_bpm $bpm

        kick    = $kick
        snare   = $snare
        beats   = $beats
        bars    = $bars
        $switch_count.times do
          beat = beats.look(:beats) - 1
          if kick[beat] then
            sinfreq = rdist(10, 70)
            glissf = rdist(0, 0.9)
            att = rdist(0, 0.01)
            a = $normal.call * 0.2
            use_synth(:sc_kick)
            play(amp: a, pan: -0.5, sinfreq: sinfreq, glissf: glissf,     att: att)
          end
          if snare[beat] then
            sample sdrum, amp: $normal.call * 0.4, pan: -0.8
          end

          old_walk = walking_sleep(old_walk, beat, "drums_2")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
    end
  end


  with_fx :reverb, mix: 0.2 do | r |
    with_fx :echo, mix: 0.1 do | e |
      old_walk = 0
      live_loop :drums_3, sync: :metronome do
        use_bpm $bpm

        snare   = $snare
        beats   = $beats
        bars    = $bars
        $switch_count.times do
          beat = beats.look(:beats) - 1
          if snare[beat] then
            sample sdrum, amp: $normal.call * 0.4, pan: -0.1
          end

          old_walk = walking_sleep(old_walk, beat, "drums_3")

          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
        end
      end
    end
  end
end

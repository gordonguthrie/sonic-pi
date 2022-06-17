##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|   \__,_|_| |_|_|\_\\__, |
##|                         __/ |
##|                        |___/
##|  _    _             _
##| | |  | |           | |
##| | |__| | ___   ___ | | __
##| |  __  |/ _ \ / _ \| |/ /
##| | |  | | (_) | (_) |   <
##| |_|  |_|\___/ \___/|_|\_\

print("HOOK RELOADED")

$Toms = [
  "Toms/K3Tom-01.wav",
  "Toms/K3Tom-05.wav",
  "Toms/K5-Tom01a.wav",
  "Toms/K5-Tom01c.wav",
  "Toms/K5-Tom03a.wav",
  "Toms/K5-Tom03b.wav",
  "Toms/K5-Tom03c.wav",
].ring

rips = (knit, 2, 3, 3, 2)

roll1 = tabb(["1000","0100","0010","0000"])
roll2 = tabb(["1001","0101","0010","1010"])
roll3 = tabb(["1011","0101","0110","1010"])
roll4 = tabb(["1011","0110","1101","1011"])

rip0  = tabb(["0000","0000","0000","0000"])
rip1  = tabb(["0000","0100","0000","0000"])
rip2  = tabb(["0000","0000","0100","0000"])
rip3  = tabb(["0000","0000","0001","0000"])


hook1 = {rolls: [roll1, roll2, roll3],
         rips:  [rip1,  rip0,  rip0]}

hook2 = {rolls: [roll1, roll2, roll4],
         rips:  [rip0,  rip2,  rip0]}

hook3 = {rolls: [roll1, roll3, roll4],
         rips:  [rip0,  rip0,  rip0]}


Hooks = [hook1, hook2, hook3].ring

with_fx :compressor do
  with_fx :reverb, mix: 0.2 do | r |
    with_fx :echo, mix: 0.1 do | e |
      old_walk = 0
      live_loop :hooks_1, sync: :metronome do
        use_bpm $bpm
        beats  = $beats
        bars   = $bars
        tom    = $Toms.choose
        $switch_count.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          h = Hooks.look(:hook)
          roll = h[:rolls][0]
          rip = h[:rips][0]
          if $hook[bar] && roll[beat]
            if !rip[beat]
              sample $samplespath + tom, amp: rdist(0.05, $HookAmp), pan: rdist(0.1, -0.3)
              old_walk = walking_sleep(old_walk, beat, "hooks_1")
            else
              r = rips.choose
              r.times do
                sample $samplespath + tom, amp: rdist(0.05, $HookAmp), pan: rdist(0.1, -0.3)
                rip_sleep(beat, r, "hooks1")
              end
            end
          else
            old_walk = walking_sleep(old_walk, beat, "hooks_1")
          end
          if beat == 15
            bars.tick(:bars)
            Hooks.tick(:hook)
          end

          beats.tick(:beats)

        end
      end
    end
  end
end

with_fx :compressor do
  with_fx :reverb, mix: 0.2 do | r |
    with_fx :echo, mix: 0.1 do | e |
      old_walk = 0
      live_loop :hooks_2, sync: :metronome do
        use_bpm $bpm
        beats  = $beats
        bars   = $bars
        tom    = $Toms.choose
        $switch_count.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          h = Hooks.look(:hook)
          roll = h[:rolls][1]
          rip = h[:rips][1]
          if $hook[bar] && roll[beat]
            if !rip[beat]
              sample $samplespath + tom, amp: rdist(0.05, $HookAmp), pan: rdist(0.1, -0.2)
              old_walk = walking_sleep(old_walk, beat, "hooks_2")
            else
              r = rips.choose
              r.times do
                sample $samplespath + tom, amp: rdist(0.05, $HookAmp), pan: rdist(0.1, -0.2)
                rip_sleep(beat, r, "hooks2")
              end
            end
          else
            old_walk = walking_sleep(old_walk, beat, "hooks_2")
          end
          if beat == 15
            bars.tick(:bars)
            Hooks.tick(:hook)
          end

          beats.tick(:beats)

        end
      end
    end
  end
end

with_fx :compressor do
  with_fx :reverb, mix: 0.2 do | r |
    with_fx :echo, mix: 0.1 do | e |
      old_walk = 0
      live_loop :hooks_3, sync: :metronome do
        use_bpm $bpm
        beats  = $beats
        bars   = $bars
        tom    = $Toms.choose
        $switch_count.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          h = Hooks.look(:hook)
          roll = h[:rolls][2]
          rip = h[:rips][2]
          if $hook[bar] && roll[beat]
            if !rip[beat]
              sample $samplespath + tom, amp: rdist(0.05, $HookAmp), pan: rdist(0.1, -0.4)
              old_walk = walking_sleep(old_walk, beat, "hooks_1")
            else
              r = rips.choose
              r.times do
                sample $samplespath + tom, amp: rdist(0.05, $HookAmp), pan: rdist(0.1, -0.4)
                rip_sleep(beat, r, "hooks1")
              end
            end
          else
            old_walk = walking_sleep(old_walk, beat, "hooks_3")
          end
          if beat == 15
            bars.tick(:bars)
            Hooks.tick(:hook)
          end

          beats.tick(:beats)

        end
      end
    end
  end
end

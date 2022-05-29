with_fx(:level, amp: 0.5) do
  old_walk = 0

  live_loop(:bass,   sync: :metronome) do
    bar = bars.look(:bars) - 1
    beat = beats.look(:beats) - 1
    key = Keys[bar]
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
    mbase.tick(:mbass)
    mdurations.tick(:mdurations)
  end
end

##| with_fx :reverb, mix: 0.3 do | r |
##|   with_fx :echo, mix: 0.25 do | e |
##|     old_walk = 0

##|     live_loop :lead, sync: :metronome do
##|       print("in lead live loop")
##|       bar  = bars.look(:bars) - 1
##|       beat = beats.look(:beats) - 1
##|       key  = Keys[bar]
##|       if hook == false then

##|         Chord = [(chord key[:root], :maj), (chord key[:root], :major7), (chord key[:root], :m9)].choose
##|         print("Chord for lead", Chord)
##|         use_synth :surfbass
##|         play freq: Chord[0] - 12, muteSus: 2.0
##|         play freq: Chord[1] - 12, muteSus: 2.0
##|         play freq: Chord[2] - 12, muteSus: 2.0
##|         play freq: Chord[3] - 12, muteSus: 2.0
##|       end
##|       old_walk = walking_sleep(old_walk, beat, "bass")
##|       if beat == 15 then
##|         bars.tick(:bars)
##|       end
##|       beats.tick(:beats)
##|     end
##|   end
##| end

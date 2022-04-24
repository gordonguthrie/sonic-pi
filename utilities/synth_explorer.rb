define :loop_over_synths do |args|
  
  defaultargs={start_octave: 1, end_octave: 8, start_synth: 1, end_synth: 42}
  
  synths = [:beep,
            :blade,
            :bnoise,
            :chipbass,
            :chiplead,
            :chipnoise,
            :cnoise,
            :dark_ambience,
            :dpulse,
            :dsaw,
            :dtri,
            :dull_bell,
            :fm,
            :gnoise,
            :growl,
            :hollow,
            :hoover,
            :kalimba,
            :mod_beep,
            :mod_dsaw,
            :mod_fm,
            :mod_pulse,
            :mod_saw,
            :mod_sine,
            :mod_tri,
            :noise,
            :piano,
            :pluck,
            :pnoise,
            :pretty_bell,
            :prophet,
            :pulse,
            :rodeo,
            :saw,
            :sine,
            :square,
            :subpulse,
            :supersaw,
            :tb303,
            :tech_saws,
            :tri,
            :zawa]
  
  octaves = [
    [:C1, :E1, :G1],
    [:C2, :E2, :G2],
    [:C3, :E3, :G3],
    [:C4, :E4, :G4],
    [:C5, :E5, :G5],
    [:C6, :E6, :G6],
    [:C7, :E7, :G7],
  [:C8, :E8, :G8]]
  
  print("args is ", args)
  
  start_octave = get_arg(args, :start_octave, 1)
  end_octave = get_arg(args, :end_octave, 8)
  start_synth = get_arg(args, :start_synth, 1)
  end_synth = get_arg(args, :end_synth, 42)
  
  if (start_octave < 1 or end_octave > 8 or start_synth < 1 or end_synth > 42) then
    print("invalid options", args)
    print("start_octave ", start_octave)
    print("end_octave ", end_octave)
    print("start_synth", start_synth)
    print("end_synth", end_synth)
  else
    
    i = start_octave - 1
    (end_octave - start_octave).times do
      notes = octaves[i]
      i = i + 1
      j = start_synth
      (end_synth - start_synth).times do
        print("playing ", synths[j])
        print("in octave ", notes)
        play_synth_chord synths[j], notes
        play_synth_notes synths[j], notes
        j = j + 1
      end
    end
  end
end

define :get_arg do | args, key, default |
  if args == nil then
    return default
  else
    if args.keys.include? key then
      return args[key]
    else
      return default
    end
  end
end

define :play_synth_chord do |synth, notes|
  use_synth synth
  play notes[0]
  play notes[1]
  play notes[2]
  sleep 1
end

define :play_synth_notes do |synth, notes|
  use_synth synth
  play notes[0]
  sleep 1
  play notes[1]
  sleep 1
  play notes[2]
  sleep 1
end


# loop_over_synths({start_octave: 1, end_octave: 8, start_synth: 1, end_synth: 43})
loop_over_synths({start_octave: 5, start_synth: 1, end_synth: 42})

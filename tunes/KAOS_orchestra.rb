use_debug false

current_bpm = 120
use_bpm current_bpm

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")

use_random_seed 47

beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

ghost  = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }


Kicks = ["Kicks_II/BOOM.wav",
         "Kicks_II/garage_kick.wav",
         "Kicks_II/808distbd.wav",
         "Kicks_II/dark-verby-kicker.wav",
         "Kicks/Xperimental Kick Sub.aif",
         "Kicks_II/lowdrum.wav",
         "Kicks/ElecK02-Kick01.wav"
         ]
Snares = ["Snares/LudSnrA-01.wav",
          "Snares/LudSnrA-02.wav",
          "Snares/LudSnrA-03.wav",
          "Snares/LudSnrA-04.wav",
          "Snares/LudSnrA-05.wav"
          ]
Cymbals = ["Cymbals/TrashA-02.wav",
           "Cymbals/TrashA-04.wav",
           "Cymbals/TrashA-09.wav",
           "Cymbals/TrashB-01.wav"
           ]
WierdosI = ["Wierdos/typewriter-bell.wav",
            "Wierdos/Knife-01.wav",
            "Wierdos/Frog1-simple.wav",
            "Wierdos/spank.wav",
            "Wierdos/gunshot.wav",
            "Wierdos/ricochet.wav",
            "Wierdos/ratatat.wav",
            "Wierdos/reload.wav",
            ]

kicks1      =  make("1000001010000010")
kicks2      =  make("1000001010000000")

kicks = kicks1

bass0 = ring(0)
bass1 = make_riff(13, kicks.repeat(5))

bass      = bass1[:beats]
durations = bass1[:durations]

define :play_bass do | note, duration, debug |
  if debug then
    print("base note is ", note, "duration is", duration)
  end
  a1  = rdist(0.2, 0.5)
  a2  = rdist(0.2, 0.5)
  a3  = rdist(0.2, 0.5)
  r1  = rdist(0.1, duration)
  r2  = rdist(0.1, duration)
  pan = rdist(0.3, 0)
  synth :dsaw, note: note + 12.1, amp: 0.2 * a1, pan: pan, release: r1
  synth :dsaw, note: note + 12,   amp: 0.2 * a2, pan: pan, release: r2
  synth :sine, note: note,        amp: 0.5 * a3, pan: pan, release: r1
  synth :dtri, note: note - 12,   amp: 0.2 * a1, pan: pan, release: r2, attack: 0.01
  synth :beep, note: note - 11.9, amp: 0.2 * a2, pan: pan, release: r1
end

define :trig do | thing, value |
  sync :trigs
  sleep 0.2
  print("trigger is", thing, "value is", value, "pan is", ((value - 1) % 4))
  pan = (value - 2.5)/1.8
  a = ((rand < 0.8) ? normal.call : ghost.call)
  if (thing == "kick") then
    sinfreq = rdist(10, 70)
    glissf = rdist(0.05, 0.9)
    att = rdist(0.001, 0.01)
    if rand < 0.85 then
      use_synth :sc_kick
      play amp: a * 0.5, pan: pan + rdist(0.1, 0), sinfreq: sinfreq, glissf: glissf, att: att
    else
      s = samplespath + Kicks.choose
      sample s, amp: a, pan: pan + rdist(0.1, 0)
    end
  elsif (thing == "snare") then
    sinfreq = rdist(10, 180)
    att = rdist(0.01, 0.01)
    rel = rdist(0.01, 0.2)
    ffreq = rdist(200, 2000)
    if rand < 0.85 then
      use_synth :sc_snare
      play amp: a * 0.1, pan: pan + rdist(0.1, 0), sinfreq: sinfreq, att: att, rel: rel, ffreq: ffreq
    else
      s = samplespath + Snares.choose
      sample s, amp: a, pan: pan + rdist(0.1, 0)
    end
  elsif (thing == "cymbal") then
    s = samplespath + Cymbals.choose
    sample s, amp: a, pan: pan + rdist(0.1, 0)
  elsif (thing == "chord") then
    n = (chord :c2, ['13', '9', '7-9'].choose).choose
    use_synth :organTonewheel0
    freq = midi_to_hz(n)
    dur = rdist(0.3, 0.5)
    play freq: freq, amp: a, pan: pan + rdist(0.1, 0), dur: dur
  else
    s = samplespath + WierdosI[value - 1]
    sample s, amp: a, pan: rdist(1, 0)
  end
end

define :swing_time do
  swing_time = 0.0
  return swing_time
end

define :get_sleep do | beat |
  if (beat % 2) == 0
    slp = 0.5 + swing_time
  else
    slp = 0.5 - swing_time
  end
  return slp
end

define :loop_drum do | name, sample, kicks, beats |
  live_loop name, sync: :metronome do
    b = beats.look(:beat)
    k = kicks.look(:kick)
    if k then
      print("drum fires")
      s = samplespath + sample
      ##| sample s
    else
      print("tick")
    end
    slp = get_sleep(b)
    sleep slp
    kicks.tick(:kick)
    beats.tick(:beat)
  end
end

define :loop_bass do | bass, durations, beats, debug |
  Chord = (chord :c2, '13')
  with_fx :lpf, cutoff: 60 do
    live_loop :bass, sync: :metronome do
      beat = beats.look
      b = bass.look(:bass)
      d = durations.look(:duration)
      if d != 0 then
        play_bass(Chord[b], d, debug)
      end
      slp = get_sleep(beat)
      sleep slp
      beats.tick
      bass.tick(:bass)
      durations.tick(:duration)
    end
  end
end

##| with_fx :reverb, mix: 0.3 do
##|   with_fx :echo, mix: 0.25 do
with_fx :compressor do
  loop_drum(:kick, "Japanese/okedo-A4.wav", kicks, beats)
end
##|   end
##| end

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.25 do
    with_fx :compressor do
      loop_bass(bass, durations, beats, false)
    end
  end
end

live_loop :controller1 do
  use_real_time
  a = sync "/*/*/gridButton1"
  trig("kick", 1)
end
live_loop :controller2 do
  use_real_time
  a = sync "/*/*/gridButton2"
  trig("kick", 2)
end
live_loop :controller3 do
  use_real_time
  a = sync "/*/*/gridButton3"
  trig("kick", 3)
end
live_loop :controller4 do
  use_real_time
  a = sync "/*/*/gridButton4"
  trig("kick", 4)
end
live_loop :controller5 do
  use_real_time
  a = sync "/*/*/gridButton5"
  trig("snare", 1)
end
live_loop :controller6 do
  use_real_time
  a = sync "/*/*/gridButton6"
  trig("snare", 2)
end
live_loop :controller7 do
  use_real_time
  a = sync "/*/*/gridButton7"
  trig("snare", 3)
end
live_loop :controller8 do
  use_real_time
  a = sync "/*/*/gridButton8"
  trig("snare", 4)
end
live_loop :controller9 do
  use_real_time
  a = sync "/*/*/gridButton9"
  trig("cymbal", 1)
end
live_loop :controller10 do
  use_real_time
  a = sync "/*/*/gridButton10"
  trig("cymbal", 2)
end
live_loop :controller11 do
  use_real_time
  a = sync "/*/*/gridButton11"
  trig("cymbal", 3)
end
live_loop :controller12 do
  use_real_time
  a = sync "/*/*/gridButton12"
  trig("cymbal", 4)
end
live_loop :controller13 do
  use_real_time
  a = sync "/*/*/gridButton13"
  trig("chord", 1)
end
live_loop :controller14 do
  use_real_time
  a = sync "/*/*/gridButton14"
  trig("chord", 2)
end
live_loop :controller15 do
  use_real_time
  a = sync "/*/*/gridButton15"
  trig("chord", 3)
end
live_loop :controller16 do
  use_real_time
  a = sync "/*/*/gridButton16"
  trig("chord", 4)
end
live_loop :controller17 do
  use_real_time
  a = sync "/*/*/gridButton17"
  trig("effect", 1)
end
live_loop :controller18 do
  use_real_time
  a = sync "/*/*/gridButton18"
  trig("effect", 2)
end
live_loop :controller19 do
  use_real_time
  a = sync "/*/*/gridButton19"
  trig("effect", 3)
end
live_loop :controller20 do
  use_real_time
  a = sync "/*/*/gridButton20"
  trig("effect", 4)
end
live_loop :controller21 do
  use_real_time
  a = sync "/*/*/gridButton21"
  trig("effect", 5)
end
live_loop :controller22 do
  use_real_time
  a = sync "/*/*/gridButton22"
  trig("effect", 6)
end
live_loop :controller23 do
  use_real_time
  a = sync "/*/*/gridButton23"
  trig("effect", 7)
end
live_loop :controller24 do
  use_real_time
  a = sync "/*/*/gridButton24"
  trig("effect", 8)
end

live_loop :syncher, sync: :metronome  do
  8.times do
    sleep 0.3
    print("trig fires")
    cue :trigs
    beat = beats.look
    slp = get_sleep(beat) - 0.3
    sleep slp
    beats.tick
  end
end

live_loop :metronome do
  sleep 8
end
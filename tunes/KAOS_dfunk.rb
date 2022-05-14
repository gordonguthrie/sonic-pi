# The funky drummer
# The aim here is to experiment with
# a) sequencing drums
# b) playing with 'time feel' which is
#    music-speak for how the beat feels,
#    ranging from robotic (0.0 swing_time)
#    to ultra funky Fresh Prince of Bel Air
#    theme tune style (0.2+ swing_time)

use_debug false

current_bpm = 180
use_bpm current_bpm
samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"

beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

define :swing_time do
  swing_time = 0.1
  return swing_time
end

define :get_drum do | kit, dub, hard |
  if ! dub then
    if ! hard then
      accent = kit[:ghosts].choose
    else
      accent = kit[:hards].choose
    end
  else
    accent = kit[:dubs].choose
  end
  return accent
end

define :get_cymbal do | kit, beat, debug |
  if debug then
    print("kit is", kit)
    print("beat is", beat)
  end
  if beat == :ghost then
    return kit[:ghosts].choose
  elsif beat == :crash then
    return kit[:crashs].choose
  elsif beat == :open then
    return kit[:opens].choose
  else
    return kit[:main]
  end
end

define :play_bass do | note, pan, no_beats, debug |
  if debug then
    print("base note is ", note, "no of beats is", no_beats)
  end
  synth :sine, note: note + 12.1, amp: 0.1, pan:  pan, release: no_beats
  synth :sine, note: note + 12,   amp: 0.1, pan:  pan, release: no_beats
  synth :sine, note: note,        amp: 0.3, pan:  pan, release: no_beats
  synth :dtri, note: note - 12,   amp: 0.2, pan:  pan, release: no_beats
  synth :beep, note: note - 11.9, amp: 0.1, pan:  pan, release: no_beats
  play note, pan: pan, release: no_beats
end

define :get_sleep do | beat |
  if (beat % 2) == 0
    slp = 0.5 + swing_time
  else
    slp = 0.5 - swing_time
  end
  return slp
end

Keys = (ring, {root: :C, scale: :major}, {root: :A, scale: :minor}, {root: :F, scale: :major}, {root: :D, scale: :minor})

# Kits

Kicks1 = {main: "Kicks_II/BOOM.wav",
          ghosts: [
            "Kicks_II/garage_kick.wav",
            "Kicks_II/808distbd.wav",
            "Kicks_II/dark-verby-kicker.wav",
            "Kicks/Xperimental Kick Sub.aif",
            "Kicks_II/lowdrum.wav",
            "Kicks/ElecK02-Kick01.wav"
          ],
          hards: [
            "Kicks_II/broken-head-drum.wav",
            "Japanese/big_taiko.wav",
            "Japanese/taiko_1.wav"
          ],
          dubs: [
            "Kicks_II/808bd3.wav",
            "Kicks_II/808distbd.wav",
            "Kicks_II/bjorn1.wav",
            ##| "Kicks_II/bjorn1.wav",
            ##| "Japanese/okedo-A4.wav",
            ##| "Kicks/Kick - Slow & Low.wav"
]}

Kicks2 = {main: "Kicks/ElecK01-Kick02.wav",
          ghosts: [
            "Kicks_II/garage_kick.wav",
            "Kicks_II/BOOM.wav",
            "Kicks/Xperimental Kick Sub.aif",
            "Kicks_II/lowdrum.wav",
            "Kicks/ElecK02-Kick01.wav"
          ],
          hards: [
            "Kicks_II/broken-head-drum.wav",
            "Japanese/big_taiko.wav",
            "Japanese/taiko_1.wav"
          ],
          dubs: [
            "Kicks_II/bjorn1.wav",
            "Japanese/okedo-A4.wav",
            "Kicks/Kick - Slow & Low.wav"
]}

Snares1 = {main: "Snares/LudSnrA-01.wav",
           ghosts: [
             "Snares/LudSnrA-02.wav",
             "Snares/LudSnrA-03.wav",
             "Snares/LudSnrA-04.wav",
             "Snares/LudSnrA-05.wav"
           ],
           hards: [
             "Snares_II/tuned_tight.wav",
             "Snares_II/nice_acoustic_sd.wav",
             "Snares_II/ambient_snare.wav",
             ##| "Snares_II/complex_live_snare.wav",
             ##| "Snares_II/complex_live_snare_2.wav",
             ##| "Snares_II/complex_live_snare_3.wav",
             ##| "Snares_II/double-snare.wav",
             ##| "Snares_II/naturalsd.wav",
             ##| "Snares_II/high-reggae-snare.wav",
             ##| "Snares_II/natural-sd-rim-on-3.wav",
             ##| "Snares_II/natural-sd-rim-on-4.wav",
             ##| "Snares_II/snareclock.wav"
           ],
           dubs: [
             "Snares_II/chunky-big-snare2.wav",
             "Snares_II/dirty_exploded_snare.wav",
             "Snares_II/double-reverb-stick.wav",
             ##| "Snares_II/hard_rock_snare.wav",
             ##| "Snares_II/hard_rock_snare.wav",
             ##| "Snares_II/hard_rock_snare_6.wav",
             ##| "Snares_II/natural-sd-rim-on-1.wav",
             ##| "Snares_II/natural-sd-rim-on-2.wav",
             ##| "Snares_II/ringing-trick-snare.wav",
             ##| "Snares_II/tuned_tight.wav"
]}

Cymbals1 = {main: "Cymbals/TrashA-09.wav",
            ghosts: [
              "Cymbals/TrashA-02.wav",
              "Cymbals/TrashA-04.wav",
              "Cymbals/TrashA-09.wav",
              "Cymbals/TrashB-01.wav",
              ##| "Cymbals/TrashB-02.wav",
              ##| "Cymbals/TrashB-03.wav",
              ##| "Cymbals/TrashC-04.wav",
              ##| "Cymbals/TrashDF-02.wav"
            ],
            crashs: [
              "Cymbals/TrashA-05.wav",
              "Cymbals/TrashA-06.wav",
              ##| "Cymbals/TrashA-07.wav",
              ##| "Cymbals/TrashA-08.wav",
              ##| "Cymbals/TrashDF-03.wav"
            ],
            opens: [
              "Cymbals/TrashC-01.wav",
              "Cymbals/TrashC-02.wav",
              "Cymbals/TrashC-03.wav"
]}

rkick0 = rsnare0 = rcymbal0 = dub0 = hard0 = ring(false)

define :make_riff do | chord_size, kick |
  len = kick.length
  print("chord size is", chord_size)
  print("len is", len)
  return rmake("100230000032400")
end

#                   "1234567890123456"
rkick1      =  make("1000001010000010")
rsnare1     =  make("0101010101010101")
rsnare2     =  make("0101010001011101")
rsnareacc1  =  make("0000100000001000")
rcymbal1    = cmake("0111011101120111")
rcymbal2    = cmake("1212121212121212")
rcymbal3    = cmake("1221122113311221")

dub1  = make("00100010")
dub2  = make("00111000")
hard1 = make("00000100")
hard2 = make("00011100")

Kicks   = Kicks1
Snares  = Snares1
Cymbals = Cymbals1

rkick      = rkick1
rcymbal    = rcymbal1
rsnare     = rsnare2
rsnareacc  = rsnareacc1

mbase1 =  make_riff(5, rkick)
mbase  = mbase1

dub  = dub0
hard = hard2

with_fx :reverb, mix: 0.0 do
  with_fx :echo, mix: 0.0 do
    with_fx :compressor do
      
      live_loop :beat, sync: :metronome do
        
        ghost = -> { rrand(0.2, 0.3) }
        normal = -> { rrand(0.4, 0.6) }
        accent = -> { rrand(0.8, 0.9) }
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        ##| print("beat is", beat, "and bar is", bar, "key is", key)
        
        if rkick[beat] then
          accent = get_drum(Kicks, dub[bar], hard[bar])
          drum = ((rand > 0.8) ? accent : Kicks[:main])
          s = samplespath + drum
          sample s, amp: ((rand < 0.8) ? normal.call : ghost.call)
        end
        
        if (rcymbal[beat] != false) then
          c = get_cymbal(Cymbals, rcymbal[beat], false)
          a = ((beat % 2) == 0 ? ghost.call : normal.call )
          s = samplespath + c
          sample s, amp: a, pan: 0.5 if rand < 0.9
        end
        
        if rsnare[beat] then
          accent = get_drum(Snares, dub[bar], hard[bar])
          r1 = rand
          drum = ((r1 > 0.7) ? accent : Snares[:main])
          r2 = rand
          a = ((r2 > 0.6) ? ghost.call : normal.call)
          s = samplespath + drum
          sample s, amp: a * 0.7, pan: -0.3
        end
        
        if rsnareacc[beat] then
          accent = get_drum(Snares, dub[bar], hard[bar])
          a = ((rand > 0.7) ? ghost.call : normal.call)
          s = samplespath + accent
          sample s, amp: a * 0.7, pan: 0.3
        end
        
        slp = get_sleep(beat)
        sleep slp
        
        if beat == 15 then
          bars.tick(:bars)
        end
        beats.tick(:beats)
      end
    end
  end
end

with_fx :level, amp: 0.3 do
  live_loop :bass, sync: :metronome do
    bar  = bars.look(:bar) - 1
    beat = beats.look(:beats) - 1
    key  = Keys[bar]
    Chord = (chord key[:root], '9')
    if rkick[beat] then
      n = Chord[0] - 24
      play_bass(n, rdist(0.2, 0), 2 + rdist(0.2, 0), false)
    end
    m = mbase.look(:mbase)
    if m != 0 then
      n = Chord[m] - 24
      play_bass(n, rdist(0.2, 0), 0.25 + rdist(0.1, 0), false)
    end
    slp = get_sleep(beat)
    sleep slp
    if beat == 15 then
      bars.tick(:bars)
    end
    beats.tick(:beats)
    mbase.tick(:mbase)
  end
end

live_loop :metronome do
  sleep 1
end


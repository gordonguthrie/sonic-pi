
Seq1  = ring(2, 4, 5)
Seq2  = ring(5, 4, 1)
Seq3  = ring(2, 1, 5)
Seq4  = ring(1, 4, 5, 1)
Seq5  = ring(1, 4, 5, 4)
Seq6  = ring(1, 6, 4, 5)
Seq7  = ring(1, 5, 6, 4)
Seq8  = ring(6, 4, 1, 5)
Seq9  = ring(1, 5, 4, 3, 4, 1, 4, 5)
Seq10 = ring(1, 1, 1, 4, 4, 1, 1, 5, 5, 4, 1)


C = $majChordsA
S = Seq1


R = ring(1, 0.5, 0.5, 0,5, 1, 1, 0.75).shuffle

use_bpm 55

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"

Cymbals0 = (ring, :r)
Cymbals1 = (ring, 1, 1, 1, :r, 1, :r, 1, :r)
Cymbals2 = (ring, 1, 8, 8, :r, 5, :r, 8, :r)
Cymbals3 = (ring, 1, 1, 1,  0, 1, :r, 1, :r)

BaseDrum0  = (ring, :r)
BaseDrum1a = (ring,  2, :r, :r, :r,  2, :r, :r, :r,  2,  3,  8, :r,  2, :r, :r, :r)
BaseDrum1b = (ring, 17, :r, :r, :r, 17, :r, :r, :r,  5, 17,  5, :r, 17, :r, :r, :r)
BaseDrum1c = (ring, 17, :r, :r, :r,  2, :r, :r, :r,  5,  2,  5, :r, 17, :r, :r, :r)
BaseDrum1d = (ring, 22, :r, :r, :r, 22, :r, :r, :r,  5, 22,  5, :r, 22, :r, :r, :r)
BaseDrum1e = (ring, 22, :r, :r, :r, 22, :r, :r, :r, 18, 22, 18, :r, 22, :r, :r, :r)

BaseDrum2a = (ring,  2, :r, :r, :r,  2, :r, :r,  3,  4, :r,  8, :r,  2, :r, :r, :r)
BaseDrum2b = (ring,  2, :r, :r, :r,  2, :r, :r,  3,  4, :r,  8, :r,  2, :r, :r, :r)

BaseDrum3a = (ring,  1, :r,  2, :r,  1, :r,  2, :r,  2, :r, 16, :r,  8, :r,  2, :r)
BaseDrum3b = (ring,  1, :r,  2, :r,  1, :r,  2, :r,  2, :r, 16, :r,  8, :r,  2, :r)
BaseDrum3b = (ring, 17, :r,  2, :r, 17, :r,  2, :r,  2, :r, 17, :r,  2, :r,  2, :r)

B = (ring 18)

SnareDrum0 = (ring, :r)
SnareDrum1 = (ring, :r, :r,  2, :r, :r, :r,  2, :r, :r, :r,  2, :r, :r, :r,  2, :r)
SnareDrum2 = (ring, :r, :r,  2, :r, :r, :r,  6, :r, :r, :r,  2, :r, :r, :r,  6, :r)
SnareDrum3 = (ring, :r, :r,  5, :r, :r,  6,  6, :r, :r, :r,  5, :r, :r, :r,  5, :r)

Springs0 =  (ring, :r)
Springs1 =  (ring,  0, :r, :r, :r,  1, :r, :r, :r,  2,  3,  4, :r, 5, :r,  6, :r)
Springs2 =  (ring,  0, :r, :r, :r,  0, :r, :r, :r,  0,  0,  0, :r, 0, :r,  0, :r)
Springs3 =  (ring,  1, :r, :r, :r,  1, :r, :r, :r,  1,  1,  1, :r, 1, :r,  1, :r)
Springs4 =  (ring,  2, :r, :r, :r,  2, :r, :r, :r,  2,  2,  2, :r, 2, :r,  2, :r)
Springs5 =  (ring,  3, :r, :r, :r,  3, :r, :r, :r,  3,  3,  3, :r, 3, :r,  3, :r)
Springs6 =  (ring,  4, :r, :r, :r,  4, :r, :r, :r,  4,  4,  4, :r, 4, :r,  4, :r)
Springs7 =  (ring,  5, :r, :r, :r,  5, :r, :r, :r,  5,  5,  5, :r, 5, :r,  5, :r)
Springs8 =  (ring,  6, :r, :r, :r,  6, :r, :r, :r,  6,  6,  6, :r, 6, :r,  6, :r)

Tom0 = (ring, :r)
Tom1 = (ring, :r, :r,  2, :r, :r, :r,  2, :r, :r, :r,  2, :r, :r, :r,  2, :r)

Base0 = (ring, :r)
Base1 = (ring, :C2, :E2, :G2, :B2, :F2, :C2, :A2, :C2)
Base2 = (ring, :C2, :E2, :G2, :r,  :C2, :r, :E2,  :r)
Base3 = (ring, :C2, :r,  :C2, :r,  :E2, :r, :E2,  :r,  :G2,  :E2, :G2, :C2, :r,  :E2, :r, :E2)

Lead0 = (ring, :r)
Lead1 = (ring, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0)

use_bpm 55

BaseDrum  = BaseDrum1e
SnareDrum = SnareDrum2
Cymbals   = Cymbals3

Springs = Springs0

Base = Base3
Lead = Lead1

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.2 do
    
    live_loop :metronome do
      cue :beat
      sleep 1
    end
    
    live_loop :snares do
      sync :beat
      t = SnareDrum.tick
      play_drums $snares, t, 0.3 + rdist(0.1, 0), 4
    end
    
    ##| live_loop :toms do
    ##|   sync :beat
    ##|   sleep 0.75
    ##|   sample $toms, 0
    ##|   sleep 0.25
    ##| end
    
    live_loop :kicks do
      sync :beat
      sig = 4
      sig.times do
        t = BaseDrum.tick
        play_tuned_drums $kicks, t, 1.0 + rdist(0.1, 0), C[0], sig
      end
    end
    
    live_loop :springs do
      sync :beat
      sig = 8
      sig.times do
        t = Springs.tick
        play_drums $springs, t, 0.4 + rdist(0.1, 0), sig
      end
    end
    
    live_loop :cymbal do
      sync :beat
      sig = 8
      sig.times do
        t = Cymbals.tick
        play_drums $cymbals, t, 1.0 + rdist(0.1, 0), sig
      end
    end
    
  end
end


with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.2 do
    with_fx :wobble, mix: 0.2 do
      live_loop :lead do
        sync :beat
        if Lead.tick then
          lead_lines(C[S.tick], 0.9 + rdist(0.1, 0))
        end
        sleep 0.25
      end
    end
  end
end


live_loop :bass do
  sig = 8
  sig.times do
    note = Base.tick
    if note != :r then
      synth :kalimba,   note: note,      amp: 0.2, pan:  0.2
      synth :sine,      note: note + 12, amp: 0.5, pan: -0.2
      synth :beep,      note: note,      amp: 0.5, pan:  0.1
      synth :subpulse,  note: note,      amp: 0.1, pan: -0.1
    end
    sleep 1.0/8
  end
end

define :make_sample do | sample, index |
  dir = sample[:dir]
  samples = sample[:samples]
  samplespath + dir + samples[index]
end

define :play_drums do | sample, index, amp, no_beats |
  if index != :r then
    s = make_sample(sample, index)
    sample s, amp: amp
  end
  sleep 1.0/no_beats
end

define :play_tuned_drums do | sample, index, amp, chord, no_beats |
  if index != :r then
    s = make_sample(sample, index)
    note = chord.choose - 12
    with_fx :autotuner, note: note, mix: 0.5 do
      sample s, amp: amp
    end
    sample s, amp: amp
  end
  sleep 1.0/no_beats
end

define :lead_lines do | note, release |
  print("note is ", note)
  synth :mod_beep,      amp: 0.2, note: note,      release: release, attack: 0.1
  synth :blade,         amp: 0.5, note: note,      release: release
  synth :dark_ambience, amp: 0.5, note: note,      release: release
  synth :blade,         amp: 0.3, note: note - 12, release: release
end


use_debug false

use_bpm 55
samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"

define :play_drums do | kit, play, amp, no_beats, pan, debug |
  release = 1.0/no_beats
  if play != nil then
    sample = kit[:samples]
    drums = kit[:drums]
    dir = sample[:dir]
    samples = sample[:samples]
    file = drums[play]
    if debug then
      print("file is ", file)
    end
    ampadjust = kit[:amp]
    s = samplespath + dir + file
    sample s, amp: amp + ampadjust, pan: pan + rdist(0.1, 0), release: release
  end
  sleep release
end

define :play_bass do | note, pan, no_beats, debug |
  if debug then
    print("base note is ", note)
  end
  release = 1.0/no_beats
  synth :kalimba,   note: note,      amp: 0.2, pan:  pan + 0.03, attack: 0.2
  synth :sine,      note: note + 12, amp: 0.3, pan:  pan - 0.02
  synth :beep,      note: note,      amp: 0.5, pan:  pan - 0.01
  synth :subpulse,  note: note,      amp: 0.1, pan:  pan + 0.02
  sleep release
end


Keys = (ring, {root: :C, scale: :major}, {root: :A, scale: :minor}, {root: :F, scale: :major}, {root: :D, scale: :minor}).stretch(8)

# Kits
KickKit1 = {samples: $japanese, drums: {a: "big_taiko.wav", b: "okedo-A4.wav", c: "taiko_1.wav"}, amp: 0.0}
KickKit2 = {samples: $japanese, drums: {a: "hirado-A1.wav", b: "okedo-A2.wav", c: "tsuzumi.wav"},  amp: 0.0}
KickKit3 = {samples: $kicks, drums: {a: "Xperimental Kick Sub.aif", b: "Kick - Slow & Low.wav", c: "ElecK02-Kick01.wav"}, amp: 0.0}
KickKit4 = {samples: $kicks_II, drums: {a: "808bd3.wav", b: "808distbd.wav", c: "dark-verby-kicker.wav"}, amp: 0.0}
KickKit5 = {samples: $kicks_II, drums: {a: "garage_kick.wav", b: "bjorn1.wav", c: "bjorn2.wav"}, amp: 0.0}
KickKit6 = {samples: $kicks_II, drums: {a: "lowdrum.wav", b: "BOOM.wav", c: "broken-head-drum.wav"}, amp: 0.0}

CymbalKit1 = {samples: $cymbals, drums: {a: "TrashA-01.wav", b: "TrashA-02.wav", c: "TrashA-05.wav"}, amp: -0.0}
CymbalKit2 = {samples: $cymbals, drums: {a: "TrashC-01.wav", b: "TrashC-02.wav", c: "TrashC-03.wav"}, amp: -0.5}
CymbalKit3 = {samples: $cymbals, drums: {a: "TrashDF-01.wav", b: "TrashD-01.wav", c: "TrashA-04.wav"}, amp: -0.2}

SnareKit1 = {samples: $wierdos, drums: {a:"gunshot.wav", b: "ratatat.wav", c: "ratatat2.wav", d: "ricochet.wav", e: "reload.wav"}, amp: -0.7}

WierdoKit1 = {samples: $wierdos, drums: {a:"bendy-metal-hit.wav", b: "ratatat.wav", c: "ratatat2.wav", d: "ricochet.wav", e: "reload.wav", f: "police-whistle-long.wav", g: "police-whistle-verb.wav"}, amp: -0.7}
WierdoKit2 = {samples: $wierdos, drums: {a:"computer1.wav", b: "computer2.wav", c: "computer3.wav", d: "computer4.wav", e: "computer5.wav", f: "computer6.wav", g: "three-beep-stereo.wav"}, amp: -0.7}

print("wierdos is ", $wierdos)

# Rhythms

Kick0 = (ring, nil)
Kick1 = (ring, :a, nil, nil, nil, :c, nil, nil, nil, :b, nil, nil, nil, :c, nil, nil, nil)
Kick2 = (ring, :a, nil, nil, nil, :c, nil, nil, :b,  :a, nil, nil, nil, :c, nil, nil, nil)

Cymbal0 = (ring, nil)
Cymbal1 = (ring, :a, :a, :a, :a, :a, :b, :a, :a)
Cymbal2 = (ring, :a, nil, nil, :a, nil, nil, :a, nil)
Cymbal3 = (ring, :a, :c, :c, :a, :c, :c, :a, :c)

Wierdo0 = (ring, nil)
Wierdo1 = (ring, :a, nil, :d, nil, :a, nil, :d, nil, :b, :c, :d, :f, :e, nil, :g, nil)

# Tunes

Baseline1 = (ring 0, 1, 2, 3)
Baseline2 = (ring 0, 1, 2, 3, 3, 2, 1, 0)
Baseline3 = (ring 0, 0, 0, 1, 2, 2, 3, 3)


Base0 = (ring, false)
Base1 = (ring, true, false, false, false, )
Base2 = (ring, true, false, true, false, false, true, false)
Base3 = (ring, true, false, true, false, true, false, true)
Base4 = (spread, 3, 8)
Base5 = (spread, 5, 8)

KickKit   = KickKit2
CymbalKit = CymbalKit1
WierdoKit = WierdoKit1

Kick = Kick1
Cymbal = Cymbal3
Base = Base2
Wierdo = Wierdo0

Baseline = Baseline1

live_loop :metronome do
  sleep 1
end

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.2 do
    with_fx :compressor do
      
      with_fx :level, amp: 0.7 do
        live_loop :kicks, sync: :metronome do
          ##| dur = block_duration do
          sig = 4
          pan = 0
          sig.times do
            t = Kick.look
            play_drums KickKit, t, 1.0 + rdist(0.1, 0), sig, pan, false
            Kick.tick
          end
          ##| end
          ##| print("Duration of kick is ", dur)
        end
      end
      
      
      live_loop :cymbals, sync: :metronome do
        ##| dur = block_duration do
        sig = 8
        pan = -0.2
        sig.times do
          t = Cymbal.look
          play_drums CymbalKit, t, 1.0 + rdist(0.1, 0), sig, pan, false
          Cymbal.tick
        end
        ##| end
        ##| print("Duration of cymbals is ", dur)
      end
      
      live_loop :wierdo, sync: :metronome do
        ##| dur = block_duration do
        sig = 4
        sig.times do
          pan = rdist(0.8, 0)
          t = Wierdo.look
          play_drums WierdoKit, t, 1.0 + rdist(0.1, 0), sig, pan, true
          Wierdo.tick
        end
        ##| end
        ##| print("Duration of wierdo is ", dur)
      end
      
      
    end
  end
end

with_fx :level, amp: 0.3 do
  live_loop :bass, sync: :metronome do
    ##| dur = block_duration do
    Key = Keys.look
    sig = 2
    pan = 0.3
    sig.times do
      if Base.look then
        root = Key[:root]
        sc = Key[:scale]
        no_of_notes = 7
        idx = Baseline.look
        note = (chord_degree :i, root, sc, no_of_notes)[idx]
        play_bass note - 24, pan, sig, false
        Baseline.tick
      end
      Keys.tick
    end
    ##| end
    ##| print("Duration of bass is ", dur)
  end
end

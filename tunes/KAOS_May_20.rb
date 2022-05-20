use_debug false

current_bpm = 120
use_bpm current_bpm

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/suns_out_guns_out.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/play_routines.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/bag_of_randoms.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/tab.rb")

use_random_seed 51

beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

randoms = bag_of_randoms(1024)

swing_time = 0.2

define :swing_time do
  return swing_time
end

Keys = (ring, {root: :C, scale: :major})

rkick0 = rsnare0 = rcymbal0 = dub0 = hard0 = rsnareacc0 = rcymbalacc0 = ring(false)

rkick1      = tabb(["1000","0010","1000","0010"])
rsnare1     = tabb(["0000","1000","0000","1000"])
rsnare1     = tabb(["0000","1000","0000","1000"])
rsnareacc1  = tabb(["1000","1000","1000","1000"])
rcymbal1    = tabn(["1210","1123"])

dub1  = tabb(["0010","0010"])
dub2  = tabb(["0011","1000"])
hard1 = tabb(["0000","0100"])
hard2 = tabb(["0001","1100"])

Kicks   = Kicks1
Snares  = Snares1
Cymbals = Cymbals2

rkick      = rkick0
rcymbal    = rcymbal1
rsnareacc  = rcymbalacc0
rsnare     = rsnare0
rsnareacc  = rsnareacc0

print("rcymbal is", rcymbal)
print("rsnareacc1 is", rsnareacc1)

has_shaker  = true

mbase0 = ring(0)
mbase1 = make_riff(9, rkick1.drop(8))

##| mbase      = mbase0

mbase      = mbase1[:beats]
mdurations = mbase1[:durations]

print("mbase1 is", mbase1)
print("mbase is", hexring_to_string(mbase))
print("mdurations is", mdurations)

dub  = dub1
hard = hard0

ghost  = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }

define :walking_sleep do | old_walk, beat |
  walk = rdist(0.01, 0)
  slp = get_sleep(beat)
  sleep slp + walk - old_walk
  return walk
end

define :play_kicks do | kicks, bar, globalrandom1, globalrandom2 |
  splash = get_drum(kicks, dub[bar], hard[bar])
  drum = ((globalrandom1 > 0.8) ? splash : kicks[:main])
  sinfreq = rdist(10, 70)
  glissf = rdist(0, 0.9)
  att = rdist(0, 0.01)
  a = ((rand < 0.8) ? normal.call : ghost.call)
  if globalrandom2 > 0.9 then
    s = samplespath  + drum
    sample s, amp: a, pan: 0.5
  else
    use_synth :sc_kick
    play amp: a, pan: 0.5, sinfreq: sinfreq, glissf: glissf, att: att
  end
  if has_shaker then
    sample samplespath + Shakers.choose, amp: 2.0
  end
end

define :play_snare do | snares, bar, globalrandom1, globalrandom2 |
  splash = get_drum(snares, dub[bar], hard[bar])
  drum = ((globalrandom1 > 0.5) ? splash : snares[:main])
  a = ((rand > 0.6) ? ghost.call : normal.call)
  if globalrandom2 > 0.9 || dub[bar] || hard[bar] then
    s = samplespath  + drum
    sample s, amp: a, pan: 0.5
  else
    use_synth :sc_snare
    play amp: a * rdist(0.1, 0.5), pan: 0.3
  end
end

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.25 do
    with_fx :compressor do
      old_walk = 0
      live_loop :beat1, sync: :metronome do
        
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        globalrandom1 = randoms.tick
        globalrandom2 = randoms.tick
        ##| print("beat is", beat, "and bar is", bar, "key is", key)
        if rkick[beat] then
          play_kicks(Kicks, bar, globalrandom1, globalrandom2)
        end
        
        if rsnare[beat] then
          play_snare(Snares, bar, globalrandom1, globalrandom2)
        end
        
        old_walk = walking_sleep(old_walk, beat)
        
        if beat == 15 then
          bars.tick(:bars)
          swing_time = rdist(0.05, 0.2)
        end
        beats.tick(:beats)
      end
    end
  end
end

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.25 do
    with_fx :compressor do
      old_walk = 0
      live_loop :beat3, sync: :metronome do
        
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        globalrandom1 = randoms.tick
        globalrandom2 = randoms.tick
        ##| print("beat is", beat, "and bar is", bar, "key is", key)
        
        if rsnare[beat] then
          play_snare(Snares, bar, globalrandom1, globalrandom2)
        end
        
        old_walk = walking_sleep(old_walk, beat)
        
        if beat == 15 then
          bars.tick(:bars)
        end
        beats.tick(:beats)
      end
    end
  end
end

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.2 do
    with_fx :compressor do
      old_walk = 0
      live_loop :beat2, sync: :metronome do
        
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        globalrandom1 = randoms.tick
        globalrandom2 = randoms.tick
        
        if rkick[beat] then
          play_kicks(Kicks, bar, globalrandom1, globalrandom2)
        end
        
        if (rcymbal[beat] != 0) then
          cymbal = rcymbal[beat]
          cring = Cymbals[:cymbals].ring
          a = normal.call * Cymbals[:amp]
          s = samplespath + cring[cymbal]
          sample s, amp: a, pan: rdist(0.03, 0.5)
        end
        
        if rsnare[beat] then
          play_snare(Snares, bar, globalrandom1, globalrandom2)
        end
        
        if rsnareacc[beat] then
          splash = get_drum(Snares, dub[bar], hard[bar])
          a = ((rand > 0.7) ? ghost.call : normal.call)
          s = samplespath + splash
          sample s, amp: a * 0.5, pan: -0.45
        end
        
        old_walk = walking_sleep(old_walk, beat)
        
        if beat == 15 then
          bars.tick(:bars)
        end
        beats.tick(:beats)
      end
    end
  end
end

with_fx :level, amp: 0.5 do
  old_walk = 0
  
  live_loop :bass, sync: :metronome do
    bar  = bars.look(:bars) - 1
    beat = beats.look(:beats) - 1
    key  = Keys[bar]
    Chord1 = (chord key[:root], '13')
    Chord2 = (chord key[:root] + 24, ['13', '9', '7-9'].choose)
    m = mbase.look(:mbase)
    d = mdurations.look(:mdurations)
    pan1 = rdist(0.1,  0.2)
    pan2 = rdist(0.1, -0.2)
    n = Chord1[m] - 24
    if m != 0 then
      dur1 = (d + rdist(0.05, 0)).abs
      dur2 = (d + rdist(0.05, 0)).abs
      if m = 1 then
        isroot = true
      else
        isroot = false
      end
      with_fx :lpf, cutoff: 80 do
        play_bass(n, pan1, dur1, isroot, false)
      end
      play_lead(Chord2, pan2, dur2, false)
    end
    slp = get_sleep(beat)
    walk = rdist(0.01, 0)
    sleep slp + walk - old_walk
    oldwalk = walk
    if beat == 15 then
      bars.tick(:bars)
    end
    beats.tick(:beats)
    mbase.tick(:mbase)
    mdurations.tick(:mdurations)
  end
  
end

live_loop :metronome do
  sleep 8
end


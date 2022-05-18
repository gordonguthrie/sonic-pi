use_debug false

current_bpm = 125
use_bpm current_bpm

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")

use_random_seed 48


beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

define :swing_time do
  swing_time = 0.2
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
    if (rand > 0.7) then
      return kit[:ghosts].choose
    else
      return kit[:main]
    end
  elsif beat == :crash then
    return kit[:crashs].choose
  elsif beat == :open then
    return kit[:opens].choose
  else
    return kit[:main]
  end
end

define :play_bass do | note, pan, no_beats, isroot, debug |
  if debug then
    print("base note is ", note, "no of beats is", no_beats)
  end
  r = rand
  release = no_beats * 0.3
  a1 = rdist(0.2, 0.8)
  a2 = rdist(0.2, 0.8)
  a3 = rdist(0.2, 0.8)
  r1 = rdist(0.2, 0.8)
  r2 = rdist(0.2, 0.8)
  r3 = rdist(0.2, 0.8)
  sustain = no_beats - release
  synth    :dsaw, note: note + 12.1, amp: 0.2 * a1, pan: pan, release: no_beats * r1
  synth    :dsaw, note: note + 12,   amp: 0.2 * a2, pan: pan, release: no_beats * r2
  synth    :sine, note: note,        amp: 0.5 * a3, pan: pan, release: no_beats * r1
  synth    :dtri, note: note - 12,   amp: 0.2 * a1, pan: pan, release: no_beats * r2, attack: 0.01
  synth    :beep, note: note - 11.9, amp: 0.2 * a2, pan: pan, release: no_beats * r1
  if isroot then
    synth :pulse, note: note,        amp: 0.8 * a3, pan: pan, release: release * r3, sustain: sustain, pulse_width: 0.2, attack: 0.01
    synth :pulse, note: note - 12,   amp: 0.5 * a1, pan: pan, release: release * r3, sustain: sustain, pulse_width: 0.4, attack: 0.01
    play                note,        amp: 1 * a2,   pan: pan, release: release * r3, sustain: sustain
  else
    play                note,        amp: 0.2 * a3, pan: pan, release: no_beats * r3
  end
end

define :play_lead do | note, pan, no_beats, debug |
  if debug then
    print("lead note is ", note, "no of beats is", no_beats)
  end
  a = rdist(0.2, 0.8)
  r = rand
  release = no_beats * 0.3
  sustain = no_beats - release
  synth :blade, note: note + 12.1, amp: 0.1 * a, pan: pan, release: no_beats
  synth :piano, note: note + 11.9, amp: 0.1 * a, pan: pan, release: no_beats
  synth :piano, note: note,        amp: 0.7 * a, pan: pan, release: no_beats
  synth :piano, note: note - 12,   amp: 0.2 * a, pan: pan, release: no_beats
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

rkick0 = rsnare0 = rcymbal0 = dub0 = hard0 = rsnareacc0 = rcymbalacc0 = ring(false)

#                   "1234567890123456"
rkick1      =  make("1000001010000010")
rsnare1     =  make("0010001000100000")
rsnare2     =  make("1000001010000010")
rsnare3     =  make("0001000000010000")
rsnareacc1  =  make("0000100000001000")
rcymbal1    = cmake("0111011101120111")
rcymbalacc1 =  make("0010001000101010")
rcymbal2    = cmake("1212121212121212")
rcymbal3    = cmake("1221122113311221")
rcymbalacc1 =  make("0010000000001000")

rcymbal4    = cmake("1012101210121011")
rcymbalacc4 =  make("1000100010001000")

rcymbal5    = cmake("10121021210121012")
rcymbalacc5 =  make("0")

dub1  = make("00100010")
dub2  = make("00111000")
hard1 = make("00000100")
hard2 = make("00011100")

Kicks   = Kicks2
Snares  = Snares1
Cymbals = Cymbals4

rkick      = rkick1
rcymbal    = rcymbal1
rsnareacc  = rcymbalacc1
rsnare     = rsnare3
rsnareacc  = rsnareacc0

mbase0 = ring(0)
mbase1 = make_riff(13, rkick1.drop(8))

##| mbase      = mbase

mbase      = mbase1[:beats]
mdurations = mbase1[:durations]

print("mbase is", compress(mbase))
print("mdurations is", mdurations)

lead0 = (ring, :r)
lead1 = tmake("C00000000")

lead = lead1

print("lead", lead)

dub  = dub2
hard = hard0

ghost  = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }


with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.25 do
    with_fx :compressor do
      old_walk = 0
      live_loop :beat1, sync: :metronome do
        
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        ##| print("beat is", beat, "and bar is", bar, "key is", key)
        
        if rkick[beat] then
          splash = get_drum(Kicks, dub[bar], hard[bar])
          drum = ((rand > 0.8) ? splash : Kicks[:main])
          sinfreq = rdist(10, 70)
          glissf = rdist(0, 0.9)
          att = rdist(0, 0.01)
          use_synth :sc_kick
          play amp: ((rand < 0.8) ? normal.call : ghost.call), pan: 0.5
        end
        
        if rsnare[beat] then
          r2 = rand
          a = ((r2 > 0.6) ? ghost.call : normal.call)
          use_synth :sc_snare
          play amp: a * 0.5, pan: 0.3
        end
        
        walk = rdist(0.01, 0)
        slp = get_sleep(beat)
        sleep slp + walk - old_walk
        oldwalk = walk
        
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
        ##| print("beat is", beat, "and bar is", bar, "key is", key)
        
        if rkick[beat] then
          splash = get_drum(Kicks, dub[bar], hard[bar])
          use_synth :sc_kick
          play amp: ((rand < 0.8) ? normal.call : ghost.call), pan: -0.5
        end
        
        if (rcymbal[beat] != false) then
          c = get_cymbal(Cymbals, rcymbal[beat], false)
          a = ((rcymbalacc1[beat]) ? accent.call : normal.call)
          s = samplespath + c
          sample s, amp: a * 2, pan: 0.2 if rand < 0.9
        end
        
        if rsnare[beat] then
          r2 = rand
          a = ((r2 > 0.6) ? ghost.call : normal.call)
          use_synth :sc_snare
          play amp: a * 0.7, pan: -0.3
        end
        
        if rsnareacc[beat] then
          splash = get_drum(Snares, dub[bar], hard[bar])
          a = ((rand > 0.7) ? ghost.call : normal.call)
          s = samplespath + splash
          sample s, amp: a * 0.5, pan: -0.3
        end
        walk = rdist(0.01, 0)
        slp = get_sleep(beat)
        sleep slp + walk - old_walk
        oldwalk = walk
        
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
    bar  = bars.look(:bar) - 1
    beat = beats.look(:beats) - 1
    key  = Keys[bar]
    Chord1 = (chord key[:root], '13')
    Chord2 = (chord key[:root] + 24, ['13', '9', '7-9'].choose)
    m = mbase.look(:mbase)
    d = mdurations.look(:mdurations)
    pan1 = rdist(0.1,  0.2)
    pan2 = rdist(0.1, -0.2)
    n = Chord1[m] - 24
    ##| print("note is", n)
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
  sleep 1
end


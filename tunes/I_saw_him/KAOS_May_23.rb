use_debug false

current_bpm = 120
use_bpm current_bpm

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/I_saw_him/loadable/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/I_saw_him/loadable/hooks.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/I_saw_him/loadable/runtime.rb")
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

k1 = tabn(["2001","0001","2001","2000"])
s1 = tabn(["0000","1000","0000","1010"])
w1 = tabn(["2000","2000","1210","1121"])

rkick0 = rsnare0 = rcymbal0 = dub0 = hard0 = hook0 = rsnareacc0 = ring(false)

rkick1      = tabb(["1000","0010","1000","0010"])
rkick2      = tabb(["1000","0000","1000","0010"])
rkick3      = tabb(["1000","0010","1010","0010"])
rsnare1     = tabb(["0000","1000","0000","1000"])
rsnare2     = tabb(["0000","1000","0000","1000"])
rsnareacc1  = tabb(["1000","1000","1000","1000"])
rsnareacc2  = tabb(["1010","1000","1010","1000"])
rcymbal1    = tabn(["1210","1123"])
rcymbal2    = tabn(["1310","1134"])
rcymbal3    = tabn(["3230","3321"])
hooks1      = tabn(["1020","2430"])

dub1  = tabb(["0010","0010"])
dub2  = tabb(["0011","1000"])
hard1 = tabb(["0000","0100"])
hard2 = tabb(["0001","1100"])
hook1 = tabb(["01"])

Kicks      = Kicks1
Snares     = Snares1
Cymbals    = Cymbals1
DubShakers = DubShakers1
Shakers    = Shakers2
Hook       = Hook3

rkick      = rkick1
rcymbal    = rcymbal1
rsnare     = rsnare1
rsnareacc  = rsnareacc1
hooks      = hooks1

has_shaker = false

mbass0 = ring(0)
mbassx = make_riff(9, rkick1.drop(8), 0.2)


print("mbass1 is", mbassx)
print("bass is", numring_to_string(mbassx[:beats]))
print("durations is", mbassx[:durations])

##| mbass      = mbass0

mbass      = mbassx[:beats]
mdurations = mbassx[:durations]

dub  = dub1
hard = hard1
hook = hook0

ghost  = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }

with_fx :reverb, mix: 0.3 do | r |
  with_fx :echo, mix: 0.25 do | e |
    with_fx :compressor do
      old_walk = 0

      live_loop :beat1, sync: :metronome do
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        globalrandom1 = randoms.tick
        globalrandom2 = randoms.tick

        in_dub(bar, dub, r, e)

        if rkick[beat] then
          play_kicks(Kicks, bar, dub, hard, has_shaker, globalrandom1, globalrandom2)
        end

        if rsnare[beat] then
          play_snare(Snares, bar, dub, hard, globalrandom1, globalrandom2)
        end
        old_walk = walking_sleep(old_walk, beat, "beat1")

        if beat == 15 then
          bars.tick(:bars)
          swing_time = rdist(0.05, 0.2)
        end
        beats.tick(:beats)
      end
    end
  end
end

with_fx :reverb, mix: 0.3 do | r |
  with_fx :echo, mix: 0.25 do | e |
    with_fx :compressor do
      old_walk = 0

      live_loop :beat2, sync: :metronome do
        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        globalrandom1 = randoms.tick
        globalrandom2 = randoms.tick

        in_dub(bar, dub, r, e)

        if rsnare[beat] then
          play_snare(Snares, bar, dub, hard, globalrandom1, globalrandom2)
        end
        old_walk = walking_sleep(old_walk, beat, "beat2")

        if beat == 15 then
          bars.tick(:bars)
        end
        beats.tick(:beats)
      end
    end
  end
end

with_fx :reverb, mix: 0.3 do | r |
  with_fx :echo, mix: 0.25 do | e |
    with_fx :compressor do
      old_walk = 0
      live_loop :beat3, sync: :metronome do

        bar  = bars.look(:bars) - 1
        beat = beats.look(:beats) - 1
        key  = Keys[bar]
        globalrandom1 = randoms.tick
        globalrandom2 = randoms.tick

        in_dub(bar, dub, r, e)

        if rkick[beat] then
          play_kicks(Kicks, bar, dub, hard, has_shaker, globalrandom1, globalrandom2)
        end

        if (rcymbal[beat] != 0) then
          cymbal = rcymbal[beat] - 1
          cring = Cymbals[:cymbals].ring
          a = normal.call * Cymbals[:amp]
          s = samplespath + cring[cymbal]
          sample s, amp: a, pan: rdist(0.03, 0.5)
        end

        if rsnare[beat] then
          play_snare(Snares, bar, dub, hard, globalrandom1, globalrandom2)
        end

        if rsnareacc[beat] then
          splash = get_drum(Snares, dub[bar], hard[bar])
          a = ((rand > 0.7) ? ghost.call : normal.call)
          s = samplespath + splash
          sample s, amp: a * 0.5, pan: -0.45
        end
        old_walk = walking_sleep(old_walk, beat, "beat3")

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
    m = mbass.look(:mbass)
    d = mdurations.look(:mdurations)
    pan = rdist(0.1,  0.2)
    n = Chord1[m] - 36
    if m != 0 then
      dur = (d + rdist(0.05, 0)).abs
      if m = 1 then
        isroot = true
      else
        isroot = false
      end
      play_bass(n, pan, dur, isroot, false)
    end
    old_walk = walking_sleep(old_walk, beat, "bass")
    if beat == 15 then
      bars.tick(:bars)
    end
    beats.tick(:beats)
    mbass.tick(:mbass)
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

with_fx :reverb, mix: 0.3 do | r |
  with_fx :echo, mix: 0.25 do | e |
    old_walk = 0
    live_loop :hook, sync: :metronome do
      bar  = bars.look(:bars) - 1
      beat = beats.look(:beats) - 1
      key  = Keys[bar]
      if hook[bar] then
        if hooks[beat] != 0 then
          drum = Hook[hooks[beat] - 1]
          sample samplespath + drum
        else
          sleep 0.5
        end
      end
      old_walk = walking_sleep(old_walk, beat, "beat3")
      if beat == 15 then
        bars.tick(:bars)
      end
      beats.tick(:beats)
    end
  end
end


live_loop :metronome do
  sleep 8
end

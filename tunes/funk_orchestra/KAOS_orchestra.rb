use_debug false

current_bpm = 120
use_bpm current_bpm
use_cue_logging false
use_real_time
samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"

run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/funk_orchestra/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/funk_orchestra/loops.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi//libraries/play_routines.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")

use_random_seed 53

beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

ghost  = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }

Dubs = Dubs1

kicks1      = tabb(["1000","0000","1000","0000"])
snares1     = tabb(["0000","1000","0000","1000"])
cymbals1    = tabn(["1210","1123"])
dubs1       = kicks1

kicks   = kicks1
snares  = snares1
cymbals = cymbals1
dubs    = dubs1

silencekicks = true
silencesnares = true
silencecymbals = true
silencebass = false

bass0 = ring(0)
bass1 = make_riff(7, kicks.drop(8), 1)

bass      = bass1[:beats].ring
durations = bass1[:durations].ring

define :prompt do | colour, beat |
  sleep = get_sleep(beat)
  prelay = sleep * 3 + 0.2
  cue colour + "outbound", prelay
end

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.25 do
    with_fx :compressor do
      idx = 0
      Chord = (chord :c2, '13')
      live_loop :backingtrack, sync: :metronome do
        use_real_time
        dur = block_duration do
          b = beats[idx]
          k = kicks[idx]
          s = snares[idx]
          c = cymbals[idx]
          n = bass[idx]
          d = durations[idx]
          if k && !silencekicks then
            is_root = true
            samp = samplespath + Kicks[1]
            sample samp, amp: 2.0, pan: -1
          else
            is_root = false
          end
          if s && !silencesnares then
            samp = samplespath + Snares[0]
            sample samp, pan: -1
          end
          if c && !silencecymbals then
            samp = samplespath + Cymbals[c]
            sample samp, amp: 0.6, pan: -1
          end
          if d != 0 && !silencebass then
            dur = (d + rdist(0.05, 0)).abs
            pan = rdist(0.1,  0.2)
            pan = -1
            play_bass(Chord[n], pan, dur, is_root, false)
          end
          idx = tick
          if kicks[idx] then
            prompt("blue", b)
          end
          if snares[idx] then
            prompt("yellow", b)
          end
          if cymbals[idx] then
            prompt("red", b)
          end
          if dubs[idx] then
            prompt("green", b)
          end
          slp = get_sleep(b)
          sleep slp
          ##| print("in backing track sleep is", slp, "for", b)
        end
        ##| print("named loop ran with duration of", dur)
      end
    end
  end
end

beatidx = 0

live_loop :syncher, sync: :metronome  do
  use_real_time
  dur = block_duration do
    cue :trig
    beat = beats[beatidx]
    slp = get_sleep(beat)
    sleep slp
    beatidx = tick
  end
  ##| print("syncher ran with duration of", dur)
end

live_loop :metronome do
  use_real_time
  dur = block_duration do
    sleep 8
  end
  ##| print("metronome ran with duration of", dur)
end

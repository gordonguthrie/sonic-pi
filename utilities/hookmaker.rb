use_debug false

current_bpm = 120
use_bpm 120

use_random_seed 1023

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
##| load_synthdefs "/Users/gordonguthrie/.synthdefs"

sounds = rand_i(5) + 5
print("sounds", sounds)
sleeps = [0.001, 0.25, 0.5, 0.75, 1.0]

type = :sample

hook = []
slps = []

total = 0
tot = 0

sounds.times do | n |
  slp = sleeps.choose
  total = total + slp
  if total < 16
    hook[n] = {sleep: slp,
               sample: "African/wavedrum1.wav",
               sound: :f2}
    slps[n] = slp
    tot = total
  end
end

print("slps is", slps)
print("tot is", tot)

hook = hook.ring

idx = 0

live_loop :hook, sync: :metronome do
  h = hook.tick
  sleep h[:sleep]
  if type == :sample then
    sample samplespath + h[:sample]
  elsif type == :sound then
    synth(:sine, note: h[:sound], amp: 0.3)
  end
end

live_loop :metronome do
  sleep 8
end

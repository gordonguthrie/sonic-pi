use_debug false

current_bpm = 120
use_bpm current_bpm

use_random_seed 1004

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
##| load_synthdefs "/Users/gordonguthrie/.synthdefs"

sounds = rand_i(5) + 5
print("sounds", sounds)
sleeps = [0.001, 0.25, 0.5, 0.75, 1.0]

hook = []
slps = []

total = 0

sounds.times do | n |
  slp = sleeps.choose
  total = total + slp
  if total < 8
    hook[n] = {sleep: slp,
               sample: "African/wavedrum1.wav"}
    slps[n] = slp
  end
end

print("hook is", hook)
print("yoqwza")

hook = hook.ring

idx = 0

live_loop :hook, sync: :metronome do
  h = hook.tick
  sleep h[:sleep]
  sample samplespath + h[:sample]
end

live_loop :metronome do
  sleep 8
end

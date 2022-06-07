use_debug false

current_bpm = 120
use_bpm 120

use_random_seed 1060

samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
##| load_synthdefs "/Users/gordonguthrie/.synthdefs"

sounds = rand_i(2) + 4
print("sounds", sounds)
sleeps = [0.001, 0.25, 0.5, 0.75, 1.0]

type = :note

hook  = []
slps  = []
notes = []

total = 0
tot = 0

sounds.times do | n |
  slp = sleeps.choose
  total = total + slp
  if total < 8
    note = [:c2, :e2, :g2, :b3, :d3].choose
    hook[n] = {sleep: slp,
               sample: "African/wavedrum1.wav",
               note: note }
    slps[n] = slp
    notes[n] = note
    tot = total
  end
end

print("notes is", notes)
print("slps is", slps)
print("tot is", tot)

hook = hook.ring

idx = 0

live_loop :hook, sync: :metronome do
  h = hook.tick
  sleep h[:sleep]
  if type == :sample then
    sample samplespath + h[:sample]
  elsif type == :note then
    synth(:sine, note: h[:note], amp: 0.3)
  end
end

live_loop :metronome do
  sleep 8
end

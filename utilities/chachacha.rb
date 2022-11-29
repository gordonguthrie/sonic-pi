use_bpm 45
sleeps   = (ring 0.2, 0.21, 0.19, 0.1, 0.1, 0.2, 0.21, 0.19, 0.1, 0.1, 0.2, 0.21, 0.19, 0.08, 0.12)
strength = (ring :s,    :w,   :s,  :w,  :w)

Ch = (ring (chord :c, :major), (chord :d, :minor), (chord :e, :minor), (chord :f, :major), (chord :g, :major), (chord :a, :minor))


Kicks = [
  "Kicks_II/garage_kick.wav",
  "Kicks_II/808distbd.wav",
  "Kicks_II/dark-verby-kicker.wav",
  "Kicks/Xperimental Kick Sub.aif"
]
t = 0
use_synth :subpulse
live_loop :beat do
  c = Ch.choose
  s = 0.2 + rand(0.4)
  r = 0.2 + rand(0.4)
  8.times do
    print t, sleeps[t], c
    sample "~/Dev/sonic-pi/samples/Kicks_II/garage_kick.wav"
    if strength[t] == :w
      sample "~/Dev/sonic-pi/samples/Snares_II/tuned_tight.wav", amp: 0.5
      #play_chord(c.notes)
    end
    sleep sleeps[t]
    t = t + 1
  end
end

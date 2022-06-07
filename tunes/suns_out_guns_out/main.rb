$bpm =  160
$sync = 8

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"


$swing_time = 0.05

define(:get_sleep) do |beat|
  if (beat % 2) == 0
    slp = 0.5 + $swing_time
  else
    slp = 0.5 - $swing_time
  end

  return slp
end

define(:play_melody) do |note, synth, beat|

  if (beat % 2) == 0
    amp = 0.7 * rdist(0.1, 1)
    attack = 0.03
    decay = 0.1
    sustain = 0.1
  else
    amp = 1.0 * rdist(0.1, 1)
    attack = 0.03
    decay = 0.3
    sustain = 0.3
  end
  use_synth synth
  play note: note, amp: amp, attack: attack, decay: decay, sustain: sustain
end


Kicks = ["Kicks_II/BOOM.wav",
         "African/wavedrum1.wav",
         "Kicks_II/bjorn1.wav",
         "Japanese/taiko_1.wav",
         "African/bendy.wav",
         "Japanese/taiko_1.wav",
         "Wierdos/dark-klonk-hit.wav",
         "Kicks_II/enormous-808-kick.wav",
         ].ring


Claps = [
  "Claps/Vrb-clap1.wav",
  "Claps/divine-clap-ring.wav",
  "Claps/percussion-clap.wav",
  "Claps/pong-verb-clap.wav",
  "Claps/verby-percussion-pop.wav"
].ring

Vibrs = [
  "Wierdos/vibra-crunchy-1.wav",
  "Wierdos/vibra-crunchy-2.wav",
  "Wierdos/zippy-wave.wav"
].ring


Keys = [
  {root: :c, scale: :major},
  {root: :d, scale: :major},
  {root: :f, scale: :major},
  {root: :a, scale: :minor}
].ring

Chords = [:i, :ii, :iii, :iv, :v, :vi, :vii].ring

live_loop :beat do
  use_bpm $bpm
  kick = $samplespath + Kicks.tick
  clap = $samplespath + Claps.tick
  $sync.times do
    a = rrand(0.1, 1)
    idx = tick
    (sample :elec_bong, amp: 1.5 * a if (spread 3, 8)[idx])
    (sample clap, amp: 0.8 * a if (spread 7, 11)[idx])
    (sample kick, amp: 2 * a if (spread 1, 4)[idx])
    sleep get_sleep(idx)
  end
end


with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    live_loop :melody, sync: :beat do
      use_bpm $bpm
      Key = Keys[3]
      Chord = Chords[6]
      $sync.times do
        # bass
        idx = tick
        C = chord_degree(Chord, Key[:root] - 24, Key[:scale], 4)
        play_melody C.choose - 24, :beep, idx
        # lead
        play_melody C, :tri, idx if (spread 3, 8)[idx]
        sleep get_sleep(idx)
      end
    end

  end
end

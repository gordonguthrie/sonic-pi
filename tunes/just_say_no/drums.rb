##|        _           _      _____               _   _
##|       | |         | |    / ____|             | \ | |
##|       | |_   _ ___| |_  | (___   __ _ _   _  |  \| | ___
##|   _   | | | | / __| __|  \___ \ / _` | | | | | . ` |/ _ \
##|  | |__| | |_| \__ \ |_   ____) | (_| | |_| | | |\  | (_) |
##|   \____/ \__,_|___/\__| |_____/ \__,_|\__, | |_| \_|\___/
##|                                        __/ |
##|                                       |___/
##|  _____
##| |  __ \
##| | |  | |_ __ _   _ _ __ ___  ___
##| | |  | | '__| | | | '_ ` _ \/ __|
##| | |__| | |  | |_| | | | | | \__ \
##| |_____/|_|   \__,_|_| |_| |_|___/

print("DRUMS RELOADED")

use_bpm $bpm

$KickAmp  = 1.0
$SnareAmp = 0.8

Ch = (ring (chord :c, :major), (chord :d, :minor), (chord :e, :minor), (chord :f, :major), (chord :g, :major), (chord :a, :minor))

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:compressor) do
      old_walk = 0
      
      live_loop(:beat1,       sync: :metronome) do
        bars     = $bars
        beats    = $beats
        Kicks    = $Kicks
        Snares   = $Snares
        playhard = $PlayHard
        randoms  = $Randoms
        $Repeat.times do
          bar = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          globalrandom1 = randoms.tick
          globalrandom2 = randoms.tick
          
          if $strength[beat] == :s
            puts("strong beat")
          end
          sample $Root + "samples/Kicks/Xperimental Kick Sub.aif", amp: 0.8
          
          
          if $strength[beat] == :w
            puts("weak beat")
            use_synth(:sc808_congamid)
            a = ((rand > 0.9) ? $ghost.call : $normal.call)
            snareamp = 0.8
            play(amp: a * snareamp, pan: 0.3)
            c = Ch.choose
            use_synth :organ_tonewheel
            play_chord(c.notes, amp: 0.8)
            
          end
          
          old_walk = walking_sleep(old_walk, beat, "beat1")
          
          if beat == 15
            bars.tick(:bars)
          end
          
          beats.tick(:beats)
        end
      end
    end
  end
end
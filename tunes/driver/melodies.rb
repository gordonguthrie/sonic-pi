##|   _____ _
##|  / ____| |
##| | |    | |__   ___   ___  _ __
##| | |    | '_ \ / _ \ / _ \| '_ \
##| | |____| | | | (_) | (_) | | | |
##|  \_____|_| |_|\___/ \___/|_| |_|

print("CHOON RELOADED")

use_bpm $bpm

define(:play_bass) do |note, debug|
  if debug
    print("base note is ", note)
  end
  synth(:sine, note: note + 12.1, amp: 0.1)
  synth(:sine, note: note + 12,   amp: 0.1)
  synth(:sine, note: note,        amp: 0.3)
  synth(:dtri, note: note - 12,   amp: 0.1)
  synth(:beep, note: note - 11.9, amp: 0.1)

end

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:level, amp: 0.5) do

      live_loop(:bass) do
        sync :beat
        bars   = $bars
        beats  = $beats
        key    = $key
        sleeps = $sleeps
        bass   = $bass
        sleeps = bass[:sleeps]
        notes = bass[:notes]
        len = notes.length
        len.times do
          bar  = bars.look(:bars) - 1
          beat = beats.look(:beats) - 1
          play_bass(notes[beat], false)
          slp = sleeps.look(:beat)
          sleep(slp)
          if beat == 15
            bars.tick(:bars)
          end

          beats.tick(:beats)
          bass.tick(:bass)
        end
      end
    end
  end
end

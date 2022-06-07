##|  _____       _
##| |  __ \     (_)
##| | |  | |_ __ ___   _____ _ __
##| | |  | | '__| \ \ / / _ \ '__|
##| | |__| | |  | |\ V /  __/ |
##| |_____/|_|  |_| \_/ \___|_|
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
  synth(:sine, note: note + 12.1, amp: 0.2)
  synth(:sine, note: note + 12,   amp: 0.2)
  synth(:sine, note: note,        amp: 0.5)
  synth(:dtri, note: note - 12,   amp: 0.2)
  synth(:beep, note: note - 11.9, amp: 0.2)

end

with_fx(:reverb, mix: 0.3) do |r|
  with_fx(:echo,   mix: 0.25) do |e|
    with_fx(:level, amp: 0.5) do

      live_loop(:bass) do
        sync :beat
        bars   = $bars
        key    = $key
        sleeps = $sleeps
        bass   = $bass
        sleeps = bass[:sleeps]
        notes = bass[:notes]
        len = notes.length
        len.times do
          bar = bars.look(:bars) - 1
          note = notes.look(:notes)
          play_bass(note, false)
          slp = sleeps.look(:beat)
          sleep(slp)
          if beat == 15
            bars.tick(:bars)
          end
          notes.tick(:notes)
        end
      end
    end
  end
end

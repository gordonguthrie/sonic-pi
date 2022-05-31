##| __      __   _
##| \ \    / /  (_)
##|  \ \  / /__  _  ___ ___  ___
##|   \ \/ / _ \| |/ __/ _ \/ __|
##|    \  / (_) | | (_|  __/\__ \
##|     \/ \___/|_|\___\___||___/

use_bpm $bpm

vol = 0.4

with_fx :echo, mix: 0.3 do
  with_fx :reverb, mix: 0.2 do
    verse_a = $verse_a
    verse_b = $verse_b
    verse_c = $verse_c
    verse_d = $verse_d
    verse_e = $verse_e

    live_loop :voices, sync: :metronome do
      amp = $amp
      s1 = $voicespath + verse_a
      sample s1, amp: amp[0] * rdist(0.1, vol), pan: rdist(0.7, 0)
      s2 = $voicespath + verse_b
      sample s2, amp: amp[1] * rdist(0.1, vol), pan: rdist(0.7, 0)
      s3 = $voicespath + verse_c
      sample s3, amp: amp[2] * rdist(0.1, vol), pan: rdist(0.7, 0)
      s4 = $voicespath + verse_d
      sample s4, amp: amp[3] * rdist(0.1, vol), pan: rdist(0.7, 0)
      s5 = $voicespath + verse_e
      sample s5, amp: amp[4] * rdist(0.1, vol), pan: rdist(0.7, 0)
      sleep 16
    end
  end
end

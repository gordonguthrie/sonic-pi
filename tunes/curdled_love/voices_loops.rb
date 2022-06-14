##|   _____              _ _          _
##|  / ____|            | | |        | |
##| | |    _   _ _ __ __| | | ___  __| |
##| | |   | | | | '__/ _` | |/ _ \/ _` |
##| | |___| |_| | | | (_| | |  __/ (_| |
##|  \_____\__,_|_|  \__,_|_|\___|\__,_|
##| __      __   _
##| \ \    / /  (_)
##|  \ \  / /__  _  ___ ___  ___
##|   \ \/ / _ \| |/ __/ _ \/ __|
##|    \  / (_) | | (_|  __/\__ \
##|     \/ \___/|_|\___\___||___/

print("VOICES RELOADED")

use_bpm $bpm

vol = 0.7

with_fx :echo, mix: 0.3 do
  with_fx :reverb, mix: 0.2 do
    live_loop :voices, sync: :metronome do
      verse = $verse
      amp = $amp
      s1 = $voicespath + verse + "_001_1.wav"
      sample s1, amp: amp[0] * rdist(0.1, vol) * $VoiceAmp, pan: rdist(0.7, 0)
      s2 = $voicespath + verse + "_002_2.wav"
      sample s2, amp: amp[1] * rdist(0.1, vol) * $VoiceAmp, pan: rdist(0.7, 0)
      s3 = $voicespath + verse + "_003_3.wav"
      sample s3, amp: amp[2] * rdist(0.1, vol) * $VoiceAmp, pan: rdist(0.7, 0)
      s4 = $voicespath + verse + "_004_4.wav"
      sample s4, amp: amp[3] * rdist(0.1, vol) * $VoiceAmp, pan: rdist(0.7, 0)
      s5 = $voicespath + verse + "_005_5.wav"
      sample s5, amp: amp[4] * rdist(0.1, vol) * $VoiceAmp, pan: rdist(0.7, 0)
      sleep $vocalsleep
    end
  end
end

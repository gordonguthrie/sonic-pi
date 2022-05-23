voicespath = "/Users/gordonguthrie/Dev/sonic-pi/voices/"
current_bpm = 120
use_bpm current_bpm

ghost  = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }

with_fx :echo, mix: 0.3 do
  with_fx :reverb, mix: 0.2 do
    live_loop :voices do
      amps = (ring
              [1, 1, 1, 0, 0], # good
              [1, 0, 1, 1, 0], # good
              [1, 0, 0, 1, 1], # goodish
              [1, 0, 1, 1, 0], # good
              [1, 0, 1, 0, 1], # goodish
              [1, 0, 0, 1, 1], # yark
              [1, 1, 1, 1, 0], # great
              [1, 1, 1, 0, 1], # great
              [1, 1, 0, 1, 1], # great
              [1, 0, 1, 1, 1], # great
              [1, 1, 1, 1, 1], # great
              ).tick
      print("amps is", amps)
      s1 = voicespath + "love_song/i_met_him_001_1 VOCALOID.wav"
      sample s1, amp: amps[0]
      s2 = voicespath + "love_song/i_met_him_002_3 VOCALOID.wav"
      sample s2, amp: amps[1]
      s3 = voicespath + "love_song/i_met_him_003_4 VOCALOID.wav"
      sample s3, amp: amps[2]
      s4 = voicespath + "love_song/i_met_him_004_5 VOCALOID.wav"
      sample s4, amp: amps[3]
      s5 = voicespath + "love_song/i_met_him_005_2 VOCALOID.wav"
      sample s5, amp: amps[4]
      sleep 16
    end
  end
end

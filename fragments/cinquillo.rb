# Welcome to Sonic Pi

live_loop :blah do
  s1 = :vinyl_scratch
  s2 = :tabla_tas2
  sample s1, pitch_dis: 0.004, time_dis: 0.004, amp: 0.8
  sleep 0.1
  sleep 0.1
  sample s1, pitch_dis: 0.004, time_dis: 0.004, amp: 0.7
  sleep 0.1
  sample s1, pitch_dis: 0.004, time_dis: 0.004, amp: 0.9
  sleep 0.1
  sleep 0.1
  sample s1, pitch_dis: 0.004, time_dis: 0.004, amp: 0.7
  #sample s2, pitch_dis: 0.001, time_dis: 0.001
  sleep 0.1
  sample s1, pitch_dis: 0.004, time_dis: 0.004, amp: 0.9
  sleep 0.1
  sleep 0.1
end
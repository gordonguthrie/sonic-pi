##|   ____           _               _
##|  / __ \         | |             | |
##| | |  | |_ __ ___| |__   ___  ___| |_ _ __ __ _
##| | |  | | '__/ __| '_ \ / _ \/ __| __| '__/ _` |
##| | |__| | | | (__| | | |  __/\__ \ |_| | | (_| |
##|  \____/|_|  \___|_| |_|\___||___/\__|_|  \__,_|
##| | |
##| | |     ___   ___  _ __  ___
##| | |    / _ \ / _ \| '_ \/ __|
##| | |___| (_) | (_) | |_) \__ \
##| |______\___/ \___/| .__/|___/
##|                   | |
##|                   |_|

with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.25 do
    with_fx :compressor do
      idx = 0
      live_loop :backingtrack, sync: :metronome do
        use_bpm $bpm
        use_real_time
        beats     = $beats
        kicks     = $kicks
        snares    = $snares
        cymbals   = $cymbals
        dubs      = $dubs
        percs     = $percs
        bass      = $bass
        durations = $durations
        8.times do
          b  = beats[idx]
          k  = kicks[idx]
          s  = snares[idx]
          c  = cymbals[idx]
          du = dubs[idx]
          p  = percs[idx]
          n  = bass[idx]
          d  = durations[idx]
          if k && !$silencekicks then
            is_root = true
            samp = $samplespath + Kicks[0]
            pan = rdist(0.1, 0.4)
            sample samp, amp: 2.0, pan: pan
          else
            is_root = false
          end
          if s && !$silencesnares then
            samp = $samplespath + Snares[0]
            pan = rdist(0.1, -0.4)
            sample samp, pan: pan
          end
          if (c != 0) && !$silencecymbals then
            samp = $samplespath + Cymbals[c]
            pan = rdist(0.1, -0.2)
            sample samp, amp: 0.6, pan: pan
          end
          if d != 0 && !$silencebass then
            dur = (d + rdist(0.05, 0)).abs
            pan = rdist(0.1,  0.1)
            play_bass($Chord[n], pan, dur, is_root, false)
          end
          if s && !$silencedubs then
            samp = $samplespath + Dubs.choose
            pan = rdist(0.1, 0.4)
            sample samp, pan: pan
          end
          if s && !$silencepercs then
            samp = $samplespath + Percs.choose
            pan = rdist(0.1, -0.4)
            sample samp, pan: pan
          end
          if kicks[idx + 1] then
            prompt("blue", b)
          end
          if snares[idx + 1] then
            prompt("yellow", b)
          end
          if percs[idx + 1] then
            prompt("red", b)
          end
          if dubs[idx + 1] then
            prompt("green", b)
          end
          if kicks[idx + 2] then
            prompt("blue1", b)
          end
          if snares[idx + 2] then
            prompt("yellow1", b)
          end
          if percs[idx + 2] then
            prompt("red1", b)
          end
          if dubs[idx + 2] then
            prompt("green1", b)
          end
          if kicks[idx + 3] then
            prompt("blue2", b)
          end
          if snares[idx + 3] then
            prompt("yellow2", b)
          end
          if percs[idx + 3] then
            prompt("red2", b)
          end
          if dubs[idx + 3] then
            prompt("green2", b)
          end
          if kicks[idx + 4] then
            prompt("blue3", b)
          end
          if snares[idx + 4] then
            prompt("yellow3", b)
          end
          if percs[idx + 4] then
            prompt("red3", b)
          end
          if dubs[idx + 4] then
            prompt("green3", b)
          end
          idx = idx + 1
          slp = get_sleep(b)
          sleep slp
        end
      end
    end
  end
end

beatidx = 0

live_loop :syncher, sync: :metronome  do
  use_real_time
  use_bpm $bpm
  beats = $beats
  8.times do
    cue :trig
    beat = beats[beatidx]
    slp = get_sleep(beat)
    sleep slp
    beatidx = tick
  end
end

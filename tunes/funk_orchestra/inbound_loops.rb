#  _____       _                           _
# |_   _|     | |                         | |
#   | |  _ __ | |__   ___  _   _ _ __   __| |
#   | | | '_ \| '_ \ / _ \| | | | '_ \ / _` |
#  _| |_| | | | |_) | (_) | |_| | | | | (_| |
# |_____|_| |_|_.__/ \___/ \__,_|_| |_|\__,_|

## the controllers that receive OSC messages
## these distribute the messages into different playing loops
## so its a router

live_loop(:controller1) do
  use_real_time
  sync("/*/*/push1")
  cue("playblue/" + rand_i(9).to_s)
end

live_loop(:controller2) do
  use_real_time
  sync("/*/*/push2")
  cue("playyellow/" + rand_i(9).to_s)
end

live_loop(:controller3) do
  use_real_time
  sync("/*/*/push3")
  cue("playred/" + rand_i(9).to_s)
end

live_loop(:controller4) do
  use_real_time
  sync("/*/*/push4")
  cue("playgreen/" + rand_i(9).to_s)
end

## this is the destination the routers send syncs to
## and these actually trigger the sounds
live_loop(:blue0) do
  use_real_time
  sync("playblue/0")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue1) do
  use_real_time
  sync("playblue/1")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue2) do
  use_real_time
  sync("playblue/2")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue3) do
  use_real_time
  sync("playblue/3")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue4) do
  use_real_time
  sync("playblue/4")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue5) do
  use_real_time
  sync("playblue/5")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue6) do
  use_real_time
  sync("playblue/6")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue7) do
  use_real_time
  sync("playblue/7")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue8) do
  use_real_time
  sync("playblue/8")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue9) do
  use_real_time
  sync("playblue/9")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow0) do
  use_real_time
  sync("playyellow/0")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow1) do
  use_real_time
  sync("playyellow/1")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow2) do
  use_real_time
  sync("playyellow/2")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow3) do
  use_real_time
  sync("playyellow/3")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow4) do
  use_real_time
  sync("playyellow/4")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow5) do
  use_real_time
  sync("playyellow/5")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow6) do
  use_real_time
  sync("playyellow/6")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow7) do
  use_real_time
  sync("playyellow/7")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow8) do
  use_real_time
  sync("playyellow/8")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow9) do
  use_real_time
  sync("playyellow/9")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red0) do
  use_real_time
  sync("playred/0")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red1) do
  use_real_time
  sync("playred/1")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red2) do
  use_real_time
  sync("playred/2")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red3) do
  use_real_time
  sync("playred/3")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red4) do
  use_real_time
  sync("playred/4")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red5) do
  use_real_time
  sync("playred/5")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red6) do
  use_real_time
  sync("playred/6")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red7) do
  use_real_time
  sync("playred/7")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red8) do
  use_real_time
  sync("playred/8")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red9) do
  use_real_time
  sync("playred/9")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green0) do
  use_real_time
  sync("playgreen/0")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green1) do
  use_real_time
  sync("playgreen/1")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green2) do
  use_real_time
  sync("playgreen/2")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green3) do
  use_real_time
  sync("playgreen/3")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green4) do
  use_real_time
  sync("playgreen/4")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green5) do
  use_real_time
  sync("playgreen/5")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green6) do
  use_real_time
  sync("playgreen/6")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green7) do
  use_real_time
  sync("playgreen/7")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green8) do
  use_real_time
  sync("playgreen/8")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green9) do
  use_real_time
  sync("playgreen/9")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

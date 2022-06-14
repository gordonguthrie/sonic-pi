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
  sync("playblue/0")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue1) do
  sync("playblue/1")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue2) do
  sync("playblue/2")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue3) do
  sync("playblue/3")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue4) do
  sync("playblue/4")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue5) do
  sync("playblue/5")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue6) do
  sync("playblue/6")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue7) do
  sync("playblue/7")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue8) do
  sync("playblue/8")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:blue9) do
  sync("playblue/9")
  sample($samplespath + Kicks.choose,   amp: $SampleKickAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow0) do
  sync("playyellow/0")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow1) do
  sync("playyellow/1")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow2) do
  sync("playyellow/2")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow3) do
  sync("playyellow/3")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow4) do
  sync("playyellow/4")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow5) do
  sync("playyellow/5")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow6) do
  sync("playyellow/6")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow7) do
  sync("playyellow/7")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow8) do
  sync("playyellow/8")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow9) do
  sync("playyellow/9")
  sample($samplespath + Snares.choose,   amp: $SampleSnareAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red0) do
  sync("playred/0")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red1) do
  sync("playred/1")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red2) do
  sync("playred/2")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red3) do
  sync("playred/3")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red4) do
  sync("playred/4")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red5) do
  sync("playred/5")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red6) do
  sync("playred/6")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red7) do
  sync("playred/7")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red8) do
  sync("playred/8")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:red9) do
  sync("playred/9")
  sample($samplespath + Percs.choose,   amp: $SamplePercAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green0) do
  sync("playgreen/0")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green1) do
  sync("playgreen/1")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green2) do
  sync("playgreen/2")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green3) do
  sync("playgreen/3")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green4) do
  sync("playgreen/4")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green5) do
  sync("playgreen/5")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green6) do
  sync("playgreen/6")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green7) do
  sync("playgreen/7")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green8) do
  sync("playgreen/8")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

live_loop(:green9) do
  sync("playgreen/9")
  sample($samplespath + Dubs.choose,   amp: $SampleDubAmp * $normal.call,   pan: rdist(1, 0))
end

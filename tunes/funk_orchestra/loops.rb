samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
ghost = -> { rrand(0.2, 0.3) }
normal = -> { rrand(0.4, 0.6) }
accent = -> { rrand(0.8, 0.9) }

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

  ## print("playing blue 0")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue1) do
  sync("playblue/1")

  ## print("playing blue 1")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue2) do
  sync("playblue/2")

  ## print("playing blue 2")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue3) do
  sync("playblue/3")

  ## print("playing blue 3")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue4) do
  sync("playblue/4")

  ## print("playing blue 4")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue5) do
  sync("playblue/5")

  ## print("playing blue 5")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue6) do
  sync("playblue/6")

  ## print("playing blue 6")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue7) do
  sync("playblue/7")

  ## print("playing blue 7")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue8) do
  sync("playblue/8")

  ## print("playing blue 8")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:blue9) do
  sync("playblue/9")

  ## print("playing blue 9")
  ## sync(:trig)
  sample(samplespath + Kicks.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow0) do
  sync("playyellow/0")

  ## print("playing yellow 0")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow1) do
  sync("playyellow/1")

  ## print("playing yellow 1")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow2) do
  sync("playyellow/2")

  ## print("playing yellow 2")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow3) do
  sync("playyellow/3")

  ## print("playing yellow 3")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow4) do
  sync("playyellow/4")

  ## print("playing yellow 4")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow5) do
  sync("playyellow/5")

  ## print("playing yellow 5")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow6) do
  sync("playyellow/6")

  ## print("playing yellow 6")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow7) do
  sync("playyellow/7")

  ## print("playing yellow 7")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow8) do
  sync("playyellow/8")

  ## print("playing yellow 8")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:yellow9) do
  sync("playyellow/9")

  ## print("playing yellow 9")
  ## sync(:trig)
  sample(samplespath + Snares.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red0) do
  sync("playred/0")

  ## print("playing red 0")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red1) do
  sync("playred/1")

  ## print("playing red 1")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red2) do
  sync("playred/2")

  ## print("playing red 2")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red3) do
  sync("playred/3")

  ## print("playing red 3")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red4) do
  sync("playred/4")

  ## print("playing red 4")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red5) do
  sync("playred/5")

  ## print("playing red 5")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red6) do
  sync("playred/6")

  ## print("playing red 6")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red7) do
  sync("playred/7")

  ## print("playing red 7")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red8) do
  sync("playred/8")

  ## print("playing red 8")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:red9) do
  sync("playred/9")

  ## print("playing red 9")
  ## sync(:trig)
  sample(samplespath + Cymbals.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green0) do
  sync("playgreen/0")

  ## print("playing green 0")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green1) do
  sync("playgreen/1")

  ## print("playing green 1")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green2) do
  sync("playgreen/2")

  ## print("playing green 2")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green3) do
  sync("playgreen/3")

  ## print("playing green 3")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green4) do
  sync("playgreen/4")

  ## print("playing green 4")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green5) do
  sync("playgreen/5")

  ## print("playing green 5")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green6) do
  sync("playgreen/6")

  ## print("playing green 6")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green7) do
  sync("playgreen/7")

  ## print("playing green 7")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green8) do
  sync("playgreen/8")

  ## print("playing green 8")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

live_loop(:green9) do
  sync("playgreen/9")

  ## print("playing green 9")
  ## sync(:trig)
  sample(samplespath + Dubs.choose,   amp: normal.call,   pan: rdist(1, 0))
end

## these are the synching loops that push the OSC messages out to the webpage
## one for each of the four tabs
live_loop(:blueoutbound) do
  slp = sync(:blueoutbound)
  sleep(slp[0])

  ## print("in blue outbound", slp)
  use_osc("localhost", 3333)
  osc("blue")
end

live_loop(:yellowoutbound) do
  slp = sync(:yellowoutbound)
  sleep(slp[0])

  ## print("in yellow outbound", slp)
  use_osc("localhost", 3333)
  osc("yellow")
end

live_loop(:redoutbound) do
  slp = sync(:redoutbound)
  sleep(slp[0])

  ## print("in red outbound", slp)
  use_osc("localhost", 3333)
  osc("red")
end

live_loop(:greenoutbound) do
  slp = sync(:greenoutbound)
  sleep(slp[0])

  ## print("in green outbound", slp)
  use_osc("localhost", 3333)
  osc("green")
end

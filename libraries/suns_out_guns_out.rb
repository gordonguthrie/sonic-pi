live_loop(:controller1) do
  use_real_time
  a = sync("/*/*/push1")
  pan = rdist(1, 0)
  amp = rdist(0.5, 0.5)
  shots = ["gunshot.wav"]
  sample("/Users/gordonguthrie/Dev/sonic-pi/samples/Guns/" + shots.choose,   pan: pan,   amp: amp)
end

live_loop(:controller2) do
  use_real_time
  a = sync("/*/*/push2")
  pan = rdist(1, 0)
  amp = rdist(0.5, 0.5)
  impacts = [
    "mixkit-8-bit-explosion-gun-2779.wav",
    "mixkit-arcade-retro-jump-223.wav",
    "ricochet.wav",
  ]
  sample("/Users/gordonguthrie/Dev/sonic-pi/samples/Guns/" + impacts.choose,   pan: pan,   amp: amp)
end

live_loop(:controller3) do
  use_real_time
  a = sync("/*/*/push3")
  pan = rdist(1, 0)
  amp = rdist(0.5, 0.5)
  bursts = ["ratatat.wav", "ratatat2.wav"]
  sample("/Users/gordonguthrie/Dev/sonic-pi/samples/Guns/" + bursts.choose,   pan: pan,   amp: amp)
end

live_loop(:controller4) do
  use_real_time
  a = sync("/*/*/push4")
  pan = rdist(1, 0)
  amp = rdist(0.5, 0.5)
  reloads = ["reload.wav", "mixkit-shotgun-hard-pump-1665.wav"]
  sample("/Users/gordonguthrie/Dev/sonic-pi/samples/Guns/" + reloads.choose,   pan: pan,   amp: amp)
end

#   ____        _   _                           _
#  / __ \      | | | |                         | |
# | |  | |_   _| |_| |__   ___  _   _ _ __   __| |
# | |  | | | | | __| '_ \ / _ \| | | | '_ \ / _` |
# | |__| | |_| | |_| |_) | (_) | |_| | | | | (_| |
#  \____/ \__,_|\__|_.__/ \___/ \__,_|_| |_|\__,_|

## these are the synching loops that push the OSC messages out to the webpage
## one for each of the four rings and each of the 12 circles
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

live_loop(:blueoutbound1) do
  slp = sync(:blue1outbound)
  sleep(slp[0])

  ## print("in blue outbound", slp)
  use_osc("localhost", 3333)
  osc("blue1")
end

live_loop(:yellowoutbound1) do
  slp = sync(:yellow1outbound)
  sleep(slp[0])

  ## print("in yellow outbound", slp)
  use_osc("localhost", 3333)
  osc("yellow1")
end

live_loop(:redoutbound1) do
  slp = sync(:red1outbound)
  sleep(slp[0])

  ## print("in red outbound", slp)
  use_osc("localhost", 3333)
  osc("red1")
end

live_loop(:greenoutbound1) do
  slp = sync(:green1outbound)
  sleep(slp[0])

  ## print("in green outbound", slp)
  use_osc("localhost", 3333)
  osc("green1")
end

live_loop(:blueoutbound2) do
  slp = sync(:blue2outbound)
  sleep(slp[0])

  ## print("in blue outbound", slp)
  use_osc("localhost", 3333)
  osc("blue2")
end

live_loop(:yellowoutbound2) do
  slp = sync(:yellow2outbound)
  sleep(slp[0])

  ## print("in yellow outbound", slp)
  use_osc("localhost", 3333)
  osc("yellow2")
end

live_loop(:redoutbound2) do
  slp = sync(:red2outbound)
  sleep(slp[0])

  ## print("in red outbound", slp)
  use_osc("localhost", 3333)
  osc("red2")
end

live_loop(:greenoutbound2) do
  slp = sync(:green2outbound)
  sleep(slp[0])

  ## print("in green outbound", slp)
  use_osc("localhost", 3333)
  osc("green2")
end

live_loop(:blueoutbound3) do
  slp = sync(:blue3outbound)
  sleep(slp[0])

  ## print("in blue outbound", slp)
  use_osc("localhost", 3333)
  osc("blue3")
end

live_loop(:yellowoutbound3) do
  slp = sync(:yellow3outbound)
  sleep(slp[0])

  ## print("in yellow outbound", slp)
  use_osc("localhost", 3333)
  osc("yellow3")
end

live_loop(:redoutbound3) do
  slp = sync(:red3outbound)
  sleep(slp[0])

  ## print("in red outbound", slp)
  use_osc("localhost", 3333)
  osc("red3")
end

live_loop(:greenoutbound3) do
  slp = sync(:green3outbound)
  sleep(slp[0])

  ## print("in green outbound", slp)
  use_osc("localhost", 3333)
  osc("green3")
end

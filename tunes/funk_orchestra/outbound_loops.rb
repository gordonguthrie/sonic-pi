#_______
#/__\
#_______________
#__'_\/_\'_\/_`
#_____)(_)_(_
#\____/\__,_\___.__/\___/\__,___\__,_

thesearethesynchingloopsthatpushtheOSCmessagesouttothewebpage
oneforeachofthefourringsandeachofthe12circles
use_osc_loggingfalse


live_loop(:blueoutbound)do
  slp=sync(:blueoutbound)
  sleep(slp[0])

  print("inblueoutbound",slp)
  use_osc("localhost",3333)
  osc("blue")
end

live_loop(:blueoutbound1)do
  slp=sync(:blue1outbound)
  sleep(slp[0])

  print("inblueoutbound",slp)
  use_osc("localhost",3333)
  osc("blue1")
end

live_loop(:blueoutbound2)do
  slp=sync(:blue2outbound)
  sleep(slp[0])

  print("inblueoutbound",slp)
  use_osc("localhost",3333)
  osc("blue2")
end

live_loop(:blueoutbound3)do
  slp=sync(:blue3outbound)
  sleep(slp[0])

  print("inblueoutbound",slp)
  use_osc("localhost",3333)
  osc("blue3")
end


live_loop(:yellowoutbound)do
  slp=sync(:yellowoutbound)
  sleep(slp[0])

  print("inyellowoutbound",slp)
  use_osc("localhost",3333)
  osc("yellow")
end

live_loop(:yellowoutbound1)do
  slp=sync(:yellow1outbound)
  sleep(slp[0])

  print("inyellowoutbound",slp)
  use_osc("localhost",3333)
  osc("yellow1")
end

live_loop(:yellowoutbound2)do
  slp=sync(:yellow2outbound)
  sleep(slp[0])

  print("inyellowoutbound",slp)
  use_osc("localhost",3333)
  osc("yellow2")
end

live_loop(:yellowoutbound3)do
  slp=sync(:yellow3outbound)
  sleep(slp[0])

  print("inyellowoutbound",slp)
  use_osc("localhost",3333)
  osc("yellow3")
end


live_loop(:redoutbound)do
  slp=sync(:redoutbound)
  sleep(slp[0])

  print("inredoutbound",slp)
  use_osc("localhost",3333)
  osc("red")
end

live_loop(:redoutbound1)do
  slp=sync(:red1outbound)
  sleep(slp[0])

  print("inredoutbound",slp)
  use_osc("localhost",3333)
  osc("red1")
end

live_loop(:redoutbound2)do
  slp=sync(:red2outbound)
  sleep(slp[0])

  print("inredoutbound",slp)
  use_osc("localhost",3333)
  osc("red2")
end

live_loop(:redoutbound3)do
  slp=sync(:red3outbound)
  sleep(slp[0])

  print("inredoutbound",slp)
  use_osc("localhost",3333)
  osc("red3")
end


live_loop(:greenoutbound)do
  slp=sync(:greenoutbound)
  sleep(slp[0])

  print("ingreenoutbound",slp)
  use_osc("localhost",3333)
  osc("green")
end

live_loop(:greenoutbound1)do
  slp=sync(:green1outbound)
  sleep(slp[0])

  print("ingreenoutbound",slp)
  use_osc("localhost",3333)
  osc("green1")
end

live_loop(:greenoutbound2)do
  slp=sync(:green2outbound)
  sleep(slp[0])

  print("ingreenoutbound",slp)
  use_osc("localhost",3333)
  osc("green2")
end

live_loop(:greenoutbound3)do
  slp=sync(:green3outbound)
  sleep(slp[0])

  print("ingreenoutbound",slp)
  use_osc("localhost",3333)
  osc("green3")
end

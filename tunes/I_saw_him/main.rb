use_debug false

$bpm = 120

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/I_saw_him/loadable/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/I_saw_him/loadable/hooks.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/I_saw_him/loadable/runtime.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/suns_out_guns_out.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/play_routines.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/bag_of_randoms.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/tab.rb")

use_random_seed 51

$beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

$randoms = bag_of_randoms(1024)

$swing_time = 0.2

$keys = (ring, {root: :C, scale: :major})

k1 = tabn(["2001","0001","2001","2000"])
s1 = tabn(["0000","1000","0000","1010"])
w1 = tabn(["2000","2000","1210","1121"])

rkick0 = rsnare0 = rcymbal0 = dub0 = hard0 = hook0 = rsnareacc0 = ring(false)

g1 = g2 = g3 = g4 = ring(:r)

rkick1      = tabb(["1000","0010","1000","0010"])
rkick2      = tabb(["1000","0000","1000","0010"])
rkick3      = tabb(["1000","0010","1010","0010"])
rsnare1     = tabb(["0000","1000","0000","1000"])
rsnare2     = tabb(["0000","1000","0000","1000"])
rsnareacc1  = tabb(["1000","1000","1000","1000"])
rsnareacc2  = tabb(["1010","1000","1010","1000"])
rcymbal1    = tabn(["1210","1123"])
rcymbal2    = tabn(["1310","1134"])
rcymbal3    = tabn(["3230","3321"])
hooks1      = tabn(["1020","2430"])

g1a   = tab2(["F.ab","FGab","FGab","FGab"], :C4)
g2a   = tab2(["...f","a.fe","...f","c.fe"], :C4)
g3a   = tab2(["...a","C.ag","...a","c.ag"], :C4)
g4a   = tab2(["....","..DC","....","..DC"], :C4)


dub1  = tabb(["0010","0010"])
dub2  = tabb(["0011","1000"])
hard1 = tabb(["0000","0100"])
hard2 = tabb(["0001","1100"])
hook1 = tabb(["01"])

$Kicks      = Kicks1
$Snares     = Snares1
$Cymbals    = Cymbals1
$DubShakers = DubShakers1
$Shakers    = Shakers1
$Hook       = Hook2

$rkick      = rkick1
$rcymbal    = rcymbal1
$rsnare     = rsnare1
$rsnareacc  = rsnareacc1
$hooks      = hooks1

$g1 = g1a
$g2 = g2a
$g3 = g3a
$g4 = g4a

$has_shaker = false

mbass0 = ring(0)
mbassx = make_riff(9, rkick1.drop(8), 0.2)

print("mbass1 is", mbassx)
print("bass is", numring_to_string(mbassx[:beats]))
print("durations is", mbassx[:durations])

##| mbass      = mbass0

$mbass      = mbassx[:beats]
$mdurations = mbassx[:durations]

$dub  = dub1
$hard = hard0
$hook = hook0

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

live_loop :metronome do
  sleep 8
end

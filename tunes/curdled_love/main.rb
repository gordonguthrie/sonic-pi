use_debug false

print("MAIN RELOADED")

$bpm = 120

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
$voicespath = "/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/voices/"

load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/loadable/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/loadable/hooks.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/loadable/runtime.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/suns_out_guns_out.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/play_routines.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/bag_of_randoms.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/tab.rb")

use_random_seed 58

$beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

$randoms = bag_of_randoms(1024)

$swing_time = 0.2

rkick0 = rsnare0 = rcymbal0 = playdub0 = playhard0 = playhook0 = rsnareacc0 = ring(false)
mbass0 = ring(0)
g1 = g2 = g3 = g4 = ring(:r)
gr = ring(0)

$key = {root: :A, scale: :major}

k1 = tabn(["2001","0001","2001","2000"])
s1 = tabn(["0000","1000","0000","1010"])
w1 = tabn(["2000","2000","1210","1121"])

rkick1     = tabb(["1000","0010","1000","0010"])
rkick2     = tabb(["1000","0000","1000","0010"])
rkick3     = tabb(["1000","0010","1010","0010"])
rsnare1    = tabb(["0000","1000","0000","1000"])
rsnare2    = tabb(["0000","1000","0000","1000"])
rsnareacc1 = tabb(["1000","1000","1000","1000"])
rsnareacc2 = tabb(["1010","1000","1010","1000"])
rcymbal1   = tabn(["1210","1123"])
rcymbal2   = tabn(["1310","1134"])
rcymbal3   = tabn(["3230","3321"])
hooks1     = tabn(["1020","2430"])
hooks2     = tabn(["1012","1413"])

playdub1  = tabb(["0010","0010"])
playdub2  = tabb(["0011","1000"])
playhard1 = tabb(["0000","0100"])
playhard2 = tabb(["0001","1100"])
playhook1 = tabb(["01"])

hk1 = {hook:   Hook1,
       rhythm: hooks1}

$Kicks      = Kicks1
$Snares     = Snares1
$Cymbals    = Cymbals1
$DubShakers = DubShakers2
$Shakers    = Shakers2

##| $rkick     = rkick0
##| $rcymbal   = rcymbal0
##| $rsnare    = rsnare0
##| $rsnareacc = rsnareacc0
##| $hk        = hk1

$rkick     = rkick1
$rcymbal   = rcymbal3
$rsnare    = rsnare2
$rsnareacc = rsnareacc1
$hk        = hk1

$has_shaker = false

$playdub  = playdub0
$playhard = playhard0
$playhook = playhook0

root_a = note($key[:root], octave: 4)
print("root_a is", root_a)
mode_a = $key[:scale]
print("mode is", mode_a)
g1a = tab2(["F.ab","FGab","FGab","FGab"], root_a, mode_a)
g2a = tab2(["...f","a.fe","...f","c.fe"], root_a, mode_a)
g3a = tab2(["...a","C.ag","...a","c.ag"], root_a, mode_a)
g4a = tab2(["....","..DC","....","..DC"], root_a, mode_a)
gra = tabn(["8283"])

root_b = note($key[:root], octave: 3)
mode_b = $key[:scale]
g1b = tab2(["....","cece","cece","cece"], root_b, mode_b)
g2b = tab2(["....",".g.g","....","...."], root_b, mode_b)
g3b = tab2(["....",".B.B","....","...."], root_b, mode_b)
g4b = tab2(["....","...D","....","...."], root_b, mode_b)
grb = tabn(["3838"])

root_c = note($key[:root], octave: 3)
mode_c = $key[:scale]
g1c = tab2(["cgeB", "g.f.","egeD","g.f."], root_c, mode_c)
g2c = tab2(["e...", "B.F.","g...","...."], root_c, mode_c)
g3c = tab2(["....", "....","B...","D..."], root_c, mode_c)
g4c = tab2(["B...", "....","D...","F..."], root_c, mode_c)
grc = tabn(["8425"])

$g1 = g1c
$g2 = g2c
$g3 = g3c
$g4 = g4c
$gr = grc

mbass1 = tabn(["1228", "5115"])
mbass2 = tabn(["1963", "4711"])
mbass3 = tabn(["1634", "7113"])
mbass4 = tabn(["1851", "5216"])
mbass5 = tabn(["1347", "1319"])
mdurations1 = [2.0, 0.5,  1.0, 0.35, 0.7, 0.4,  2.0, 0.0]
mdurations2 = [2.0, 0.25, 0.7, 0.25, 0.5, 0.5,  2.0, 0.25]
mdurations3 = [2.0, 0.5,  0.7, 0.25, 1.0, 0.25, 2.0, 0.4]
mdurations4 = [2.0, 0.25, 0.7, 0.4,  0.0, 0.35, 2.0, 0.4]
mdurations5 = [2.0, 0.25, 0.5, 0.5,  0.5, 0.4 , 2.0, 0.4]

riff = make_riff(9, rkick1.drop(8), 0.2)
mbassx = riff[:beats]
mdurationsx = riff[:durations]

print("mbass is", mbassx)
print("bass is", numring_to_string(riff[:beats]))
print("durations is", riff[:durations])

##| mbass      = mbass0

$mbass      = mbass1
$mdurations = mdurations1

verse_1 = "i_saw_you"
verse_2 = "you_kissed_me"
verse_3 = "i_fucked_you"
verse_4 = "you_cheated"
verse_5 = "i_met_her"

chorus_1 = "Chorus I"
chorus_2 = "Chorus II"
chorus_3 = "Chorus III"

$verse = chorus_3

amp0 = [0, 0, 0, 0, 0]
amp1 = [1, 0, 0, 0, 0]
amp2 = [1, 1, 1, 0, 0]
amp3 = [1, 1, 1, 0, 1]
amp4 = [1, 1, 0, 1, 1]
amp5 = [1, 0, 1, 1, 1]
amp6 = [1, 1, 1, 1, 1]

$amp = amp0

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

live_loop :metronome do
  sleep 8
end

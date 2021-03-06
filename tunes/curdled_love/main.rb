##|   _____              _ _          _
##|  / ____|            | | |        | |
##| | |    _   _ _ __ __| | | ___  __| |
##| | |   | | | | '__/ _` | |/ _ \/ _` |
##| | |___| |_| | | | (_| | |  __/ (_| |
##|  \_____\__,_|_|  \__,_|_|\___|\__,_|
##| | |
##| | |     _____   _____
##| | |    / _ \ \ / / _ \
##| | |___| (_) \ V /  __/
##| |______\___/ \_/ \___|

print("MAIN RELOADED")

use_debug false

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
$voicespath = "/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/voices/"

load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/loadable/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/loadable/hooks.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/curdled_love/loadable/runtime.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/suns_out_guns_out.rb")
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
hooks3     = tabn(["1012","1413","1032","0232"])

playdub1  = tabb(["0010","0010"])
playdub2  = tabb(["0011","1000"])
playhard1 = tabb(["0000","0100"])
playhard2 = tabb(["0001","1100"])
playhook1 = tabb(["01"])

bass1 = tabn(["1228", "5115"])
bass2 = tabn(["1963", "4711"])
bass3 = tabn(["1634", "7113"])
bass4 = tabn(["1851", "5216"])
bass5 = tabn(["1347", "1319"])
durations1 = [2.0, 0.5,  1.0, 0.35, 0.7, 0.4,  2.0, 0.0]
durations2 = [2.0, 0.25, 0.7, 0.25, 0.5, 0.5,  2.0, 0.25]
durations3 = [2.0, 0.5,  0.7, 0.25, 1.0, 0.25, 2.0, 0.4]
durations4 = [2.0, 0.25, 0.7, 0.4,  0.0, 0.35, 2.0, 0.4]
durations5 = [2.0, 0.25, 0.5, 0.5,  0.5, 0.4 , 2.0, 0.4]

riff = make_riff(9, rkick1.drop(8), 0.2)
bassx = riff[:beats]
durationsx = riff[:durations]

$key = {root: :d, scale: :major}

funk0 = {bass: ring(0), durations: durations1}
funk1 = {bass: bass1, durations: durations1}
funk2 = {bass: bass2, durations: durations2}
funk3 = {bass: bass3, durations: durations3}
funk4 = {bass: bass4, durations: durations4}
funk5 = {bass: bass5, durations: durations5}

hk1 = {hook: Hook1, rhythm: hooks1}
hk2 = {hook: Hook2, rhythm: hooks2}
hk3 = {hook: Hook3, rhythm: hooks3}
hk4 = {hook: Hook4, rhythm: hooks1}
hk5 = {hook: Hook5, rhythm: hooks2}

$bpm = 120

$Kicks      = Kicks2
$Snares     = Snares1
$Cymbals    = Cymbals1
$DubShakers = DubShakers2

$Shakers    = Shakers1

$rkick     = rkick0
$rcymbal   = rcymbal0
$rsnare    = rsnare0
$rsnareacc = rsnareacc0
$hk        = hk4

$has_shaker = true

$playdub  = playdub0
$playhard = playhard0
$playhook = playhook0

$funk = funk0

verse_1 = "i_saw_you"
verse_2 = "you_kissed_me"
verse_3 = "i_fucked_you"
verse_4 = "you_cheated"
verse_5 = "i_met_her"

chorus_1 = "Chorus I"
chorus_2 = "Chorus II"
chorus_3 = "Chorus III"

$verse = verse_5
$verse = chorus_1

amp0 = [0, 0, 0, 0, 0]
amp1 = [1, 0, 0, 0, 0]
amp2 = [1, 1, 1, 0, 0]
amp3 = [1, 1, 1, 0, 1]
amp4 = [1, 1, 0, 1, 1]
amp5 = [1, 0, 1, 1, 1]
amp6 = [1, 1, 1, 1, 1]

$vocalsleep = 16
$amp = amp0

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

live_loop :metronome do
  sleep 8
end

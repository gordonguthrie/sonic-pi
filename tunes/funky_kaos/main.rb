##|  ______           _
##| |  ____|         | |
##| | |__ _   _ _ __ | | ___   _
##| |  __| | | | '_ \| |/ / | | |
##| | |  | |_| | | | |   <| |_| |
##| |_|   \__,_|_| |_|_|\_\\__, |
##|                         __/ |
##|  _  __          ____   |___/
##| | |/ /    /\   / __ \ / ____|
##| | ' /    /  \ | |  | | (___
##| |  <    / /\ \| |  | |\___ \
##| | . \  / ____ \ |__| |____) |
##| |_|\_\/_/    \_\____/|_____/

$bpm = 55

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/bag_of_randoms.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/tab.rb")


$beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

$randoms = bag_of_randoms(1024)

$swing_time = 0.1

$switch_count = 4

kick0 = snare0 = shaker0 = steelies0 = ring(false)
cymbal0 = bassamp0 = champ0 = ring(0)
chords0 = ring(:r)

$Cymbals = [
  :drum_cymbal_soft,
  :drum_cymbal_pedal,
  :drum_cymbal_closed,
  :drum_cymbal_hard,
  :drum_cymbal_open,
].ring

$key  = :d1
$mode = :major

kick1    = tabb(["1000","0000","1000","0000"])
cymbal1  = tabn(["1010","1140","1020","1030","2121"])
cymbal2  = tabn(["1111","1414","1311"])
snare1   = tabb(["0000","1000","0000","1000"])
bass1    = tab2(["c.e.","e.g.","g.B.","e.c."], $key, $mode)
bassamp1 = tabn(["6070"])
bass2    = tab2(["cegB","Afdc",], $key, $mode)
bassamp2 = tabn(["4556"])

chords1  = tabc(["1141","6366","4451"])
chplay1  =  tab(["uuuu","udud","usus"])
champ1   = tabn(["5361"])


shaker1   = spread(3, 23)
steelies1 = spread(3, 29)

$kick     = kick1
$snare    = snare1
$bass     = bass2
$bassamp  = bassamp2
$cymbal   = cymbal1
$shaker   = shaker0
$steelies = steelies0
$chords   = chords1
$chplay   = chplay1
$champ    = champ1

live_loop :metronome do
  sleep 8
end

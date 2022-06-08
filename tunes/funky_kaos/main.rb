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

$bpm = 120

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/bag_of_randoms.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/tab.rb")


$beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

$randoms = bag_of_randoms(1024)

$swing_time = 0.1

$switch_count = 8

kick0 = snare0 = shaker0 = punches0 = euclidians0 = ring(false)
cymbal0 = bassamp0 = champ0 = ring(0)
chords0 = ring(:r)

$Cymbals = [
  :drum_cymbal_soft,
  :drum_cymbal_pedal,
  :drum_cymbal_closed,
  :drum_cymbal_hard,
  :drum_cymbal_open,
].ring

Punches = [
  "Punches/mellow-stab.wav",
  "Punches/stab-satisfying-2.wav",
  "Punches/stab-satisfying-1.wav",
  "Punches/stab-satisfying-3.wav",
  "Punches/thick-punch.wav",
  "Claps/pong-verb-clap.wav",
  "Claps/divine-clap-ring.wav",
].ring

Claps = [
  "Claps/pong-verb-clap.wav",
  "Claps/divine-clap-ring.wav",
].ring

Shakers = [
  "Wierdos/vibra-crunchy-1.wav",
  "Punches/roller-disco-bomb-drop.wav",
].ring

$key  = :c1
$mode = :major

kick1    = tabb(["1000","0000","1000","0000"])
cymbal1  = tabn(["1010","1140","1020","1030","2121"])
cymbal2  = tabn(["1415","1414","1414"])
snare1   = tabb(["0000","1000","0000","1000"])
bass1    = tab2(["c.ee","e.gG","g.bB","e.cC"], $key, $mode)
bassamp1 = tabn(["6070"])
bass2    = tab2(["cegB","Afdc",], $key, $mode)
bassamp2 = tabn(["4556"])

chords1  = tabc(["1.4.","4..."])
chplay1  =  tab(["susd"])
champ1   = tabn(["4111"])
chords2  = tabc(["1111","4444","6666","1111"])
chplay2  =  tab(["udus","udud"])
champ2   = tabn(["4131","4241"])

shaker1     = spread(3, 7)
euclidians1 = spread(3, 11)
punch1      = spread(2, 5)
clap1       = spread(1, 8)

$Punch  = Punches[4]
$Clap   = Claps[1]
$Shaker = Shakers[2]

$kick       = kick1
$snare      = snare1
$bass       = bass1
$bassamp    = bassamp1
$cymbal     = cymbal1
$shaker     = shaker1
$euclidians = euclidians0
$punch      = punch1
$clap       = clap1
$chords     = chords2
$chplay     = chplay2
$champ      = champ0

live_loop :metronome do
  sleep 8
end

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

hook0 = kick0 = snare0 = shaker0 = punches0 = euclidians0 = ring(false)
cymbal0 = bassamp0 = champ0 = ring(0)
chords0 = ring(:r)

$KickAmp   = 0.2
$SnareAmp  = 0.4
$CymbalAmp = 0.4
$BassAmp   = 0.08
$HookAmp   = 0.1
$ShakerAmp = 0.2
$PunchAmp  = 0.15
$ClapAmp   = 0.15

$Cymbals = [
  :drum_cymbal_soft,
  :drum_cymbal_pedal,
  :drum_cymbal_closed,
  :drum_cymbal_hard,
  :drum_cymbal_open,
].ring

$Punches = [
  "Punches/mellow-stab.wav",
  "Punches/stab-satisfying-2.wav",
  "Punches/stab-satisfying-1.wav",
  "Punches/stab-satisfying-3.wav",
  "Punches/73.wav",
].ring

$Claps = [
  "Claps/Vrb-clap1.wav",
  "Claps/compressed-clap.wav",
  "Claps/thin-wispy-clap.wav",
  "Claps/real-room-clap.wav",
].ring

$Shakers = [
  "Wierdos/vibra-crunchy-1.wav",
  "Punches/roller-disco-bomb-drop.wav",
  "Punches/hiphoppity-gliss-up-down.wav"
].ring

$Keys = [:c1, :d1, :f1, :a1].ring
$Modes = [:major, :minor].ring

$key  = $Keys[1]
$mode = $Modes[0]

kick1    = tabb(["1000","0000","1000","0000"])
kick2    = tabb(["1000","0001","1000","0000"])
snare1   = tabb(["0000","1000","0000","1000"])
snare2   = tabb(["1000","1000","1100","1000"])
cymbal1  = tabn(["1010","1140","1020","1030","2121"])
cymbal2  = tabn(["1415","1414","1414"])


define (:make_bass) do
  nbass1   = tab2(["c.ee","e.gG","g.bB","e.cC"], $key, $mode)
  bassamp1 = tabn(["6070"])
  nbass2   = tab2(["cegB","Afdc",], $key, $mode)
  bassamp2 = tabn(["4556"])

  bass0 = {nbass: nbass1, bassamp: ring(0)}
  bass1 = {nbass: nbass1, bassamp: bassamp1}
  bass2 = {nbass: nbass2, bassamp: bassamp2}

  $basscontrols = [bass1, bass2].ring
  $bass         = bass1
end

make_bass()

hook1       = tabb(["0001","0000","1000","0100"]).drop(12)
shaker1     = spread(3, 7)
shaker2     = spread(5, 7)
euclidians1 = spread(3, 11)
euclidians2 = spread(5, 11)
punch1      = spread(3, 9)
punch2      = spread(3, 8)
punch3      = spread(5, 7)
punch3      = spread(7, 16)
clap1       = spread(3, 8)
clap2       = spread(5, 8)
clap3       = spread(5, 9)
clap4       = spread(5, 13)

$Punch  = $Punches[0]
$Clap   = $Claps[0]
$Shaker = $Shakers[0]

$hook       = hook0
$kick       = kick1
$snare      = snare1
$cymbal     = cymbal1
$shaker     = shaker0
$euclidians = euclidians0
$punch      = punch1
$clap       = clap1

live_loop :metronome do
  sleep 8
end

$kickcontrols     = [kick1, kick2].ring
$snarecontrols    = [snare1, snare2].ring
$punchcontrols    = [punch1, punch2, punch3].ring
$clapcontrols     = [clap1, clap2, clap3, clap4].ring
$cymbalcontrols   = [cymbal1, cymbal2].ring
$shakereuclidians = [shaker1, shaker2].ring
$echteuclidians   = [euclidians1, euclidians2].ring

#   ____           _               _
#  / __ \         | |             | |
# | |  | |_ __ ___| |__   ___  ___| |_ _ __ __ _
# | |  | | '__/ __| '_ \ / _ \/ __| __| '__/ _` |
# | |__| | | | (__| | | |  __/\__ \ |_| | | (_| |
#  \____/|_|  \___|_| |_|\___||___/\__|_|  \__,_|

use_debug false
use_cue_logging false
$bpm = 80

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"

run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/make_riffs.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/funk_orchestra/kits.rb")

##| use_random_seed 53
##| use_random_seed 59
##| use_random_seed 60

$beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

kicks1      = tabb(["1000","0000","1000","0000"])
snares1     = tabb(["0000","1000","0000","1000"])
cymbals1    = tabn(["1110","1010"])
dubs1       = spread(7, 27)
percs1      = spread(5, 21)

$kicks   = kicks1
$snares  = snares1
$cymbals = cymbals1
$dubs    = dubs1
$percs   = percs1

$silencekicks   = false
$silencesnares  = false
$silencedubs    = false
$silencepercs   = false

$silencecymbals = false
$silencebass    = false

$Chord = (chord :c2, '13')

bass0 = ring(0)
bass1 = make_riff(7, $kicks, 1)

$bass      = bass1[:beats].ring
$durations = bass1[:durations].ring

define :prompt do | colour, beat |
  sleep = get_sleep(beat)
  prelay = sleep * 3 + 0.2
  cue colour + "outbound", 0.1
end

live_loop :metronome do
  use_real_time
  sleep 8
end

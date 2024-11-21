##|        _           _      _____               _   _
##|       | |         | |    / ____|             | \ | |
##|       | |_   _ ___| |_  | (___   __ _ _   _  |  \| | ___
##|   _   | | | | / __| __|  \___ \ / _` | | | | | . ` |/ _ \
##|  | |__| | |_| \__ \ |_   ____) | (_| | |_| | | |\  | (_) |
##|   \____/ \__,_|___/\__| |_____/ \__,_|\__, | |_| \_|\___/
##|                                        __/ |
##|                                       |___/
##|   __  __       _
##|  |  \/  |     (_)
##|  | \  / | __ _ _ _ __
##|  | |\/| |/ _` | | '_ \
##|  | |  | | (_| | | | | |
##|  |_|  |_|\__,_|_|_| |_|
##|

print("MAIN RELOADED")

use_debug false


$Root = "/Users/gordo/Dev/sonic-pi/"

$samplespath = $Root + "samples/"
$tune        = $Root + "tunes/just_say_no/"

$voicespath       = $tune + "voices"
$songsamplesspath = $tune + "samples"

run_file($Root + "libraries/bag_of_randoms.rb")
run_file($Root + "libraries/tab.rb")
run_file($tune + "loadable/kits.rb")
run_file($tune + "loadable/runtime.rb")

$bpm = 45

# This is a cha-cha so its 4 beats to the bar, but 5 stops
# One, Two, Three, Four-Five

# The repeat is 9 bars, so the tune can change direction every ninth

$Repeat = 9

$sleeps   = (ring 0.2, 0.21, 0.19, 0.1, 0.1, 0.2, 0.21, 0.19, 0.1, 0.1, 0.2, 0.21, 0.19, 0.08, 0.12)
$strength = (ring :s,   :w,  :s,  :w,  :w)

$beats = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8, 9)

$Randoms = bag_of_randoms(1024)

playhard1 = tabb(["00000","10000"])
playhard2 = tabb(["10000","10100"])

$Kicks    = Kicks1
$Snares   = Snares1
$PlayHard = playhard1

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

live_loop :metronome do
  sleep 8
end

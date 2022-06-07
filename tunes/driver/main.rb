##|  _____       _
##| |  __ \     (_)
##| | |  | |_ __ ___   _____ _ __
##| | |  | | '__| \ \ / / _ \ '__|
##| | |__| | |  | |\ V /  __/ |
##| |_____/|_|  |_| \_/ \___|_|

$bpm = 120

$ghost  = -> { rrand(0.2, 0.3) }
$normal = -> { rrand(0.4, 0.6) }
$accent = -> { rrand(0.8, 0.9) }

use_bpm $bpm

$samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
load_synthdefs "/Users/gordonguthrie/.synthdefs"

run_file("/Users/gordonguthrie/Dev/sonic-pi/tunes/driver/loadable/kits.rb")
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/bag_of_randoms.rb")

$bars  = (ring, 1, 2, 3, 4, 5, 6, 7, 8)

$randoms = bag_of_randoms(1024)

# Drums

# 120bpm, 1004 random, 7 sounds, 4 total
dsleeps1 = [0.75, 1.0, 0.5, 0.001, 0.5, 1.0, 0.25].ring
dghosts1 = [1, 0, 0, 0, 0].ring
# 120 bpm, 1020 random, 8 sounds, 4.25 total
dsleeps2 = [0.75, 0.001, 0.75, 0.75, 0.5, 1.0, 0.25, 0.25].ring
# 120 bpm, 1021 random, 8 sounds, 4 total
dsleeps3 = [0.001, 0.75, 0.75, 0.5, 1.0, 0.25, 0.25, 0.5].ring
# 120 bpm, 1022 random, 5 sounds, 3.25 total
dsleeps4 = [0.75, 0.75, 0.5, 1.0, 0.25].ring
# 120 bpm, 1023 random, 8 sounds, 3.5 total
dsleeps5 = [0.75, 0.5, 1.0, 0.25, 0.25, 0.5, 0.25, 0.001].ring

# Bass

# 120 bpm, 1025 random, 6 sounds, 4 total
bnotes1 = [:e2, :g2, :c2, :e2, :c2, :e2].ring
bsleeps1 = [1.0, 0.25, 0.25, 1.0, 1.0, 0.5].ring
# 120 bpm, 1026, 4 sounds, 1 total
bnotes2 = [:e2, :e2, :d3, :d3].ring
bsleeps2 = [0.25, 0.5, 0.001, 0.25].ring
# 120 bpm, 1035, 3 sounds, 1 total
bnotes3 = [:e2, :e2, :d3].ring
bsleeps3 = [0.5, 0.001, 0.5]
# 120 bpm, 1036, 4 sounds, 2 total
bnotes4 = [:c2, :g2, :e2, :c2].ring
bsleeps4 = [0.25, 0.25, 1.0, 0.5].ring
# 120 bpm, 1060,  4 sounds,  2 total
bnotes5 = [:g2, :g2, :b3, :d3].ring
bsleeps5 = [0.5, 0.75, 0.25, 0.5].ring


$key = [
  {root: :c, scale: :major},
  ##|   {root: :d, scale: :major},
  ##|   {root: :f, scale: :major},
  ##|   {root: :a, scale: :minor}
]

drums1 = {sleeps: dsleeps1,
          ghosts: dghosts1}
drums2 = {sleeps: dsleeps2}
drums3 = {sleeps: dsleeps3}
drums4 = {sleeps: dsleeps4}
drums5 = {sleeps: dsleeps5}

bass0 = {notes: ring(:r),
         sleeps: ring(1)
         }

bass1 = {notes: bnotes1,
         sleeps: bsleeps1}
bass2 = {notes: bnotes2,
         sleeps: bsleeps2}
bass3 = {notes: bnotes3,
         sleeps: bsleeps3}
bass4 = {notes: bnotes4,
         sleeps: bsleeps4}
bass5 = {notes: bnotes5,
         sleeps: bsleeps5}

$DrumKit = Drums1

$drums = drums1

$bass = bass2

# this file is added to ~/.sonic-pi/init.rb
# and then the same stuff will be pulled in a oner

print("in master.rb - should be run from init")

path1 = "~/Dev/sonic-pi/libraries/"
#require path1 + "make_bar.rb"
eval_file path1 + "chord_sequences.rb"
#require path1 + "rock_chord_changes.rb"

path2 = "~/Dev/sonic-pi/samples/"
eval_file path2 + "samples.rb"
# this file is added to ~/.sonic-pi/init.rb
# and then the same stuff will be pulled in a oner

print("in master.rb - should be run from init")

path1 = "~/Dev/sonic-pi/libraries/"
eval_file path1 + "chord_sequences.rb"
eval_file path1 + "rhythms.rb"

path2 = "~/Dev/sonic-pi/samples/"
eval_file path2 + "samples.rb"


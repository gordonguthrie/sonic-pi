samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
run_file("/Users/gordonguthrie/Dev/sonic-pi/samples/samples.rb")

define(:loop_over_samples) do |sample|
  dir = sample[:dir]
  samples = sample[:samples]

  samples.each do |samp|
    print("from ", dir)

    4.times do
      s = samplespath + dir + samp
      sample(s)
      sleep(1)
    end
  end
end

samples = [$kicks, $snares, $toms, $cymbals]

samples.each do |s|
  loop_over_samples(s)
end

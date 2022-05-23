samplespath = "/Users/gordonguthrie/Dev/sonic-pi/samples/"
run_file("/Users/gordonguthrie/Dev/sonic-pi/libraries/kits.rb")

define(:loop_over_kit) do |kit|
  print("main", kit[:main])
  s = samplespath + kit[:main]

  4.times do
    sample(s)
    sleep(0.5)
  end

  kit[:ghosts].each { |d|
    s = samplespath + d

    4.times do
      print("ghost drum is", d)
      sample(s)
      sleep(0.5)
    end

  }
  print("hards")
  kit[:hards].each { |d|
    s = samplespath + d

    4.times do
      print("hards drum is", d)
      sample(s)
      sleep(0.5)
    end

  }
  print("dubs")
  kit[:dubs].each { |d|
    s = samplespath + d

    4.times do
      print("dubs drum is", d)
      sample(s)
      sleep(0.5)
    end

  }
end

kits = [Kicks1, Kicks2, Snares1]

kits.each do |k|
  loop_over_kit(k)
end

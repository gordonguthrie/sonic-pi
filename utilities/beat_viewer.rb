define(:get_total_time) do | rhythms |
  total = 0.0
  no_beats = rhythms.length()
  n = 0
  no_beats.times do
    total = total + rhythms[n]
    n = n + 1
  end
  return total
end

define(:write_file) do | contents, filename |
  File.open("/Users/gordonguthrie/tmp/" + filename + ".ppm", "w") { |f| f.write contents }
end

define(:visualise_rhythms) do | rhythms, filename |
  total = get_total_time(rhythms)
  expand = 100
  height = 200
  thickness = 5
  width = (total * expand).to_int
  header = ["P3", (width * thickness).to_s + " " + height.to_s, "1"]
  body = ring("0 0 0").stretch(thickness)
  print "starting body is #{body}"
  run = 0
  b = 0
  n = 1
  (width - 1).times do
    beat = (rhythms[b] * expand).to_i + run
    if n == beat
      print "in beat at #{beat} for #{n} and #{b}"
      body = body + ring("0 0 0").stretch(thickness)
      b = b + 1
      run = beat
    else
      #print "n is #{n} and beat is #{beat}"
      body = body + ring("1 1 1").stretch(thickness)
    end
    n = n + 1
  end
  print "body has length of #{body.length}"
  contents = header
  height.times do
    contents = contents + body
  end
  write_file(contents * "\n", filename)
end

rhythm = ring(0.2, 0.3, 0.2, 0.3, 0.3, 0.2, 0.3, 0.2)

filename = "swing_time"

visualise_rhythms(rhythm, filename)

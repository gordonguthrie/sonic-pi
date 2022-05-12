def make_rhythms(accents, total_beats, beat_rotations=0)
  res = []

  total_beats.times do |i|
    # makes a boolean based on the index
    # true is an accent, false is a rest
    res << ((i * accents % total_beats) < accents)
  end

  res.ring
end

print("make_rhythms defined")
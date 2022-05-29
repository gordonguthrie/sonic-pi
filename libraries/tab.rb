define(:tabb) do |array|
  len1 = array.length
  idx1 = 0
  result = []

  len1.times do
    string = array[idx1]
    len2 = string.length
    idx2 = 0

    len2.times do
      if string[idx2] == "1"
        result.append(true)
      else
        result.append(false)
      end

      idx2 = idx2 + 1
    end

    idx1 = idx1 + 1
  end

  return result.ring
end

define(:tabn) do |array|
  len1 = array.length
  idx1 = 0
  result = []

  len1.times do
    string = array[idx1]
    len2 = string.length
    idx2 = 0

    len2.times do
      result.append(string[idx2].to_i)
      idx2 = idx2 + 1
    end

    idx1 = idx1 + 1
  end

  return result.ring
end

define(:tabh) do |array|
  len1 = array.length
  idx1 = 0
  result = []

  len1.times do
    string = array[idx1]
    len2 = string.length
    idx2 = 0

    len2.times do
      char = string[idx2].upcase

      if ((char == "1") || (char == "2") || (char == "3") || (char == "4") || (char == "5") || (char == "6") || (char == "7") || (char == "8") || (char == "9"))
        result.append(char.to_i)
      elsif (char == "A")
        result.append(10)
      elsif (char == "B")
        result.append(11)
      elsif (char == "C")
        result.append(12)
      elsif (char == "D")
        result.append(13)
      elsif (char == "E")
        result.append(14)
      elsif (char == "F")
        result.append(15)
      else
        result.append(0)
      end

      idx2 = idx2 + 1
    end

    idx1 = idx1 + 1
  end

  return result.ring
end

define(:tabs) do |array|
  len1 = array.length
  idx1 = 0
  result = []

  len1.times do
    string = array[idx1]
    len2 = string.length
    idx2 = 0

    len2.times do
      if string[idx2] == "A" || string[idx2] == "a"
        result.append(:A)
      elsif string[idx2] == "B" || string[idx2] == "b"
        result.append(:B)
      elsif string[idx2] == "C" || string[idx2] == "c"
        result.append(:C)
      elsif string[idx2] == "D" || string[idx2] == "d"
        result.append(:D)
      elsif string[idx2] == "E" || string[idx2] == "e"
        result.append(:E)
      elsif string[idx2] == "F" || string[idx2] == "f"
        result.append(:F)
      elsif string[idx2] == "G" || string[idx2] == "g"
        result.append(:G)
      else
        result.append(:r)
      end

      idx2 = idx2 + 1
    end

    idx1 = idx1 + 1
  end

  return result.ring
end

define(:tab2) do |array, root|
  len1 = array.length
  idx1 = 0
  result = []

  octave = note_info(root).octave
  key = note_info(root).pitch_class
  key_offset = key - :c

  len1.times do
    string = array[idx1]
    len2 = string.length
    idx2 = 0

    len2.times do
      if string[idx2] == "a"
        result.append(make_sym(:a + key_offset, octave))
      elsif string[idx2] == "b"
        result.append(make_sym(:b + key_offset, octave))
      elsif string[idx2] == "c"
        result.append(make_sym(:c + key_offset, octave))
      elsif string[idx2] == "d"
        result.append(make_sym(:d + key_offset, octave))
      elsif string[idx2] == "e"
        result.append(make_sym(:e + key_offset, octave))
      elsif string[idx2] == "f"
        result.append(make_sym(:f + key_offset, octave))
      elsif string[idx2] == "g"
        result.append(make_sym(:g + key_offset, octave))
      elsif string[idx2] == "A"
        result.append(make_sym(:a + key_offset, octave + 1))
      elsif string[idx2] == "B"
        result.append(make_sym(:b + key_offset, octave + 1))
      elsif string[idx2] == "C"
        result.append(make_sym(:c + key_offset, octave + 1))
      elsif string[idx2] == "D"
        result.append(make_sym(:d + key_offset, octave + 1))
      elsif string[idx2] == "E"
        result.append(make_sym(:e + key_offset, octave + 1))
      elsif string[idx2] == "F"
        result.append(make_sym(:f + key_offset, octave + 1))
      elsif string[idx2] == "G"
        result.append(make_sym(:g + key_offset, octave + 1))
      else
        result.append(:r)
      end

      idx2 = idx2 + 1
    end

    idx1 = idx1 + 1
  end

  return result.ring
end

define(:make_sym) do | midi, octave |
  n = note_info(midi.to_i + (octave - 4) * 12).midi_string
  return n.to_sym
end

define(:numring_to_string) do |ring|
  len = ring.length
  str = []
  idx = 0

  len.times do
    str.append(ring[idx].to_s)
    idx = idx + 1
  end

  return str.join("")
end

define(:hexring_to_string) do |ring|
  len = ring.length
  str = []
  idx = 0

  len.times do
    n = ring[idx]

    if (n >= 0 && n <= 9)
      str.append(n.to_s)
    elsif n == 10
      str.append("A")
    elsif n == 11
      str.append("B")
    elsif n == 12
      str.append("C")
    elsif n == 13
      str.append("D")
    elsif n == 14
      str.append("E")
    elsif n == 15
      str.append("F")
    else
      str.append(".")
    end

    idx = idx + 1
  end

  return str.join("")
end

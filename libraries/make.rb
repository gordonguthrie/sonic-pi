define(:make) do |string|
  len = string.length
  idx = 0
  array = []

  len.times do
    if string[idx] == "1"
      array.append(true)
    else
      array.append(false)
    end

    idx = idx + 1
  end

  return array.ring
end

define(:rmake) do |string|
  len = string.length
  idx = 0
  array = []

  len.times do
    array.append(string[idx].to_i)
    idx = idx + 1
  end

  return array.ring
end

define(:cmake) do |string|
  len = string.length
  idx = 0
  array = []

  len.times do
    if string[idx] == "1"
      array.append(:main)
    elsif string[idx] == "2"
      array.append(:ghost)
    elsif string[idx] == "3"
      array.append(:crash)
    elsif string[idx] == "4"
      array.append(:open)
    else
      array.append(false)
    end

    idx = idx + 1
  end

  return array.ring
end

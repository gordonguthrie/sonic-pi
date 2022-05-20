define(:bag_of_randoms) do |no|
  array = []

  no.times do
    array.append(rand)
  end

  return array.ring
end

define :make_bar do |beats|
  n = 2
  r = [1]
  (beats - 1).times do
    r.push(n)
    n = n + 1
  end
  r.ring
end
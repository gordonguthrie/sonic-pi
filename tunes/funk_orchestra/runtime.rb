define(:play_bass) do |note, duration, debug|
  if debug
    print("base note is ", note, "duration is", duration)
  end

  a1 = rdist(0.2, 0.5)
  a2 = rdist(0.2, 0.5)
  a3 = rdist(0.2, 0.5)
  r1 = rdist(0.1, duration)
  r2 = rdist(0.1, duration)
  pan = rdist(0.3, 0)
  synth(:sine,   note: note + 12.1,   amp: 0.2 * a1,   pan: pan,   release: r1)
  synth(:sine,   note: note + 12,   amp: 0.2 * a2,   pan: pan,   release: r2)
  synth(:sine,   note: note,   amp: 0.5 * a3,   pan: pan,   release: r1)
  synth(:dtri,   note: note - 12,   amp: 0.2 * a1,   pan: pan,   release: r2,   attack: 0.01)
  synth(:beep,   note: note - 11.9,   amp: 0.2 * a2,   pan: pan,   release: r1)
end

define(:swing_time) do
  swing_time = 0.0
  return swing_time
end

define(:get_sleep) do |beat|
  if (beat % 2) == 0
    slp = 0.5 + swing_time
  else
    slp = 0.5 - swing_time
  end

  return slp
end

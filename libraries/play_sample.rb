def play_sample_for_sequence(pattern, sample_name, sleep_time = 0.25)
  pattern.each.with_index do |beat, i|
    sample(sample_name) if !!beat
    sleep(sleep_time)
  end
end

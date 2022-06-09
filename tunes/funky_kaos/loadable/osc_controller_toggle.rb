live_loop(:toggle_kick) do
  use_real_time
  a = sync("/*/*/toggle_kick")
  print("  _____               _     ")
  print(" |_   _|__  __ _ __ _| |___ ")
  print("   | |/ _ \/ _` / _` | / -_)")
  print("   |_|\___/\__, \__, |_\___|")
  print("  _  ___   |___/|___/       ")
  print(" | |/ (_)__| |__            ")
  print(" | ' <| / _| / /            ")
  print(" |_|\_\_\__|_\_\            ")
  if $kick.length == 1 then
    $kick = $kickcontrols.tick
  else
    $kick = ring(false)
  end
end

live_loop(:toggle_snare) do
  use_real_time
  a = sync("/*/*/toggle_snare")
  print("  _____               _     ")
  print(" |_   _|__  __ _ __ _| |___ ")
  print("   | |/ _ \/ _` / _` | / -_)")
  print("  _|_|\___/\__, \__, |_\___|")
  print(" / __|_ _  |___/|___/__     ")
  print(" \__ \ ' \/ _` | '_/ -_)    ")
  print(" |___/_||_\__,_|_| \___|    ")
  if $snare.length == 1 then
    $snare = $snarecontrols.tick
  else
    $snare = ring(false)
  end
end

live_loop(:toggle_bass) do
  use_real_time
  a = sync("/*/*/toggle_bass")
  print("  _____               _     ")
  print(" |_   _|__  __ _ __ _| |___ ")
  print("   | |/ _ \/ _` / _` | / -_)")
  print("  _|_|\___/\__, \__, |_\___|")
  print(" | _ ) __ _|___/|___/       ")
  print(" | _ \/ _` (_-<_-<          ")
  print(" |___/\__,_/__/__/          ")
  if $bass[:bassamp].length == 1 then
    $bass = $basscontrols.tick
  else
    $bass = {nbass: ring(:c4), bassamp: ring(0)}
  end
end

live_loop(:toggle_shakers) do
  use_real_time
  a = sync("/*/*/toggle_shakers")
  print("  _____               _        ")
  print(" |_   _|__  __ _ __ _| |___    ")
  print("   | |/ _ \/ _` / _` | / -_)   ")
  print("   |_|\___/\__, \__, |_\___|   ")
  print("  ___ _    |___/|___/          ")
  print(" / __| |_  __ _| |_____ _ _ ___")
  print(" \__ \ ' \/ _` | / / -_) '_(_-<")
  print(" |___/_||_\__,_|_\_\___|_| /__/")
  if $shaker.length == 1 then
    $shaker = $shakereuclidians.tick
  else
    $shaker = ring(false)
  end
end

live_loop(:toggle_mode) do
  use_real_time
  a = sync("/*/*/toggle_mode")
  print("  _____               _     ")
  print(" |_   _|__  __ _ __ _| |___ ")
  print("   | |/ _ \/ _` / _` | / -_)")
  print("   |_|\___/\__, \__, |_\___|")
  print("  __  __   |___/|___/       ")
  print(" |  \/  |___  __| |___      ")
  print(" | |\/| / _ \/ _` / -_)     ")
  print(" |_|  |_\___/\__,_\___|     ")
  if $mode == :major then
    $mode = :minor
  else
    $mode =:major
  end
  print("mode is", $mode)
end

live_loop(:toggle_cymbals) do
  use_real_time
  a = sync("/*/*/toggle_cymbals")
  print("  _____               _          ")
  print(" |_   _|__  __ _ __ _| |___      ")
  print("   | |/ _ \/ _` / _` | / -_)     ")
  print("   |_|\___/\__, \__, |_\___|     ")
  print("   ___     |___/|___/       _    ")
  print("  / __|  _ _ __ | |__  __ _| |___")
  print(" | (_| || | '  \| '_ \/ _` | (_-<")
  print("  \___\_, |_|_|_|_.__/\__,_|_/__/")
  print("      |__/                       ")
  if $cymbal.length == 1 then
    $cymbal = $cymbalcontrols.tick
  else
    $cymbal = ring(0)
  end
  print("cymbal is", $cymbal)
end

live_loop(:toggle_euclids) do
  use_real_time
  a = sync("/*/*/toggle_euclids")
  print("  _____               _     ")
  print(" |_   _|__  __ _ __ _| |___ ")
  print("   | |/ _ \/ _` / _` | / -_)")
  print("   |_|\___/\__, \__, |_\___|")
  print("  ___      |___/|___/       ")
  print(" | __|  _ __| (_)__| |      ")
  print(" | _| || / _| | / _` |      ")
  print(" |___\_,_\__|_|_\__,_|      ")
  if $euclidians.length == 1 then
    $euclidians = $echteuclidians.tick
  else
    $euclidians = ring(false)
  end
  print("euclidians is", $euclidians)
end

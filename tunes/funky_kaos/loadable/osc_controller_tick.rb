live_loop(:tick_kick) do
  use_real_time
  a = sync("/*/*/tick_kick")
  print("  _____ _    _                   ")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("  _|_|_|_\__|_\_\                ")
  print(" | |/ (_)__| |__                 ")
  print(" | ' <| / _| / /                 ")
  print(" |_|\_\_\__|_\_\                 ")
  $kick = $kickcontrols.tick
end

live_loop(:tick_snare) do
  use_real_time
  a = sync("/*/*/tick_snare")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("  _|_| |_\__|_\_\                ")
  print(" / __|_ _  __ _ _ _ ___          ")
  print(" \__ \ ' \/ _` | '_/ -_)         ")
  print(" |___/_||_\__,_|_| \___|         ")
  $snare = $snarecontrols.tick
end


live_loop(:tick_bass) do
  use_real_time
  a = sync("/*/*/tick_bass")
  print("  _____ _    _                   ")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("  _|_| |_\__|_\_\                ")
  print(" | _ ) __ _ ______               ")
  print(" | _ \/ _` (_-<_-<               ")
  print(" |___/\__,_/__/__/               ")
  $bass = $basscontrols.tick
end

live_loop(:tick_euclidian_punch) do
  use_real_time
  a = sync("/*/*/tick_euclidian_punch")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("  _|_| |_\__|_\_\  _             ")
  print(" | _ \_  _ _ _  __| |_           ")
  print(" |  _/ || | ' \/ _| ' \          ")
  print(" |_|_ \_,_|_||_\__|_||_|         ")
  print(" | __|  _ __| (_)__| |           ")
  print(" | _| || / _| | / _` |           ")
  print(" |___\_,_\__|_|_\__,_|           ")
  $punch = $punchcontrols.tick
end

live_loop(:tick_shakers) do
  use_real_time
  a = sync("/*/*/tick_shakers")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("  _|_|_|_\__|_\_\                ")
  print(" / __| |_  __ _| |_____ _ _ ___  ")
  print(" \__ \ ' \/ _` | / / -_) '_(_-<  ")
  print(" |___/_||_\__,_|_\_\___|_| /__/  ")
  $Shaker = $Shakers.tick
end

live_loop(:tick_key) do
  use_real_time
  a = sync("/*/*/tick_key")
  print("  _____ _    _                   ")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("  _|_|_|_\__|_\_\                ")
  print(" | |/ /___ _  _                  ")
  print(" | ' </ -_) || |                 ")
  print(" |_|\_\___|\_, |                 ")
  print("           |__/                  ")
  $key = $Keys.tick
  make_bass()
  $bass = $basscontrols.tick
  print("key is", $key)
end

live_loop(:tick_euclidian_clap) do
  use_real_time
  a = sync("/*/*/tick_euclidean_clap")
  print("  _____ _    _        ")
  print(" |_   _(_)__| |__     ")
  print("   | | | / _| / /     ")
  print("   |_| |_\__|_\_\     ")
  print("  / __| |__ _ _ __    ")
  print(" | (__| / _` | '_ \   ")
  print("  \___|_\__,_| .__/   ")
  print("  ___        |_|    _ ")
  print(" | __|  _ __| (_)__| |")
  print(" | _| || / _| | / _` |")
  print(" |___\_,_\__|_|_\__,_|")
  $clap = clapcontrols.tick
end

live_loop(:tick_cymbals) do
  use_real_time
  a = sync("/*/*/tick_cymbals")
  print("  _____ _    _                   ")
  print(" |_   _(_)__| |__                ")
  print("   | | | / _| / /                ")
  print("   |_| |_\__|_\_\_          _    ")
  print("  / __|  _ _ __ | |__  __ _| |___")
  print(" | (_| || | '  \| '_ \/ _` | (_-<")
  print("  \___\_, |_|_|_|_.__/\__,_|_/__/")
  print("      |__/                       ")
  $cymbal = $cymbalcontrols.tick
end

live_loop(:tick_euclidian_shaker) do
  use_real_time
  a = sync("/*/*/tick_euclidian_shaker")
  print("  _____ _    _              ")
  print(" |_   _(_)__| |__           ")
  print("   | | | / _| / /           ")
  print("  _|_|_|_\__|_\_\           ")
  print(" / __| |_  __ _| |_____ _ _ ")
  print(" \__ \ ' \/ _` | / / -_) '_|")
  print(" |___/_||_\__,_|_\_\___|_|  ")
  print("  ___        _ _    _       ")
  print(" | __|  _ __| (_)__| |      ")
  print(" | _| || / _| | / _` |      ")
  print(" |___\_,_\__|_|_\__,_|      ")
  $shaker = $shakereuclidians.tick
end

live_loop(:tick_euclids) do
  use_real_time
  a = sync("/*/*/tick_euclids")
  print("  _____ _    _        ")
  print(" |_   _(_)__| |__     ")
  print("   | | | / _| / /     ")
  print("  _|_| |_\__|_\_\   _ ")
  print(" | __|  _ __| (_)__| |")
  print(" | _| || / _| | / _` |")
  print(" |___\_,_\__|_|_\__,_|")
  $euclidians = $echteuclidians.tick
  print("euclidians is", $euclidians)
end

live_loop(:tick_punches) do
  use_real_time
  a = sync("/*/*/tick_punches")
  print("  _____ _    _                 ")
  print(" |_   _(_)__| |__              ")
  print("   | | | / _| / /              ")
  print("  _|_| |_\__|_\_\  _           ")
  print(" | _ \_  _ _ _  __| |_  ___ ___")
  print(" |  _/ || | ' \/ _| ' \/ -_|_-<")
  print(" |_|  \_,_|_||_\__|_||_\___/__/")
  $Punch = $Punches.tick
end

live_loop(:tick_hook) do
  use_real_time
  a = sync("/*/*/tick_hook")
  print("  _____ _    _      ")
  print(" |_   _(_)__| |__   ")
  print("   | | | / _| / /   ")
  print("  _|_| |_\__|_\_\   ")
  print(" | || |___  ___| |__")
  print(" | __ / _ \/ _ \ / /")
  print(" |_||_\___/\___/_\_\") #")
  play 38
end

live_loop(:tick_claps) do
  use_real_time
  a = sync("/*/*/tick_claps")
  print("  _____ _    _        ")
  print(" |_   _(_)__| |__     ")
  print("   | | | / _| / /     ")
  print("   |_| |_\__|_\_\     ")
  print("  / __| |__ _ _ __ ___")
  print(" | (__| / _` | '_ (_-<")
  print("  \___|_\__,_| .__/__/")
  print("             |_|      ")
  $Clap = $Claps.tick
  print("Claps is", $Clap)
end

live_loop(:calmer) do
  use_real_time
  a = sync("/*/*/calmer")
  print("   ___      _               ")
  print("  / __|__ _| |_ __  ___ _ _ ")
  print(" | (__/ _` | | '  \/ -_) '_|")
  print("  \___\__,_|_|_|_|_\___|_|  ")
  $swing_time = $swing_time - 0.01
  print("swing time is", $swing_time)
end

live_loop(:funkier) do
  use_real_time
  a = sync("/*/*/funkier")
  print("  ___          _   _         ")
  print(" | __|  _ _ _ | |_(_)___ _ _ ")
  print(" | _| || | ' \| / / / -_) '_|")
  print(" |_| \_,_|_||_|_\_\_\___|_|  ")
  $swing_time = $swing_time + 0.01
  print("swing time is", $swing_time)
end

live_loop(:faster) do
  use_real_time
  a = sync("/*/*/faster")
  print("  ___        _           ")
  print(" | __|_ _ __| |_ ___ _ _ ")
  print(" | _/ _` (_-<  _/ -_) '_|")
  print(" |_|\__,_/__/\__\___|_|  ")
  $bpm = $bpm + 1
  print("bpm is", $bpm)
end

live_loop(:slower) do
  use_real_time
  a = sync("/*/*/slower")
  print("  ___ _                    ")
  print(" / __| |_____ __ _____ _ _ ")
  print(" \__ \ / _ \ V  V / -_) '_|")
  print(" |___/_\___/\_/\_/\___|_|  ")
  $bpm = $bpm - 1
  print("bpm is", $bpm)
end

# Set flutter bin path
if [[ -n "$OS_OSX" ]]; then
  PATH="$PATH:~/Applications/flutter/bin"
fi

# TODO: Check if not install flutter, then automatically install it.
echo "[flutter] Initialize flutter"
echo "[flutter] bin - $(which flutter)"

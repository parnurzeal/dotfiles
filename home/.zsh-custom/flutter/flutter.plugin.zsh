# Set flutter bin path
if [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[flutter] Set flutter bin path in OSX."
  export PATH="$HOME/Applications/flutter/bin":"$PATH"
  export PATH="$HOME/Applications/flutter/.pub-cache/bin":"$PATH"
  # For dart
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  # For iOS
  export PATH="$PATH":"$HOME/.gem/bin"
fi

# TODO: Check if not install flutter, then automatically install it.
echo "[flutter] Initialize flutter"
echo "[flutter] bin - $(which flutter)"

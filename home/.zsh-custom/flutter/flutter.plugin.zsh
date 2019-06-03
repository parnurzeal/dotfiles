# Set flutter bin path
if [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[flutter] Set flutter bin path in OSX."
  export PATH="$PATH":"$HOME/Applications/flutter/bin"
  export PATH="$PATH":"$HOME/Applications/flutter/.pub-cache/bin"
fi

# TODO: Check if not install flutter, then automatically install it.
echo "[flutter] Initialize flutter"
echo "[flutter] bin - $(which flutter)"

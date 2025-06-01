# Set flutter bin path
if [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[dart] cmd completion setup"
  ## [Completion]
  ## Completion scripts setup. Remove the following line to uninstall
  [[ -f /Users/atw/.dart-cli-completion/zsh-config.zsh ]] && . /Users/atw/.dart-cli-completion/zsh-config.zsh || true
  ## [/Completion]
  echo "[flutter] Set flutter bin path in OSX."
  export PATH="$HOME/Applications/flutter/bin":"$PATH"
  export PATH="$HOME/Applications/flutter/.pub-cache/bin":"$PATH"
  # For dart
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  # For iOS
  export PATH="$PATH":"$HOME/.gem/bin"
fi
#

# TODO: Check if not install flutter, then automatically install it.
echo "[flutter] Initialized flutter"
echo "[flutter] bin - $(which flutter)"



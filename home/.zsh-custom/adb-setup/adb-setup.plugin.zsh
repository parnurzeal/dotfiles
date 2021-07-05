# Set flutter bin path
if [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[adb] Set up bin path for Android platfrom tools in OSX."
  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi

# TODO: Check if not install flutter, then automatically install it.
echo "[adb] bin - $(which adb)"

# Add Android SDK path and its bin.
if [[ "${DOT_OS}" == "OSX" ]]; then
  export ANDROID_HOME=~/Library/Android/sdk/
elif [[ "${DOT_OS}" == "LINUX" ]]; then
  export ANDROID_HOME=~/Android/Sdk/
fi
# Set up instant app bin path
export PATH=$PATH:$ANDROID_HOME/extras/google/instantapps

echo "[android-sdk] finish setup android sdk path & bin"

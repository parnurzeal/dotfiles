# Add virtualenv (refer: https://github.com/pyenv/pyenv-virtualenv)
# TODO: Check if not install pyenv and pyenv-virtualenv, automatically install it.
if [[ "${DOT_OS}" == "OSX" ]]; then
  export ANDROID_HOME=~/Library/Android/sdk/
else if [[ "${DOT_OS}" == "LINUX" ]]; then
  export ANDROID_HOME=~/Android/Sdk/
fi
# Set up instant app bin path
export PATH=$PATH:$ANDROID_HOME/extras/google/instantapps

echo "[android-sdk] finish setup android sdk path & bin"

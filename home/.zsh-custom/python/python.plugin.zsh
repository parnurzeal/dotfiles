# Add virtualenv (refer: https://github.com/pyenv/pyenv-virtualenv)
# TODO: Check if not install pyenv and pyenv-virtualenv, automatically install it.
if [[ "${DOT_OS}" == "LINUX" ]]; then
  echo "[pyenv] Linux doesn't need pyenv"
else
  echo "[pyenv] Initialize virtualenv for pyenv"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

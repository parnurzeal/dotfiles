# Add virtualenv (refer: https://github.com/pyenv/pyenv-virtualenv)
# TODO: Check if not install pyenv and pyenv-virtualenv, automatically install it.
if [[ "${DOT_OS}" == "LINUX" ]]; then
  echo "[python] Linux doesn't need pyenv"
else
  CHECK_NOT_EXIST="brew list pyenv > /dev/null 2>&1"
  INSTALL_CMD="brew install pyenv"
  if [[ $(eval $CHECK_NOT_EXIST) ]]; then
    echo "[python] installing pyenv - $INSTALL_CMD"
    eval $INSTALL_CMD
  else
    echo "[python] pyenv is ready! :)"
  fi
  echo "[pyenv] Initialize virtualenv for pyenv"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

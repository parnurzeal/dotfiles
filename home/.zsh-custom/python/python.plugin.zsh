# Set python bin path
if [[ -n "$OS_OSX" ]]; then
  PATH="$PATH:/Users/twattanavekin/Library/Python/2.7/bin"
fi

# Add virtualenv (refer: https://github.com/pyenv/pyenv-virtualenv)
# TODO: Check if not install pyenv and pyenv-virtualenv, automatically install it.
echo "[pyenv] Initialize virtualenv for pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

CHECK_NOT_EXIST="brew list conda > /dev/null 2>&1"
INSTALL_CMD="brew install conda"
if [[ $(eval $CHECK_NOT_EXIST) ]]; then
  echo "[conda] installing conda - $INSTALL_CMD"
  eval $INSTALL_CMD
else
  echo "[python] pyenv is ready! :)"
fi
echo "[conda] Initialize conda"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


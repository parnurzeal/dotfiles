# Set git global username
GIT_USERNAME="parnurzeal"
GIT_EMAIL="parnurzeal@gmail.com"
# Deprecated - now use the same github account for both personal and work.
# Check if at work (by checking AT_G env), set to work email.
# if [[ -n "$AT_G" ]]; then
#  GIT_USERNAME="twattanavekin"
#  GIT_EMAIL="twattanavekin@google.com"
# fi

# Set my main git user
echo "Set git email to ${GIT_EMAIL}"
git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}"

# Set ghq path
git config --global ghq.root "${HOME}/PlayGround/ghq"

# Set core editor to vim
git config --global core.editor $(which vim)

# Set git alias
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.cb "checkout -b"
git config --global alias.cm commit
git config --global alias.cma "commit -a"
git config --global alias.cmam "commit --amend"
git config --global alias.cmama "commit --amend -a"
git config --global alias.w whatchanged
git config --global alias.b branch

# Install git extras
if [[ "${DOT_OS}" == "OSX" ]]; then
  GIT_EXTRA_NOT_EXIST="brew list git-extras > /dev/null 2>&1"
  GIT_EXTRA_INSTALL_CMD="brew install git-extras"
  # If not exist, install.
  if [[ $(eval $GIT_EXTRAS_NOT_EXIST) ]]; then
     echo "[git] installing git-extras - $GIT_EXTRAS_INSTALL_CMD"
     eval $GIT_EXTRAS_INSTALL_CMD
  else
    echo "[git] tj/git-extras is ready!"
  fi
  # TODO: Add support for linux
fi

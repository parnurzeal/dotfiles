# Homebrew
export PATH="$PATH:$HOME/homebrew/bin"
#ANTIGEN_AUTO_CONFIG=false

# Add Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Add Antigen
if [[ ! -f "$HOME/.antigen.zsh" ]]; then
  curl -L git.io/antigen > "$HOME/.antigen.zsh"
fi
source "$HOME/.antigen.zsh"

##### GIT #####
GIT_USERNAME="parnurzeal"
GIT_EMAIL="parnurzeal@gmail.com"
# Check if at G? not specific to OS.
if [[ -n "$AT_G" ]]; then
  GIT_USERNAME="twattanavekin"
  GIT_EMAIL="twattanavekin@google.com"
fi


antigen use oh-my-zsh

# My custom
antigen bundle $HOME/.zsh-custom/00_presetting --no-local-clone
antigen bundle $HOME/.zsh-custom/git --no-local-clone

# Set a theme
antigen theme intheloop

antigen apply



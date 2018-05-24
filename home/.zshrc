# Homebrew
export PATH="$PATH:$HOME/homebrew/bin"
#ANTIGEN_AUTO_CONFIG=false

# Add Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

##### GIT #####
GIT_USERNAME="parnurzeal"
GIT_EMAIL="parnurzeal@gmail.com"
# Check if at G? not specific to OS.
if [[ -n "$AT_G" ]]; then
  GIT_USERNAME="twattanavekin"
  GIT_EMAIL="twattanavekin@google.com"
fi


# Add Antigen
source "$HOME/.homesick/repos/dotfiles/antigen/antigen.zsh"

antigen use oh-my-zsh

# My custom
antigen bundle $HOME/.zsh-custom/00_presetting --no-local-clone
antigen bundle $HOME/.zsh-custom/git --no-local-clone

# Set a theme
antigen theme intheloop

antigen apply



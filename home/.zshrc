##### Set PATH #####
# Homebrew
export PATH="$PATH:$HOME/homebrew/bin"
# My Bin
export PATH="$PATH:$HOME/bin"
####################

##### Add preminalry scripts & dependencies #####
# Add Homeshick
if [[ ! -d "$HOME/.homesick/repos/homeshick" ]]; then
  git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# Add Antigen
if [[ ! -f "$HOME/.antigen.zsh" ]]; then
  curl -L git.io/antigen > "$HOME/.antigen.zsh"
fi
source "$HOME/.antigen.zsh"
#################################################

##### Antigen #####
antigen use oh-my-zsh
# My custom
antigen bundle $HOME/.zsh-custom/00_presetting --no-local-clone
antigen bundle $HOME/.zsh-custom/git --no-local-clone
antigen bundle $HOME/.zsh-custom/google-cloud-sdk --no-local-clone
# Non-custom
antigen bundle lukechilds/zsh-nvm
antigen bundle rupa/z
# Set a theme
antigen theme intheloop
antigen apply
###################

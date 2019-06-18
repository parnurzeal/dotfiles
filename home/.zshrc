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

# Set variable checker for cross-platform support
# Check OS
case ${OSTYPE} in
  darwin*)
    export DOT_OS="OSX"
    ;;
  linux*)
    export DOT_OS="LINUX"
    ;;
esac
# Check place
if [[ -f "$HOME/.at_g" ]]; then
  export DOT_PLACE="G"
else
  export DOT_PLACE="H"
fi
echo "Using ${DOT_OS} at ${DOT_PLACE}"
#################################################

##### Antigen #####
antigen use oh-my-zsh
# My custom
antigen bundle $HOME/.zsh-custom/00_presetting --no-local-clone
antigen bundle $HOME/.zsh-custom/zsh-history --no-local-clone
antigen bundle $HOME/.zsh-custom/flutter --no-local-clone
antigen bundle $HOME/.zsh-custom/git --no-local-clone
antigen bundle $HOME/.zsh-custom/google-cloud-sdk --no-local-clone
antigen bundle $HOME/.zsh-custom/python --no-local-clone
antigen bundle $HOME/.zsh-custom/cpp --no-local-clone
# Work custom
if [[ "${DOT_PLACE}" == "G" ]]; then
  antigen bundle $HOME/.zsh-work-custom/g4d --no-local-clone
  antigen bundle $HOME/.zsh-work-custom/fileutil --no-local-clone
  antigen bundle $HOME/.zsh-work-custom/bagpipe --no-local-clone
fi
# Non-custom
antigen bundle lukechilds/zsh-nvm
antigen bundle rupa/z
# Set a theme
antigen theme intheloop
antigen apply
###################

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

# Install antibody if not yet installed.
antibody > /dev/null 2>&1 || \
  { echo "Installing antibody; need your password to put antigen under /usr/local/bin" && \
  curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin }

#source "$HOME/.antigen.zsh"
# Initialize antibody
source <(antibody init)
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

####### Antibody #######
# My custom
antibody bundle $HOME/.zsh-custom/00_presetting
antibody bundle $HOME/.zsh-custom/zsh-history
antibody bundle $HOME/.zsh-custom/flutter
antibody bundle $HOME/.zsh-custom/git
antibody bundle $HOME/.zsh-custom/google-cloud-sdk
antibody bundle $HOME/.zsh-custom/python
antibody bundle $HOME/.zsh-custom/cpp
# Work custom
if [[ "${DOT_PLACE}" == "G" ]]; then
  antibody bundle $HOME/.zsh-work-custom/g4d
  antibody bundle $HOME/.zsh-work-custom/fileutil
  antibody bundle $HOME/.zsh-work-custom/bagpipe
  antibody bundle $HOME/.zsh-work-custom/pastebin
fi
# Non-custom
antibody bundle lukechilds/zsh-nvm
antibody bundle rupa/z
# Set a theme
if [[ "${DOT_PLACE}" == "G" ]] && [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[Theme] Use spaceship theme"
  antibody bundle denysdovhan/spaceship-prompt
else
  echo "[Theme] Use oh-my-zsh intheloop theme"
  antibody bundle robbyrussell/oh-my-zsh path:lib
  antibody bundle robbyrussell/oh-my-zsh path:themes/intheloop.zsh-theme
fi
###################

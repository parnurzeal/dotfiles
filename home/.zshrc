###################
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/atw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
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
echo "---My Plugins---"
antibody bundle $HOME/.zsh-custom/00_presetting
antibody bundle $HOME/.zsh-custom/zsh-history
antibody bundle $HOME/.zsh-custom/flutter
antibody bundle $HOME/.zsh-custom/git
antibody bundle $HOME/.zsh-custom/google-cloud-sdk
antibody bundle $HOME/.zsh-custom/python
antibody bundle $HOME/.zsh-custom/cpp
antibody bundle $HOME/.zsh-custom/myplayground
# Work custom
if [[ "${DOT_PLACE}" == "G" ]]; then
  echo "---G Plugins---"
  antibody bundle $HOME/.zsh-work-custom/g4d
  antibody bundle $HOME/.zsh-work-custom/fileutil
  antibody bundle $HOME/.zsh-work-custom/bagpipe
  antibody bundle $HOME/.zsh-work-custom/pastebin
  antibody bundle $HOME/.zsh-work-custom/adb_screenrecord
  antibody bundle $HOME/.zsh-work-custom/libvirt
  antibody bundle $HOME/.zsh-work-custom/crow
  antibody bundle $HOME/.zsh-work-custom/x20
  antibody bundle $HOME/.zsh-work-custom/adb_remote
fi
# Non-custom
echo "--Public Plugins---"
echo "[alias] djui/alias-tips - help rmb alias"
antibody bundle djui/alias-tips
echo "[nvm] lukechilds/zsh-nvm - manage nvm better"
antibody bundle lukechilds/zsh-nvm
echo "[cd] rupa/z - quickly jump to freq used directory"
antibody bundle rupa/z
echo "[zsh] zsh-users/zsh-syntax-highlighting - highlight zsh"
antibody bundle zsh-users/zsh-syntax-highlighting
echo "[alias] oh-my-zsh/plugins/common-aliases - common aliases"
echo "See https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/common-aliases"
antibody bundle robbyrussell/oh-my-zsh path:plugins/common-aliases
echo "[git] oh-my-zsh/plugins/git - git aliases and useful functions"
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
# Set a theme
if [[ "${DOT_PLACE}" == "G" ]] && [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[Theme] Use powerlevel10k theme"
  antibody bundle romkatv/powerlevel10k
else
  echo "[Theme] Use oh-my-zsh intheloop theme"
  antibody bundle robbyrussell/oh-my-zsh path:lib
  antibody bundle robbyrussell/oh-my-zsh path:themes/intheloop.zsh-theme
fi

# If not using powerlevel10k theme, you can remove the following line.
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Set MDProxy for G Remote Dev to gLinux
if [[ "${DOT_PLACE}" == "G" ]] && [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[MDProxy] Set up MDProxy for G remote development"
  [[ -e ~/mdproxy/mdproxy_zshrc ]] && source ~/mdproxy/mdproxy_zshrc # MDPROXY-ZSHRC
fi

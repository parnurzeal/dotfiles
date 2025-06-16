############## Check Linux or Mac ###############
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
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/atw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

################## Set PATH #####################
# My Bin
export PATH="$PATH:$HOME/bin"

# Homebrew
if [[ "${DOT_OS}" == "OSX" ]]; then
  export PATH="$PATH:/opt/homebrew/bin"
  # Homebrew for Macbook M1+
  eval "$(brew shellenv)"
fi

##### Add preminalry scripts & dependencies #####
# Add Homeshick
if [[ ! -d "$HOME/.homesick/repos/homeshick" ]]; then
  git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Add Antidote
if [[ ! -d "$HOME/.antidote" ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
fi
source "$HOME/.antidote/antidote.zsh"
source <(antidote init)

####### antidote #######
# My custom
echo "---My Plugins---"
antidote bundle $HOME/.zsh-custom/00_presetting
antidote bundle $HOME/.zsh-custom/zsh-history
antidote bundle $HOME/.zsh-custom/zsh-wordsplit
antidote bundle $HOME/.zsh-custom/git
antidote bundle $HOME/.zsh-custom/python
antidote bundle $HOME/.zsh-custom/adb-setup
antidote bundle $HOME/.zsh-custom/android-sdk
antidote bundle $HOME/.zsh-custom/conda
antidote bundle $HOME/.zsh-custom/cpp
antidote bundle $HOME/.zsh-custom/flutter
antidote bundle $HOME/.zsh-custom/go
antidote bundle $HOME/.zsh-custom/google-cloud-sdk
antidote bundle $HOME/.zsh-custom/node
antidote bundle $HOME/.zsh-custom/ruby
# Work custom
if [[ "${DOT_PLACE}" == "G" ]]; then
  echo "---G Plugins---"
  antidote bundle $HOME/.zsh-work-custom/g4d
  antidote bundle $HOME/.zsh-work-custom/hgd
  antidote bundle $HOME/.zsh-work-custom/fileutil
  antidote bundle $HOME/.zsh-work-custom/bagpipe
  antidote bundle $HOME/.zsh-work-custom/pastebin
  antidote bundle $HOME/.zsh-work-custom/adb_screenrecord
  antidote bundle $HOME/.zsh-work-custom/libvirt
  antidote bundle $HOME/.zsh-work-custom/crow
  antidote bundle $HOME/.zsh-work-custom/md_proxy
  antidote bundle $HOME/.zsh-work-custom/x20
  antidote bundle $HOME/.zsh-work-custom/adb_remote
  antidote bundle $HOME/.zsh-work-custom/adb_mdproxy_connect
  antidote bundle $HOME/.zsh-work-custom/dart
  antidote bundle $HOME/.zsh-work-custom/aqr
  antidote bundle $HOME/.zsh-work-custom/xmanager
  antidote bundle $HOME/.zsh-work-custom/gms
fi
# Non-custom
echo "--Public Plugins---"
echo "[alias] djui/alias-tips - help rmb alias"
antidote bundle djui/alias-tips
echo "[nvm] lukechilds/zsh-nvm - manage nvm better"
antidote bundle lukechilds/zsh-nvm
echo "[cd] rupa/z - quickly jump to freq used directory"
antidote bundle rupa/z
echo "[zsh] zsh-users/zsh-syntax-highlighting - highlight zsh"
antidote bundle zsh-users/zsh-syntax-highlighting
echo "[alias] oh-my-zsh/plugins/common-aliases - common aliases"
echo "See https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/common-aliases"
antidote bundle robbyrussell/oh-my-zsh path:plugins/common-aliases
# Stop using git alias for now.
# echo "[git] oh-my-zsh/plugins/git - git aliases and useful functions"
# antidote bundle robbyrussell/oh-my-zsh path:plugins/git

# Set a theme
if [[ "${DOT_PLACE}" == "G" ]] && [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[Theme] Use powerlevel10k theme"
  antidote bundle romkatv/powerlevel10k
else
  echo "[Theme] Use oh-my-zsh intheloop theme"
  antidote bundle robbyrussell/oh-my-zsh path:lib
  antidote bundle robbyrussell/oh-my-zsh path:themes/intheloop.zsh-theme
fi

# If not using powerlevel10k theme, you can remove the following line.
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

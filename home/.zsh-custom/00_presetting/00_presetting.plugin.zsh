# Set variable checker for cross-platform support
case ${OSTYPE} in
  darwin*)
    echo "I am OSX"
    OS_OSX=true
    if [[ -f "$HOME/.at_g" ]]; then
      AT_G=true
      G_OSX=true
    else
      A_OSX=true
    fi
    # Stop using KQueue because it is broken in OSX Sierra https://github.com/tmux/tmux/issues/475
    export EVENT_NOKQUEUE=1
    ;;
  linux*)
    echo "I am Linux"
    OS_LINUX=true
    if [[ -f "$HOME/.at_g" ]]; then
      AT_G=true
      G_LINUX=true
    else
      A_LINUX=true
    fi
    ;;
esac

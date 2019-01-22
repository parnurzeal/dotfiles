# Set variable checker for cross-platform support
MSG="I am "
case ${OSTYPE} in
  darwin*)
    MSG="${MSG} OSX"
    OS_OSX=true
    if [[ -f "$HOME/.at_g" ]]; then
      MSG="${MSG} at G..."
      AT_G=true
      G_OSX=true
    else
      A_OSX=true
    fi
    ;;
  linux*)
    MSG="${MSG} Linux"
    OS_LINUX=true
    if [[ -f "$HOME/.at_g" ]]; then
      MSG="${MSG} at G..."
      AT_G=true
      G_LINUX=true
    else
      A_LINUX=true
    fi
    ;;
esac

echo "${MSG}"

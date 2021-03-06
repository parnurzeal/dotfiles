# A Dotfiles

## MacOSX

### Prerequisites
0. Set Zsh as a default shell
```
chsh -s $(which zsh)
```
1. Homeshick
```
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.zshrc
```
2. Install Homebrew
```
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
```
3. Install tmux
```
brew install tmux
```

### Install
1. Clone this dotfiles repo by homeshick
```
homeshick clone parnurzeal/dotfiles
```

### Optional
1. Install neovim
```
brew install neovim
```


### Reference
Zsh Framework - https://github.com/sorin-ionescu/prezto

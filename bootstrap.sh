#!/bin/sh

# install command line tools
xcode-select --install

# install XCode
sudo xcodebuild -license

# install Google Chrome

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install macvim --with-override-system-vim 
brew install zsh tmux Caskroom/cask/iterm2 cmake ctags git fasd autojump

git config --global credential.helper osxkeychain

mkdir ~/.zprezto

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

sh -s /bin/zsh

# to update:
# git pull && git submodule update --init --recursive

ln -s ~/.dotfiles/zprezto/ ~/.zprezto
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/zpreztorc ~/.zpreztorc
ln -s ~/.dotfiles/zprofile ~/.zprofile
ln -s ~/.dotfiles/zlogin ~/.zlogin
ln -s ~/.dotfiles/zlogout ~/.zlogout
#ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/tmux.conf ~/.tmux.con
#ln -s ~/.dotfiles/Xresources ~/.Xresources
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
#ln -s ~/.dotfiles/emacs ~/.emacs
ln -s ~/.dotfiles/profile ~/.profile
ln -s ~/.dotfiles/secrets ~/.secrets

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cd ~/.dotfiles

git clone https://github.com/chriskempson/base16-iterm2 ~/.iterm2/base16

brew install caskroom/cask/brew-cask
brew install gdb ssh-copy-id wget watch source-highlight ag reattach-to-user-namespace

brew install python
brew tap homebrew/python
brew install numpy --with-openblas
brew install scipy --with-openblas
brew install matplotlib
brew install zmq
pip install pylab
pip install ipython
pip install notebook

brew install pyenv
pyenv install 2.7.10
pyenv install 3.5.0

brew cask install java firefox zotero keepassx sublime-text
brew install emacs --with-cocoa

# install vimperator
# install JDK

brew cask install textmate eclipse-ide xmind libreoffice

brew cask install mactex texshop latexit

brew cask install tunnelblick xquartz caffeine atom seil
brew install gnuplot --with-x11

brew install homebrew/games/gnu-go homebrew/games/go-gui homebrew/games/fuego

brew install ghc
brew install cabal-install
cabal update

# install Chromecast
# install Chrome Apps
# install Adobe Reader
# install Google Drive App
# install Dropbox App

brew cask install skype google-drive dropbox github-desktop sourcetree flash-player adobe-reader telegram viber shiftit electric-sheep

brew install Caskroom/cask/xscreensaver


ln -s ~/.dotfiles/sshconfig ~/.ssh/config
if [ -z ${DISPLAY} ]
then
  export DISPLAY=:0.0
fi
brew linkapps

# install SauceCodePro, Set iTerm, MacVim font

# Generate Ctags
# ctags -R .

open iTermColorsToTerminalColors.swift

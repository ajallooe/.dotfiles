#!/bin/sh

# install command line tools
xcode-select --install

# install XCode
sudo xcodebuild -license

# install Google Chrome

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install macvim zsh tmux Caskroom/cask/iterm2 

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

sh -s /bin/zsh

# to update:
# git pull && git submodule update --init --recursive

brew install gdb

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

brew install Caskroom/cask/java Caskroom/cask/firefox Caskroom/cask/zotero Caskroom/cask/keepassx

# install JDK

brew cask install textmate eclipse-ide xmind libreoffice

brew cask install mactex texshop latexit

brew install homebrew/games/gnu-go homebrew/games/go-gui homebrew/games/fuego

brew install ghc

# install Chromecast
# install Chrome Apps
# install Adobe Reader
# install Google Drive App
# install Dropbox App
brew cask install skype google-drive dropbox github-desktop sourcetree flash-player adobe-reader telegram viber shiftit electric-sheep
brew install Caskroom/cask/xscreensaver

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zpreztorc ~/.zpreztorc
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/tmux.conf ~/.tmux.con
ln -s ~/.dotfiles/Xresources ~/.Xresources
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/emacs ~/.emacs
ln -s ~/.dotfiles/profile ~/.profile

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~/.dotfiles

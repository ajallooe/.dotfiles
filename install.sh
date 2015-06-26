#!/bin/sh

ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.con
ln -s ~/.dotfiles/.Xresources ~/.Xresources
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.emacs ~/.emacs
ln -s ~/.dotfiles/.profile ~/.profile

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~/.dotfiles


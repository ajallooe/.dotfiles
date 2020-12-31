#!/usr/bin/env sh

if [ $PWD == $HOME]; then
    ln -s .dotfiles/doom .doom.d
fi

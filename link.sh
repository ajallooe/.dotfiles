#!/bin/zsh

set -e

echo "Setting up dotfile symlinks..."

# List of [source] [target] pairs
FILES_TO_LINK=(
  "$HOME/.dotfiles/shell/.aliases" "$HOME/.aliases"
  "$HOME/.dotfiles/shell/.functions" "$HOME/.functions"
  "$HOME/.dotfiles/git/.gitconfig" "$HOME/.gitconfig"
  "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
  "$HOME/.dotfiles/zsh/.zprofile" "$HOME/.zprofile"
  "$HOME/.dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
  "$HOME/.dotfiles/bash/.bashrc" "$HOME/.bashrc"
  "$HOME/.dotfiles/bash/.bash_profile" "$HOME/.bash_profile"
  "$HOME/.dotfiles/vim/.vimrc" "$HOME/.vimrc"
  "$HOME/.dotfiles/ssh/config" "$HOME/.ssh/config"
  "$HOME/.dotfiles/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"
  "$HOME/.dotfiles/config/gh" "$HOME/.config/gh"
  "$HOME/.dotfiles/config/iterm2" "$HOME/.config/iterm2"
  "$HOME/.dotfiles/config/raycast" "$HOME/.config/raycast"
  "$HOME/.dotfiles/scripts/setup.sh" "$HOME/.config/setup.sh"
)

i=1
while [ $i -le ${#FILES_TO_LINK} ]; do
  SRC=${FILES_TO_LINK[$i]}
  DEST=${FILES_TO_LINK[$((i+1))]}

  if [ -e "$SRC" ]; then
    echo "Linking $DEST → $SRC"
    mkdir -p "$(dirname "$DEST")"
    ln -sfn "$SRC" "$DEST"
  else
    echo "Skipping $SRC (not found)"
  fi

  i=$((i+2))
done

echo "Done."

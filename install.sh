#!/bin//bash

AINYAVA_DOTFILES=$(pwd)

# Make symbolic links to config dirs
CONFIG_DIRS="zsh nvim mpv vlc fish"

for i in $CONFIG_DIRS; do
  ln -sf "$AINYAVA_DOTFILES/.config/$i" "$HOME/.config"
done

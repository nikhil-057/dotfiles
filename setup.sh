#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
mkdir -p ~/.config/nvim
ln -rsfv init.lua ~/.config/nvim/init.lua
ln -rsfv .tmux.conf ~/.tmux.conf
ln -rsfv .profile ~/.profile
ln -rsfv .zshrc ~/.zshrc

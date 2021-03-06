#!/usr/bin/env bash

# nvim
ln -f ~/.config/nvim/* ~/dotfiles/nvim
ln -f ~/.config/nvim/lua/* ~/dotfiles/nvim/lua
ln -f ~/.config/nvim/spell* ~/dotfiles/nvim/spell
ln -f ~/.config/nvim/snippets* ~/dotfiles/nvim/snippets
cp -r ~/.config/nvim/pack/plugins/opt/* ~/dotfiles/nvim/pack/plugins/opt

# zsh
ln -f ~/.zshenv ~/dotfiles/zsh/.zshenv

# espanso
ln -f ~/.config/espanso/default.yml ~/dotfiles/espanso/default.yml
ln -f ~/.config/espanso/user/* ~/.config/espanso/user

# i3
ln -f ~/.config/i3/* ~/dotfiles/i3

# kitty
ln -f ~/.config/kitty/* ~/dotfiles/kitty

# sxhkd
ln -f ~/.config/sxhkd/* ~/dotfiles/sxhkd

# vifm
ln -f ~/.config/vifm/* ~/dotfiles/vifm

# alacritty
ln -f ~/.config/alacritty/alacritty.yml ~/dotfiles/alacritty/alacritty.yml

#!/usr/bin/sh

# Git Config
git config --global include.path ~/.dotfiles/.gitconfig

# Tmux Config
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# SSH Config
ln -s ~/.dotfiles/ssh-config ~/.ssh/config

# Dircolors
ln -s ~/.dotfiles/.dir_colors ~/.dir_colors

# Alacritty
ln -s ~/.dotfiles/.alacritty.yml ~/.alacritty.yml

# GPG Config
ln -s ~/.dotfiles/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s ~/.dotfiles/gpg/sshcontrol ~/.gnupg/sshcontrol
gpg --import ~/.dotfiles/gpg/public.pgp

# Fish
ln -s ~/.dotfiles/fish ~/.config/fish

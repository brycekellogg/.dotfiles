#!/usr/bin/sh

# zsh
echo """
ZDOTDIR=$HOME/.dotfiles/zsh
source \$ZDOTDIR/.zshenv
""" > $HOME/.zshenv

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

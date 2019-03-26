#!/usr/bin/sh

# NeoVim
pip3 install --user neovim

# Universal CTags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
rm -rf ctags

# Dotfiles
echo """
ZDOTDIR=$HOME/.dotfiles/zsh
source \$ZDOTDIR/.zshenv
""" > $HOME/.zshenv

# Git Config
git config --global include.path ~/.dotfiles/.gitconfig

# SSH Config
ln -s ~/.dotfiles/ssh-config ~/.ssh/config

# Dircolors
ln -s ~/.dotfiles/.dir_colors ~/.dir_colors

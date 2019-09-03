#!/usr/bin/sh

# NeoVim
pip3 install --user neovim
# pip3 install numpydoc


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

# Alacritty
ln -s ~/.dotfiles/.alacritty.yml ~/.alacritty.yml

# Patched NERD Font
mkdir ~/.fonts
cd ~/.fonts && wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf

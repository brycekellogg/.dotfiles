### Install zsh ###
```
sudo dnf install zsh
sudo apt install zsh

chsh -s /bin/zsh
zsh
```

### Clone dotfiles repo ###

```
cd ~
git glone https://github.com/brycekellogg/.dotfiles.git
cd ~/.dotfiles/
git submodule update --init --recursive
```

### nvim ###
```
mkdir -p ~/.config/nvim/
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
```

### dircolors ###
Create a symlink to the dircolors database
```zsh
ln -s ~/.dotfiles/.dir_colors ~/.dir_colors
```

### Install Universal ctags ###
https://github.com/universal-ctags/ctags


### zsh dotfiles ###
To load the zsh dotfiles, create a $HOME/.zshenv file that
contains the following:

```zsh
ZDOTDIR=$HOME/.dotfiles/zsh
source $ZDOTDIR/.zshenv
```

### Git Config ###
Instead of copying or symlinking the .gitconfig file to $HOME/.gitconfig,
create a separate $HOME/.gitconfig that contains the following:

```INI
[include]
    path=~/.dotfiles/.gitconfig
```

### Install zsh ###
sudo dnf install zsh
apt install zsh

chsh -s /bin/zsh
zsh

### Install Prezto ###
https://github.com/sorin-ionescu/prezto

### Install Customized dotfiles
cp -asi --remove-destination `pwd`/.^git ~

### Install Universal ctags ###
https://github.com/universal-ctags/ctags

### Git Config ###
Instead of copying or symlinking the .gitconfig file to $HOME/.gitconfig,
create a separate $HOME/.gitconfig that contains the following:

```INI
[include]
    path=~/.dotfiles/.gitconfig
```

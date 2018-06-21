### Install zsh ###
sudo dnf install zsh
apt install zsh

chsh -s /bin/zsh
zsh

### Install Prezto ###
https://github.com/sorin-ionescu/prezto

### Install Customized dotfiles
cp -asi --remove-destination `pwd`/.^git ~

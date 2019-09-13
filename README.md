### Install zsh ###
```
sudo dnf install zsh
sudo apt install zsh

chsh -s /bin/zsh
zsh
```

### Install Universal Ctags ###
https://github.com/universal-ctags/ctags
```
sudo dnf copr enable thindil/universal-ctags
sudo dnf install universal-ctags
```

### NeoVim ###
```
pip3 install --user neovim
```

### Clone dotfiles repo ###

```
cd ~
git clone https://github.com/brycekellogg/.dotfiles.git
cd ~/.dotfiles/
git submodule update --init --recursive
```

### GPG ###
```
sudo cp /usr/share/doc/gnupg2/examples/systemd-user/*.socket /usr/lib/systemd/user/
sudo cp /usr/share/doc/gnupg2/examples/systemd-user/*.service /usr/lib/systemd/user/
sudo systemctl --user --global enable gpg-agent-ssh.socket
```

### youcompleteme ###
https://valloric.github.io/YouCompleteMe/#linux-64-bit

```
cd ~/.local/share/nvim/plugged/youcompleteme/
python3 install.py --clang-completer
pip3 install --user neovim
```

### Patched NERD Font ###
```
mkdir ~/.fonts
cd ~/.fonts && wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf
```

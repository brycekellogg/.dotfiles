#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Alias tmux first before using zprezto plugin
alias tmux="tmux -f ~/.dotfiles/.tmux.conf"

# Force gnome-keyring to not hijack ssh (must be before pezto)
gnome-keyring-daemon --replace --daemonize --components=pkcs11,secrets,gpg &> /dev/null

# Add location to custom theme
fpath=(${ZDOTDIR:-$HOME}/prompt ${fpath})

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias vim="nvim -u ~/.dotfiles/init.vim"
alias hist="history -$HISTSIZE"
alias cb="xclip -selection clipboard"
alias open="xdg-open"
alias ll='ls -ohX'


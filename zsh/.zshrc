#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Alias tmux first before using zprezto plugin
alias tmux="tmux -f ~/.dotfiles/.tmux.conf"

# Add location to custom theme
fpath=(${ZDOTDIR:-$HOME}/prompt ${fpath})

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias vim="nvim"
alias hist="history -$HISTSIZE"
alias cb="xclip -selection clipboard"



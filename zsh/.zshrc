#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Alias tmux first before using zprezto plugin
alias tmux="tmux -f ~/.dotfiles/.tmux.conf"

# Force gnome-keyring to not hijack ssh or gpg (must be before pezto)
gnome-keyring-daemon --replace --daemonize --components=pkcs11,secrets &> /dev/null

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
alias sudo='sudo '

source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh Autosuggestions
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''

# Zsh History Substring Search
source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

if [[ -n "$key_info" ]]; then
  for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Up]" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Down]" history-substring-search-down
  done

  unset keymap
fi

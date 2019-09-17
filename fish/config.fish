set -x SSH_AUTH_SOCK /run/user/(id -u)/gnupg/S.gpg-agent.ssh

# Neovim Configuration
alias vim='nvim'
set -x VIMINIT source "~/.dotfiles/init.vim"

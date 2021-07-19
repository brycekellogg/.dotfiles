set -x SSH_AUTH_SOCK /run/user/(id -u)/gnupg/S.gpg-agent.ssh

set -x PATH ~/.local/bin/ ~/bin/ $PATH

# Aliases
alias vim='nvim'
alias cb='xclip -selection clipboard'
alias ll='ls -l -G -X -h --group-directories-first'


# Ignoring Key Combinations
bind \e\[6\;5~ ''  # CTRL-PAGEDOWN
bind \e\[5\;5~ ''  # CTRL-PAGEUP
bind \e\[1\;3F ''  # ALT-END
bind \e\[1\;3H ''  # ALT-HOME
bind \e\[1\;5F ''  # CTRL-END
bind \e\[1\;5H ''  # CTRL-HOME
bind \e\[3\;5~ ''  # CTRL-DEL
bind \e\[2\;5~ ''  # CTRL-INS
bind \e\[3\;3~ ''  # ALT-DEL
bind \e\[2\;3~ ''  # ALT-INS
bind \e\[1\;5A ''  # CTRL-UP
bind \e\[1\;5B ''  # CTRL-DOWN
bind \e\[2~ ''     # INSERT


# Neovim Configuration
set -x VIMINIT source "~/.dotfiles/init.vim"
set -x EDITOR nvim


# Set terminal (Tmux) title
#
# Here we overwrite a fish shell built in function that sets the
# title of the terminal emulator, in this case Tmux. If we're
# anywhere inside a git repo, we want the title to be set to the
# name of the git repo. Otherwise we want the title to be set to
# the name of the current working directory.
function fish_title
    set -l gitdir (git rev-parse --git-dir 2> /dev/null)
    if test "$gitdir" = ""
        echo (basename (pwd))
    else if test "$gitdir" = ".git"
        echo (basename (pwd))
    else
        echo (basename (dirname "$gitdir"))
    end
end


function fish_prompt --description 'Write out the prompt'
    echo -n -s (set_color $fish_color_cwd) (prompt_pwd) \
               (set_color $fish_color_vcs) (__fish_vcs_prompt) \
               (set_color $fish_color_pmt) " » "
end

direnv hook fish | source

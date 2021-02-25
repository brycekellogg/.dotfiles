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
set -x PAGER "nvim -c 'set ft=man' -"

# Tmux Titles
function fish_title
    if git rev-parse --git-dir > /dev/null ^ /dev/null
        set -l gitdir (git rev-parse --git-dir)
        if test $gitdir = ".git"
            echo (basename (pwd))
        else
            echo (basename (dirname $gitdir))
        end
    else
        echo (basename (pwd))
    end
end


function fish_prompt --description 'Write out the prompt'


    # Only display USER@HOSTNAME if connected over ssh
    #if set -g SSH_TTY
        #echo -n -s "$USER"@(prompt_hostname)" "
    #end

    echo -n -s (set_color $fish_color_cwd) (prompt_pwd) \
               (set_color $fish_color_vcs) (__fish_vcs_prompt) \
               (set_color $fish_color_pmt) " » "
end

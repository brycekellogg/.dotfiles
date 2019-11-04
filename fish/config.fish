set -x SSH_AUTH_SOCK /run/user/(id -u)/gnupg/S.gpg-agent.ssh

# Aliases
alias vim='nvim'
alias cb='xclip -selection clipboard'
alias ll='ls -l -G -X -h --group-directories-first'

# Neovim Configuration
set -x VIMINIT source "~/.dotfiles/init.vim"
set -x EDITOR nvim


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

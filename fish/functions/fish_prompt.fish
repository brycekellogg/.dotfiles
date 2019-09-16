function fish_prompt --description 'Write out the prompt'


    # Only display USER@HOSTNAME if connected over ssh
    if set -g SSH_TTY
        echo -n -s "$USER"@(prompt_hostname)" "
    end

    echo -n -s (set_color $fish_color_cwd) (prompt_pwd) \
               (set_color $fish_color_vcs) (__fish_vcs_prompt) \
               (set_color $fish_color_pmt) " » "
end


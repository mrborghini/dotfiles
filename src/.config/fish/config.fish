if status is-interactive
    # Setup prompt for fish
    function fish_prompt
        set -l last_status $status
        echo -n "["
        set_color --bold cyan
        echo -n $(whoami)"@"(prompt_hostname)
        set_color --bold blue
        echo -n " "(prompt_pwd)
        set_color normal
        echo -n ']$ '

        # enable tab completions for accepting and completing
        function fish_user_key_bindings
            bind \t __tab_accept_or_complete
        end
    end
end

set -g fish_prompt_pwd_dir_length 0

# Helper function to make tab completions work like zsh
function __tab_accept_or_complete
    set -l before (commandline)
    commandline -f accept-autosuggestion
    set -l after (commandline)
    # If the command line is unchanged, there was no suggestion to accept,
    # so fall back to normal completion.
    if test "$before" = "$after"
        commandline -f complete
    end
end

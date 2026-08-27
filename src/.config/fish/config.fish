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

        # Tab: cycle completions. Right arrow: accept gray autosuggestion.
        function fish_user_key_bindings
            bind \t complete
            bind \e\[Z complete-and-search
        end
    end
end

# Previous command with !!
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end


set -g fish_prompt_pwd_dir_length 0

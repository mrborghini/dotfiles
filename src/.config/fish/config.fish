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

set -g fish_prompt_pwd_dir_length 0

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Bind the Home and End keys based on the terminal's output
bindkey '^[[H' beginning-of-line  # Home key
bindkey '^[[F' end-of-line        # End key

bindkey '\e[3~' delete-char          # Delete key
bindkey '\e[5~' beginning-of-history # Page Up
bindkey '\e[6~' end-of-history       # Page Down

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

PROMPT='[%F{cyan}%n@%M%F{blue} %~%f]$ '

bindkey -e  # Enable emacs keybindings

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Bind the Home and End keys based on the terminal's output
bindkey '^[[H' beginning-of-line     # Home key
bindkey '^[[F' end-of-line           # End key

bindkey '\e[3~' delete-char          # Delete key
bindkey '\e[5~' beginning-of-history # Page Up
bindkey '\e[6~' end-of-history       # Page Down
bindkey -e                           # Enable emacs keybindings

# Disable case sensitivivity
setopt nocaseglob
setopt nocasematch

# Setup zsh autocomplete
zstyle :compinstall filename '$HOME/.zshrc'

# Initialize auto complete
autoload -Uz compinit
compinit

# Setup command line text to "[user@hostname path]$ "
PROMPT='[%F{cyan}%n@%M%F{blue} %~%f]$ '

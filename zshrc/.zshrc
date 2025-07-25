# COMMAND PROMPT
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starshipconfig/starship.toml
eval "$(starship init zsh)"

# FUZZY FIND DIRS
alias f='cd $(fd --type directory | fzf)'

# VIM KEYBINDINGS IN TERMINAL
set -o vi
bindkey -v '^?' backward-delete-char
bindkey -v
KEYTIMEOUT=1


#!/bin/zsh

# GENERAL 
export EDITOR=nvim

# COMMAND PROMPT
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
eval "$(starship init zsh 2>/dev/null || echo '')"

# FUZZY FIND DIRS
alias f='cd $(fd --type directory | fzf)'

# VIM KEYBINDINGS IN TERMINAL
set -o vi
bindkey -v '^?' backward-delete-char
KEYTIMEOUT=1

# YAZI
export YAZI_CONFIG_HOME=$XDG_CONFIG_HOME/yazi/yazi.toml
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


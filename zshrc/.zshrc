source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export XDG_CONFIG_HOME=~/.config/dotfiles
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starshipconfig/starship.toml

eval "$(starship init zsh)"

alias f='cd $(fd --type directory | fzf)'

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

set -o vi

bindkey -v '^?' backward-delete-char



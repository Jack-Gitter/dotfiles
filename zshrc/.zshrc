source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export XDG_CONFIG_HOME=~/.config/dotfiles
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starshipconfig/starship.toml

eval "$(starship init zsh)"

alias f='cd $(fd --type directory | fzf)'
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

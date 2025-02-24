export STARSHIP_CONFIG=~/.config/starshipconfig/starship.toml
export HOME=~/.config/dotfiles/

eval "$(starship init zsh)"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

alias f='cd $(fd --type directory | fzf)'

# pnpm
export PNPM_HOME="/Users/jack.gitter/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

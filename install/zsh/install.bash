#!/bin/bash

if ! command -v "brew" >/dev/null 2>&1; then
    echo "installing homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

if ! command -v "starship" >/dev/null 2>&1; then
    echo "installing starship"
    brew install starship
fi

brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

#!/bin/bash

if ! command -v "brew" >/dev/null 2>&1; then
    echo "installing homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

if ! command -v fzf >/dev/null 2>&1; then 
    echo "installing fzf"
    brew install fzf
fi

if ! command -v "nvim" >/dev/null 2>&1; then
    echo "installing neovim..."
    brew install neovim
fi

if ! command -v "rg" >/dev/null 2>&1; then
    echo "installing rg..."
    brew install ripgrep
fi

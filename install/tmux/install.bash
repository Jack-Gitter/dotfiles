#!/bin/sh

if ! command -v "brew" >/dev/null 2>&1; then
    echo "installing homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

if ! command -v "tmux" >/dev/null 2>&1; then
    echo "installing tmux..."
    brew install tmux
fi

if ! command -v "git" >/dev/null 2>&1; then
    echo "installing git..."
    brew install git
fi


if  [ ! -d "~/.tmux/plugins/tpm/" ]; then
    echo "installing tpm..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


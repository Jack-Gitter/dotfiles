#!/bin/sh

if ! command -v "brew" >/dev/null 2>&1; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

if ! command -v "tmux" >/dev/null 2>&1; then
    brew install tmux
fi

if ! command -v "git" >/dev/null 2>&1; then
    brew install git
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

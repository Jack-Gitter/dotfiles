#!/bin/bash

if ! command -v "brew" >/dev/null 2>&1; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

if ! command -v "starship" >/dev/null 2>&1; then
    brew install starship
fi

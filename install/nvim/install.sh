#!bin/bash

if ! [-x "$(command -v brew)"]; then 
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

if ! [-x "$(command -v nvim)"] then
    brew install neovim


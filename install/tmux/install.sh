#!bin/bash

if ! [-x "$(command -v brew)"]; then 
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

if ! [-x "$(command -V tmux)"]; then 
    brew install tmux

if ! [-x "$(command -v git)"]; then 
    brew install git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#!/bin/bash

cp -r ~/.config/nvim/ .
cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.tmux.conf .
git add *
git commit -m "commiting updates"
git push

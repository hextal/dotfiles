#!/bin/bash

cp ~/.config/nvim/init.vim .
cp ~/.vim .
cp ~/.zshrc .
cp ~/.tmux.conf .
git add *
git commit -m "commiting updates"
git push

#!/bin/bash

cp "$HOME/.zshrc" ./
cp "$HOME/.vimrc" ./

cp "$HOME/.gitconfig" ./
cp "$HOME/.gitignore" ./

git add .
git commit -m 'Update by script'
git push


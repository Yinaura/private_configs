#!/bin/bash

cp -r "$HOME/.zshrc" ./
cp -r "$HOME/.vimrc" ./

cp -r "$HOME/.gitconfig" ./
cp -r "$HOME/.gitignore" ./

cp -rf "$HOME/.rc" ./
cp -rf "$HOME/zle/" ./

git add .
git commit -m 'Update with script'


#!/bin/bash

cp -r "$HOME/.zshrc" ./
cp -r "$HOME/.vimrc" ./

cp -r "$HOME/.gitconfig" ./
cp -r "$HOME/.gitignore" ./

git add .
git commit -m 'Update with script'
git push


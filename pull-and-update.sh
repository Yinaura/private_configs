#!/bin/bash

git pull

cp -f ./.zshrc "$HOME/.zshrc"
cp -f ./.vimrc "$HOME/.vimrc"

cp -f ./.gitconfig "$HOME/.gitconfig"
cp -f ./.gitignore "$HOME/.gitignore" 

echo "done"

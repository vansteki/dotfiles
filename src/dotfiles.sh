#!/usr/bin/.env bash

# use "dirname $0" to get origin dir of symbolic file
PWD=$(dirname $0)
DOTFILES_DIR=${PWD%/*}/dotfiles/macos

source $PWD/update.sh

echo ---
echo "update dotfiles..."

update $HOME $DOTFILES_DIR

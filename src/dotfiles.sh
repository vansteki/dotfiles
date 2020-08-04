#!/usr/bin/.env bash

# use "dirname $0" to get origin dir of symbolic file
PWD=$(dirname $0)
DOTFILES_DIR=${PWD%/*}/dotfiles/macos

source $PWD/update.sh
if [[ $1 == "save" ]]; then
  echo ---
  echo "update dotfiles..."
  echo ---
  update $HOME $DOTFILES_DIR
else
  echo ---
  echo "dry run mode: update dotfiles, use dotfiles save to save result to remote repository"
  echo ---
  update $HOME $DOTFILES_DIR "--dry-run"
fi

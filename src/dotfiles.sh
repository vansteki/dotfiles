#!/bin/zsh

# use "dirname $0" to get origin dir of symbolic file
PWD=$(dirname $0)
DOTFILES_DIR=${PWD%/*}/dotfiles/macos

source $PWD/update.sh
if [[ $1 == "push" && $2 == "--all" ]]; then
  echo ---
  echo "update dotfiles...[multi repo]"
  echo ---
  update $HOME $DOTFILES_DIR --all
elif [[ $1 == "push"  ]]; then
  echo ---
  echo "update dotfiles...[single repo]"
  echo ---
  update $HOME $DOTFILES_DIR
else
  echo ---
  echo "dry run mode: update dotfiles, use \`dotfiles push\` to push  result to remote repository"
  echo "or"
  echo "using \`dotfiles push --all\` to push to all remote repos"
  echo ---
  update $HOME $DOTFILES_DIR "--dry-run"
fi

#!/usr/bin/env bash

function setup() {
  echo 'setup...'
  result=$(cat ~/.zshenv | grep -c dotfiles.sh)

  if [[ $result -gt 0 ]]; then
    echo 'dotfiles alias in ~/.zshrc founded:'
    cat ~/.zshenv | grep dotfiles.sh
  else
    printf "\n# My dotfiles helper\n" >>~/.zshenv
    echo alias dotfiles=\"bash $(pwd)/src/dotfiles.sh\" >>~/.zshenv
  fi

  echo "usage: try 'dotfiles' to see update your dotfiles in dry-run mode."
  echo "usage: use 'dotfiles push' to push your dotfiles to remote."
  echo "usage: use 'dotfiles push --all' to push your dotfiles to all remotes."
}

setup

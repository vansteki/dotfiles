#!/usr/bin/.env bash

function setup() {
  echo 'setup...'
  result=$(cat ~/.zshrc | grep -c dotfiles.sh)

  if [[ $result -ge 0 ]]; then
    echo 'dotfiles alias in ~/.zshrc founded:'
    cat ~/.zshrc | grep dotfiles.sh
  else
    printf "\n# My dotfiles helper\n" >>~/.zshrc
    echo alias dotfiles=\"bash $(pwd)/src/dotfiles.sh\" >>~/.zshrc
  fi

  echo "usage: use 'dotfiles update' to update your dotfiles"
}

setup

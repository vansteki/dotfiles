#!/usr/bin/.env bash

function setup() {
  echo 'setup...'
  printf "\n# My dotfiles helper\n" >>~/.zshrc
  echo alias dotfiles=\"bash $(pwd)/src/dotfiles.sh\" >>~/.zshrc
  result=$(cat ~/.zshrc | grep -c dotfiles.sh)
  if [[ $result -ge 0 ]]; then
    echo 'dotfiles alias in ~/.zshrc founded:'
    cat ~/.zshrc | grep dotfiles.sh
  fi
  echo "usage: use 'dotfiles update' to update your dotfiles"
}

setup

#!/usr/bin/env bash

function setup() {
  echo 'setup'
  if [[ "$OSTYPE" == "darwin"* ]]; then
    printf "\n# My dotfiles helper\n" >>~/.zshrc
    echo alias dotfiles=\"bash $(pwd)/dotfiles.sh\" >>~/.zshrc
    result=$(cat ~/.zshrc | grep -c dotfiles.sh)

    if [[ $result -ge 0 ]]; then
      echo 'dotfiles alias in ~/.zshrc founded:'
      cat ~/.zshrc | grep dotfiles.sh
    fi

  elif [[ "$OSTYPE" == "win64" ]]; then
    echo setup for linux windows

  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo setup for linux
  fi
  echo "usage: use 'dotfiles update' to update your dotfiles"
}

setup

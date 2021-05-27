#!/bin/zsh

function setup() {
  echo 'setup...'
  result=$(cat ~/.zshrc | grep -c dotfiles.sh)

  if [[ $result -gt 0 ]]; then
    echo 'dotfiles alias in ~/.zshrc founded:'
    cat ~/.zshrc | grep dotfiles.sh
  else
    printf "\n# My dotfiles helper\n" >>~/.zshrc
    echo alias dotfiles=\"bash $(pwd)/src/dotfiles.sh\" >>~/.zshenv
  fi

  echo "usage: try 'dotfiles' to see update your dotfiles in dry-run mode."
  echo "usage: use 'dotfiles push' to push your dotfiles to remote."
  echo "usage: use 'dotfiles push --all' to push your dotfiles to all remotes."
}

setup

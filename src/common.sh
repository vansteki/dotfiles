#!/usr/bin/.env bash

function cleanTestFiles() {
  rm -rf $PWD/userhome/.* $PWD/userhome/*.yml || exit 0
}

function countFiles() {
  local src=$1
  echo $(ls -1A $src | wc -l)
}

ps -p $$
echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
PWD=$(dirname $0)
echo ORIGIN PATH: $PWD

sourceDir="$PWD/dotfiles/macos"
destDir="$HOME"
echo sourceDir: $sourceDir
echo destDir: $destDir

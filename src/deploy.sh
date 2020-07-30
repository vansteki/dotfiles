#!/usr/bin/.env bash

function deploy() {
  local src=$1
  local dest=$2
  [ -z $src ] && echo "no source dir" && exit 1
  [ -z $dest ] && echo "no source dir" && exit 1
  echo files or folders to copy:
  find $src -type f
  cp -r $src/ $dest/
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  destDir="$HOME"
  deploy $PWD/dotfiles/macos $destDir
  echo ---
  echo "file deployed:"
  find $PWD/dotfiles/macos -type f | xargs -I file basename file
  echo ---
elif [[ "$OSTYPE" == "win64" ]]; then
  echo "Windows!"

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

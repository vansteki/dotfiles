#!/usr/bin/.env bash

set -x

source $PWD/.env
source $PWD/common.sh

function deploy() {
  local src=$1
  local dest=$2
  [ -z $src ] && echo "no source dir" && exit 1
  [ -z $dest ] && echo "no source dir" && exit 1
  fileCount=$(countFiles $src)
  echo "copy $fileCount files from $src to $dest"
  echo files or folders to copy:
  find $src -type f
  cp -r $src/ $dest/
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  sourceDir="$PWD/macos"
  destDir="$HOME"
  deploy $sourceDir $destDir
  echo ---
  echo "file deployed:"
  find $sourceDir -type f | xargs -I file basename file
  echo ---
elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

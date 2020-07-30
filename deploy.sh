#!/usr/bin/.env bash

source ./env.sh
source ./common.sh

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

deploy $sourceDir $destDir
echo "file deployed:"
find $sourceDir -type f | xargs -I file basename file
#xargs -I file find $destDir -maxdepth 1 -name "file"

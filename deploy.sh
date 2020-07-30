#!/usr/bin/env bash

source .env.sh

function deploy() {
  local src=$1
  local dest=$2
  [ -z $src ] && src="$PWD/macos" || src=$1
  [ -z $dest ] && dest="$PWD/userhome" || dest=$2
  fileCount=$(countFiles $dest)
  echo "copy $fileCount files from $src to $dest"
  echo files or folders to copy:
  find $src -type f
  cp -r $src/ $dest/
}

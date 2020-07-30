#!/usr/bin/env bash

. .env.sh

function deploy() {
  sourceDir="$PWD/macos"
  destDir="$PWD/userhome"
  fileCount=$(countFiles $sourceDir)
  echo "copy $fileCount files from $sourceDir to $destDir"
  deployDotfiles $sourceDir $destDir
}

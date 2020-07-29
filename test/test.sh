#!/usr/bin/env bash

#set -x

cd "$PWD/test" || exit

echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
ps -p $$

echo ------

sourceDir="$PWD/test_macos"
destDir=""
fileCount=0

function cleanTestFiles() {
  rm $destDir/.*
}

function countFiles() {
  local src=$1
  echo $(ls -1A $src | wc -l)
}

function deployDotfiles() {
  local src=$1
  local dest=$2
  echo files or folders to copy:
  find $src -type f
  cp -r $src/ $dest/
}

function setup() {
  sourceDir="$PWD/test_macos"
  destDir="$PWD/test_userhome"
  fileCount=$(countFiles $sourceDir)
  echo "copy $fileCount files from $sourceDir to $destDir"
  deployDotfiles $sourceDir $destDir
}

function update() {
  sourceDir="$PWD/test_userhome"
  destDir="$PWD/test_macos"

  echo sourceDir $sourceDir
  echo destDir $destDir
  echo ---

  filesToCommit=$(find $destDir -type f -name "*" -exec basename {} \;)
  filesToCommitWithPath=$(echo $filesToCommit | tr " " "\n" | xargs -I file find . -name "file" )
  echo $filesToCommitWithPath | tr " " "\n" | xargs -I file cp file $destDir
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  setup
#  update
elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./test_windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

#cleanTestFiles

# udpate dotfiles




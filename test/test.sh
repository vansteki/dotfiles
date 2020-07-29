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

function findThenCopyTo() {
  local src=$1
  local dest=$2
  [[ $3 = '' ]] && local fileNamePattern=".*" || local fileNamePattern=$3
  echo files or folders to copy:
  find $src -type f
  echo $filesToCopy
  cp -r test_macos/ test_userhome/
}

function setup() {
  sourceDir="$PWD/test_macos"
  destDir="$PWD/test_userhome"
  fileCount=$(countFiles $sourceDir)
  echo "copy $fileCount files from $sourceDir to $destDir"
  findThenCopyTo $sourceDir $destDir
}

function update() {
  sourceDir="$PWD/test_userhome"
  destDir="$PWD/test_macos"

  echo sourceDir $sourceDir
  echo destDir $destDir
  echo ---

  commitFileList=$(find $destDir -type f -name "*" -exec basename {} \;)
  echo $commitFileList | tr " " "\n" | xargs -I file echo ~/file
#  | xargs -J file echo $sourceDir/file
#  echo files to update:
#  echo $commitFileList
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  setup
elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./test_windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

#cleanTestFiles

# udpate dotfiles




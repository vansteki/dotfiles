#!/usr/bin/env bash

#set -x#w

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
  find $src -type f -name "$fileNamePattern" | xargs -J file cp file $dest
}


if [[ "$OSTYPE" == "darwin"* ]]; then
  sourceDir="$PWD/test_macos"
  destDir="$PWD/test_userhome"
  fileCount=$(countFiles $sourceDir)
  echo "copy $fileCount files from $sourceDir to $destDir"
  findThenCopyTo $sourceDir $destDir

elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./test_windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

#cleanTestFiles


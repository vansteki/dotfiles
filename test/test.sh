#!/usr/bin/env bash

#set -x
#w

cd "$PWD/test" || exit

echo OS: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
echo ------

sourceDir="$PWD/test_macos"
destDir=""
fileCount=0

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Apple!"
  sourceDir="$PWD/test_macos"
  fileCount=$(ls -1A $sourceDir | wc -l)
  echo "copy $fileCount files from $sourceDir to $destDir"
  find "$sourceDir -type f -name '.*' | xargs -J file cp file $destDir"

elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./test_windows'
  fileCount=$(ls -1A $sourceDir | wc -l)
  echo "copy $fileCount files from $sourceDir to $destDir"
  find "$sourceDir -type f -name '.*' | xargs -J file cp file $destDir"

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi



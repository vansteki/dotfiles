#!/usr/bin/env bash

#set -x

cd "$PWD/test" || exit

echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
ps -p $$

echo ---

sourceDir="$PWD/macos"
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
  sourceDir="$PWD/macos"
  destDir="$PWD/userhome"
  fileCount=$(countFiles $sourceDir)
  echo "copy $fileCount files from $sourceDir to $destDir"
  deployDotfiles $sourceDir $destDir
}

function update() {
  sourceDir="$PWD/userhome"
  destDir="$PWD/macos"

  echo sourceDir $sourceDir
  echo destDir $destDir
  echo ---
  echo files to update:

  filesToCommit=$(find $destDir -maxdepth 1 -type f -name "*" -exec basename {} \;)
  echo $filesToCommit
  for file in $filesToCommit; do
    find $sourceDir -type f -name "$file"
    find $sourceDir -type f -name "$file" -exec cp -r {} $destDir \;
  done

  echo ---

  filesWithFolderToCommit=$(find $destDir -type d -name ".*" -exec basename {} \;)
  echo $filesWithFolderToCommit
  for file in $filesWithFolderToCommit; do
    find $sourceDir -type d -name "$file"
    find $sourceDir -type d -name "$file" -exec cp -r {} $destDir \;
  done

  #  echo $filesToCommitWithPath | tr " " "\n" | xargs echo $destDir/
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  #  setup
  update
elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

#cleanTestFiles

# udpate dotfiles

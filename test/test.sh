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
  rm /usr/local/opt/dotfiles
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
  echo 'setup'
  if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s ./dotfiles /usr/local/opt/dotfiles
  elif [[ "$OSTYPE" == "win64" ]]; then
    echo setup for linux windows
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo setup for linux
  fi
  echo "usage: use 'dotfiles update' to update your dotfiles"
}

function deploy() {
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

  echo ---
  echo update to repo via git:
  cd $destDir || exit
  git add -u
  git commit -m "update dotfiles"
  git push origin master
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  setup
#  deploy
#  update
#  cleanTestFiles $destDir
elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

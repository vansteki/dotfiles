#!/usr/bin/.env bash

# use "dirname $0" to get origin dir of symbolic file
PWD=$(dirname $0)
source $PWD/common.sh

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
  sourceDir="$PWD/macos"
  destDir="$PWD/userhome"
  update

elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

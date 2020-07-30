#!/usr/bin/env bash

cd "$PWD/test" || echo 'no need to change working directory'

echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
ps -p $$

echo ---

sourceDir="$PWD/macos"
destDir=""
fileCount=0

function cleanTestFiles() {
  rm -rf $PWD/userhome/.*
}

function countFiles() {
  local src=$1
  echo $(ls -1A $src | wc -l)
}

# void, stringToFind, fileToGrep
function testIfStringExistInFile() {
  echo "test if string exists in a file"
  echo ---
  local stringToFind=$1
  local fileToGrep=$2
  local result=0
  result=$(cat $stringToFind | grep -c $fileToGrep)
  if [[ $result -ge 0 ]]; then
    echo "found $stringToFind in $fileToGrep:"
    cat $stringToFind | grep $fileToGrep
  fi
}

function setup() {
  echo 'setup'
  if [[ "$OSTYPE" == "darwin"* ]]; then
    printf "\n# My dotfiles helper\n" >>~/.zshrc
    echo alias dotfiles=\"bash $(pwd)/dotfiles.sh\" >>~/.zshrc
    result=$(cat ~/.zshrc | grep -c dotfiles.sh)

    if [[ $result -ge 0 ]]; then
      echo 'dotfiles alias in ~/.zshrc founded:'
      cat ~/.zshrc | grep dotfiles.sh
    fi

  elif [[ "$OSTYPE" == "win64" ]]; then
    echo setup for linux windows

  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo setup for linux
  fi
  echo "usage: use 'dotfiles update' to update your dotfiles"
}

function deployDotfiles() {
  local src=$1
  local dest=$2
  echo files or folders to copy:
  find $src -type f
  cp -r $src/ $dest/
}

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
  #  setup
#  deploy
  update && ls -al ./userhome && cleanTestFiles
#  cleanTestFiles $destDir
elif [[ "$OSTYPE" == "win64" ]]; then
  sourceDir='./windows'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux!"
fi

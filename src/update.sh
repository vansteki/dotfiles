function update() {
  sourceDir=$1
  destDir=$2
  mode=$3

  echo sourceDir $sourceDir
  echo destDir $destDir
  echo ---
  echo files to update:

  filesToCommit=$(find $destDir -maxdepth 1 -type f -name "*" -exec basename {} \;)
  echo $filesToCommit
  for file in $filesToCommit; do
    find $sourceDir -maxdepth 1 -type f -name "$file"
    find $sourceDir -maxdepth 1 -type f -name "$file" -exec cp -r {} $destDir \;
  done

  echo ---
  echo folders to update:
  filesWithFolderToCommit=$(find $destDir -maxdepth 1 -type d -name ".*" -exec basename {} \;)
  echo $filesWithFolderToCommit
  for file in $filesWithFolderToCommit; do
    find $sourceDir -maxdepth 1 -type d -name "$file"
    find $sourceDir -maxdepth 1 -type d -name "$file" -exec cp -r {} $destDir \;
  done

  echo ---
  echo mode: $3 $4
  if [[ $mode != "--dry-run" ]]; then
    if [[ $mode == "--all" ]]; then
      echo push to all remote repos
      cd $destDir || exit
      git add -u
      git commit -m "update dotfiles to all remote repos"
      git remote | xargs -L1 git push
    else
      echo update to repo via git:
      cd $destDir || exit
      git add -u
      git commit -m "update dotfiles"
      git push origin master
    fi
  else
    echo dry-run update to repo via git:
    cd $destDir || exit
    git add -u --dry-run
    git commit -m "update dotfiles" --dry-run
    git push origin master --dry-run
  fi
}

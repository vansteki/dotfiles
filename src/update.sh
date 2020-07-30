function update() {
  sourceDir="$HOME"
  destDir="$PWD/dotfiles/macos"

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
  echo update to repo via git:
  cd $destDir || exit
  git add --dry-run -u
  git commit --dry-run -m "update dotfiles"
  git push --dry-run origin master
}

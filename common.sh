function cleanTestFiles() {
  rm -rf $PWD/userhome/.* $PWD/userhome/*.yml || exit 0
}

function countFiles() {
  local src=$1
  echo $(ls -1A $src | wc -l)
}

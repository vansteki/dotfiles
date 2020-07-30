#!/usr/bin/env bash

function cleanTestFiles() {
  rm -rf $PWD/userhome/.* $PWD/userhome/*.yml || exit 0
}

function countFiles() {
  local src=$1
  echo $(ls -1A $src | wc -l)
}

#!/usr/bin/env bash

ps -p $$
echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
# should use in production env
#PWD=$(dirname $0)
#echo ORIGIN PATH: $PWD

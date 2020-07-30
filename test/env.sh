#!/usr/bin/env bash

echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
ps -p $$
sourceDir="$PWD/macos"
destDir="$PWD/userhome"
echo sourceDir: $sourceDir
echo destDir: $destDir

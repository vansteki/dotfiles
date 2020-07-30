#!/usr/bin/env bash

source .env.sh

deploy $sourceDir $destDir
echo "deploy done, clean dotfiles:"
find $destDir -type f -name "*"

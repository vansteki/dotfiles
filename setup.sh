#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "copy files from ./macos to user $HOME";


elif  [[ "$OSTYPE" == "win64" ]]; then
  echo "Windows!";
fi

#!/usr/bin/env bash

ps -p $$
echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
# should use in production env
#PWD=$(dirname $0)
#echo ORIGIN PATH: $PWD

#!/usr/bin/env bash

ps -p $$
echo OSTYPE: $OSTYPE
echo HOME: $HOME
echo PWD: $PWD
PWD=$(dirname $0)
echo ORIGIN PATH: $PWD


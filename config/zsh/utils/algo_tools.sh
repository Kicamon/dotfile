#!/bin/bash

prev="$HOME/Documents/Algorithm"
dir=$(pwd)
file="."${dir:${#prev}}"/$1"
time=$(date +'%Y.%m.%d')
echo -e "|[<++>](<++>)|<++>|${file}|${time}|0|<++>|" | tee -a "${prev}/docs/题单.md"

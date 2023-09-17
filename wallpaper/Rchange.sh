#! /bin/bash

Path=~/.config/wallpaper/
files=($(ls ${Path} | grep -E 'png|jpg'))
len=${#files[*]}
index=`head --lines=1 ~/.config/wallpaper/index.txt`

while true
do
  index=`expr ${RANDOM} % ${len}`
	feh --bg-fill ${Path}${files[$index]}
  echo $index > ~/.config/wallpaper/index.txt
  sleep 600
done

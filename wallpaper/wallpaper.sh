#! /bin/bash
#set -x

Path=~/.config/wallpaper/
files=($(ls ${Path} | grep -E 'png|jpg'))
len=${#files[*]}
index=`head --lines=1 ~/.config/wallpaper/index.txt`

if [ $1 == 0 ]
then
  index=0
	feh --bg-fill ${Path}${files[$index]}
elif [ $1 == 1 ]
then
	index=`expr ${index} - 1`
	if [ ${index} -lt 0 ]
	then
    index=`expr ${len} - 1`
	fi
	feh --bg-fill ${Path}${files[$index]}
elif [ $1 == 2 ]
then
	index=`expr ${index} + 1`
	if [ ${index} -ge ${len} ]
	then
    index=0
	fi
	feh --bg-fill ${Path}${files[${index}]}
elif [ $1 == 3 ]
then
  RCHANGE=$(ps -ef | grep Rchange.sh | grep -v grep)
  echo "$RCHANGE"
  if [ "$RCHANGE" == "" ]
  then
    ${Path}Rchange.sh
  else
    killall Rchange.sh
  fi
fi

echo $index > ~/.config/wallpaper/index.txt

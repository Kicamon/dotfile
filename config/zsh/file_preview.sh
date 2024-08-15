#! /usr/bin/env sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}

dir=$1
if [ "$2" == "gd" ]; then
  if ! [ -d "$dir" ];then
    dir=$(lua $HOME/.config/zsh/quick_jump.lua $dir)
  fi
  dir=$(eval echo "$dir")
fi

if [ -d "$dir" ]; then
  exa -l --no-user --no-time --icons --no-permissions --no-filesize "$dir" 2>/dev/null
elif [ "$category" = text ]; then
  (bat -p --style numbers --color=always "$1" ) 2>/dev/null | head -1000
elif [ "$mime" = application/pdf ]; then
  pdftotext $1 - | less
else
  echo $1 is a $category file
fi

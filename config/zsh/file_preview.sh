#! /usr/bin/env sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}

# get dir
dir=$1
if [[ -z "$dir" ]]; then
  dir=$2
fi
dir=$(lua $HOME/.config/zsh/quick_jump.lua $dir)
dir=$(eval echo "$dir")

# preview
if [ -d "$dir" ]; then
  echo -e "\e[1;34m Directory: $dir \e[0m"
  exa -l --no-user --no-time --icons --no-permissions --no-filesize "$dir" 2>/dev/null
elif [ "$category" = text ]; then
  (bat -p --style numbers --color=always "$1") 2>/dev/null | head -1000
elif [ "$mime" = application/pdf ]; then
  pdftotext $1 - | less
elif [ "$2" == "-kill" ]; then
  top_output=$(top -bn1 | grep "$1")

  CPU_USAGE=$(echo "$top_output" | awk '{sum += $9} END {print sum}')
  MEM_USAGE=$(echo "$top_output" | awk '{sum += $10} END {print sum}')

  echo "$1 进程的CPU使用率: $CPU_USAGE%"
  echo "$1 进程的内存使用率: $MEM_USAGE%"
else
  echo $1 is a $category file
fi

cd ~/Documents/Algorithm/cf

cf race $1 &
wait

local dir=~/Documents/Algorithm/cf/contest/$1

for file in ${dir}/*; do
  rm ${file}/*
done

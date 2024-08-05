git add .
if [ -n "$1" ];then
  git commit -m $1
else
  time=$(date "+%Y/%m/%d,%H:%M")
  git commit -m ${time}
fi
wait
git push

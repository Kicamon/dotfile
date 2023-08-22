#! /bin/bash

time=$(date "+%Y/%m/%d,%H:%M")

git add ./alacritty ./dunst ./fcitx5 ./fish ./i3 ./kitty ./mpd ./ncmpcpp ./picom ./polybar ./rofi ./wallpaper ./zsh ./ranger ./neofetch ./update.sh
git commit -m ${time}
git push

#! /bin/bash

time=$(date "+%Y/%m/%d,%H:%M")

git add ./alacritty ./dunst ./fcitx5 ./fish ./i3 ./kitty ./mpd/mpd.conf ./ncmpcpp ./picom ./polybar ./rofi ./wallpaper ./zsh ./ranger ./neofetch ./update.sh ./tmux ./starship.toml ./vim ./install.sh
wait
git commit -m ${time}
wait
git push

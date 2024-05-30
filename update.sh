#! /bin/bash

time=$(date "+%Y/%m/%d,%H:%M")

cp -r ~/.config/alacritty ~/.config/i3 ~/.config/dunst ~/.config/fcitx5 ~/.config/fish ~/.config/kitty ~/.config/mpd ~/.config/ncmpcpp ~/.config/picom ~/.config/polybar ~/.config/rofi ~/.config/wallpaper ~/.config/zsh ~/.config/ranger ~/.config/neofetch ~/.config/tmux ~/.config/starship.toml ~/.config/vim ~/.config/install.sh ./
wait
git add .
wait
git commit -m ${time}
wait
git push

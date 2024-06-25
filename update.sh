#! /bin/bash

rm -r ./config/wallpaper
cp -rp ~/.config/alacritty ~/.config/i3 ~/.config/dunst ~/.config/fcitx5 ~/.config/fish ~/.config/kitty ~/.config/ncmpcpp ~/.config/picom ~/.config/polybar ~/.config/rofi ~/.config/wallpaper ~/.config/zsh ~/.config/ranger ~/.config/neofetch ~/.config/starship.toml ~/.config/vim ~/.config/yazi ~/.config/fontconfig ~/.config/gtk-* ~/.config/qt6ct ~/.config/Kvantum ./config
cp ~/.config/tmux/tmux.conf ./config/tmux
cp ~/.config/mpd/mpd.conf ./config/mpd
cp  ~/.xinitrc ~/.Xresources ~/.npmrc ./
cp -rp ~/.local/share/fonts ~/.local/share/icons ~/.local/share/themes ./local

echo -e "\e[31mupdate completed\e[0m"

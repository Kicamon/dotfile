#!/usr/bin/env bash

remove_file() {
	local dir=$1
	for file in "$dir"/*; do
		if [[ -f "$file" && "$file" =~ \.uuid$ ]]; then
			rm "$file"
		elif [[ -d "$file" ]]; then
			remove_file "$file"
		fi
	done
}

update_up() {
	cp -rp ~/.config/Kvantum \
		~/.config/dunst \
		~/.config/fcitx5 \
		~/.config/fish \
		~/.config/fontconfig \
		~/.config/gtk-* \
		~/.config/i3 \
		~/.config/kitty \
		~/.config/neofetch \
		~/.config/picom \
		~/.config/polybar \
		~/.config/qt6ct \
		~/.config/ranger \
		~/.config/rofi \
		~/.config/tmux \
		~/.config/vim \
		~/.config/yazi \
		~/.config/zsh \
		./config
	cp -rp ~/.xinitrc \
		~/.Xresources \
		~/.xkb \
		./user
	cp -rp ~/.local/share/fcitx5 \
		~/.local/share/fonts \
		~/.local/share/themes \
		./local

	shopt -s dotglob

	rm -rf ./local/fcitx5/pinyin ./local/fonts/artfont
	remove_file ./local

	echo -e "\e[31mupdate completed\e[0m"
}

update_down() {
	cp -rf ./config/. "$HOME"/.config
	cp -rf ./local/. "$HOME"/.local/share
	cp -rf ./user/. "$HOME"/
	echo -e "\e[31mupdate completed\e[0m"
}

case "$1" in
up) update_up ;;
down) update_down ;;
*) update_up ;;
esac

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

config_path=(
	Kvantum
	dunst
	fcitx5
	fish
	fontconfig
	gtk-*
	i3
	kitty
	neofetch
	picom
	polybar
	qt6ct
	ranger
	rofi
	tmux
	vim
	yazi
	zsh
	alacritty
)

local_path=(
	fcitx5
	fonts
	themes
)

update_up() {
	for path in ${config_path[@]}; do
		rsync -a --delete "${HOME}/.config/${path}/" "./config/${path}/"
	done
	for path in ${local_path[@]}; do
		rsync -a --delete "${HOME}/.local/share/${path}/" "./local/${path}/"
	done

	cp -rp ${HOME}/.xinitrc \
		${HOME}/.Xresources \
		./user

	shopt -s dotglob

	rm -rf ./local/fcitx5/pinyin ./local/fonts/artfont
	remove_file ./local

	echo -e "\e[31mupdate completed\e[0m"
}

update_down() {
	for path in ${config_path[@]}; do
		rsync -a --delete "./config/${path}/" "${HOME}/.config/${path}/"
	done
	for path in ${local_path[@]}; do
		rsync -a --delete "./local/${path}/" "${HOME}/.local/share/${path}/"
	done
	cp -rf ./user/. "$HOME"/
	echo -e "\e[31mupdate completed\e[0m"
}

case "$1" in
down) update_down ;;
*) update_up ;;
esac

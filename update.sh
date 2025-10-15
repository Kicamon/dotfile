#!/usr/bin/env bash

config_path=(
	Kvantum
	dunst
	fcitx5
	fish
	fontconfig
	gtk-2.0
	gtk-3.0
	gtk-4.0
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
  find ./local -type f -name "*.uuid" -exec rm {} +;

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

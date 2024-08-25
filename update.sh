#!/usr/bin/env bash

update() {
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
		~/.config/starship.toml \
		~/.config/tmux \
		~/.config/vim \
		~/.config/yazi \
		~/.config/zsh \
		./config
	cp ~/.xinitrc \
		~/.Xresources \
		./user
	cp -rp ~/.local/share/fcitx5 \
		~/.local/share/fonts \
		~/.local/share/themes \
		./local
}

shopt -s dotglob

remove_file() {
	local dir=$1
	for file in ${dir}/*; do
		if [[ -f ${file} && ${file} == "./local/fonts/"*".uuid" ]]; then
			rm ${file}
		elif [[ -d ${file} ]]; then
			remove_file ${file}
		fi
	done
}

remove_dir() {
	rm -rf ./local/fcitx5/pinyin ./local/icons/hicolor ./config/tmux/plugins
}

update
remove_file ./local
remove_dir

echo -e "\e[31mupdate completed\e[0m"

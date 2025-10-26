#!/usr/bin/env bash

config_path=($(ls -A ./config/))
local_path=($(ls -A ./local/))
user_path=($(ls -A ./user/))

update() {
	local from=$1
	local to=$2
	if [[ -d $from ]]; then
		rsync -a --delete "${from}/" "${to}/"
	else
		cp $from $to
	fi
}

update_up() {
	for path in ${config_path[@]}; do
		update "${HOME}/.config/${path}" "./config/${path}" &
	done
	for path in ${local_path[@]}; do
		update "${HOME}/.local/share/${path}" "./local/${path}" &
	done
	for path in ${user_path[@]}; do
		update "${HOME}/${path}" "./user/${path}" &
	done

	wait

	shopt -s dotglob

	rm -rf ./local/fcitx5/pinyin ./local/fonts/artfont
	find ./local -type f -name "*.uuid" -exec rm {} +

	echo -e "\e[31mupdate completed\e[0m"
}

update_down() {
	for path in ${config_path[@]}; do
		update "./config/${path}" "${HOME}/.config/${path}" &
	done
	for path in ${local_path[@]}; do
		update "./local/${path}" "${HOME}/.local/share/${path}" &
	done
	for path in ${local_path[@]}; do
		update "./user/${path}" "${HOME}/${path}" &
	done

	wait

	echo -e "\e[31mupdate completed\e[0m"
}

case "$1" in
down) update_down ;;
*) update_up ;;
esac

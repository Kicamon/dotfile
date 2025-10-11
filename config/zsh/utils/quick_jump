#!/bin/bash

HOME_DIR="$HOME"
FILE_PATH="$HOME_DIR/.local/state/zsh_jump_list"

declare -A jump

read_jump_list() {
	if [[ ! -f "$FILE_PATH" ]]; then
		touch "$FILE_PATH"
		return
	fi

	while IFS=' ' read -r keyword dir; do
		if [[ -n "$keyword" && -n "$dir" ]]; then
			jump["$keyword"]="$dir"
		fi
	done <"$FILE_PATH"
}

add_jump_list() {
	local keyword="$1"
	local dir="$2"

	echo "$keyword $dir" >>"$FILE_PATH"
}

read_jump_list

opt="$1"

case "$opt" in
"")
	echo "~"
	;;
"-l")
	for keyword in "${!jump[@]}"; do
		echo "$keyword"
	done
	;;
"-a")
	keyword="$2"
	dir="$3"
	dir="${dir/#$HOME_DIR/~}"
	add_jump_list "$keyword" "$dir"
	;;
*)
	if [[ -n "${jump[$opt]}" ]]; then
		echo "${jump[$opt]}"
	else
		echo "$opt"
	fi
	;;
esac

FILE_PATH="${HOME}/.local/state/zsh_jump_list"

typeset -A jump

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
	jump["$keyword"]="$dir"
	echo "$keyword $dir" >>"$FILE_PATH"
}

change_dir() {
	if [[ ! -n "$1" ]]; then
		echo "~"
	elif [[ -n "${jump[\"$1\"]}" ]]; then
		echo "${jump[\"$1\"]}"
	else
		echo "$1"
	fi
}

list_jump() {
  for keyword in ${(k)jump[@]}; do
    echo ${(Q)keyword}
	done
}

read_jump_list

gd() {
	local opt="$1"

	if [[ "$opt" == "-a" ]]; then
		add_jump_list $2 $(pwd)
	elif [[ "$opt" == "-l" ]]; then
		list_jump
	elif [[ "$opt" == "-e" ]]; then
		$EDITOR "$FILE_PATH"
	else
		local dir=$opt
		if [[ ! -d "$dir" ]]; then
			dir=$(change_dir $dir)
		fi
		dir=$(eval echo "$dir")
		cd "$dir"
	fi
}

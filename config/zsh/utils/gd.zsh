qj_path=${HOME}'/.config/zsh/utils/quick_jump.lua'

gd() {
	local opt="$1"

	if [[ "$opt" == "-a" ]]; then
		lua ${qj_path} -a $2 $(pwd)
	elif [[ "$opt" == "-l" ]]; then
		lua ${qj_path} -l
	elif [[ "$opt" == "-e" ]]; then
		$EDITOR "/home/KicamonIce/.local/state/zsh_jump_list"
	else
		local dir=$opt
		if [[ ! -d "$dir" ]]; then
			dir=$(lua ${qj_path} $dir)
		fi
		dir=$(eval echo "$dir")
		cd "$dir"
	fi
}

_gd_dir_list() {
	local gd_cmp=($(lua ${qj_path} -l))
	compadd "$@" -- $gd_cmp
	_cd "$@" || compadd "$@" -- $gd_cmp
}

compdef _gd_dir_list gd

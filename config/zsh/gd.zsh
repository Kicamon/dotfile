gd() {
	local opt="$1"

	if [[ "$opt" == "-a" ]]; then
		lua "$HOME/.config/zsh/quick_jump.lua" -a $2 $(pwd)
	elif [[ "$opt" == "-l" ]]; then
		lua "$HOME/.config/zsh/quick_jump.lua" -l
	elif [[ "$opt" == "-e" ]]; then
		$EDITOR "/home/KicamonIce/.local/state/zsh_jump_list"
	else
		local dir=$opt
		if [[ ! -d "$dir" ]]; then
			dir=$(lua $HOME/.config/zsh/quick_jump.lua $dir)
		fi
		dir=$(eval echo "$dir")
		cd "$dir"
	fi
}

_gd_dir_list() {
	local gd_cmp=($(lua $HOME/.config/zsh/quick_jump.lua -l))
	compadd "$@" -- $gd_cmp
	_cd "$@" || compadd "$@" -- $gd_cmp
}

compdef _gd_dir_list gd

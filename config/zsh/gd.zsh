function gd() {
  local opt="$1"

  if [[ "$opt" == "-add" ]]; then
    local mapdir=$(pwd)
    lua "$HOME/.config/zsh/quick_jump.lua" -add "$2" "$mapdir"
  elif [[ "$opt" == "-list" ]]; then
    lua "$HOME/.config/zsh/quick_jump.lua" -list
  elif [[ "$opt" == "-edit" ]]; then
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

function _gd_dir_list(){
  local gd_cmp=($(lua $HOME/.config/zsh/quick_jump.lua -list))
  compadd "$@" -- $gd_cmp;_cd "$@" || compadd "$@" -- $gd_cmp
}

compdef _gd_dir_list gd

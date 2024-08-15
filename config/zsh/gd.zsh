function gd(){
  dir=$1
  if ! [ -d "$dir" ];then
    dir=$(lua $HOME/.config/zsh/quick_jump.lua $dir)
  fi
  dir=$(eval echo "$dir")
  cd $dir
}

function _gd_dir_list(){
  local gd_cmp=($(lua $HOME/.config/zsh/quick_jump.lua -list))
  compadd "$@" -- $gd_cmp;_cd "$@" || compadd "$@" -- $gd_cmp
}

compdef _gd_dir_list gd

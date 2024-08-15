function _gd_dir_list(){
  local dir
  dir=($(lua $HOME/.config/zsh/quick_jump.lua -list))
  compadd "$@" -- $dir
}

function _gd_complete() {
  _gd_dir_list
  _cd
}

function gd(){
  dir=$1
  if ! [ -d "$dir" ];then
    dir=$(lua $HOME/.config/zsh/quick_jump.lua $dir)
  fi
  dir=$(eval echo "$dir")
  cd $dir
}

compdef _gd_complete gd

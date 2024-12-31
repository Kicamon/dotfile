autoload -U colors && colors
black="%{$fg_bold[black]%}"
red="%{$fg_bold[red]%}"
green="%{$fg_bold[green]%}"
yellow="%{$fg_bold[yellow]%}"
blue="%{$fg_bold[blue]%}"
magenta="%{$fg_bold[magenta]%}"
cyan="%{$fg_bold[cyan]%}"
white="%{$fg_bold[white]%}"
reset_color="%{$reset_color%}"

git_info() {
  branch=""
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -z $branch ]]; then
    return
  fi

  git_status_output=$(git status --short)
  delete=""
  modify=""
  add=""
  while read -r line; do
    if [[ $line =~ ^D ]]; then
      delete="✘"
    fi
    if [[ $line =~ ^M ]]; then
      modify="!"
    fi
    if [[ $line =~ ^\\? ]]; then
      add="?"
    fi
  done <<< "$git_status_output"


  if [[ -z $delete && -z $modify && -z $add ]]; then
    echo "${magenta} ${branch} "
  else
    echo "${magenta} ${branch} [${delete}${modify}${add}]"
  fi
}


get_prefix_icon() {
  if [[ $? -eq 0 ]]; then
    echo "${green}λ "
  else
    echo "${red}✗ "
  fi
}

print_theme() {
  prefix_icon=$(get_prefix_icon)
  PROMPT="
${white}%n ${cyan}%~ $(git_info)
${prefix_icon}"
}

precmd() {
  print_theme
}

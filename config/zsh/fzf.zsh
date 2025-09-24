export FZF_DEFAULT_OPTS="--preview 'bash ~/.config/zsh/file_preview.sh {}'"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist,vendor} --type f"

zstyle ':fzf-tab:complete:cd:*' query-string input
zstyle ':fzf-tab:complete:gd:*' fzf-preview 'bash ~/.config/zsh/file_preview.sh ${realpath} ${word}'
zstyle ':fzf-tab:*' group-colors $'\033[15m' $'\033[14m' $'\033[33m' $'\033[35m' $'\033[15m' $'\033[14m' $'\033[33m' $'\033[35m'
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[ "$group" = "process ID" ] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:killall:*' fzf-preview 'bash ~/.config/zsh/file_preview.sh ${word} -kill'
zstyle ':fzf-tab:complete:*:options' fzf-flags --preview-window=down:0:wrap
zstyle ':fzf-tab:complete:(docker|cargo):*' fzf-flags --preview-window=down:0:wrap
zstyle ':fzf-tab:complete:systemctl:*' fzf-flags --preview-window=down:0:wrap
zstyle ':fzf-tab:complete:systemctl-(status|(re|)start|(dis|en)able):*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:yay:*' fzf-preview 'yay -Qi $word | bat --color=always -plyaml || yay -Si $word | bat --color=always-plyaml'
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Qi $word | bat --color=always -plyaml  || pacman -Si $word | bat --color=always -plyaml '
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff --color=always $word'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview 'git show --color=always $word'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview '[ -f "$realpath" ] && git diff --color=always $word || git log --color=always $word'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bash ~/.config/zsh/file_preview.sh ${(Q)realpath}'
zstyle ':fzf-tab:complete:*:*' fzf-flags --height=12
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'

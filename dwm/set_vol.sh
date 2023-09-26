#! /bin/bash

dwmdir=~/.config/dwm

case $1 in
    up) amixer set Master 5%+ ;;
    down) amixer set Master 5%- ;;
esac

bash $dwmdir/statusbar/statusbar.sh update vol
bash $dwmdir/statusbar/packages/vol.sh notify

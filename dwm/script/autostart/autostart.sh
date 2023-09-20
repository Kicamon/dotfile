# /bin/bash

monirot1=HDMI-0
monirot2=DP-4
# set $monirot1 DP-4
# set $monirot2 DP-4
# exec_always exec xrandr --output HDMI-0 --primary --auto --above DP-4
xrandr --output ${monirot1} --primary --auto --above ${monirot2} &
#exec_always exec xrandr --output HDMI-0 --auto --above DP-4 --primary
# 投影
#xrandr --output "输出口" --auto --same-al DP-4 --auto
picom &
# ~/.config/polybar/launch.sh
~/.config/wallpaper/wallpaper.sh 0 &
sleep 1; nutstore
sleep 1; fcitx5
sleep 1.5; xmodmap ~/.xmodmap
sleep 2; dunst &
# sleep 2; mpd

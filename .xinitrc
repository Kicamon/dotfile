export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
xrdb -merge ~/.Xresources
exec dwm
exec xmodmap ~/.xmodmap

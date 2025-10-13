export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export QT_QPA_PLATFORMTHEME=qt6ct
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export GLFW_IM_MODULE=ibus
export DWM=/home/KicamonIce/.config/dwm
Xcursor.theme:Breeze_Light
xrdb -merge ~/.Xresources
exec dwm
xset s 900

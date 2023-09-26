#! /bin/bash
# DWM自启动脚本 仅作参考 
# 搭配 https://github.com/yaocccc/scripts 仓库使用 目录位置 ~/scripts
# 部分配置文件在 ~/scripts/config 目录下

_thisdir=$(cd $(dirname $0);pwd)

settings() {
    [ $1 ] && sleep $1
    xset -b                                   # 关闭蜂鸣器
    syndaemon -i 1 -t -K -R -d                # 设置使用键盘时触控板短暂失效
    # ~/scripts/set_screen.sh two               # 设置显示器
    xrandr --output HDMI-0 --primary --auto --above DP-4
    ~/.config/wallpaper/wallpaper.sh 0
}

daemons() {
    [ $1 ] && sleep $1
    $_thisdir/statusbar/statusbar.sh cron &   # 开启状态栏定时更新
    fcitx5 &                                  # 开启输入法
    dunst & # 开启通知server
    picom --experimental-backends &
}

settings &                                  # 初始化设置项
daemons 1 &                                   # 后台程序项

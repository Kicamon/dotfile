#! /bin/bash

# font
echo "install fonts?[y/N]"
opt=N
read opt
if [ $opt == "y"]; then
  yay -S adobe-source-code-pro-font adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-han-sans-otc-fonts nono-fonts-emoji noto-color-emoji-fontconfig noto-fonts noto-fonts-sc opendesktop-fonts otf-droid-nerd otf-codenewroman-nerd ttf-arphic-ukai ttf-arphic-uming ttf-carlito ttf-dejavu ttf-droid ttf-firacode-nerd ttf-foundertype-sc-fonts ttf-hack ttf-hannom ttf-inconsolata ttf-iosevka-nerd ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-joypixels ttf-liberation ttf-linux-libertine ttf-maple ttf-maple-nerd ttf-maple-sc-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-opensans ttf-sourcecodepro-nerd ttf-twemoji-color ttf-victor-mono ttf-wps-fonts wqy-bitmapfont wqy-microhei wqy-zenhei
fi

# code
opt=N
echo "install coding tools?[y/N]"
read opt
if [ $opt == "y"]; then
  sudo pacman -S clang gdb nodejs npm yarn lua python python-black neovim python-pynvim bash-language-server pyright fd lua-language-server ripgrep typescript-language-server vscode-css-languageserver vscode-html-languageserver vscode-json-languageserver vim-language-server
fi
opt=N
echo "install live server?[y/N]"
read opt
if [ $opt == "y"]; then
  npm install -g live-server
fi

# init config
opt=N
echo "init config?[y/N]"
read opt
if [ $opt == "y"]; then
  cp -rp ./config/* ~/.config
  cp -rp ./local/* ~/.local/share
  cp ./.xinitrc ./.Xresources ./.npmrc ~/
fi

# install zim
opt=N
echo "install zim?[y/N]"
read opt
if [ $opt == "y"]; then
  wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi

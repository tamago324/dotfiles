#!/bin/bash

cd $HOME/dotfiles
git pull

paru -Syu;
paccache -r;
paccache -ruk0;

# pacman でインストールしたものをファイルに出力する
pacman -Qmq > $HOME/dotfiles/_pkgnames/yay.list

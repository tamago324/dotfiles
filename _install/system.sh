#!/bin/bash

main() {
  # yay を入れる
  install_yay

  cd ~/dotfiles
  yay -Syu

  # キャッシュの削除
  paccache -r
  paccache -ruk0

  # インストール
  cat ~/dotfiles/pkgname/yay.list | yay -S -
}

install_yay() {
  git clone https://aur.archlinux.org/yay-bin.git yay-bin /tmp/yay
  cd /tmp/yay
  makepkg -si
}



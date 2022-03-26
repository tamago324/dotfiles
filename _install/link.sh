#!/bin/bash

# リンクを生成する

ln -sfnv $(DOTPATH)/.config/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml
ln -sfnv $(DOTPATH)/.vim $(HOME)/.vim
ln -sfnv $(DOTPATH)/.gitconfig $(HOME)/.gitconfig
ln -sfnv $(DOTPATH)/bin $(HOME)/.local/bin

# fcitx5 の設定ファイル
ln -sfnv $(DOTPATH)/.pam_environment $(HOME)/.pam_environment
ln -sfnv $(DOTPATH)/fcitx5/addon/hotkey-extension.conf $(HOME)/.local/share/fcitx5/addon/hotkey-extension.conf
ln -sfnv $(DOTPATH)/fcitx5/lua/hotkey-extension/main.lua $(HOME)/.local/share/fcitx5/lua/hotkey-extension/main.lua

# xfce
ln -sfnv $(DOTPATH)/.xinitrc $(HOME)/.xinitrc
ln -sfnv $(DOTPATH)/.xprofile $(HOME)/.xprofile

# zsh
ln -sfnv $(DOTPATH)/.zshrc $(HOME)/.zshrc
ln -sfnv $(DOTPATH)/.zshenv $(HOME)/.zshenv

#!/bin/bash

# シェルがzshではない場合、変更する
#   正規表現のマッチ: https://qiita.com/Linda_pp/items/31fa611766598715a172
if ! expr ${SHELL} : "zsh$" > /dev/null; then
    # ログインシェルに追加する
    #   https://unix.stackexchange.com/questions/111365/how-to-change-default-shell-to-zsh-chsh-says-invalid-shell
    zshpath=/usr/bin/zsh
    sudo cat /etc/shells | grep ${zshpath} > /dev/null
    if [ $? ]; then
        echo ${zshpath} | sudo tee -a /etc/shells
    fi
    sudo chsh -s ${zshpath} $USER
fi

#!/bin/bash

# vimfiles をダウンロードする

VIMFILES_PATH=${GHQ_ROOT}/github.com/tamago324/vimfiles

# dotfiles がなければダウンロードする
if [ ! -d ${VIMFILES_PATH} ]; then
    git clone https://github.com/tamago324/vimfiles ${VIMFILES_PATH}
    ln -s ${VIMFILES_PATH} $HOME/.config/nvim
fi



#!/bin/bash

# dotfiles をダウンロードする

DOT_FILES_PATH=$HOME/ghq/github.com/tamago324/dotfiles

# dotfiles がなければダウンロードする
if [ ! -d ${DOT_FILES_PATH} ]; then
    git clone https://github.com/tamago324/dotfiles ${DOT_FILES_PATH}
    ln -s ${DOT_FILES_PATH} $HOME/dotfiles
fi



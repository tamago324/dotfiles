#!/bin/bash

DOT_FILES_PATH=$HOME/ghq/github.com/tamago324/dotfiles

git clone https://github.com/tamago324/dotfiles ${DOT_FILES_PATH}
ln -s ${DOT_FILES_PATH} $HOME/dotfiles

#!/bin/bash

# ln -s /home/tamago324/.ghq/github.com/tamago324/dotfiles/bin/apps/install_neovim.sh ~/bin/install_neovim.sh

function neovim_nightly() {
  # nightly
  cd /tmp
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv nvim.appimage /usr/local/bin
  sudo ln -snf /usr/local/bin/nvim.appimage /usr/local/bin/nvim
}

neovim_nightly

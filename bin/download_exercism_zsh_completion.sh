#!/bin/bash

function download() {
  cd /tmp
  curl -LO https://raw.githubusercontent.com/exercism/cli/main/shell/exercism_completion.zsh
  sudo mv exercism_completion.zsh $HOME/.config/zsh/comp/_exercism
}
download

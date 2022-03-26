#!/bin/bash

capture_maim() {
  # 範囲指定してキャプチャをして、クリップボードに貼り付ける
  # https://github.com/naelstrof/maim/issues/241
  path="$HOME/Pictures/$(date +%s).png"
  maim -s "$path"
  xclip -selection clipboard -t image/png "$path"
}

capture_maim

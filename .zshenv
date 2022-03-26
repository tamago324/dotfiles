# completions
if [ -d $HOME/.config/zsh/comp ]; then
    export FPATH="$HOME/.config/zsh/comp:$FPATH"
fi

# go get で入れたものを使えるようにする
export PATH="$PATH:$HOME/go/bin"

# bin を入れる
export PATH="$PATH:$HOME/.local/bin"

# ghq の設定
export GHQ_ROOT="$HOME/ghq"

# compopser
if [ -d "$HOME/.config/composer/vendor" ]; then
    export PATH="$PATH:$HOME/.config/composer/vendor/bin"
fi

if [ -d "$HOME/.luarocks/bin" ]; then
    export PATH="$PATH:$HOME/.luarocks/bin"
fi

# yarn
if [ -d "$HOME/.yarn/bin" ]; then
    export PATH="$PATH:$HOME/.yarn/bin"
fi

# 文字コード
export LANG=ja_JP.UTF-8

# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad

# https://gihyo.jp/dev/serial/01/zsh-book/0001
# / で単語移動できるようにする (/を抜いた)
# default: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# 履歴
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

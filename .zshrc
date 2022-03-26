# # 補完を有効にする

# :completion:function:completer:command:argument:tag
# completion  リテラル文字列
# function
# TODO: 理解する
zstyle ':completion:*' group-name ""
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
# Use cache completion
# apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perl -M,
# bogofilter (zsh 4.2.1 >=), fink, mac_apps...
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list \
    "" \
    'm:{a-z}={A-Z}' \
    'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
# sudo completions
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
    _approximate _list _history

zmodload zsh/mathfunc

# deoplete-zsh とかのために設定しておく
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
zmodload -aF zsh/stat b:zstat

autoload -Uz compinit
compinit

# 色を使えるようにする
autoload -Uz colors
colors




umask 022

# cd で検索する対象にいれる
cdpath=($HOME)

# TODO:理解する
zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"

# :Man zshoptions(1)

# -----------
# history
# -----------
# 直前に実行したコマンドと重複した場合、履歴に追加しない
setopt HIST_IGNORE_DUPS

# すでに履歴にあったら、前の履歴を削除する
setopt HIST_IGNORE_ALL_DUPS
# コマンドに付いている余計な空白は削除する
setopt HIST_REDUCE_BLANKS

# 先頭が空白の実行は履歴に保存しない
setopt HIST_IGNORE_SPACE

# 履歴の実行時刻を保存する (何の意味があるんだろう...)
setopt EXTENDED_HISTORY

# ! で始まる場合、
setopt HIST_EXPAND

# 関数定義は履歴に追加しない
setopt HIST_NO_FUNCTIONS

# history は保存しない
setopt HIST_NO_STORE

# 複数の端末で履歴を共有する
setopt SHARE_HISTORY

# 履歴をすぐに追加
setopt INC_APPEND_HISTORY
# -----------

# # ジョブの頭文字だけでジョブの再実行を行なう
# setopt AUTO_RESUME

# # job は長い形式で表示する
# setopt LONG_LIST_JOBS

# <C-d> でログアウトできないようにする
setopt IGNOREEOF

# -----------
# Changing Directories
# -----------
# コマンド名ではない文字でディレクトリと同じだった場合、cd する
setopt AUTO_CD
# ディレクトリスタックに自動でプッシュする
setopt AUTO_PUSHD

# TODO: 理解する
# setopt PUSHD_MINUS

# 同じディレクトリは push しない
setopt PUSHD_IGNORE_DUPS

# TODO: 理解する
# pushd popd した後にディレクトリスタックを表示しない
setopt PUSHD_SILENT
# -----------

# # スペルチェックをする
# setopt CORRECT

# TODO: 理解する
# setopt MAGIC_EQUAL_SUBST


# -----------
# completions
# -----------
# ディレクトリを補完したら末尾に / を付ける
setopt MARK_DIRS

# # vimshell のためこれを設定するらしい？ (deoplete-zsh にも必要？)
# setopt NO_MENU_COMPLETE

# # TODO: 理解する
# setopt LIST_ROWS_FIRST

# # TODO: 理解する
# # * を展開したときの状態で補完候補を表示する？
# setopt GLOB_COMPLETE

# # TODO: 理解する
# setopt ALWAYS_LAST_PROMPT

# あいまい補完のとき、リストを表示する
setopt AUTO_LIST

# # TODO: 理解する
# setopt AUTO_PARAM_SLASH

# # TODO: 理解する
# setopt AUTO_PARAM_KEYS

# # TODO: 理解する
# setopt LIST_TYPES

# コンパクトに補完候補を表示する
setopt LIST_PACKED

# # TODO: 理解する
# # エイリアスが展開されるのを防ぐ？
# setopt COMPLETE_ALIASES
# -----------


# # コマンドに / が含まれていた場合、 /usr/local/bin を探しにいく
# setopt PATH_DIRS

# # マルチバイト文字用
# setopt PRINT_EIGHTBIT

# 終了ステータスが 0 以外の場合、そのステータスを表示する
setopt PRINT_EXIT_VALUE

# # TODO: 理解する
# setopt TRANSIENT_RPROMPT

# TODO: 理解する
# unsetopt PROMPTCR

# 最初に実行された場所を記憶して、コマンドの検索を行ないようにする (高速化？)
setopt HASH_CMDS

# # TODO: 理解する
# setopt NUMERIC_GLOB_SORT

# インタラクティブシェルでもコメントを書けるようにする
setopt INTERACTIVE_COMMENTS

# rm * が実行されたら、10 秒間待機する (反射的に Enter を押すのを防ぐ)
setopt RM_STAR_WAIT

# # TODO: 理解する
# setopt EXTENDED_GLOB

# # TODO: 理解する
# # プロンプトで置換する？
# setopt PROMPT_SUBST

# # WSL のときのみ、docker を起動する
# if [ -d /run/WSL ]; then
#     service docker status > /dev/null 2>&1
#     if [ $? != 1 ]; then
#         sudo service docker start > /dev/null 2>&1
#     fi
# fi

# pure を実行
autoload -U promptinit; promptinit
prompt pure

# anyenv
if [[ -n `which anyenv` ]]; then
    eval "$(anyenv init -)"
fi

# alias nvim=/usr/local/bin/nvim
alias v=/usr/local/bin/nvim
alias cat=bat

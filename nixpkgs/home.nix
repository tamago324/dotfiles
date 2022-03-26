{ config, pkgs, ... }:

let
  zshsettings = import ./zsh.nix;

  wsl_pkgs = with pkgs; [
    wslu
  ];

  # TODO: jidoude hanndannsuru
  laptop_pkgs = with pkgs; [
    #intel-graphics-compiler # for alacritty
    # alacritty
    # google-chrome
    alttab
    peek
    vokoscreen-ng
  ];
in

{
  home.username = "tamago324";
  home.homeDirectory = "/home/tamago324";

  # home-manager のバージョンを固定する
  /* home.stateVersion = "21.11"; */
  home.stateVersion = "22.05";

  programs = {
    home-manager.enable = true;
  };
  programs.zsh = zshsettings pkgs;

  /* # https://nixos.wiki/wiki/Visual_Studio_Code */
  /* programs.vscode = {                          */
  /*   enable = true;                             */
  /*   package = pkgs.vscodium;                   */
  /* };                                           */

  home.packages = with pkgs; [
    /* zsh */
    /* zsh-z */

    git

    gh
    ghq
    universal-ctags
    nodejs-16_x
    nodePackages.prettier
    nodePackages.typescript
    # SQL フォーマットツール (nvim の formatter.nvim で使う)
    nodePackages.sql-formatter
    # nodePackages.typescript-language-server
    yarn
    deno
    fzf
    exa
    neofetch

    heroku
    postgresql

    python3
    python39Packages.pip # こうしないと pip が入らない
    # solaar に必要
    python39Packages.pyudev
    python39Packages.psutil
    python39Packages.xlib
    python39Packages.pyaml

    neovim-remote

    lua51Packages.luacheck
    lua51Packages.luarocks
    /* lua51Packages.luafilesystem */

    # nightly をダウンロードするため、ここではインストールしない
    /* neovim */
    stylua
    fd
    ripgrep
    bat
    jq

    nixpkgs-fmt
    rnix-lsp

    # tree-sitter のため
    gcc

    curl
    wget
    tree
    unzip

    ffmpeg
    tealdeer

    # libffi
    # zlib

    # WSLの場合、うまく行かなかったため、apt でインストールすることにした
    # docker
    # docker-compose
    jdk8

    php
    php80Packages.composer
    php80Packages.php-cs-fixer

    mysql80
    # クライアント
    mycli

    # # Logicool トラックボールの設定アプリ
    solaar

    # cheat.sh
    cht-sh
    pure-prompt

    exercism
    cargo

    virtualbox
    vagrant

    # うまく使えなかったから、yay でいれる
    # plantuml

    # nyancat
    # w3m

    vim

    /* epson-escpr */

    # ];
  ] ++ laptop_pkgs;

  home.file = {
    #   ".gitconfig".source = ./.gitconfig;
    #   ".config/nvim".source = ./.config/nvim;
    ".config/alacritty/alacritty.yml".source = ../.config/alacritty.yml;
    ".vim".source = ./../.vim;
    ".gitconfig".source = ./../.gitconfig;
    ".local/bin".source = ../bin;

    # fcitx5 用の設定ファイル
    ".pam_environment".source = ./../.pam_environment;
    ".local/share/fcitx5/addon/hotkey-extension.conf".source = ./../fcitx5/addon/hotkey-extension.conf;
    ".local/share/fcitx5/lua/hotkey-extension/main.lua".source = ./../fcitx5/lua/hotkey-extension/main.lua;

    # xfce 用
    ".xinitrc".source = ./../.xinitrc;
    ".xprofile".source = ./../.xprofile;
  };
}

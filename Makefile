DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: help

link: ## ファイルのリンクを生成する
	$(DOTPATH)/_install/link.sh

install: ## いろいろをインストールする
	# $(DOTPATH)/_install/fetch_dotfiles.sh
	$(DOTPATH)/_install/fetch_vimfiles.sh
	$(DOTPATH)/_install/system.sh
	$(DOTPATH)/_install/change_shell.sh
	$(DOTPATH)/_install/link.sh

update:	## ツールの更新、更新結果を pkgnames/ に出力
	$(DOTPATH)/_update/system.sh

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

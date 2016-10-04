default: dotfiles localfiles vim neovim antigen tpm packages anyenv python
	@echo 'done'

# dotfiles
################################

dotfile_names := .gitconfig .gitignore .gvimrc .tmux.conf .vim .vimrc .zsh .zshrc .zprofile .ctags .slate .perltidyrc .proverc .snippet .rubocop.yml
dotfile_paths := $(addprefix $(HOME)/, $(dotfile_names))

dotfiles: $(dotfile_names) $(dotfile_paths)

$(dotfile_paths):
	$(eval source := $(addprefix $(HOME)/dotfiles/, $(shell basename $@)))
	$(eval dest   := $@)
	ln -s $(source) $(dest)

# リンクを張る前に一応存在をチェックしておきたい
$(dotfile_names):
	@echo 'missing required file:' $@
	exit 1


# localfiles
################################

localfile_names := .zshrc.local .zprofile.local .gitconfig.local
localfile_paths := $(addprefix $(HOME)/, $(localfile_names))

localfiles: $(localfile_paths)

$(localfile_paths):
	$(eval source := $(HOME)/dotfiles/$(shell basename $@).sample)
	$(eval dest   := $@)
	cp $(source) $(dest)


# Vim
################################

vim: $(HOME)/.vim_backup $(HOME)/dotfiles/.vim/bundle/neobundle.vim

$(HOME)/.vim_backup:
	mkdir $(HOME)/.vim_backup

$(HOME)/dotfiles/.vim/bundle/neobundle.vim:
	mkdir $(HOME)/dotfiles/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim $(HOME)/dotfiles/.vim/bundle/neobundle.vim


# NeoVim
################################

neovim: $(HOME)/.config/nvim $(HOME)/.config/nvim/_local.vim $(HOME)/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

$(HOME)/.config/nvim:
	mkdir -p $(HOME)/.config
	ln -s $(HOME)/dotfiles/.config/nvim $(HOME)/.config/nvim

$(HOME)/.config/nvim/bundle/repos/github.com/Shougo/dein.vim:
	mkdir $(HOME)/.config/nvim/bundle
	git clone https://github.com/Shougo/dein.vim $(HOME)/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

$(HOME)/.config/nvim/_local.vim:
	cp $(HOME)/.config/nvim/_local.vim.sample $(HOME)/.config/nvim/_local.vim


# packages
################################

is_mac    := ${shell uname    | grep Darwin}
is_ubuntu := ${shell uname -a | grep Ubuntu}

ifdef is_mac
packages: /usr/local/bin/brew
	brew update
	brew upgrade
	brew install cmake automake tmux zsh git tig ctags curl wget the_silver_searcher tree jq haskell-stack heroku awscli llvm lua luajit go sqlite msgpack
	brew install vim --with-lua --with-luajit
	brew install macvim --with-lua --with-luajit
	brew install neovim/neovim/neovim --HEAD
	brew install rogual/neovim-dot-app/neovim-dot-app --HEAD
	brew linkapps macvim neovim-dot-app

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif

# TODO: 現状はubuntu 16.04前提...
ifdef is_ubuntu
packages: /etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-xenial.list
	sudo apt update
	sudo apt upgrade
	sudo apt install -y language-pack-ja-base make cmake automake tmux zsh git tig neovim vim-gnome exuberant-ctags curl wget dstat silversearcher-ag tree unzip jq build-essential haskell-stack llvm luajit pkg-config libbz2-dev liblua5.2-dev liblzma-dev libncurses5-dev libpcre3-dev libreadline-dev libsqlite3-dev libssl-dev zlib1g-dev

/usr/bin/add-apt-repository:
	sudo apt install software-properties-common

# ここにファイルができるはず
/etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-xenial.list: /usr/bin/add-apt-repository
	sudo add-apt-repository ppa:neovim-ppa/unstable
endif


# anyenv
################################

envs := pyenv plenv rbenv ndenv
env_paths := $(addprefix $(HOME)/.anyenv/envs/, $(envs))

python_version := 3.5.2
perl_version   := 5.24.0
ruby_version   := 2.3.1
node_version   := v4.6.0

env_versions     := $(python_version) $(perl_version) $(ruby_version) $(node_version)
env_version_dirs := $(join $(addsuffix /versions/, $(env_paths)),$(env_versions))

anyenv: $(HOME)/.anyenv $(HOME)/.anyenv/plugins/anyenv-update $(env_paths) $(env_version_dirs)

$(HOME)/.anyenv:
	git clone https://github.com/riywo/anyenv $(HOME)/.anyenv

$(HOME)/.anyenv/plugins:
	mkdir -p $(HOME)/.anyenv/plugins

$(HOME)/.anyenv/plugins/anyenv-update: $(HOME)/.anyenv/plugins
	git clone https://github.com/znz/anyenv-update.git $(HOME)/.anyenv/plugins/anyenv-update

$(env_paths):
	$(eval env := $(shell basename $@))
	anyenv install $(env)

$(env_version_dirs):
	$(eval env     := $(shell echo $@ | perl -pe 's!^.*/envs/(\w+)/versions/.*$$!$$1!g'))
	$(eval version := $(shell basename $@))
	$(env) install $(version)
	$(env) global $(version)


# antigen (zsh plugin manager)
################################

antigen: $(HOME)/.antigen

$(HOME)/.antigen:
	git clone https://github.com/zsh-users/antigen.git $(HOME)/.antigen


# tpm (tmux plugin manager)
################################

tpm: $(HOME)/.tmux/plugins/tpm

$(HOME)/.tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm


# python
################################

python:
	pip install --upgrade pip
	pip install neovim


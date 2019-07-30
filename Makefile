default: dotfiles localfiles vim neovim tpm packages rust fish karabiner alacritty
	@echo 'done'

# dotfiles
################################

dotfile_names := .gitconfig .gitignore .gvimrc .tmux.conf .vim .vimrc .ctags .slate .perltidyrc .proverc .snippet .rubocop.yml .pryrc .csscomb.cson .gitcommittemplate .ideavimrc .prettierrc.yaml .hammerspoon
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

localfile_names := gitconfig fish.fish nvim.vim
localfile_paths := $(addprefix $(HOME)/dotfiles/local/, $(localfile_names))

localfiles: $(localfile_paths)

$(localfile_paths):
	$(eval source := $@.sample)
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

neovim: $(HOME)/.config/nvim $(HOME)/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

$(HOME)/.config/nvim: $(HOME)/.config
	ln -s $(HOME)/dotfiles/.config/nvim $(HOME)/.config/nvim

$(HOME)/.config/nvim/bundle/repos/github.com/Shougo/dein.vim:
	mkdir $(HOME)/.config/nvim/bundle
	git clone https://github.com/Shougo/dein.vim $(HOME)/.config/nvim/bundle/repos/github.com/Shougo/dein.vim


# packages
################################

is_mac    := ${shell uname    | grep Darwin}
is_ubuntu := ${shell uname -a | grep Ubuntu}

ifdef is_mac
packages: /usr/local/bin/brew
	brew update
	brew upgrade
	brew install cmake automake autoconf tmux git tig ctags curl wget the_silver_searcher tree jq haskell-stack heroku awscli llvm lua luajit go sqlite msgpack reattach-to-user-namespace htop diff-so-fancy nkf nasm fish fzf peco ghq python3 neovim gibo imagemagick postgresql redis libtool hub rbenv nodenv goenv git-secrets protobuf colordiff watch kubectl sops direnv
	brew install vim --with-luajit
	brew install sanemat/font/ricty

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif

# TODO: 現状はubuntu 16.04前提...
ifdef is_ubuntu
packages: /etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-xenial.list
	sudo apt update
	sudo apt upgrade
	sudo apt install -y language-pack-ja-base make cmake automake tmux git tig htop neovim vim-gnome exuberant-ctags curl wget dstat silversearcher-ag tree unzip jq build-essential haskell-stack llvm luajit pkg-config libbz2-dev liblua5.2-dev liblzma-dev libncurses5-dev libpcre3-dev libreadline-dev libsqlite3-dev libssl-dev zlib1g-dev python3 fish fzf

/usr/bin/add-apt-repository:
	sudo apt install software-properties-common

# ここにファイルができるはず
/etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-xenial.list: /usr/bin/add-apt-repository
	sudo add-apt-repository ppa:neovim-ppa/unstable
endif


# tpm (tmux plugin manager)
################################

tpm: $(HOME)/.tmux/plugins/tpm

$(HOME)/.tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm


# rust
################################

rustup := $(HOME)/.cargo/bin/rustup

rust: $(rustup)

$(rustup):
	curl https://sh.rustup.rs -sSf | sh


# fish
################################

fish: $(HOME)/.config/fish $(HOME)/.config/fish/functions/fisher.fish

$(HOME)/.config/fish: $(HOME)/.config
	ln -s $(HOME)/dotfiles/.config/fish $(HOME)/.config/fish

$(HOME)/.config/fish/functions/fisher.fish:
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher


# karabiner
################################

karabiner: $(HOME)/.config/karabiner

$(HOME)/.config/karabiner: $(HOME)/.config
	ln -s $(HOME)/dotfiles/.config/karabiner $(HOME)/.config/karabiner


# alacritty
################################

alacritty: $(HOME)/.config/alacritty

$(HOME)/.config/alacritty: $(HOME)/.config
	ln -s $(HOME)/dotfiles/.config/alacritty $(HOME)/.config/alacritty


# general
################################

$(HOME)/.config:
	mkdir -p $(HOME)/.config


default: dotfiles localfiles vim neovim packages anyenv
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

vim_backup_dir := $(HOME)/.vim_backup
neobundle_dir  := $(HOME)/dotfiles/.vim/bundle

vim: $(vim_backup_dir) $(neobundle_dir)

$(vim_backup_dir):
	mkdir $(vim_backup_dir)

$(neobundle_dir):
	mkdir $(neobundle_dir)
	git clone git://github.com/Shougo/neobundle.vim $(neobundle_dir)/neobundle.vim


# NeoVim
################################

config_dir   := $(HOME)/.config
neovim_dir   := $(HOME)/.config/nvim
neovim_local := $(HOME)/.config/nvim/_local.vim
dein_dir     := $(HOME)/dotfiles/.config/nvim/bundle

neovim: $(config_dir) $(neovim_dir) $(neovim_local) $(dein_dir)

$(config_dir):
	mkdir $(config_dir)

$(neovim_dir):
	ln -s $(HOME)/dotfiles/.config/nvim $(neovim_dir)

$(dein_dir):
	mkdir $(dein_dir)
	git clone https://github.com/Shougo/dein.vim $(dein_dir)/repos/github.com/Shougo/dein.vim

$(neovim_local):
	cp $(neovim_local).sample $(neovim_local)

# packages
################################

is_mac    := ${shell uname    | grep Darwin}
is_ubuntu := ${shell uname -a | grep Ubuntu}

ifdef is_mac
celler_dir := /usr/local/Cellar

packages: $(celler_dir)
	brew update
	brew upgrade
	brew install cmake automake tmux zsh git tig ctags curl wget the_silver_searcher tree jq haskell-stack heroku awscli llvm lua luajit go sqlite msgpack
	brew install vim --with-lua --with-luajit
	brew install macvim --with-lua --with-luajit
	brew install neovim/neovim/neovim --HEAD
	brew install rogual/neovim-dot-app/neovim-dot-app --HEAD
	brew linkapps macvim neovim-dot-app

$(celler_dir):
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif

ifdef is_ubuntu
packages:
	# for NeoVim
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/unstable
	
	sudo apt update
	sudo apt upgrade
	sudo apt install -y language-pack-ja-base make cmake automake tmux zsh git tig neovim vim-gnome exuberant-ctags curl wget dstat silversearcher-ag tree unzip jq build-essential haskell-stack llvm luajit pkg-config libbz2-dev liblua5.2-dev liblzma-dev libncurses5-dev libpcre3-dev libreadline-dev libsqlite3-dev libssl-dev zlib1g-dev
endif


# anyenv
################################

anyenv_dir     := $(HOME)/.anyenv
anyenv_plugins := $(HOME)/.anyenv/plugins
anyenv_update  := $(HOME)/.anyenv/plugins/anyenv-update

anyenv: $(anyenv_dir) $(anyenv_update)

$(anyenv_dir):
	git clone https://github.com/riywo/anyenv $(anyenv_dir)

$(anyenv_plugins):
	mkdir -p $(anyenv_plugins)

$(anyenv_update): $(anyenv_plugins)
	git clone https://github.com/znz/anyenv-update.git $(anyenv_update)


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


# utilities
################################

clean:
	rm $(dotfile_paths)
	rm $(neovim_dir)


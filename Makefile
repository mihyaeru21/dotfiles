default: dotfiles vim neovim
	@echo 'done'

# dotfiles
################################

dot_file_names := .gitconfig .gitignore .gvimrc .tmux.conf .vim .vimrc .zsh .zshrc .zprofile .ctags .slate .perltidyrc .proverc .snippet .bin .rubocop.yml
dot_file_paths := $(addprefix $(HOME)/, $(dot_file_names))

dotfiles: $(dot_file_names) $(dot_file_paths)

$(dot_file_paths):
	$(eval source := $(addprefix $(HOME)/dotfiles/, $(shell basename $@)))
	$(eval dest   := $@)
	ln -s $(source) $(dest)

$(dot_file_names):
	@echo 'missing required file:' $@
	exit 1


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

config_dir := $(HOME)/.config
neovim_dir := $(HOME)/.config/nvim
dein_dir   := $(HOME)/dotfiles/.config/nvim/bundle

neovim: $(config_dir) $(neovim_dir) $(dein_dir)

$(config_dir):
	mkdir $(config_dir)

$(neovim_dir):
	ln -s $(HOME)/dotfiles/.config/nvim $(neovim_dir)

$(dein_dir):
	mkdir $(dein_dir)
	git clone https://github.com/Shougo/dein.vim $(dein_dir)/repos/github.com/Shougo/dein.vim


# utilities
################################

clean:
	rm $(dot_file_paths)
	rm $(neovim_dir)


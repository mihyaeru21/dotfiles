default: dotfiles neovim
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


# NeoVim
################################

config_dir := $(HOME)/.config
neovim_dir := $(HOME)/.config/nvim

neovim: $(config_dir) $(neovim_dir)

$(config_dir):
	mkdir $(config_dir)

$(neovim_dir):
	ln -s $(HOME)/dotfiles/.config/nvim $(neovim_dir)


# utilities
################################

clean:
	rm $(dot_file_paths)
	rm $(neovim_dir)


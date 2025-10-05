NOCOLOR		= \033[0m
RED			= \033[0;31m
GREEN			= \033[0;32m

BREWFILE = ~/Workspace/github.com/ktr17/dotfiles/Brewfile

create_symlink:
	@echo "${GREEN}=> [vim] ~/.vimrc, ~/.vim${NOCOLOR}"
	ln -s ~/Workspace/github.com/ktr17/dotfiles/.vimrc ~/.vimrc
	ln -s ~/Workspace/github.com/ktr17/dotfiles/.vim ~/.vim
	@echo "${GREEN}=> [config] ~/.config${NOCOLOR}"
	ln -s ~/Workspace/github.com/ktr17/dotfiles/.config ~/.config
	@echo "${GREEN}=> [config] ~/.hammerspoon${NOCOLOR}"
	ln -s ~/Workspace/github.com/ktr17/dotfiles/.hammerspoon ~/.hammerspoon

install_brew:
	brew bundle install --file $(BREWFILE)

generate_brewfile:
	brew bundle dump --file $(BREWFILE) --force

setup_brew:
	@echo "${GREEN}=> Brew command not install.${NOCOLOR}"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


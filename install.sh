#!/bin/zsh
# This is a fork of https://github.com/davidfischer/dotfiles/blob/master/install.sh

DOTFILES=~~/Projects/dotfiles
dependencies=(git tree vim)

# Notice title
# Output: => variabel
notice() { echo  "\033[1;32m=> $1\033[0m"; }

# Error title
# Output: => Error: variabel
error() { echo "\033[1;31m=> Error: $1\033[0m"; }

# List item
# Output: ✔ variabel
c_list() { echo  "  \033[1;32m✔\033[0m $1"; }

# Error list item
# Output: ✖ variabel
e_list() { echo  "  \033[1;31m✖\033[0m $1"; }

# Check for dependency
dep() {
	type -p $1 &> /dev/null
	local installed=$?
	if [ $installed -eq 0 ]; then
		c_list $1
	else
		e_list $1
	fi
	return $installed
}

# Install function
install() {
	cd $HOME

	notice "Making symlinks"
	rm -f ~/.gitconfig && ln -s $DOTFILES/.gitconfig ~/.gitconfig
	c_list "gitconfig"
	rm -f ~/.gitignore && ln -s $DOTFILES/.gitignore ~/.gitignore
	c_list "gitignore"
	rm -f ~/.vimrc && ln -s $DOTFILES/_vim/.vimrc ~/.vimrc
	c_list "vimrc"
	rm -rf ~/.vim && ln -s $DOTFILES/_vim/.vim ~/.vim
	c_list "vim"
	rm -rf ~/.oh-my-zsh && ln -s $DOTFILES/_zsh/.oh-my-zsh ~/.oh-my-zsh
	c_list "oh-my-zsh"
	rm -rf ~/.zprofile && ln -s $DOTFILES/_zsh/.zprofile ~/.zprofile
	c_list "zprofile"
	rm -rf ~/.zshalias && ln -s $DOTFILES/_zsh/.zshalias ~/.zshalias
	c_list "zshalias"
	rm -rf ~/.zshrc && ln -s $DOTFILES/_zsh/.zshrc ~/.zshrc
	c_list "zshrc"
	rm -rf ~/.tmux.conf && ln -s $DOTFILES/_tmux/.tmux.conf ~/.tmux.conf
	c_list "tmux"
	mkdir $DOTFILES/_zsh/.oh-my-zsh/custom/themes && ln -s $DOTFILES/_zsh/pure/pure.zsh $DOTFILES/_zsh/.oh-my-zsh/custom/themes/pure.zsh-theme
	c_list "pure"
}

# Dependencies

notice "Checking dependencies"

not_met=0
for need in "${dependencies[@]}"; do
	dep $need
	met=$?
	not_met=$(echo "$not_met + $met" | bc)
done

if [ $not_met -gt 0 ]; then
	error "$not_met dependencies not met!"
	exit 1
fi

# Install

# Assumes $HOME/.dotfiles is *ours*
if [ -d $DOTFILES ]; then
	pushd $DOTFILES

	# Update Repo
	notice "Updating"
	git pull origin master
	git submodule init
	git submodule update

	# Install
	notice "Installing"
	install
else
	# Clone Repo
	notice "Downloading"
	git clone --recursive git://github.com/rub1/dotfiles.git $DOTFILES

	pushd $DOTFILES

	# Install
	notice "Installing"
	install
fi

# Finished

notice "Finished"
exec $SHELL -l

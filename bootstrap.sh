#!/bin/zsh
# Lots of copy and paste from these:
# https://github.com/gf3/dotfiles/blob/master/bootstrap.sh
# https://github.com/davidfischer/dotfiles/blob/master/install.sh

DOTFILES=~/Projects/dotfiles
dependencies=(git tree vim)
files=(.gitconfig .gitignore .oh-my-zsh .tmux.conf .vim .vimrc .zprofile .zshalias .zshrc)
ohmycustom=~/Projects/dotfiles/.oh-my-zsh/custom/themes
backupdir="$HOME/.dotfiles-backup/$(date "+%Y%m%d-%H%M%S")"

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

# RCreates a new backup direcotry and copys files that will be symlinked
backup() {
	mkdir -p $backupdir
	for file in "${files[@]}"; do
		cp -Rf $HOME/$file $backupdir/$file && c_list "$file"
	done
}

# Removes old files and makes new symlinks
install() {
	for file in "${files[@]}"; do
		rm -rf $HOME/$file && c_list "removed $file"
		ln -s $DOTFILES/$file $HOME/$file && c_list "symlinked $file"
	done
}

# Makes oh-my-zsh custom theme folder and makes symlink to pure theme
installpure() {
	mkdir $ohmycustom
	rm -rf $ohmycustom/pure.zsh-theme && c_list "removed pure"
	ln -s $DOTFILES/_init/pure/pure.zsh $ohmycustom/pure.zsh-theme && c_list "symlinked pure"
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

cd $DOTFILES

# Update Repo
notice "Updating repo"
git pull origin master
notice "Init submodules"
git submodule init
notice "Updating submodules"
git submodule update

# Install
notice "Installing"
install
installpure

# Finished

notice "Finished"
exec $SHELL -l
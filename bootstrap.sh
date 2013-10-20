#!/bin/zsh
# Lots of copy and paste from these:
# https://github.com/gf3/dotfiles/blob/master/bootstrap.sh
# https://github.com/davidfischer/dotfiles/blob/master/install.sh

DOTFILES=~/Projects/dotfiles
SUBLIME=/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
dependencies=(git tree vim)
files=(.gitconfig .gitignore .oh-my-zsh .tmux.conf .vim .vimrc .zprofile .zshalias .zshrc)
sublfiles=(Default\ (OSX).sublime-keymap Preferences.sublime-settings html.sublime-snippet)
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

# Creates a new backup direcotry and copys files that will be symlinked
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

# Install powerline fonts
installfonts() {
	cp -f $DOTFILES/_init/powerline-fonts/*/*.otf $HOME/Library/Fonts
	cp -f $DOTFILES/_init/powerline-fonts/*/*.ttf $HOME/Library/Fonts
}

installsublime() {
	mkdir -p $SUBLIME
	for file in "${sublfiles[@]}"; do
		cp -Rf $SUBLIME/$file $backupdir/$file && c_list "backed up $file"
		ln -s $DOTFILES/_sublime/$file $HOME/$file && c_list "symlinked $file"
	done
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
notice "Backup to $backupdir"
backup
notice "Installing"
install
installpure
installsublime
notice "Copying fonts to library"
installfonts

# Finished
notice "Finished"
exec $SHELL -l

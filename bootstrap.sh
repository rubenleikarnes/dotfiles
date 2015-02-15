#!/bin/zsh
# Lots of copy and paste from these:
# https://github.com/gf3/dotfiles/blob/master/bootstrap.sh
# https://github.com/davidfischer/dotfiles/blob/master/install.sh

dotfiles=~/dotfiles
dependencies=(git stow tmux)
files=(ack editorconfig git hushlogin nano tmux vim zsh)
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

in_array() {
  local hay needle=$1
  shift
  for hay; do
	[[ $hay == $needle ]] && return 0
  done
  return 1
}

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

# Creates a new backup directory and copys old files
backup() {
	mkdir -p $backupdir
	for folder in "${files[@]}"; do
		cd $dotfiles

		local myfiles=()

		for item in "$(ls -A1 ${folder[@]})"; do
			myfiles=("${myfiles[@]}" $item)
		done

		for fil in "${myfiles[@]}"; do
			if [ -e $HOME/${fil} ]; then
				in_array $fil || cp -Rf "$HOME/$fil" "$backupdir/$fil" && c_list "$fil"
			fi
		done
	done
}

# Removes old files
remove() {
	for folder in "${files[@]}"; do
		cd $dotfiles

		local myotherfiles=()

		for item in "$(ls -A1 ${folder[@]})"; do
			myotherfiles=("${myotherfiles[@]}" $item)
		done

		for fil in "${myotherfiles[@]}"; do
			if [ -e $HOME/${fil} ]; then
				in_array $fil || rm -rf "$HOME/$fil" && c_list "$fil"
			fi
		done
	done
}

# makes new symlinks
install() {
	for file in "${files[@]}"; do
		cd $dotfiles
		stow $file && c_list "symlinked $file"
	done
}

# Assumes $HOME/.dotfiles is *ours*
if [ -d $HOME/dotfiles ]; then

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

	# Backup
	notice "Backup to $backupdir"
	backup
	# Remove old files
	notice "Removing old files from home"
	remove

	# Install new symlinks
	notice "Installing"
	install

	# Finished
	notice "Finished"
else
	# Couldn't find dotfiles
	error "Couldn't find dotfiles in $HOME, please download using the following link:"
	error "\"git clone --recursive git://github.com/rub1/dotfiles.git $HOME/dotfiles\""
fi

# exec $SHELL -l

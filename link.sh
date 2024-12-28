#!/usr/bin/env bash

# Credits to https://github.com/nicknisi/dotfiles/blob/master/install/link.sh

DOTFILES=$HOME/dotfiles
BACKUPDIR=~/.dotfiles-backup-$(date +'%Y%m%d-%H%M')

# Green list checkmark
# Output: ✔ variabel
g_list() { echo  "  \033[1;32m✔ $1 \033[0m"; }

# Yellow list checkmark
# Output: ✔ variabel
y_list() { echo  "  \033[1;33m✔\033[0m $1"; }

# Red error x
# Output: ✖ Error: variabel
e_list() { echo "  \033[1;31m✖ Error: $1\033[0m"; }



echo "\nCreating backup folder"
echo "=============================="
y_list "$BACKUPDIR created"
mkdir $BACKUPDIR




echo "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
	target="$HOME/.$( basename $file '.symlink' )"
	if [ -e $target ]; then
		y_list "~${target#$HOME} already exists... backing up."
		mv $target $BACKUPDIR
		g_list "Creating symlink for $file"
		ln -s $file $target
	else
		g_list "Creating symlink for $file"
		ln -s $file $target
	fi
done


echo "\nCreating .config symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.configlink' )
for file in $linkables ; do
	target="$HOME/.config/$( basename $file '.configlink' )"
	if [ -e $target ]; then
		y_list "~${target#$HOME} already exists... backing up."
		mv $target $BACKUPDIR
		g_list "Creating symlink for $file"
		ln -s $file $target
	else
		g_list "Creating symlink for $file"
		ln -s $file $target
	fi
done



if [ -d $HOME/Sync/.auth ]; then
	echo "\nCreating symlinks for auth files in Sync.com"
	echo "=============================="
	linkables=$( find -H "$HOME/Sync/.auth" -maxdepth 3 -name '*.symlink' )
	for file in $linkables ; do
		target="$HOME/.$( basename $file '.symlink' )"
		if [ -e $target ]; then
			y_list "~${target#$HOME} already exists... Skipping."
		else
			g_list "Creating symlink for $file"
			ln -s $file $target
		fi
	done
fi

#!/usr/bin/env bash

# Credits to https://github.com/nicknisi/dotfiles/blob/master/install/link.sh

DOTFILES=$HOME/dotfiles

echo "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done


echo "\nInstalling nvim" 
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

if [ ! -d $HOME/.config/nvim ]; then
    echo "Creating symlink for nvim"
    ln -s $DOTFILES/nvim $HOME/.config/nvim 
else
    echo "~/.config/nvim already exists... Skipping."
fi


echo "\nInstalling prezto" 
echo "=============================="
if [ ! -d $HOME/.zprezto ]; then
    echo "Creating symlink for prezto"
    ln -s $DOTFILES/zsh/.zprezto $HOME/.zprezto 
else
    echo "~/.prezto already exists... Skipping."
fi


echo "\nInstalling Sublime Text" 
echo "=============================="
if [ ! -d  $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages ]; then
    echo "Creating Sublimee Packages folder"
    mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages
fi

if [ ! -d $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ]; then
    echo "Creating symlink for Sublime Text"
    ln -s $DOTFILES/sublime/User $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User  
else
    echo "Sublime Text User folder already exists... Skipping."
fi



if [ -d $HOME/Dropbox/.auth ]; then
	echo "\nCreating symlinks for auth files in dropbox"
	echo "=============================="
	linkables=$( find -H "$HOME/Dropbox/.auth" -maxdepth 3 -name '*.symlink' )
	for file in $linkables ; do
		target="$HOME/.$( basename $file '.symlink' )"
		if [ -e $target ]; then
			echo "~${target#$HOME} already exists... Skipping."
		else
			echo "Creating symlink for $file"
			ln -s $file $target
		fi
	done
fi

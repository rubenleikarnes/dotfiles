#!/bin/zsh
# This is a fork of https://github.com/davidfischer/dotfiles/blob/master/install.sh

DOTFILES=~/Projects/dotfiles/

#rm -f ~/.bashrc && ln -s $DOTFILES/bashrc ~/.bashrc
#rm -f ~/.gitconfig && ln -s $DOTFILES/gitconfig ~/.gitconfig
#rm -f ~/.editorconfig && ln -s $DOTFILES/editorconfig ~/.editorconfig
#rm -f ~/.vimrc && ln -s $DOTFILES/vimrc ~/.vimrc
#rm -rf ~/.vim && ln -s $DOTFILES/vim ~/.vim

cd $DOTFILES && git submodule update --init

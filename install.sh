#!/bin/zsh
# This is a fork of https://github.com/davidfischer/dotfiles/blob/master/install.sh

DOTFILES=~/Projects/dotfiles/


# Notice title
# Output: => variabel
notice() { echo  "\033[1;32m=> $1\033[0m"; }

# Error title
# Output: => Error: variabel
error() { echo "\033[1;31m=> Error: $1\033[0m"; }

notice "Updating submodules"
cd $DOTFILES && git submodule update --init

cd $HOME

notice "Making symlinks"
rm -f ~/.gitconfig && ln -s $DOTFILES/.gitconfig ~/.gitconfig
rm -f ~/.gitignore && ln -s $DOTFILES/.gitignore ~/.gitignore
rm -f ~/.vimrc && ln -s $DOTFILES/_vim/.vimrc ~/.vimrc
rm -rf ~/.vim && ln -s $DOTFILES/_vim/.vim ~/.vim
rm -rf ~/.oh-my-zsh && ln -s $DOTFILES/_zsh/.oh-my-zsh ~/.oh-my-zsh
rm -rf ~/.zprofile && ln -s $DOTFILES/_zsh/.zprofile ~/.zprofile
rm -rf ~/.zshalias && ln -s $DOTFILES/_zsh/.zshalias ~/.zshalias
rm -rf ~/.zshrc && ln -s $DOTFILES/_zsh/.zshrc ~/.zshrc
rm -rf ~/.tmux.conf && ln -s $DOTFILES/_tmux/.tmux.conf ~/.tmux.conf
mkdir ~/.oh-my-zsh/custom/themes && ln -s $DOTFILES/_zsh/pure/pure.zsh ~/.oh-my-zsh/custom/themes/pure.zsh-theme

notice "Done"
exec $SHELL -l

# dotfiles

My start for getting some awesome dotfiles. My startingpoint ~~is~~ was mostly a fork of [Mathias Bynens'](https://github.com/mathiasbynens/dotfiles) bash files witch I've now stopped using since I've gone over to use Zsh. My Vim config ~~is~~ was a fork of [Harry Roberts'](https://github.com/csswizardry/dotfiles) vimrc for a startingpoint. Go check them out they're both awesome. My Sublime config have been evolving over the past few years and i tend to switch color scheme atleast once a month. Can't remember where I forked my tmux.conf, sorry. Copyed tmux styling from [xero](https://github.com/xero/dotfiles).

# Requirements

```
coreutils
git
stow
tmux
z
zsh
```

## Install

``` 

$ bash < <( curl https://raw.githubusercontent.com/rub1/dotfiles/master/bootstrap.sh )

chsh -s $(which zsh)
git clone https://github.com/rub1/dotfiles.git ~/dotfiles
cd ~/dotfiles
git submodule init
git submodule update
cd ~/dotfiles/zsh/.zprezto
git submodule init
git submodule update
cd ~/dotfiles
stow editorconfig
stow git
stow hushlogin
stow tmux
stow vim
stow zsh
```

Stow symlinks to parent directory so you need to be in the dotfiles dir to symlink the folders. If you need to specify target other than parent use the following pattern:

```
stow -t target source
```

Restart terminal session

### Vim

``` 
:BundleInstall
```

## Terminal settings

- Theme [Ocean Dark](https://github.com/chriskempson/base16-iterm2)
- [Inconsolata (Powerline)](https://github.com/Lokaltog/powerline-fonts/tree/master/Inconsolata) (Size 14pt)

## Application list

- [New computer application list (osx)](Applications.md)

## Sources

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) 
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Harry Roberts](https://github.com/csswizardry/dotfiles)

## Screenshot

![Screenshot of terminal](screenshot.png)

# dotfiles

My startingpoint ~~is~~ was mostly a fork of [Mathias Bynens'](https://github.com/mathiasbynens/dotfiles) bash files wich I've now stopped using since I've gone over to use Zsh. My Sublime config have been evolving over the past few years. Tmux inspiration from [xero](https://github.com/xero/dotfiles) and [Ahmed El Gabri](https://github.com/ahmedelgabri/dotfiles). My NVim was a fork of [Harry Roberts'](https://github.com/csswizardry/dotfiles), and some inspiration from [Nick Nisi](https://github.com/nicknisi).

# Requirements

```
coreutils
zsh
git
tmux
reattach-to-user-namespace
zplug
```

## Install

``` 
Set default shell in System Preferences  \'/usr/local/bin/zsh\'
git clone --recursive git://github.com/rub1/dotfiles.git $HOME/dotfiles
git submodule update --init --recursive
```

Use the link.sh file to install all '.symlink' files.

```
sh ./link.sh
```

Restart terminal session

### NVim

``` 
:PlugInstall
```

## Terminal settings

- Theme: [Oceanic Next](https://github.com/voronianski/oceanic-next-color-scheme)
- Font: [Hack](https://github.com/chrissimpkins/hack)
- [Use ⌥ ← and ⌥→ to jump forwards/backwards words in iTerm](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x)

``` 
FOR  ACTION         SEND
⌘←  "SEND HEX CODE"      0x01 
⌘→  "SEND HEX CODE"      0x05
⌥←  "SEND ESC SEQ"  b
⌥→  "SEND ESC SEQ"  f
```
## Sources

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) 
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Harry Roberts](https://github.com/csswizardry/dotfiles)
- [Xero Harrison](https://github.com/xero/dotfiles)
- [Nick Nisi](https://github.com/nicknisi/dotfiles)
- [Ahmed El Gabri](https://github.com/ahmedelgabri/dotfiles)

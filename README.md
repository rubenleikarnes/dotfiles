# dotfiles

My startingpoint ~~is~~ was mostly a fork of [Mathias Bynens'](https://github.com/mathiasbynens/dotfiles) bash files wich I've now stopped using since I've gone over to use Zsh. My Sublime config have been evolving over the past few years. Tmux inspiration from [xero](https://github.com/xero/dotfiles) and [Ahmed El Gabri](https://github.com/ahmedelgabri/dotfiles). My NVim was a fork of [Harry Roberts'](https://github.com/csswizardry/dotfiles), and some inspiration from [Nick Nisi](https://github.com/nicknisi).

# Requirements

```
coreutils
fish
git
fzf
ripgrep
delta
tmux
zoxide
starship
```

## Install

```
Set default shell in System Preferences  \'/usr/local/bin/fish\'
git clone --recursive git://github.com/rub1/dotfiles.git $HOME/dotfiles
git submodule update --init --recursive
```

Use the link.sh file to install all '.symlink' and '.configlink' files.

```
sh ./link.sh
```

Restart terminal session

### Brew

```
cd ~/dotfiles
brew bundle
```

### nvim

Uses [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with smaller changes and a few plugins
Uncomment line so custom files can be loaded.
I do have some custom files in the customs folder Ive also added a customs.lua and the snippet below to override some settings and make it easier to "update" kickstart to a newer version

```
-- Override or set new options, autocmds, etc. in lua files placed in lua/custom/
-- See lua/custom/example_override.lua
vim.cmd('runtime! lua/custom/*.lua')
````

## Terminal settings

- Theme: [Snazzy](https://github.com/sindresorhus/iterm2-snazzy)
- Font: [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- [Use ⌥ ← and ⌥→ to jump forwards/backwards words in iTerm](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x)

```
FOR  ACTION         SEND
⌘←  "SEND HEX CODE"      0x01
⌘→  "SEND HEX CODE"      0x05
⌥←  "SEND ESC SEQ"  b
⌥→  "SEND ESC SEQ"  f
```

## Kubectl

[kubectl-config-import](https://github.com/rafi/kubectl-config-import/) tool

```
kubectl config-import -f ~/.kube/config
```

## Sources

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Harry Roberts](https://github.com/csswizardry/dotfiles)
- [Xero Harrison](https://github.com/xero/dotfiles)
- [Nick Nisi](https://github.com/nicknisi/dotfiles)
- [Ahmed El Gabri](https://github.com/ahmedelgabri/dotfiles)

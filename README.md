# dotfiles

Started as a fork of [Mathias Bynens'](https://github.com/mathiasbynens/dotfiles) bash config, evolved through Zsh, Tmux, and Vim setups inspired by [xero](https://github.com/xero/dotfiles), [Harry Roberts](https://github.com/csswizardry/dotfiles), and [Nick Nisi](https://github.com/nicknisi). Then I discovered Nix and ran a basic flake on my laptop for a while. Now everything is declarative — nix-darwin on the MacBook, NixOS on a home server VM, and more to come.

```
mbp        macOS (nix-darwin + home-manager + nix-homebrew)
vm-nixos   NixOS VM (forgejo, plex, sonarr, miniflux, caddy)
```

## Requirements

- [Nix](https://nixos.org/download) with [flakes enabled](https://nixos.wiki/wiki/Flakes)

## Install

```bash
# macOS
sudo darwin-rebuild switch --flake ~/dotfiles#mbp

# NixOS VM
sudo nixos-rebuild switch --flake ~/dotfiles#vm-nixos

# Legacy symlinks (editorconfig, fish aliases, etc.)
sh ./link.sh
```

## Terminal

- Theme: [Snazzy](https://github.com/sindresorhus/iterm2-snazzy)
- Font: [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- Shell: fish + starship prompt
- Editor: helix

## Sources

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Artem Sapegin](https://github.com/sapegin/dotfiles)
- [Harry Roberts](https://github.com/csswizardry/dotfiles)
- [Xero Harrison](https://github.com/xero/dotfiles)
- [Nick Nisi](https://github.com/nicknisi/dotfiles)
- [Ahmed El Gabri](https://github.com/ahmedelgabri/dotfiles)

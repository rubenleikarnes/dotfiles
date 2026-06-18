{ config, lib, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./starship.nix
    ./git.nix
    ./tmux.nix
    ./helix.nix
    ./editorconfig.nix
    ./hushlogin.nix
  ];

  home.stateVersion = "25.05";
}

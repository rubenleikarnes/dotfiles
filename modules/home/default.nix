{ config, lib, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./starship.nix
    ./git.nix
  ];

  home.stateVersion = "25.05";
}

{ config, lib, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./starship.nix
  ];

  home.stateVersion = "25.05";
}

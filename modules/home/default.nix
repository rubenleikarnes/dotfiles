{ config, lib, pkgs, ... }:

{
  imports = [
    ./fish.nix
  ];

  home.stateVersion = "25.05";
}

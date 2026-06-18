{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true; # allow installation of unfree packages

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ]; # enable flakes & nix-command
    auto-optimise-store = true;
  };

  # Storage optimization
  # https://nixos.wiki/wiki/Storage_optimization
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    interval = [ { Weekday = 2; Hour = 14; Minute = 0; } ];
    options = "--delete-older-than 30d";
  };
}

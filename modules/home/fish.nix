{ config, lib, pkgs, ... }:

{
  # mkOutOfStoreSymlink keeps the target writable (fish writes fish_variables).
  # xdg.configFile would copy into the read-only nix store and break this.
  home.file.".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/legacy/fish";
}

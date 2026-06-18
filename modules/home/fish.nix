{ config, lib, pkgs, ... }:

{
  home.file.".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/legacy/fish";
}

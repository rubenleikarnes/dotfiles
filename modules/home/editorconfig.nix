{ config, lib, pkgs, ... }:

{
  home.file.".editorconfig".source = ../../legacy/editorconfig/editorconfig.symlink;
}

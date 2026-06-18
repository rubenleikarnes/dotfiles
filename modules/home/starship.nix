{ config, lib, pkgs, ... }:

{
  home.file.".config/starship.toml".source = ../../legacy/starship/starship.toml.configlink;
}

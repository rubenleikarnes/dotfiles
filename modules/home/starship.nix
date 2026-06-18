{ config, lib, pkgs, ... }:

{
  xdg.configFile."starship.toml".source = ../../legacy/starship/starship.toml.configlink;
}

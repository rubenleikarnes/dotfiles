{ config, lib, pkgs, ... }:

{
  xdg.configFile."fish".source = ../../legacy/fish;
}

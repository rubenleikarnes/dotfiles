{ config, lib, pkgs, ... }:

{
  xdg.configFile."helix/config.toml".source = ../../legacy/helix/config.toml;
}

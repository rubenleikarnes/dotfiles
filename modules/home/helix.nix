{ config, lib, pkgs, ... }:

{
  home.file.".config/helix/config.toml".source = ../../legacy/helix/config.toml;
}

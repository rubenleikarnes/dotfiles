{ config, lib, pkgs, ... }:

{
  imports = [ ../../modules/home ];

  xdg.configFile = {
    "ghostty/config".source = ../../legacy/ghostty/config;
    "zed/settings.json".source = ../../legacy/zed/settings.json;
    "zed/keymap.json".source = ../../legacy/zed/keymap.json;
  };
}

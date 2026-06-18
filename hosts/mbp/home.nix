{ config, lib, pkgs, ... }:

{
  imports = [ ../../modules/home ];

  home.file = {
    ".config/ghostty/config".source = ../../legacy/ghostty/config;
    ".config/zed/settings.json".source = ../../legacy/zed/settings.json;
    ".config/zed/keymap.json".source = ../../legacy/zed/keymap.json;
  };
}

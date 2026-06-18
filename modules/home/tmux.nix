{ config, lib, pkgs, ... }:

{
  home.file.".tmux.conf".source = ../../legacy/tmux/tmux.conf.symlink;
}

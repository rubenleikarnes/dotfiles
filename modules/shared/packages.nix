{ config, lib, pkgs, ... }:

{
  # Global CLI tools used on both hosts
  environment.systemPackages = with pkgs; [
    bat # modern cat alternative
    curl # http tool
    delta # better git diff viewer
    eza # modern alternative for ls
    fzf # fuzzy finder
    git # version control
    helix # nvim alternative
    starship # shell prompt
    wget # cli downloader
    zoxide # smarter cd replacement
  ];
}

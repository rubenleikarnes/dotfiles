{ config, lib, pkgs, ... }:

{
  home.file = {
    ".gitconfig".source = ../../legacy/git/gitconfig.symlink;
    ".gitignore".source = ../../legacy/git/gitignore.symlink;
    ".gitconfig-nep-gpe".source = ../../legacy/git/gitconfig-nep-gpe.symlink;
  };
}

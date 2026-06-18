{ config, lib, pkgs, self, ... }:

{
  imports = [
    ../../modules/shared
    ./homebrew.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "ruben";

  # Mac-only packages (shared CLI tools are in modules/shared/packages.nix)
  environment.systemPackages = with pkgs; [
    avahi # mDNS discovery
    caddy # web server / reverse proxy
    claude-code # claude ai
    coreutils # GNU core utilities
    fd # fast alternative to find
    ffmpeg # video toolkit
    git-lfs # git for large files
    inetutils # telnet, ftp, etc (from apple)
    kubectl # k8s cli
    net-snmp # network monitoring
    nixd # nix language server (required by nix)
    nmap # network scanner
    openssl # tls/ssl toolkit
    ripgrep # fast grep (required by nvim)
    sshpass # non-interactive ssh password (required for AT300 config push)
    stern # tail logs from k8s pods
    tmux # terminal multiplexer
    tldr # simplified man pages
    yarn-berry # js packager
    # yt-dlp # youTube downloader
  ];

  system.defaults = {
    dock.autohide = true; # hide dock
    dock.persistent-apps = [ # pinned apps
      "/Applications/Zen.app"
      "/Applications/Microsoft Outlook.app"
      "/System/Applications/Mail.app"
      "/Applications/Slack.app"
      "/Applications/BusyCal.app"
      "/Applications/1Password.app"
      "/Applications/Zed.app"
      "/Applications/Ghostty.app"
      "/Applications/Github Desktop.app"
      "/Applications/Remote Desktop Manager.app"
      "/Applications/Obsidian.app"
      "/Applications/ChatGPT.app"
      "/Applications/Claude.app"
    ];
    loginwindow.GuestEnabled = false; # disable guest login
    NSGlobalDomain.AppleICUForce24HourTime = true; # 24h clock
    NSGlobalDomain.AppleInterfaceStyle = "Dark"; # dark mode
    NSGlobalDomain.KeyRepeat = 2; # fast key repeat

    CustomUserPreferences = {
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # 27 = "Move focus to next window"
          "27" = {
            enabled = 1;
            value = {
              parameters = [ 39 50 1048576 ]; # ⌘+'
              type = "standard";
            };
          };
          # 52 = "Turn Dock Hiding On/Off"
          "52" = {
            enabled = 0;
            value = {
              parameters = [ 65535 65535 0 ];
              type = "standard";
            };
          };
        };
      };
    };
  };

  # Remove menubar icons in Tahoe
  system.activationScripts.postActivation.text = ''
    sudo -u ruben defaults write -g NSMenuEnableActionImages -bool NO
  '';

  system.configurationRevision = self.rev or self.dirtyRev or null; # track flake git revision

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # Home Manager
  home-manager.users.ruben = import ../../modules/home;
}

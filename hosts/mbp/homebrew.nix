{ config, lib, pkgs, ... }:

{
  homebrew = { # manage homebrew packages/casks/apps
    enable = true;

    brews = [
      "mas" # Mac App Store cli
      "fisher" # fish plugin manager
      "rafi/tap/kubectl-config-import" # tool for importing kubectl config files
    ];

    casks = [
      "1password" # password manager
      "affinity" # photo editing software
      "alfred" # spotlight alternative
      "arc" # chrome alternative
      "autodesk-fusion" # 3d modeling
      "balenaetcher" # bootable usb creator
      "brave-browser" # another chrome alternative
      "appgate-sdp-client" # work vpn
      "base" # sqlite editor
      "bambu-studio" # 3d printer app from bambu
      "busycal" # calendar app
      "chatgpt" # openai desktop client
      "claude" # anthropic desktop client
      "colorsnapper" # color picker tool
      "daisydisk" # disk usage analyser
      "discord" # chat
      "docker-desktop" # container platform
      "figma" # photoshop alternative
      "firefox" # browser
      "font-ibm-plex-mono" # dev font
      "font-inter" # ui font
      "font-jetbrains-mono-nerd-font" # dev font
      "font-sf-pro" # apple system font
      "forklift" # ftp client
      "github" # github Desktop
      "ghostty" # terminal emulator
      "google-chrome" # browser
      "handbrake-app" # ffmpeg gui
      "imageoptim" # image optimizer
      "istat-menus" # menu bar system monitor
      "iterm2" # terminal emulator
      "microsoft-auto-update" # updater for ms apps
      "microsoft-office-businesspro" # ms office
      "netnewswire" # rss reader
      "obs" # streaming
      "obsidian" # markdown notes
      "postman" # api tool
      "powerphotos" # photo library manager
      "rapidapi" # alternative to postman, native macos app
      "rectangle" # window manager
      "remote-desktop-manager" # rdp client
      "royal-tsx" # remote desktop manager
      "slack" # work chat
      "spotify" # music
      "sync" # file sync
      "switchresx" # display control
      "tailscale-app" # vpn
      "tunnelblick" # openvpn client
      "teamviewer" # remote desktop
      "thebrowsercompany-dia" # ai browser from arc creators
      "the-unarchiver" # archive extractor
      "utm" # virtual machine app
      "vlc" # media player
      "waterfox-classic" # legacy browser
      "whatsapp" # messaging
      "wifiman" # unifi vpn
      "wireshark-app" # network packet analyzer
      "zed" # code editor
      "zen" # firefox alternative
    ];

    taps = [
      "rafi/tap" # kubectl-config-import tap https://github.com/rafi/kubectl-config-import
    ];

    masApps = {
      # Ivory = 6444602274; # mastodon client
      # Things3 = 904280696; # task manager
      # Wireguard = 1451685025; # vpn client
    };

    onActivation.cleanup = "zap"; # removes old versions, caches etc
    onActivation.autoUpdate = true; # updates before install
    onActivation.upgrade = true; # auto upgrade
  };
}

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/shared
  ];

  # Boot
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  # Networking
  networking.hostName = "vm-nixos";
  networking.useDHCP = false;
  networking.interfaces.ens18.ipv4.addresses = [{
    address = "192.168.1.110";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "192.168.1.1" "1.1.1.1" ];

  networking.firewall.allowedTCPPorts = [
    80     # caddy
    443    # caddy (TLS)
    8001   # forgejo
    32400  # plex
    8989   # sonarr
    8080   # qbittorrent web UI
    8081   # miniflux
  ];

  # Users for services that need data directories
  users.users.miniflux = {
    isSystemUser = true;
    group = "miniflux";
  };
  users.groups.miniflux = { };

  # Time & Locale
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_US.UTF-8";

  # Console
  console.keyMap = "no";

  # Users
  users.users.ruben = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdPRFodA/fRfFnoS03TqjIQwA5VRQ/oIWkQx9NatcifIUep5nC7NfIuo9tXgXfXygpswOOXMJqf/xSOw2h3GmTP3OhHlNsPqkoy/WK6p20FSOIT+HAYlfjWSLAVM1noDvKTWxfjVTNnjjcMUwXk3BtlwNMrkIVj7VMFPZD9YJbBVZXbmWqPB4B/ocB/4E2qCqqEMtSzTaYJreS0gFlRfWgUksBt05Uo7HNAKzNA+1svlEhpVCajuQl5lv5HUDVWDTcmUN6/GxQjXSEFFOjoakWDXa2OUDYCwhV0gS2opUogYbAMGo6oAKBzkMkWdbFxy/ZfjHOOoyV7BeDWa8vA5ou8I/P8x103oqdzqi9LO56fZLlDgfeOmgh/nMln9mUQfMQ7MMiF1PUDTlXV1UW233YYN2t5Ej045HLuBJfA0Wgrs0OuI0Qp5pU2+yI7b/iGXp+n3kUZw/jc4acndvNOqRxV17HOjsIu1rUBGl3yiE2aoBdGfizTWYILtN/dMNacUjd9hZCZVt+HLB7AG+rsyhzkxVREhxtxvzn2IO3KuskOzsESIR6Z5vCp2uNUDfZFlLpjT3voW4cIIPVuJ1SPaOERD22pXhFN/u54F85yHZJCdyow87Wp54nVV1Pi7uiejsal3A8F40akRt4abIOZQ3C8HEVbGp0P5RD8jyQnVPanw== ruben.leikarnes@gmail.com"
    ];
  };

  # Programs
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Services
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.caddy = {
    enable = true;
    virtualHosts."192.168.1.110" = {
      extraConfig = ''
        root * /var/www
        file_server
      '';
    };
  };

  services.forgejo = {
    enable = true;
    stateDir = "/data/git";
    database.type = "sqlite3";
    settings = {
      server = {
        HTTP_PORT = 8001;
        DOMAIN = "192.168.1.110";
        ROOT_URL = "http://192.168.1.110:8001/";
      };
      service.DISABLE_REGISTRATION = true;
    };
  };

  services.plex = {
    enable = true;
  };

  services.sonarr = {
    enable = true;
  };

  services.qbittorrent = {
    enable = true;
  };

  services.miniflux = {
    enable = true;
    adminCredentialsFile = "/data/miniflux/admin-creds";
    # One-time setup (run 'rb' first, then these commands):
    #   echo "ADMIN_USERNAME=admin" | sudo tee /data/miniflux/admin-creds
    #   echo "ADMIN_PASSWORD=<6+ chars>" | sudo tee -a /data/miniflux/admin-creds
    #   sudo chown miniflux:miniflux /data/miniflux/admin-creds
    #   sudo chmod 600 /data/miniflux/admin-creds
    #   sudo systemctl start miniflux
    config = {
      LISTEN_ADDR = "0.0.0.0:8081";
    };
  };

  # Ensure data directories exist on rebuild
  systemd.services.forgejo.preStart = ''
    mkdir -p /data/git
    chown forgejo:forgejo /data/git
    chmod 0750 /data/git
  '';
  systemd.tmpfiles.rules = [
    "d /data/downloads 0770 ruben qbittorrent -"
    "d /data/miniflux 0750 miniflux miniflux -"
  ];

  system.stateVersion = "26.05";

  # Home Manager
  home-manager.users.ruben = import ../../modules/home;
}

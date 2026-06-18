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

  networking.firewall.allowedTCPPorts = [ 80 443 ];

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

  system.stateVersion = "26.05";

  # Home Manager
  home-manager.users.ruben = import ../../modules/home;
}

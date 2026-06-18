{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; # unstable channel for latest pkgs
    nix-darwin.url = "github:LnL7/nix-darwin"; # nix-darwin module system
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs"; # follow nixpkgs version
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew"; # nix-homebrew integration
    nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager"; # home-manager module
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew, home-manager }:
  {
    # Build nixos flake using:
    # $ nixos-rebuild switch --flake .#vm-nixos
    nixosConfigurations.vm-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/vm-nixos
        home-manager.nixosModules.home-manager
      ];
    };

    # Build darwin flake using:
    # $ darwin-rebuild switch --flake .#mbp
    darwinConfigurations.mbp = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit self; };
      modules = [
        ./hosts/mbp
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true; # enable nix-homebrew
            enableRosetta = true; # allow x86_64 apps on arm64
            user = "ruben"; # link Homebrew to user account
          };
        }
      ];
    };
  };
}

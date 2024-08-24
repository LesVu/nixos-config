{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    raspberry-pi-nix.url = "github:tstat/raspberry-pi-nix";

    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:LesVu/nixvim_config";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, raspberry-pi-nix, lix, home-manager, proxmox-nixos, ... }@inputs:

    let
      system = "aarch64-linux";
    in
    {

      # penguin-pc - system hostname
      nixosConfigurations.penguin = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
        };
        modules = [
          raspberry-pi-nix.nixosModules.raspberry-pi
          lix.nixosModules.default
          proxmox-nixos.nixosModules.proxmox-ve
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.char = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit system inputs;
        };
        modules = [ ./home-manager/home.nix ];
      };
    };
}

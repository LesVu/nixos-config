{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:LesVu/nixvim_config";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, lix, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # penguin-pc - system hostname
      nixosConfigurations.penguin-pc = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system pkgs-unstable;
        };
        modules = [
          lix.nixosModules.default
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.char = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit system inputs pkgs-unstable;
        };
        modules = [ ./home-manager/home.nix ];
      };
    };
}

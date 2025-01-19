{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:LesVu/nixvim_config";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, lix, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in
    {

      # capybara - system hostname
      nixosConfigurations.capybara = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
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
          inherit system inputs;
        };
        modules = [ ./home-manager/home.nix ];
      };
    };
}

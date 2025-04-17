{
  description = "My system configuration";

  inputs = {

    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:LesVu/nixvim_config";
    mobile-nixos = {
      url = "github:mobile-nixos/mobile-nixos";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, mobile-nixos, ... }@inputs:

    let
      system = "aarch64-linux";
    in
    {

      # kodama - system hostname
      nixosConfigurations.kodama = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
        };
        modules = [
          ./nixos/configuration.nix
        ];
      };

      kodama-image = self.nixosConfigurations.kodama.config.mobile.outputs.default;

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

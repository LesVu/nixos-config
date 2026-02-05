{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:LesVu/nixvim_config";
  };

  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-raspberrypi,
      home-manager,
      ...
    }@inputs:

    let
      system = "aarch64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {

      # penguin - system hostname
      nixosConfigurations.penguin = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs system pkgs-unstable;
        };
        modules = [
        ({lib, ...}: let
            renamePath = nixpkgs.outPath + "/nixos/modules/rename.nix";
            renameModule = import renamePath {inherit lib;};
            moduleFilter = module:
              lib.attrByPath ["options" "boot" "loader" "raspberryPi"] null
              (module {
                config = null;
                options = null;
              })
              == null;
          in {
            disabledModules = [renamePath];
            imports = builtins.filter moduleFilter renameModule.imports;
          })
          ({
            imports = with nixos-raspberrypi.nixosModules; [
              # Required: Add necessary overlays with kernel, firmware, vendor packages
              nixos-raspberrypi.lib.inject-overlays

              # PKGS
              trusted-nix-caches
              nixpkgs-rpi
              nixos-raspberrypi.lib.inject-overlays-global

              # RPI 5
              raspberry-pi-5.base
              raspberry-pi-5.page-size-16k
              raspberry-pi-5.display-vc4
              raspberry-pi-5.bluetooth

              # SD
              sd-image
            ];
          })
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

{ pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./overlays.nix
  ];

  disabledModules = [ ];

  nixpkgs.config.allowUnfree = true;

  # Lix
  nix.package = pkgs.lixPackageSets.stable.lix;

  environment.systemPackages = with pkgs; [
    # CLI utils
    fastfetch
    file
    curl
    wget
    git
    htop
    unzip
    zip
    pciutils
    rclone

    # Development
    nodejs_22
    nixpkgs-fmt
    nil

    # Virtualization
    distrobox
    lazydocker

    # Other
    home-manager
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.hack
  ];
}

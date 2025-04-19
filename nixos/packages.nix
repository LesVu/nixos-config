{ pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./overlays.nix
  ];

  disabledModules = [ ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # CLI utils
    fastfetch
    file
    curl
    wget
    git
    btop
    unzip
    zip
    pciutils
    screen

    # Other
    home-manager
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.hack
    roboto
    nerd-fonts.roboto-mono
  ];
}

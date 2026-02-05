{ pkgs, pkgs-unstable, ... }: {
  imports = [
    ./overlays.nix
  ];

  disabledModules = [ ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # CLI utils
    neofetch
    file
    wget
    git
    htop
    unzip
    zram-generator
    zip
    pciutils
    screen

    # Development
    nodejs_24
    nixpkgs-fmt
    nil

    # Virtualization
    distrobox
    lazydocker
    # cockpit-machines

    # Other
    home-manager
    pkgs-unstable.raspberrypi-eeprom
  ];

    # Font Packages
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.hack
  ];
}

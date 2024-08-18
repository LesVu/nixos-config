{ pkgs, pkgs-unstable, ... }: {
  imports = [
    ./overlays.nix
  ];

  disabledModules = [ ./overlays.nix ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    # chromium
    # firefox

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
    nodejs_18
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

  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}

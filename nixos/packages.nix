{ pkgs, pkgs-unstable, ... }: {
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
    nodejs_18

    # Virtualization
    distrobox
    lazydocker

    # Other
    home-manager
    pkgs-unstable.raspberrypi-eeprom
    #.overrideAttrs
    #(finalAttrs: previousAttrs: {
    #  version = "2024.06.05-2712";
    #})
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}

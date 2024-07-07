{ pkgs, ... }: {
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
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}

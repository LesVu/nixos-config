{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    # chromium
    firefox
    remmina

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
    nodejs_18
    python3

    # Virtualization
    distrobox
    lazydocker

    # GPU stuff 
    glxinfo
    vulkan-tools

    # Other
    home-manager
    parsec-bin
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}

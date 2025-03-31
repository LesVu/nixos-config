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
    fastfetch
    file
    curl
    wget
    git
    htop
    unzip
    zip
    pciutils
    screen

    # Development
    nodejs_22
    nixpkgs-fmt
    nil
    gcc
    gnumake

    # Virtualization
    distrobox
    lazydocker
    # cockpit-machines

    # Other
    home-manager
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}

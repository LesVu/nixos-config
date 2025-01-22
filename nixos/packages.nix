{ pkgs, pkgs-unstable, ... }: {
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

    # Development
    nodejs_22
    python3
    (pkgs-unstable.vscode.fhsWithPackages (ps: with ps; [ nil nixpkgs-fmt ]))

    # Virtualization
    distrobox
    lazydocker
    podman-desktop

    # GPU stuff 
    glxinfo
    vulkan-tools

    # Other
    home-manager
    parsec-bin
    pkgs-unstable.anki-bin
    pkgs-unstable.obsidian
    rquickshare
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}

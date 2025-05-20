{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    # chromium
    firefox
    pkgs-unstable.obsidian
    pkgs-unstable.rquickshare
    prismlauncher
    osu-lazer-bin
    blender

    # CLI utils
    fastfetch
    file
    wget
    curl
    git
    htop
    btop
    unzip
    zip

    # Development
    nodejs_22
    python3
    (pkgs-unstable.vscode.fhsWithPackages (ps: with ps; [ nil nixfmt-rfc-style clang-tools ]))
    android-tools
    git-repo
    postman

    # Virtualization
    distrobox

    # GPU stuff 
    glxinfo
    vulkan-tools

    # Other
    home-manager
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    roboto
    (nerdfonts.override { fonts = [ "Hack" "FiraCode" ]; })
  ];
}

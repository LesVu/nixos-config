{ pkgs, pkgs-unstable, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    # chromium
    firefox
    pkgs-unstable.obsidian
    pkgs-unstable.rquickshare
    prismlauncher
    # osu-lazer-bin
    # blender
    # libreoffice-qt6-fresh

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
    jq

    # Development
    (pkgs-unstable.vscode.fhsWithPackages (
      ps: with ps; [
        nil
        nixfmt-rfc-style
        clang-tools
      ]
    ))
    # pkgs-unstable.android-studio
    android-tools
    git-repo
    postman
    ghidra

    # Virtualization
    distrobox
    podman-compose

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
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];
}

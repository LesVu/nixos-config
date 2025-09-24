{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;

    # Overlays
    overlays = [
      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          nixpkgs-review
          nix-eval-jobs
          nix-fast-build
          colmena
          ;
      })
    ];
  };

  # Lix
  nix.package = pkgs.lixPackageSets.stable.lix;

  # System Packages
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
        shfmt
        deno
      ]
    ))
    # pkgs-unstable.android-studio
    android-tools
    git-repo
    postman
    # ghidra

    # Virtualization
    distrobox
    (lib.mkIf config.virtualisation.podman.enable podman-compose)
    (lib.mkIf config.virtualisation.podman.enable docker-compose)
    lazydocker

    # GPU stuff
    glxinfo
    vulkan-tools

    # Other
    home-manager
  ];

  # Font Packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    roboto
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];
}

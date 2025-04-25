{ pkgs, pkgs-unstable, ... }: {
  imports = [
    ./overlays.nix
  ];

  disabledModules = [ ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # CLI utils
    fastfetch
    file
    curl
    wget
    git
    btop
    unzip
    zip

    #Desktops
    chromium

    # GPU stuff 
    glxinfo
    vulkan-tools

    # Other
    home-manager
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.hack
  ];
}

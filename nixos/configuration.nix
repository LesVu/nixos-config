{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules
  ];

  disabledModules = [ ];

  # Define your hostname.
  networking.hostName = "capybara";

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes" # Enabling flakes
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.nix-ld.enable = true;
  system.stateVersion = "24.11";
}

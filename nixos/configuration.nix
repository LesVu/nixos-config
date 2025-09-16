{
  imports = [
    # ./hardware-configuration.nix
    ./packages.nix
    ./kodama
    ./modules
  ];

  disabledModules = [ ];

  # Define your hostname.
  networking.hostName = "kodama";

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

  documentation.enable = false;

  system.stateVersion = "25.05";
}

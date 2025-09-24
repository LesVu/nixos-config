{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules
  ];

  disabledModules = [
    ./modules/tablet.nix
  ];

  # Define your hostname.
  networking.hostName = "axolotl";

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

  system.stateVersion = "25.05";
}

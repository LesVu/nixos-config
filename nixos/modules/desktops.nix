{
  # Enable KDE 6
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # services.autorandr = {
  #   enable = true;
  #   profiles.main = {
  #     config."DSI-1" = {
  #       rotate = "left";
  #       mode = "1200x1920";
  #       rate = "60.00";
  #     };
  #     fingerprint = { "DSI-1" = "*"; };
  #   };
  # };
}

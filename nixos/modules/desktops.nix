{
  services.displayManager.defaultSession = "xfce";

  services.xserver.desktopManager = {
    xterm.enable = false;
    xfce.enable = true;
  };
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

  services.picom = {
    enable = true;
    fade = true;
    inactiveOpacity = 0.9;
    shadow = true;
    fadeDelta = 4;
  };
}

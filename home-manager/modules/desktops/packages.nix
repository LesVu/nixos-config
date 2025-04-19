{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktops Apps
    chromium
    pcmanfm
    labwc-tweaks
    swaybg
    waypaper
    brightnessctl
    wl-clipboard
  ];
}

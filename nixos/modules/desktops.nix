{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    configPackages = [ pkgs.labwc ];
  };
  security.polkit.enable = true;
  services.xserver.enable = true;
}

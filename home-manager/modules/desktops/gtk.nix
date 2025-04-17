{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Breeze Light";
      package = pkgs.kdePackages.breeze-gtk;
      size = 14;
    };
    font = {
      name = "Noto";
      size = 12;
    };
    iconTheme = {
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Catppuccin Macchiato";
      package = pkgs.catppuccin-gtk;
    };
  };
}

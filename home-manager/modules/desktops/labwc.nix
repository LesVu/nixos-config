{ pkgs, ... }: {
  wayland.windowManager.labwc = {
    enable = true;
    rc = {
      theme = {
        name = "";
        cornerRadius = 0;
        font = {
          "@name" = "Hack Nerd Font";
          "@size" = "12";
        };
        dropShadows = "yes";
        keepBorder = "no";
      };

      keyboard = {
        default = true;
        keybind = [
          {
            "@key" = "W-Return";
            action = {
              "@name" = "Execute";
              "@command" = "kitty";
            };
          }
          {
            "@key" = "W-D";
            action = {
              "@name" = "Execute";
              "@command" = "wofi --show drun";
            };
          }
        ];
      };

      mouse = {
        default = { };
        context = {
          "@name" = "root";
          mousebind = [
            {
              "@button" = "Right";
              "@action" = "Press";
              action = {
                "@name" = "ShowMenu";
                "@menu" = "some-custom-menu";
              };
            }
          ];
        };
      };

      libinput = {
        device = {
          naturalScroll = "no";
        };
      };
    };
    menu = [
      {
        menuId = "client-menu";
        items = [
          {
            label = "Minimize";
            action = {
              name = "Iconify";
            };
          }
          {
            label = "Maximize";
            action = {
              name = "ToggleMaximize";
            };
          }
          {
            label = "Fullscreen";
            action = {
              name = "ToggleFullscreen";
            };
          }
          {
            label = "Roll up/down";
            action = {
              name = "ToggleShade";
            };
          }
          {
            label = "Decorations";
            action = {
              name = "ToggleDecorations";
            };
          }
          {
            label = "Always on Top";
            action = {
              name = "ToggleAlwaysOnTop";
            };
          }
          {
            menuId = "workspaces";
            label = "Workspace";
            icon = "";
            items = [
              {
                label = "Move left";
                action = {
                  name = "SendToDesktop";
                  to = "left";
                };
              }
              {
                label = "Move right";
                action = {
                  name = "SendToDesktop";
                  to = "right";
                };
              }
              {
                separator = { };
              }
              {
                label = "Always on Visible Workspace";
                action = {
                  name = "ToggleOmnipresent";
                };
              }
            ];
          }
          {
            label = "Close";
            action = {
              name = "Close";
            };
          }
        ];
      }

      {
        menuId = "root-menu";
        items = [ ];
      }

      {
        menuId = "some-custom-menu";
        items = [
          {
            label = "  Search";
            action = {
              name = "Execute";
              command = "wofi --show drun";
            };
          }
          {
            separator = { };
          }
          {
            menuId = "custom-apps";
            label = "Apps";
            icon = "";
            items = [
              {
                label = "  Chromium";
                action = {
                  name = "Execute";
                  command = "chromium";
                };
              }
              {
                label = "  Terminal";
                action = {
                  name = "Execute";
                  command = "kitty";
                };
              }
              {
                label = "  Files";
                action = {
                  name = "Execute";
                  command = "pcmanfm";
                };
              }
            ];
          }
          {
            separator = { };
          }
          {
            menuId = "system-apps";
            label = "system";
            icon = "";
            items = [
              {
                label = "󱠓  Theme";
                action = {
                  name = "Execute";
                  command = "labwc-tweaks";
                };
              }
              {
                label = "󰓃  Sound";
                action = {
                  name = "Execute";
                  command = "pavucontrol";
                };
              }
            ];
          }
          {
            separator = { };
          }
          {
            label = "Power";
            action = {
              name = "Execute";
              command = "wlogout -b 2";
            };
          }
          {
            label = "Exit";
            action.name = "Exit";
          }
        ];
      }
    ];
    autostart = [
      "${pkgs.swaybg}/bin/swaybg -i ~/nix/wallpaper.png -m fill &"
      "${pkgs.waybar}/bin/waybar >/dev/null 2>&1 &"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
    ];
  };
}

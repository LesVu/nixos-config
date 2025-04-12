{ pkgs, ... }: {
  # home.packages = with pkgs;[ swaybg ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "bottom";
        height = 40;

        modules-left = [ "custom/logo" ];
        modules-center = [ "wlr/taskbar" ];
        modules-right = [ "tray" "network" "pulseaudio" "clock" ];

        clock = {
          format = " {:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        tray = {
          icon-size = 17;
          spacing = 3;
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-icons = {
            default = [ "" "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        network = {
          interface = "enp1s0";
          format = "{ifname}";
          format-wifi = " {essid} ";
          format-ethernet = "{ifname} ";
          format-disconnected = "󰖪";
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
          tooltip-format-ethernet = "{ifname}  ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 60;
          on-click = "nmcli networking off";
          on-click-right = "nmcli networking on";
        };

        "custom/logo" = {
          format = " ";
          interval = "once";
          tooltip = false;
          on-click = "wofi --show drun";
          on-click-right = "wlogout -b 2";
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 25;
          # icon-theme = "Reversal-brown-dark";
          tooltip-format = "{title}";
          on-click = "minimize-raise";
          on-click-middle = "close";
          ignore-list = [ "waybar" ];
          app_ids-mapping = {
            firefoxdeveloperedition = "firefox-developer-edition";
          };
          rewrite = {
            "Firefox Web Browser" = "Firefox";
            "Foot Server" = "Terminal";
          };
        };
      };
    };
    style = ''
      *{
        font-family: Hack Nerd Font;
        padding: 1px 2px;
        color:ghostwhite;
      }

      window#waybar{
        font-size: 12px;
        color: ghostwhite;
        background-color: #1D2021;
      }
      #custom-logo,
      #network,
      #pulseaudio,
      #tray,
      #clock{
        margin: 3px;
        padding: 5px;
        padding-top: 1px;
        padding-bottom: 1px;
        font-size: 12px;
        background-color: #303233;
        border-radius: 8px;
        font-weight: bold;
      }
      #custom-logo{
        font-size: 25px;
        font-weight: normal;
      }
      #taskbar button.active{
          opacity: 1;
      }
      #taskbar button{
          opacity: 0.5;
      }
    '';
  };

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
    ];
  };
}
